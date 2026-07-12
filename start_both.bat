@echo off
echo Starting Epic Heresy...
echo.

:: Clean local Mike versions and static site output
mike delete --all --config-file mkdocs-li2023.yml >nul 2>&1
if exist site rmdir /s /q site >nul 2>&1

mike deploy --config-file mkdocs-at2018.yml at2018
mike deploy --config-file mkdocs-li2023.yml li2023
mike set-default --config-file mkdocs-li2023.yml li2023

echo.
echo ================================================
echo Site is ready!
echo   http://127.0.0.1:8000/         - Legions Imperialis 2023 default
echo   http://127.0.0.1:8000/li2023/  - Legions Imperialis 2023
echo   http://127.0.0.1:8000/at2018/  - Adeptus Titanicus 2018
echo ================================================
echo.
mike serve --config-file mkdocs-li2023.yml
