@echo off
SET "remote=origin"
SET "branch=main"

:Start
echo Type MERGE to merge changes from %remote%/%branch%, or COMMIT to commit your changes.
set /p UserAction=Enter action (MERGE/COMMIT): 

if /I "%UserAction%"=="MERGE" goto DoMerge
if /I "%UserAction%"=="COMMIT" goto DoCommit
echo Invalid input. Please type MERGE or COMMIT.
goto Start

:DoMerge
echo Fetching from remote...
git fetch %remote%

echo Changes to be merged from %remote%/%branch%:
git log ..%remote%/%branch% --oneline

:UserPromptMerge
set /p UserInputMerge=Do you want to merge these changes? (Y/N): 
if /I "%UserInputMerge%"=="Y" goto ExecuteMerge
if /I "%UserInputMerge%"=="N" goto End
echo Invalid input. Please type Y or N.
goto UserPromptMerge

:ExecuteMerge
git merge %remote%/%branch%
echo Merge completed.
goto End

:DoCommit
set /p CommitMessage=Enter commit message: 
git add -A
git commit -m "%CommitMessage%"
git pull --rebase %remote% %branch%
git push %remote% %branch%
echo Changes committed and pushed to %remote%/%branch%.
goto End

:End
echo Operation completed.
pause
