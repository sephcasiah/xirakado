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
:: 7z x v1.7z -o %PROGRAMFILES%\Xirakado
copy prebuilt1.zip %PROGRAMFILES%\Xirakado
copy prebuilt2.zip %PROGRAMFILES%\Xirakado
:: del %PROGRAMFILES%\Xirakado\v1.7z

:Exr
::Extracts work files to temp folder and switches to that folder
7z x %PROGRAMFILES%\Xirakado\preblt1.7z -o "%APPDATA%\xirakado\temp\H2"
7z x %PROGRAMFILES%\Xirakado\preblt2.7z -o "%APPDATA%\xirakado\temp\H"
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
:aidfnd
echo %VAR%
echo please enter this into the text box at Http://cma.henkaku.xyz/
echo when done, please enter the sring it gives you into this box.
set /p VOR=Enter AID: 
echo Is this correct
echo %VOR%
set /p ans=Y/N
if %ans% = "Y" do (
   echo File  found
   goto :bldapp
)
echo Try again
goto :aidfnd

:bldapp
cd %APPDATA%\xirakado\temp\H2
psvimg-create -n app -K %VOR% app PCSG90096/app
psvimg-create -n appmeta -K %VOR% appmeta PCSG90096/appmeta
psvimg-create -n license -K %VOR% license PCSG90096/license
psvimg-create -n savedata -K %VOR% savedata PCSG90096/savedata
robocopy PCSG90096 to "%USERPROFILE%\Documents\PS Vita\APP\%VAR%\PCSG90096"
taskkill /F /im qcma.exe
start %PROGRAMFILES%/qcma/qcma.exe

:message_to_user2
echo Please launch Content Manager on your PS Vita and connect it to your computer...
echo when your PSVita is connected to your computer, please select PC -> PSVita then Applications
echo Please copy H-encore-2 to your PSVita
pause
goto :cont

:cont
Echo Please launch your H-encore-2 app while holding the R button on your PSVita to jailbreak.

Echo Please use FTP to transfer The modified Modoru to your vita, and install BUT DO NOT RUN YET
echo link here https://github.com/SKGleba/modoru
echo NOTE: DO NOT USE UNMODIFIED MODORU TO DOWNGRADE FROM 3.7x -- YOU WILL SOFTBRICK -- YOU HAVE BEEN WARNED

pause
echo download and extract your prefered hackable OFW and move the PSP2UPDAT.PUP file to ux0:app/MODORU000/ on your PSVita
Echo when done, launch modoru and downgrade
echo NOTE please disable any plugins if installed BEFORE downgrading.

pause.

:cont2
echo you should now be on OFW 3.65/3.68
echo Next we will hack your new firmware
pause
goto :bldapp2
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
echo please reconnect your PSVita
pause
echo you can now move H-encore to your vita
echo launch H-encore while holding the R button on your PSVita
echo use FTP to transfer ENSO to your PSVita and install
echo link found here https://github.com/henkaku/enso/releases/tag/v1.1
echo should then be able to permanantly hack your PSVita.
echo Enjoy!
pause
exit
=======
::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDhVXguOAE+1BaAR7ebv/Nagq1k1QeADYIbJ27+PJO8v+UDwYIZj02Jf+A==
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
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
:: 7z x v1.7z -o %PROGRAMFILES%\Xirakado
copy prebuilt1.zip %PROGRAMFILES%\Xirakado
copy prebuilt2.zip %PROGRAMFILES%\Xirakado
:: del %PROGRAMFILES%\Xirakado\v1.7z

:Exr
::Extracts work files to temp folder and switches to that folder
7z x %PROGRAMFILES%\Xirakado\preblt1.7z -o "%APPDATA%\xirakado\temp\H2"
7z x %PROGRAMFILES%\Xirakado\preblt2.7z -o "%APPDATA%\xirakado\temp\H"
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
:aidfnd
echo %VAR%
echo please enter this into the text box at Http://cma.henkaku.xyz/
echo when done, please enter the sring it gives you into this box.
set /p VOR=Enter AID: 
echo Is this correct
echo %VOR%
set /p ans=Y/N
if %ans% = "Y" do (
   echo File  found
   goto :bldapp
)
echo Try again
goto :aidfnd

:bldapp
cd %APPDATA%\xirakado\temp\H2
psvimg-create -n app -K %VOR% app PCSG90096/app
psvimg-create -n appmeta -K %VOR% appmeta PCSG90096/appmeta
psvimg-create -n license -K %VOR% license PCSG90096/license
psvimg-create -n savedata -K %VOR% savedata PCSG90096/savedata
robocopy PCSG90096 to "%USERPROFILE%\Documents\PS Vita\APP\%VAR%\PCSG90096"
taskkill /F /im qcma.exe
start %PROGRAMFILES%/qcma/qcma.exe

:message_to_user2
echo Please launch Content Manager on your PS Vita and connect it to your computer...
echo when your PSVita is connected to your computer, please select PC -> PSVita then Applications
echo Please copy H-encore-2 to your PSVita
pause
goto :cont

:cont
Echo Please launch your H-encore-2 app while holding the R button on your PSVita to jailbreak.

Echo Please use FTP to transfer The modified Modoru to your vita, and install BUT DO NOT RUN YET
echo link here https://github.com/SKGleba/modoru
echo NOTE: DO NOT USE UNMODIFIED MODORU TO DOWNGRADE FROM 3.7x -- YOU WILL SOFTBRICK -- YOU HAVE BEEN WARNED

pause
echo download and extract your prefered hackable OFW and move the PSP2UPDAT.PUP file to ux0:app/MODORU000/ on your PSVita
Echo when done, launch modoru and downgrade
echo NOTE please disable any plugins if installed BEFORE downgrading.

pause.

:cont2
echo you should now be on OFW 3.65/3.68
echo Next we will hack your new firmware
pause
goto :bldapp2
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
echo please reconnect your PSVita
pause
echo you can now move H-encore to your vita
echo launch H-encore while holding the R button on your PSVita
echo use FTP to transfer ENSO to your PSVita and install
echo link found here https://github.com/henkaku/enso/releases/tag/v1.1
echo should then be able to permanantly hack your PSVita.
echo Enjoy!
pause
exit
>>>>>>> 780d8be9407e5d29897ee2cf91d7b130a17cdf6d
