# TeamTrau---Markitdown
TeamTrau - Markitdown
🛠 HƯỚNG DẪN CÀI ĐẶT (INSTALLATION)
Bạn thực hiện theo đúng thứ tự đánh số trong ảnh để đảm bảo môi trường hoạt động hoàn hảo:

Bước 1: Khởi tạo môi trường (1. setup_env.bat)
Mục đích: Tự động tải trình quản lý gói uv, tạo môi trường ảo Python 3.13 cô lập và cài đặt các thư viện cần thiết (typer, markitdown, plugins).

Cách làm: Nháy đúp chuột vào file.

Kết quả: Một thư mục .venv sẽ xuất hiện. Khi thấy dòng chữ [SUCCESS] SETUP HOAN TAT!, bạn có thể đóng cửa sổ.

Bước 2: Cập nhật bản mới nhất (2. update_tool.bat)
Mục đích: Ép hệ thống tải bản vá lỗi mới nhất từ Microsoft (GitHub) và cập nhật các Plugin OCR/Plasmate lên phiên bản cao nhất.

Cách làm: Nháy đúp chuột. Nên chạy file này định kỳ (1 lần/tuần) để đảm bảo tool luôn "xịn" nhất.

🚀 HƯỚNG DẪN SỬ DỤNG (USAGE)
Để bắt đầu làm việc, bạn sử dụng file 3. Start_markitdown.bat. Có hai cách để vận hành:

Cách 1: Kéo thả (Drag & Drop) - Nhanh nhất
Chọn một file (PDF, Word, Ảnh...) hoặc nguyên một Folder chứa nhiều tài liệu.

Kéo và thả trực tiếp vào file 3. Start_markitdown.bat.

Tool sẽ tự động convert và lưu file .md ngay tại thư mục gốc của file nguồn.

Cách 2: Nhập liệu thủ công (Manual Input)
Nháy đúp vào 3. Start_markitdown.bat.

Tại dòng >> Nhap link Web hoac duong dan...: * Dán đường dẫn File/Folder (phím tắt Ctrl + V). Bạn có thể copy path từ Windows Explorer, tool sẽ tự làm sạch dấu ngoặc kép.

Đặc biệt: Dán thẳng URL trang web (ví dụ: https://tuoitre.vn/...) để chuyển đổi nội dung web thành Markdown sạch bằng Plugin Plasmate.

Tại dòng >> Nhap folder output...: Nhấn Enter để lưu tại chỗ, hoặc dán một đường dẫn thư mục khác nếu muốn gom kết quả về một nơi.

💡 CÁC TÍNH NĂNG CAO CẤP & LƯU Ý
1. Chế độ AI (OCR & Vision)
Điều kiện: Bạn cần có OpenAI API Key.

Kích hoạt: Mở file 3. Start_markitdown.bat bằng Notepad, tìm dòng :: set "OPENAI_API_KEY=...", xóa dấu :: và điền Key của bạn vào.

Tác dụng: Tool sẽ tự động bật flag --ai. Lúc này, các file PDF quét (dạng ảnh) hoặc các tệp hình ảnh sẽ được AI đọc chữ và mô tả nội dung ảnh một cách thông minh.

2. Quy trình "Tiếp tục hoặc Thoát"
Sau mỗi task, tool sẽ hỏi: >> Ban co muon tiep tuc khong? (Y/N).

Gõ Y: Để xóa sạch màn hình và bắt đầu task mới (không cần tắt tool mở lại).

Gõ N: Để đóng tool an toàn.

3. Danh sách định dạng hỗ trợ
Tài liệu: .pdf, .docx, .xlsx, .pptx, .csv, .txt, .json, .html.

Hình ảnh: .jpg, .jpeg, .png.

Web: Tất cả các URL hợp lệ.
