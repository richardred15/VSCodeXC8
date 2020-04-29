@echo off
echo %1 %2 %3
echo "Building..."
scripts/build.bat %1 %2 %3
echo "Uploading..."
scripts/upload.bat %2
scripts/clean.bat  
