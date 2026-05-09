@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

set "BASE_DIR=%~dp0"
set "PY_EXE=%BASE_DIR%.venv\Scripts\python.exe"

:start_screen
cls
echo ==========================================
echo    MarkItDown Team Trau (Portable)
echo    Plugins: OCR, Plasmate, Web
echo ==========================================

:: Bật AI để mô tả ảnh / đọc PDF quét (Nhập API Key tại đây nếu cần)
:: set "OPENAI_API_KEY=sk-..."
set "USE_AI_FLAG="
if defined OPENAI_API_KEY set "USE_AI_FLAG=--ai"

if not "%~1"=="" (
    if not defined DROPPED_FILE_PROCESSED (
        echo [INFO] Phat hien keo tha: %~1
        "%PY_EXE%" "%BASE_DIR%main.py" "%~1" %USE_AI_FLAG%
        set "DROPPED_FILE_PROCESSED=1"
        goto ask_continue
    )
)

:input_loop
echo.
set "IN_PATH="
set /p "IN_PATH=>> Nhap link Web hoac duong dan File/Folder: "

if "!IN_PATH!"=="" (
    echo [CANH BAO] Ban chua nhap duong dan! Tool se khong convert.
    goto input_loop
)

set "OUT_PATH="
set /p "OUT_PATH=>> Nhap folder output (An Enter de luu tai cho): "

set "IN_PATH=!IN_PATH:"=!"
if defined OUT_PATH set "OUT_PATH=!OUT_PATH:"=!"

if "!OUT_PATH!"=="" (
    "%PY_EXE%" "%BASE_DIR%main.py" "!IN_PATH!" %USE_AI_FLAG%
) else (
    "%PY_EXE%" "%BASE_DIR%main.py" "!IN_PATH!" --output "!OUT_PATH!" %USE_AI_FLAG%
)

:ask_continue
echo.
echo ==========================================
set "CHOICE="
set /p "CHOICE=>> Ban co muon tiep tuc xu ly file/URL khac khong? (Y/N): "

if /I "!CHOICE!"=="Y" goto start_screen
if /I "!CHOICE!"=="N" goto end

echo [LOI] Lua chon khong hop le. Vui long go Y hoac N.
goto ask_continue

:end
echo [SYSTEM] Tien trinh da ket thuc. Tam biet!
timeout /t 2 >nul
endlocal