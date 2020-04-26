@echo off
REM Add /Y for verification
REM /M - All memory
REM /L - Low Voltage Programming
REM /OL -
REM /J
REM /F<file>
REM /TP<program device> #PK3
REM /P<pic device>
"C:\Program Files (x86)\Microchip\MPLABX\v5.15\mplab_platform\mplab_ipe\ipecmd.exe" /P18F24K40 /TPPK3 /M /L /OL /J /F"./dist/default/production/%1.production.hex"