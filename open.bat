@echo off
setlocal EnableDelayedExpansion
color 0A
title NetPeek

echo.
echo  ███╗   ██╗███████╗████████╗██████╗ ███████╗███████╗██╗  ██╗
echo  ████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔════╝██║ ██╔╝
echo  ██╔██╗ ██║█████╗     ██║   ██████╔╝█████╗  █████╗  █████╔╝
echo  ██║╚██╗██║██╔══╝     ██║   ██╔═══╝ ██╔══╝  ██╔══╝  ██╔═██╗
echo  ██║ ╚████║███████╗   ██║   ██║     ███████╗███████╗██║  ██╗
echo  ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝     ╚══════╝╚══════╝╚═╝  ╚═╝
echo.

if not exist license.key (
    set /p LICENSEKEY=Enter license key: 
    if "!LICENSEKEY!"=="" (
        echo No license key entered.
        pause
        exit /b
    )
    echo !LICENSEKEY!>license.key
)

python netpeek_v3.py
pause

