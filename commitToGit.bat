@echo off
git add .
set /p commitMessage="Enter commit message: "
git commit -m "%commitMessage%"
git push origin HEAD:main
echo.
echo Commit and push complete.
pause
