@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

set "BASE_DIR=%~dp0"
set "UV_EXE=uv"

:: Đảm bảo uv có thể được gọi nếu cài ở user profile
set "PATH=%USERPROFILE%\.local\bin;%PATH%"

echo ==========================================
echo    UPDATE: MarkItDown - TeamTrau Edition
echo ==========================================
echo [INFO] Dang kiem tra va tai ban cap nhat moi nhat...

:: Lệnh 1: Ép cập nhật lõi trực tiếp từ Repo GitHub chính chủ của Microsoft (Đã fix lỗi thư mục con)
echo [1/2] Dang update core tu GitHub Microsoft...
uv pip install --upgrade "git+https://github.com/microsoft/markitdown.git#subdirectory=packages/markitdown"

:: Lệnh 2: Cập nhật các Plugins và thư viện đi kèm lên bản mới nhất
echo [2/2] Dang update cac Plugins...
uv pip install --upgrade markitdown-ocr markitdown-plasmate openai typer

echo.
echo [SUCCESS] DA CAP NHAT THANH CONG!
pause
endlocal