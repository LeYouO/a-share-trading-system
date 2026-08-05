@echo off
chcp 65001 >nul
setlocal

:: 仓库名（可改成你想要的）
set REPO=s2t-converter

:: 切到脚本所在目录
cd /d "%~dp0"

:: 取 GitHub 登录名
for /f "delims=" %%i in ('gh api user --jq ".login"') do set GHUSER=%%i
if "%GHUSER%"=="" (
  echo 未检测到 GitHub CLI 登录，请先运行: gh auth login
  pause
  exit /b 1
)

:: 初始化 git 并提交
git init -b main >nul 2>&1 || (git init && git branch -M main)
git add -A
git commit -q -m "init: 简繁转换器"

:: 创建公开仓库并推送到 main
gh repo create %REPO% --public --source=. --push --description "简体 转 繁体 中文转换工具"

:: 开启 GitHub Pages（main 分支根目录）
gh api repos/%GHUSER%/%REPO%/pages >nul 2>&1
if errorlevel 1 (
  gh api -X POST repos/%GHUSER%/%REPO%/pages -f "source[branch]=main" -f "source[path]=/"
)

echo.
echo 部署完成，稍等 1 分钟访问：
echo https://%GHUSER%.github.io/%REPO%/
pause
