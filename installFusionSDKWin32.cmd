@ECHO Off
ECHO You are about to install Fusion SDK and extra dependencies.
SET /P "cmd=Do you want to proceed? (Y/N) :"
IF /I %cmd% == Y GOTO INSTALL ELSE GOTO CANCEL

:CANCEL
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO Operation cancelled.
PAUSE
EXIT

:INSTALL
ECHO Installing Fusion SDK, Dependencies...
ECHO ---------------------------------------------------------------------------
ECHO.
XCOPY /s /y /v ".\@uniswap\" ".\node_modules\@uniswap\"
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO Installation successful!
ECHO ---------------------------------------------------------------------------
ECHO.
PAUSE
CLS
EXIT
