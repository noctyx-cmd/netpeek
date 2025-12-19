@echo off
setlocal EnableDelayedExpansion
color 0A
title NetPeek Installer

echo.
echo  ███╗   ██╗███████╗████████╗██████╗ ███████╗███████╗██╗  ██╗
echo  ████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝██║ ██╔╝
echo  ██╔██╗ ██║█████╗     ██║   ██████╔╝█████╗  █████╗  █████╔╝
echo  ██║╚██╗██║██╔══╝     ██║   ██╔═══╝ ██╔══╝  ██╔══╝  ██╔═██╗
echo  ██║ ╚████║███████╗   ██║   ██║     ███████╗███████╗██║  ██╗
echo  ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo Python not found. Install Python 3.10+.
    pause
    exit /b
)

if exist requirements.txt (
    python -m pip install --upgrade pip
    python -m pip install -r requirements.txt
) else (
    echo requirements.txt not found.
    pause
    exit /b
)

if not exist license.key (
    set /p LICENSEKEY=Enter license key: 
    if "!LICENSEKEY!"=="" (
        echo No license key entered.
        pause
        exit /b
    )
    echo !LICENSEKEY!>license.key
)

echo Installation complete.
pause


