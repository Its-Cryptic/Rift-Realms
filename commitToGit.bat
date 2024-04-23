@echo off
git add .
Color 2
set /p commitMessage="Enter commit message: "
git commit -m "%commitMessage%"
Color 6
git push origin HEAD:main
echo.
Color Green
echo Commit and push complete.
pause
