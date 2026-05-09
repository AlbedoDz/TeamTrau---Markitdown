@echo off
:: Ép CMD luôn trỏ về thư mục chứa file .bat (Sửa lỗi khi chạy quyền Admin)
cd /d "%~dp0"
setlocal enabledelayedexpansion

:: Ép font chữ tiếng Việt (chcp 65001 thỉnh thoảng gây lỗi chớp tắt nên ta tắt output của nó)
chcp 65001 >nul 2>&1

echo ==========================================
echo    SETUP: MarkItDown - TeamTrau Edition
echo ==========================================

:: 1. Kiểm tra uv (Tránh dùng khối lệnh if có dấu ngoặc để không bị crash)
where uv >nul 2>nul
if %ERRORLEVEL% EQU 0 goto create_venv

echo [INFO] Khong tim thay 'uv'. Dang tai va cai dat...
:: Lệnh tải uv được đưa ra ngoài khối if để Windows CMD đọc chuẩn xác
powershell -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"

:: Cập nhật PATH tạm thời (uv có thể cài vào .cargo hoặc .local tùy phiên bản Windows)
set "PATH=%USERPROFILE%\.cargo\bin;%USERPROFILE%\.local\bin;%PATH%"

:create_venv
echo.
echo [INFO] Dang tao moi truong ao (.venv) voi Python 3.13...
uv venv --python 3.13 .venv

if %ERRORLEVEL% NEQ 0 (
    echo [LOI] Khong the tao moi truong ao. Hay kiem tra ket noi mang.
    pause
    exit /b
)

echo [INFO] Dang cai dat thu vien va Plugins...
uv pip install -r requirements.txt

if %ERRORLEVEL% NEQ 0 (
    echo [LOI] Cai dat thu vien that bai. Kiem tra lai file requirements.txt.
    pause
    exit /b
)

echo.
echo ==========================================
echo [SUCCESS] SETUP HOAN TAT! 
echo ==========================================
pause
endlocal