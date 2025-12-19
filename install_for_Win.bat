@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM --- Fix encoding ---
chcp 65001 >nul
color 0A
title NetPeek V3 :: Loader

echo.
echo ===============================
echo   NetPeek V3 Installer
echo ===============================
echo.

REM --- Ask for license key ---
set "KEY="
set /p KEY=Enter your license key: 

if "%KEY%"=="" (
    echo.
    echo [ERROR] No license key entered.
    pause
    exit /b 1
)

echo %KEY%> license.key

echo.
echo [*] License key saved to license.key
echo.
n
REM --- Python check ---
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found in PATH.
    echo Please install Python 3.10+ and restart.
    pause
    exit /b 1
)

REM --- Install dependencies ---
echo [*] Installing dependencies...
pip install --quiet --upgrade pip
pip install --quiet -r requirements.txt

echo.
echo [*] Starting NetPeek...
python netpeek_protected.py

echo.
pause
