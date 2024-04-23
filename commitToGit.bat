@echo off
git add .
set /p commitMessage="Enter commit message: "
git commit -m "%commitMessage%"
git push origin HEAD:master
echo.
echo Commit and push complete.
pause
