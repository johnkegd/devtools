@REM ----------------------------------------------------------------------------
@REM Vault Start Up Batch script
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM VLT_HOME - location of vault's installed home dir
@REM VLT_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM VLT_BATCH_PAUSE - set to 'on' to wait for a key stroke before ending
@REM VLT_OPTS - parameters passed to the Java VM when running vlt
@REM     e.g. to debug vlt itself, use
@REM set VLT_OPTS=-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM ----------------------------------------------------------------------------

@REM Begin all REM lines with '@' in case VLT_BATCH_ECHO is 'on'
@echo off
@REM enable echoing my setting VLT_BATCH_ECHO to 'on'
@if "%VLT_BATCH_ECHO%" == "on"  echo %VLT_BATCH_ECHO%

@REM set %HOME% to equivalent of $HOME
if "%HOME%" == "" (set HOME=%HOMEDRIVE%%HOMEPATH%)

@REM Execute a user defined script before this one
if exist "%HOME%\vltrc_pre.bat" call "%HOME%\vltrc_pre.bat"

set ERROR_CODE=0

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo ERROR: JAVA_HOME not found in your environment.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto chkMHome

echo.
echo ERROR: JAVA_HOME is set to an invalid directory.
echo JAVA_HOME = %JAVA_HOME%
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error

:chkMHome
if not "%VLT_HOME%"=="" goto valMHome

if "%OS%"=="Windows_NT" SET VLT_HOME=%~dp0\..
if not "%VLT_HOME%"=="" goto valMHome

echo.
echo ERROR: VLT_HOME not found in your environment.
echo Please set the VLT_HOME variable in your environment to match the
echo location of the Vault installation
echo.
goto error

:valMHome
if exist "%VLT_HOME%\bin\vlt.bat" goto init

echo.
echo ERROR: VLT_HOME is set to an invalid directory.
echo VLT_HOME = %VLT_HOME%
echo Please set the VLT_HOME variable in your environment to match the
echo location of the Vault installation
echo.
goto error
@REM ==== END VALIDATION ====

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM -- 4NT shell
if "%@eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set VLT_CMD_LINE_ARGS=%*
goto endInit

@REM The 4NT Shell from jp software
:4NTArgs
set VLT_CMD_LINE_ARGS=%$
goto endInit

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of agruments (up to the command line limit, anyway).
set VLT_CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto endInit
set VLT_CMD_LINE_ARGS=%VLT_CMD_LINE_ARGS% %1
shift
goto Win9xApp

@REM Reaching here means variables are defined and arguments have been captured
:endInit
SET VLT_JAVA_EXE="%JAVA_HOME%\bin\java.exe"

@REM Start Vault
:runvlt
%VLT_JAVA_EXE% -Xmx256m %VLT_OPTS% -Dlauncher.main.class=com.day.jcr.vault.cli.VaultFsApp -jar "%VLT_HOME%"\lib\launcher.jar %VLT_CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set VLT_JAVA_EXE=
set VLT_CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec
if exist "%HOME%\vltrc_post.bat" call "%HOME%\vltrc_post.bat"
@REM pause the batch file if VLT_BATCH_PAUSE is set to 'on'
if "%VLT_BATCH_PAUSE%" == "on" pause

if "%VLT_TERMINATE_CMD%" == "on" exit %ERROR_CODE%

exit /B %ERROR_CODE%

