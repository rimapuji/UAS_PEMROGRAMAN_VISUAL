@echo off
SET THEFILE=D:\TUGAS KAMPUS\SMTR 5\PERANCANGAN VISUAL(DESKTOP)\APLIKASI BARANG\project1.exe
echo Linking %THEFILE%
D:\lazarus\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o "D:\TUGAS KAMPUS\SMTR 5\PERANCANGAN VISUAL(DESKTOP)\APLIKASI BARANG\project1.exe" "D:\TUGAS KAMPUS\SMTR 5\PERANCANGAN VISUAL(DESKTOP)\APLIKASI BARANG\link4444.res"
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
