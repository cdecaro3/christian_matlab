@ECHO OFF

SET /P message=Github message: 

git add .
git commit -m "%message%"
git push