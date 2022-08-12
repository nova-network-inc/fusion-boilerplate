@ECHO Off
TITLE Fusion Boilerplate && COLOR 0F

REM We use Yarn by default, but you can easily change your package manager by
REM changing the variables below. You can also customise your scripts by making
REM changes to your `package.json` file.
SET "PkgMngr=yarn"
SET "AppInstall=%PkgMngr% install"
SET "AppStart=%PkgMngr% start"
SET "AppBuild=%PkgMngr% build"
SET "CallScript=START"

REM Get the script version.
SET /P Version=<V

REM SCRIPT MAP
REM ----------------------------------------------------------------------------
REM > Index
REM
REM   /- APP.BATCH
REM
REM > Pages
REM
REM   /- INSTALL
REM      /- APP.INSTALL
REM   /- START
REM       /- APP.START
REM   /- BUILD
REM      /- APP.BUILD
REM   /- SDK
REM      /- SDK.INSTALL
REM   /- ENV
REM       /- ENV.SET
REM           /- ENV.SET.WRITE
REM   /- HELP
REM
REM > Modals
REM
REM   /- OP.CANCEL
REM ----------------------------------------------------------------------------



REM PAGE STARTS ________________________________________________________________
REM Page: Main Menu
REM Description: Main menu with all script options.

:APP.BATCH
CLS
ECHO ---------------------------------------------------------------------------
ECHO I                                                                         I
ECHO I                    WELCOME TO FUSION BOILERPLATE                        I
ECHO I                                                                         I
ECHO I                         By Nova Network Inc.                            I
ECHO I                   Script by Paulo Baronceli (ZNX)                       I
ECHO I                                                                         I
ECHO ---------------------------------------------------------------------------
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO I                              MAIN MENU                                  I
ECHO ---------------------------------------------------------------------------
ECHO I                                                                         I
ECHO I  1. Install/Update Modules and Dependencies                             I
ECHO I  2. Start Development Application                                       I
ECHO I  3. Build Web Application                                               I
ECHO I  4. Install/Reinstall Fusion SDK                                        I
ECHO I  5. Set Environment Vairables                                           I
ECHO I  6. Help!                                                               I
ECHO I  7. Exit                                                                I
ECHO I                                                                         I
ECHO ---------------------------------------------------------------------------
ECHO.
SET /P "CMD=#"
ECHO.

REM MENU ROUTER
REM Handles the user choice, directing each option to the appropriate place, while
REM handling errors and invalid commands.
IF %CMD% == 1 (GOTO INSTALL)
IF %CMD% == 2 (GOTO START)
IF %CMD% == 3 (GOTO BUILD)
IF %CMD% == 4 (GOTO SDK)
IF %CMD% == 5 (GOTO ENV)
IF %CMD% == 6 (GOTO HELP)
IF %CMD% == 7 (EXIT) ELSE (
  ECHO Invalid option. Try again. && PAUSE>NULL && GOTO APP.BATCH
)

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Install Modules
REM Description: Installs all modules and dependencies, or updates them.

:INSTALL
ECHO You are about to install Fusion Modules and Dependencies. This process might
ECHO take several minutes to complete, and we recommend you not to close your
ECHO terminal until it is finished.
ECHO.
SET /P "SUBOPT=Do you want to proceed? (Y/N) #"
IF /I %SUBOPT% == Y GOTO APP.INSTALL ELSE (
  GOTO OP.CANCEL
)

  :APP.INSTALL
  ECHO.
  ECHO ---------------------------------------------------------------------------
  ECHO I  Starting Fusion Boilerplate installation script...                     I
    %CallScript% %AppInstall%
  ECHO I                                                                         I
  ECHO I  Installation has started on a separate terminal.                       I
  ECHO I  You can press any key to go back to the main menu.                     I
  ECHO ---------------------------------------------------------------------------
  PAUSE>NULL
  GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Start Application
REM Description: Starts the application on a local development environment.

:START
ECHO You are about to start Fusion Boilerplate in your localhost.
ECHO.
ECHO Application: Fusion Boilerplate
ECHO Start Script: %AppStart%
ECHO Default Port: 3000
ECHO Browser Link: http://localhost:3000/
ECHO.
SET /P "SUBOPT=Do you want to proceed? (Y/N) #"
IF /I %SUBOPT% == Y GOTO APP.START ELSE (
  GOTO OP.CANCEL
)

  :APP.START
  ECHO.
  ECHO ---------------------------------------------------------------------------
  ECHO I  Starting Fusion Boilerplate in your localhost...                       I
    %CallScript% %AppStart%
  ECHO I                                                                         I
  ECHO I  The application has started on a separate terminal.                    I
  ECHO I  You can press any key to go back to the main menu.                     I
  ECHO ---------------------------------------------------------------------------
  PAUSE>NULL
  GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Build Application
REM Description: Builds a static Web App for deployment and production.

:BUILD
ECHO This script will create an optimised build for your application inside your
ECHO `/build` folder in  your main repository. To deploy it, all you need to do
ECHO is to upload the files to your web server. via FTP or another method.
ECHO.
SET /P "SUBOPT=Do you want to proceed? (Y/N) #"
IF /I %SUBOPT% == Y GOTO APP.BUILD ELSE (
  GOTO OP.CANCEL
)

  :APP.BUILD
  ECHO.
  ECHO ---------------------------------------------------------------------------
  ECHO I  Building Fusion Boilerplate...                                         I
    %CallScript% %AppBuild%
  ECHO I                                                                         I
  ECHO I  The application has started building on a separate terminal.           I
  ECHO I  You can press any key to go back to the main menu.                     I
  ECHO ---------------------------------------------------------------------------
  PAUSE>NULL
  GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Install SDK
REM Description: Installs or reinstalls all SDK files and extra dependencies.

:SDK
ECHO You are about to install Fusion SDK and extra dependencies.
ECHO.
SET /P "SUBOPT=Do you want to proceed? (Y/N) #"
IF /I %SUBOPT% == Y GOTO SDK.INSTALL ELSE (
  GOTO OP.CANCEL
)

  :SDK.INSTALL
  ECHO.
  ECHO Installing Fusion SDK, Dependencies...
  ECHO ---------------------------------------------------------------------------
  ECHO.
  XCOPY /s /y /v ".\@fusionSDK\" ".\node_modules\@uniswap\"
  ECHO.
  ECHO ---------------------------------------------------------------------------
  ECHO I   The SDK installation has finished!                                    I
  ECHO I   Press any key to return to the main menu.                             I
  ECHO ---------------------------------------------------------------------------
  PAUSE>NULL
  GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Set Environment
REM Description: Creates the default environment file with pre-determined variables.

:ENV
ECHO You are about to set the default environment variables for your application.
ECHO.
SET /P "SUBOPT=Do you want to proceed? (Y/N) #"
IF /I %SUBOPT% == Y GOTO ENV.SET ELSE (
  GOTO OP.CANCEL
)

  :ENV.SET
  CLS
  ECHO ---------------------------------------------------------------------------
  ECHO I                        ENVIRONMENT VARIABLES                            I
  ECHO ---------------------------------------------------------------------------
  ECHO I                                                                         I
  ECHO I  What is your application default network ID? Supported by Fusion SDK:  I
  ECHO I                                                                         I
  ECHO I  87: Nova Network (Default)                                             I
  ECHO I  107: Nebula Testnet                                                    I
  ECHO I  250: Fantom                                                            I
  ECHO I                                                                         I
  ECHO ---------------------------------------------------------------------------
  ECHO.
  SET /P "NETWORK_ID=#"
  ECHO.
  ECHO ---------------------------------------------------------------------------
  ECHO I                                                                         I
  ECHO I  Please specify a secure HTTPS RPC endpoint to use.                     I
  ECHO I  Default: https://connect.novanetwork.io/                               I
  ECHO I                                                                         I
  ECHO ---------------------------------------------------------------------------
  ECHO.
  SET /P "RPC_ENDPOINT=#"
  ECHO.
  ECHO Recording on File:
  ECHO.
  ECHO REACT_APP_CHAIN_ID="%NETWORK_ID%"
  ECHO REACT_APP_NETWORK_URL="%RPC_ENDPOINT%"
  ECHO.
  ECHO Do you confirm the information above? If not, the form will restart.
  SET /P "SUBOPT=#"
  IF /I %SUBOPT% == Y GOTO ENV.SET.WRITE ELSE (
    GOTO ENV.SET
  )

    :ENV.SET.WRITE
    ECHO.
    ECHO Writing information to your environment file...
    ECHO REACT_APP_CHAIN_ID="%NETWORK_ID%">.env
    ECHO REACT_APP_NETWORK_URL="%RPC_ENDPOINT%">>.env
    ECHO SKIP_PREFLIGHT_CHECK=true>>.env
    ECHO.
    ECHO ---------------------------------------------------------------------------
    ECHO I   Finished writing your environment variables.                          I
    ECHO I   Press any key to return to the main menu.                             I
    ECHO ---------------------------------------------------------------------------
    PAUSE>NULL
    GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Help
REM Description: Just a bit of help!

:HELP
CLS
ECHO ---------------------------------------------------------------------------
ECHO I                                                                         I
ECHO I                    WELCOME TO FUSION BOILERPLATE                        I
ECHO I                                                                         I
ECHO I                         By Nova Network Inc.                            I
ECHO I                   Script by Paulo Baronceli (ZNX)                       I
ECHO I                                                                         I
ECHO ---------------------------------------------------------------------------
ECHO I                              HELP/ABOUT                                 I
ECHO ---------------------------------------------------------------------------
ECHO I                        Script Version: %Version%                            I
ECHO ---------------------------------------------------------------------------
ECHO I                                                                         I
ECHO I // FUSION BOILERPLATE //                                                I
ECHO I                                                                         I
ECHO I  Fusion  Boilerplate is a modified Uniswap V2 fork, powered by Fusion   I
ECHO I  SDK. It is natively compatible with Nova Network, and the main purpose I
ECHO I  of its creation was to facilitate new developers to build and deploy   I
ECHO I  AMM-based applications in our native ecosystem. It is open-source and  I
echo I  free to use.                                                           I
ECHO I                                                                         I
ECHO I // STEP-BY-STEP INSTALLATION //                                         I
ECHO I                                                                         I
ECHO I  This script automates the entire app installation process. It requires I
ECHO I  both NodeJS and Yarn installed to run. If you don't want to use Yarn,  I
ECHO I   you can change the default package manager by modifying this script.  I
ECHO I                                                                         I
ECHO I  STEP 1: INSTALL MODULES AND DEPENDENCIES                               I
ECHO I                                                                         I
ECHO I  This will install all necessary modules for running the application.   I
ECHO I                                                                         I
ECHO I  STEP 2: INSTALL FUSION SDK                                             I
ECHO I                                                                         I
ECHO I  Here you willl bring all the power of the Fusion SDK package to your   I
ECHO I  app, making it compatible with Nova Network, and setting all important I
ECHO I  parameters for the functioning of the AMM, including the smart         I
ECHO I  contracts to run it.                                                   I
ECHO I                                                                         I
ECHO I  STEP 3: SET YOUR ENVIRONMENT VARIABLES                                 I
ECHO I                                                                         I
ECHO I  All you're doing here is telling the app which network and RPC to use. I
ECHO I  If you don't know what to write, just go with the default options.     I
ECHO I                                                                         I
ECHO I // SMART CONTRACTS //                                                   I
ECHO I                                                                         I
ECHO I  By default, the application will use Nova Network's own smart          I
ECHO I  contracts to run, but you can change that by developing and deploying  I
ECHO I  your own SDK package.                                                  I
ECHO I                                                                         I
ECHO I // RUNNING THE APP IN YOUR LOCAL MACHINE //                             I
ECHO I                                                                         I
ECHO I  You can run the app using the appropriate option in the main menu. It  I
ECHO I  will start the application using the port 3000 by default. If this     I
ECHO I  port is in use, the application will add +1 to the port number until   I
ECHO I  it finds a port that it can use. Eg. 3001, 3002... Once started, you   I
ECHO I  can access the application using your browser, typing                  I
ECHO I  http://localhost:3000/ - change port if needed.                        I
ECHO I                                                                         I
ECHO I // DEPLOYING YOUR APPLICATION //                                        I
ECHO I                                                                         I
ECHO I  Deploying your application is as easy as everything else. You can use  I
ECHO I  ouroff-the-shelf build script for that. Once done, a folder called     I
ECHO I  `/build` will be created inside your main repository, and to deploy    I
ECHO I  your application, all you need to do is to upload this folder to your  I
ECHO I  server and access the app via the `index.html` file inside.            I
ECHO I                                                                         I
ECHO I  For more help, please visit https://novanetwork.io/ or contact us      I
ECHO I  directly via our social media channels.                                I
ECHO I                                                                         I
ECHO ---------------------------------------------------------------------------
PAUSE>NULL
GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________



REM PAGE STARTS ________________________________________________________________
REM Page: Cancel Modal
REM Description: Modal used to cancel operations and return to the main menu.

:OP.CANCEL
ECHO.
ECHO ---------------------------------------------------------------------------
ECHO I  Operation cancelled.                                                   I
ECHO I  Press any key to return to the main menu.                              I
ECHO ---------------------------------------------------------------------------
PAUSE>NULL
GOTO APP.BATCH

REM PAGE ENDS __________________________________________________________________
