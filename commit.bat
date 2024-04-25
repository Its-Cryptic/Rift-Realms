@echo off
git add .
Color 2
set /p commitMessage="Enter commit message: "
git commit -m "%commitMessage%"
Color 3
git push origin HEAD:main
echo.
Color 2
echo Commit and push complete.
pause
