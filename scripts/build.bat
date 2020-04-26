@echo off

REM [cpu] [project name] [errata]
echo Building %1 for %2 with %3
"C:\Program Files (x86)\Microchip\MPLABX\v5.15\gnuBins\GnuWin32\bin\make.exe" -f nbproject/Makefile-default.mk SUBPROJECTS= .build-conf
"C:\Program Files (x86)\Microchip\MPLABX\v5.15\gnuBins\GnuWin32\bin\make.exe" -f nbproject/Makefile-default.mk dist/default/production/%2.X.production.hex
"C:\Program Files (x86)\Microchip\xc8\v2.05\bin\xc8-cc.exe"  -mcpu=%1 -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -Wa,-a -DXPRJ_default=default  -msummary=-psect,-class,+mem,-hex,-file -merrata=%3  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits   -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o build/default/production/main.p1 main.c 
"C:\Program Files (x86)\Microchip\xc8\v2.05\bin\xc8-cc.exe"  -mcpu=%1 -Wl,-Map=dist/default/production/%2.X.production.map  -DXPRJ_default=default  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -Wa,-a -msummary=-psect,-class,+mem,-hex,-file -merrata=%3  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto -Wl,--memorysummary,dist/default/production/memoryfile.xml -o dist/default/production/%2.X.production.elf  build/default/production/main.p1     
py scripts/info.py