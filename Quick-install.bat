@echo off
goto check_Permissions

:check_Permissions
    echo ##################################################################################
    echo !
    echo ! Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo !
        echo ! Success: Administrative permissions confirmed.
        echo !

        echo ##################################################################################
        echo !
        echo ! Copying Files to Start Menu...
        robocopy "%~dp0\Control Panel Items" "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Control Panel Items"
        echo !
        echo ! Done!
        echo ! Press Any Key to Finish!
        echo ##################################################################################
    ) else (
        color 0c
        echo !
        echo ! Failure: Current permissions inadequate. Please Run this file as Administrator.
        echo ! Press Any key to Exit!
        echo ##################################################################################

    )

    pause >nul

