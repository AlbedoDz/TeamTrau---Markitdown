🦬 MarkItDown - TeamTrau Edition
Trình chuyển đổi đa năng: File, Folder & URL sang Markdown – Tối ưu cho LLMs.

MarkItDown - TeamTrau Edition là phiên bản Portable (di động) được tùy chỉnh sâu từ bộ lõi của Microsoft. Công cụ này giúp bạn chuyển đổi mọi loại tài liệu, hình ảnh và trang web thành định dạng Markdown sạch sẽ, cấu trúc tốt, sẵn sàng để đưa vào các mô hình ngôn ngữ lớn (LLM).

✨ Tính năng nổi bật (Key Features)
🚀 Siêu tốc độ: Sử dụng uv làm trình quản lý gói, đảm bảo hiệu suất xử lý cực cao.

🌐 Web-to-Markdown: Tích hợp Plasmate Plugin giúp quét nội dung Website sạch, loại bỏ quảng cáo/rác.

🤖 AI Vision & OCR: Hỗ trợ Plugin OCR (OpenAI GPT-4o) để đọc hiểu hình ảnh và các tệp PDF quét.

📂 Xử lý hàng loạt: Kéo thả nguyên một thư mục vào để xử lý hàng trăm file cùng lúc.

🔀 Đa nền tảng: Chạy Native trên Windows (.bat) và macOS/Linux (.sh).

🛡️ Bảo mật & Gọn nhẹ: Đã loại bỏ FFmpeg và các thư viện Media thừa, dung lượng siêu tối giản, không lỗi rác.

🛠️ Quy trình cài đặt (Installation)
Để bộ công cụ hoạt động hoàn hảo, vui lòng thực hiện theo thứ tự các file đã đánh số:

Chạy 1. setup_env.bat: Khởi tạo môi trường ảo Python 3.13 và cài đặt thư viện tự động.

Chạy 2. update_tool.bat: Cập nhật bộ lõi và các Plugin lên phiên bản mới nhất từ Microsoft.

🚀 Hướng dẫn sử dụng (Usage)
1. Cách nhanh nhất (Kéo & Thả)
Kéo file (PDF, Word, Ảnh...) hoặc Thư mục vào file 3. Start_markitdown.bat. Kết quả sẽ được lưu ngay tại vị trí file nguồn.

2. Chế độ tương tác (CLI Mode)
Mở file 3. Start_markitdown.bat và nhập dữ liệu theo yêu cầu:

Input: Link Website hoặc đường dẫn File/Folder (Hỗ trợ copy-paste trực tiếp từ Windows).

Output: Nhấn Enter để lưu tại chỗ hoặc nhập đường dẫn thư mục đích.

⚙️ Cấu hình nâng cao (Advanced Config)
Để sử dụng tính năng OCR (Đọc ảnh) và Mô tả hình ảnh bằng AI, bạn cần thêm API Key vào file khởi chạy:

Chuột phải vào 3. Start_markitdown.bat -> chọn Edit.

Tìm dòng: :: set "OPENAI_API_KEY=..."

Xóa dấu :: và điền Key của bạn vào: set "OPENAI_API_KEY=sk-xxxxxx"

Lưu lại và khởi động tool. AI sẽ tự động kích hoạt khi phát hiện file ảnh/PDF quét.

🤝 Liên hệ & Bản quyền
Core Engine: Microsoft MarkItDown: https://github.com/microsoft/markitdown
