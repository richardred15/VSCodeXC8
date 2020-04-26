@echo off
echo %1 %2 %3
echo "Building..."
cmd /c ".\scripts\build.bat %1 %2 %3"
echo "Uploading..."
cmd /c ".\scripts\upload.bat %2"
.\scripts\clean.bat