@echo off
cd /d %~dp0

echo === Hugo build ===
hugo --minify

echo === Git add ===
git add .

echo === Git commit ===
git commit -m "update blog"

echo === Git push ===
git push

echo === Done ===
pause
