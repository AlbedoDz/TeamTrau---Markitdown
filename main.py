import os
import sys
import warnings
from pathlib import Path
from typing import Optional

# =================================================================
# SUPPRESS WARNINGS: Bịt miệng cảnh báo thiếu FFmpeg của pydub
# Vì TeamTrau Edition không xử lý Media, ta không cần FFmpeg.
# =================================================================
warnings.filterwarnings("ignore", category=RuntimeWarning, module="pydub.utils")

import typer
from markitdown import MarkItDown
from openai import OpenAI

app = typer.Typer(help="MarkItDown - TeamTrau Edition")

@app.command()
def convert(
    path: str = typer.Argument(..., help="Đường dẫn file, folder hoặc URL"),
    output: Optional[str] = typer.Option(None, "--output", "-o", help="Thư mục lưu kết quả"),
    use_ai: bool = typer.Option(False, "--ai", help="Bật AI để OCR và mô tả ảnh"),
):
    clean_input = path.strip('""\'\'')

    md_kwargs = {"enable_plugins": True}
    
    if use_ai and os.getenv("OPENAI_API_KEY"):
        md_kwargs["llm_client"] = OpenAI()
        md_kwargs["llm_model"] = "gpt-4o"
        typer.secho("🤖 Chế độ AI (OCR/Vision) đã được kích hoạt.", fg=typer.colors.CYAN)
    
    md = MarkItDown(**md_kwargs)

    # -------------------------------------------------------------
    # NHÁNH A: XỬ LÝ URL
    # -------------------------------------------------------------
    if clean_input.startswith("http://") or clean_input.startswith("https://"):
        typer.echo(f"🌐 Đang phân tích Website: {clean_input}")
        try:
            result = md.convert(clean_input)
            safe_name = "".join(c if c.isalnum() else "_" for c in clean_input.split("//")[-1][:50])
            target_dir = Path(output.strip('""\'\'')) if output else Path(os.getcwd())
            target_dir.mkdir(parents=True, exist_ok=True)
            target_file = target_dir / f"{safe_name}.md"
            
            with open(target_file, "w", encoding="utf-8") as f:
                f.write(result.text_content)
            typer.secho(f"✅ Đã lưu Website thành: {target_file.name}", fg=typer.colors.GREEN)
        except Exception as e:
            typer.secho(f"💥 Lỗi khi tải web: {e}", fg=typer.colors.RED)
        raise typer.Exit()

    # -------------------------------------------------------------
    # NHÁNH B: XỬ LÝ FILE / FOLDER (Đã vá lỗ hổng định dạng)
    # -------------------------------------------------------------
    p = Path(clean_input)
    files_to_process = []
    
    # Chỉ cho phép tài liệu và hình ảnh
    valid_ext = {".pdf", ".docx", ".xlsx", ".pptx", ".csv", ".json", ".html", ".jpg", ".jpeg", ".png", ".txt"}
    
    if p.is_file():
        if p.suffix.lower() not in valid_ext:
            typer.secho(f"❌ Lỗi: Định dạng '{p.suffix}' không được hỗ trợ!", fg=typer.colors.RED)
            typer.secho(f"💡 TeamTrau Edition hien chi ho tro: {', '.join(valid_ext)}", fg=typer.colors.YELLOW)
            raise typer.Exit(1)
        files_to_process.append(p)
        
    elif p.is_dir():
        files_to_process = [f for f in p.glob("**/*") if f.suffix.lower() in valid_ext]
    else:
        typer.secho(f"❌ Lỗi: Không tìm thấy đường dẫn: {clean_input}", fg=typer.colors.RED)
        raise typer.Exit(1)

    if not files_to_process:
        typer.secho("⚠️ Không tìm thấy file hợp lệ nào để xử lý.", fg=typer.colors.YELLOW)
        raise typer.Exit(0)

    out_dir = Path(output.strip('""\'\'')) if output else None
    if out_dir: 
        out_dir.mkdir(parents=True, exist_ok=True)

    for file_path in files_to_process:
        try:
            typer.echo(f"🚀 Đang xử lý: {file_path.name}")
            result = md.convert(str(file_path))
            
            target_dir = out_dir if out_dir else file_path.parent
            target_file = target_dir / f"{file_path.stem}.md"
            
            with open(target_file, "w", encoding="utf-8") as f:
                f.write(result.text_content)
            typer.secho(f"✅ Đã lưu: {target_file.name}", fg=typer.colors.GREEN)
        except Exception as e:
            typer.secho(f"💥 Lỗi: {e}", fg=typer.colors.RED)

if __name__ == "__main__":
    app()