@echo off
title TestAutomation PipeLine

REM This batch file will eventually run an "automation" testcase inside a LowCode TestAutomation Generation DevTest project.
REM The main input for running the "automation" testcase is an excel file that identifies the testcases to build.

REM Parameter to this batch file is a DevTest .config file which must reside
REM as well in the current working directory as in the config directory of the LowCode TestAutomation Generation DevTest project.
REM The parameter must contain only the config file name, not the .config suffix

REM This batch file must reside inside the bin subdirectory of the LowCode TestAutomation Generation DevTest project.
REM This bin subdirectory has to be created (not a default DevTest project directory)

REM This batchfile will open a Select File Dialog Box (to select the excel identifying the testcases)
REM only showing the filesystem below the working directory 
REM where this batch file is started at runtime. 
REM If running this by executing a shortcut located in the testcase repository master document
REM then the "Start in" property of the link has to be blanked out (so the batch file starts in the current directory)

REM To configure:
REM   - LISA_HOME
REM   - TimeStamp Setting
REM   - TestRunner authentication -u and -p parameters, the user must have a minimum of "Test Runner" authorization

setlocal enabledelayedexpansion enableextensions

SET LISA_HOME=C:\CA\DevTest
SET PATH=%PATH%;%LISA_HOME%\bin

REM Get the DevTest project base directory, store in env DT_PROJ_HOME

call :directory_name_from_path DT_PROJ_BIN %~f0
call :directory_name_from_path DT_PROJ_HOME_BASE %DT_PROJ_BIN%..
call :parent_directory_name_from_path DT_PROJ_NAME %DT_PROJ_BIN%
set DT_PROJ_HOME=%DT_PROJ_HOME_BASE%%DT_PROJ_NAME%

echo DT_PROJ_BIN  : %DT_PROJ_BIN%
echo DT_PROJ_NAME : %DT_PROJ_NAME%
echo DT_PROJ_HOME : %DT_PROJ_HOME%

set API_PROJ_HOME=%cd%
echo API_PROJ_HOME: %API_PROJ_HOME%

REM Set timestamp as unique identifier
REM ==================================
SET HOUR=%time:~0,2%

REM Timestamp setting Turkey
REM ------------------------
REM Following 2 lines cannot have blanks
REM SET dtStamp9=%date:~-4%%date:~7,2%%date:~4,2%_0%time:~1,1%%time:~3,2%%time:~6,2%
REM SET dtStamp24=%date:~-4%%date:~7,2%%date:~4,2%_%time:~0,2%%time:~3,2%%time:~6,2%

REM Timestamp setting Belgium
REM -------------------------
REM Following 2 lines cannot have blanks
SET dtStamp9=%date:~-4%%date:~6,2%%date:~3,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~-4%%date:~6,2%%date:~3,2%_%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET DTSTAMP=%dtStamp9%) else (SET DTSTAMP=%dtStamp24%)
echo DTSTAMP      : %DTSTAMP%

REM PipeLine and DevTest properties file
set API_PROJ_CONFIG=%1
echo API_PROJ_CONFIG: %API_PROJ_CONFIG%

REM Set all properties from properties file_name_from_path
FOR /F "usebackq tokens=*" %%A IN ("%API_PROJ_HOME%\%API_PROJ_CONFIG%.config") DO set %%A

REM Dialog box for selecting the API test Excel File
Call :Browse4File "Choose TestCase Generation Excel File" "%API_PROJ_HOME%"

set API_PROJ_EXCEL=!Location!
call :directory_name_from_path API_PROJ_DIR %API_PROJ_EXCEL%

echo API_PROJ_EXCEL : %API_PROJ_EXCEL%
echo API_PROJ_DIR : %API_PROJ_DIR%

REM Preapare DevTest project directory for test creation

REM Create test result directory
MKDIR %DT_PROJ_HOME%\Tests\%DTSTAMP%

REM Create testrun config file
XCOPY %DT_PROJ_HOME%\Configs\%API_PROJ_CONFIG%.assets %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.assets /I
COPY %DT_PROJ_HOME%\Configs\%API_PROJ_CONFIG%.config %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config
REM Config File must have a blank last line
more %API_PROJ_HOME%\%API_PROJ_CONFIG%.config >> %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config

echo ExcelDataFile=%API_PROJ_EXCEL:\=/%>> %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config
echo ExcelDataDirectory=%API_PROJ_DIR:\=/%>> %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config
echo TestsOutputDirectory=%DT_PROJ_HOME:\=/%/Tests/%DTSTAMP%>> %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config

testrunner  -m tcp://localhost:2010/Registry -cs local -u admin -p admin -config %DT_PROJ_HOME%\Configs\%DTSTAMP%_%API_PROJ_CONFIG%.config -a -t %DT_PROJ_HOME%\Tests\Automation\CreateTestsV3.tst

for %%f in (%DT_PROJ_HOME%\Tests\%DTSTAMP%\*.tst) do echo "Demo Artefact Repository Commit: %DT_PROJ_HOME%\bin\curl -v -u "<NexusBasicAuthenticationUser>:<NexusBasicAuthenticationPassword>;." --upload-file %%f http://<NexusHost>:<NexusPort>/nexus/content/repositories/SV_API/1/1/%DTSTAMP%/%%~nxf

pause
goto :eof

:file_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~nx2"
    exit /b
)

:directory_name_from_path <resultVar> <pathVar>
(
    set "%~1=%~dp2"
    exit /b
)

:parent_directory_name_from_path <resultVar> <pathVar>
(
    for %%a in ("%2..") do set LastFolder=%%~nxa
    set "%~1=!LastFolder!"
    exit /b
)


::***************************************************************************
:Browse4Folder
set Location=
set vbs="%temp%\_.vbs"
set cmd="%temp%\_.cmd"
for %%f in (%vbs% %cmd%) do if exist %%f del %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
(
    echo set shell=WScript.CreateObject("Shell.Application"^) 
    echo set f=shell.BrowseForFolder(0,"%~1",0,"%~2"^) 
    echo if typename(f^)="Nothing" Then  
    echo wscript.echo "set Location=Dialog Cancelled" 
    echo WScript.Quit(1^)
    echo end if 
    echo set fs=f.Items(^):set fi=fs.Item(^) 
    echo p=fi.Path:wscript.echo "set Location=" ^& p
)>%vbs%
cscript //nologo %vbs% > %cmd%
for /f "delims=" %%a in (%cmd%) do %%a
for %%f in (%vbs% %cmd%) do if exist %%f del /f /q %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
goto :eof
::***************************************************************************

::***************************************************************************
:Browse4File
set Location=
set vbs="%temp%\_.vbs"
set cmd="%temp%\_.cmd"
for %%f in (%vbs% %cmd%) do if exist %%f del %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
(
    echo set shell=WScript.CreateObject("Shell.Application"^) 
    echo set f=shell.BrowseForFolder(0,"%~1",16384,"%~2"^) 
    echo if typename(f^)="Nothing" Then  
    echo wscript.echo "set Location=Dialog Cancelled" 
    echo WScript.Quit(1^)
    echo end if 
    echo set fs=f.Items(^):set fi=fs.Item(^) 
    echo p=fi.Path:wscript.echo "set Location=" ^& p
)>%vbs%
cscript //nologo %vbs% > %cmd%
for /f "delims=" %%a in (%cmd%) do %%a
for %%f in (%vbs% %cmd%) do if exist %%f del /f /q %%f
for %%g in ("vbs cmd") do if defined %%g set %%g=
goto :eof
::***************************************************************************

:eof
endlocal