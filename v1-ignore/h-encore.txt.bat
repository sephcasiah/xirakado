@ echo off
TYPE XK.txt 

:setup
::begins enviro setup
goto :md1
:md1
::creates temp folders needed
md %APPDATA%\xirakado
md %APPDATA%\xirakado\temp
md %APPDATA%\xirakado\temp\H
md %APPDATA%\xirakado\temp\AID
:md2
::creates working directory
md %PROGRAMFILES%\Xirakado rem may be ommitted
md %PROGRAMFILES%\Xirakado\logs

:download
:: Downloads prebuilt zip file from hosted server
copy http://xirakado.xyz/XKD.zip %PROGRAMFILES%\Xirakado
7z x %PROGRAMFILES%\Xirakado\XKD.zip -o %PROGRAMFILES%\Xirakado
del %PROGRAMFILES%\Xirakado\XKD.zip

:Exr
::Extracts work files to temp folder and switches to that folder
7z x %PROGRAMFILES%\Xirakado\preblt1.zip -o "%APPDATA%\xirakado\temp\H2"
7z x %PROGRAMFILES%\Xirakado\preblt2.zip -o "%APPDATA%\xirakado\temp\H"
cd %APPDATA%\xirakado\temp\H2

:message_to_user
echo Please check your PSVita, and ensure that your DNS is set to 212.47.229.76 to block updates....then reboot your PSVita
echo when this is done, launch Content Manager on your PS Vita and connect it to your computer...
echo when your PSVita is connected to your computer, please select PC -> PSVita then Applications
start %PROGRAMFILES%/qcma/qcma.exe
pause
goto :check

:check
echo scanning computer for connection...
if exist "%USERPROFILE%\Documents\PS Vita\APP" (
cd "%USERPROFILE%\Documents\PS Vita\APP"
dir /B "%USERPROFILE%\Documents\PS Vita\APP" GOTO :scan
set 
) else (
goto :scan


)
:scan 
:: will require cleanup
:: scans for folder required for AID
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*0*"') do (
   echo File  found
   goto :flfnd
)
echo searching
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*1*"') do (
   echo File  found
   goto :flfnd
)
echo searching.
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*2*"') do (
   echo File  found
   goto :flfnd
)
echo searching..
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*3*"') do (
   echo File  found
   goto :flfnd
)
echo searching...
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*4*"') do (
   echo File  found
   goto :flfnd
)
echo searching....
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*5*"') do (
   echo File  found
   goto :flfnd
)
echo searching.....
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*6*"') do (
   echo File  found
   goto :flfnd
)
echo searching......
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*7*"') do (
   echo File  found
   goto :flfnd
)
echo searching.......
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*8*"') do (
   echo File  found
   goto :flfnd
)
echo searching........
for /F %%i in ('dir /b "%USERPROFILE%\Documents\PS Vita\APP\*9*"') do (
   echo File  found
   goto :flfnd
)
echo searching.........
goto :scan

:flfnd
::AID folder was found and is set as local variable for conversion
echo File found!
cd %USERPROFILE%\Documents\PS Vita\APP
dir /B > %APPDATA%\xirakado\temp\AID\log1.txt
cd %APPDATA%\xirakado\temp\AID
set /p VAR=<log1.txt


:bldapp
cd %APPDATA%\xirakado\temp\H

:bldapp2
MOVE "%USERPROFILE%\Documents\PS Vita\APP\%VAR%\PCSG90096" "%USERPROFILE%\Documents\PS Vita\APP\%VAR%\PCSG90096-2"
cd %APPDATA%\xirakado\temp\H
psvimg-create -n app -K %VOR% app PCSG90096/app
psvimg-create -n appmeta -K %VOR% appmeta PCSG90096/appmeta
psvimg-create -n license -K %VOR% license PCSG90096/license
psvimg-create -n savedata -K %VOR% savedata PCSG90096/savedata
robocopy PCSG90096 to "%USERPROFILE%\Documents\PS Vita\APP\%VAR%\PCSG90096"
taskkill /F /im qcma.exe
start %PROGRAMFILES%/qcma/qcma.exe



