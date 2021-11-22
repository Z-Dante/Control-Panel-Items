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
        echo ! NOTE: This will delete the 'Control Panel Items' Custom Folder From your Start Menu Directory
        echo ! Are you sure you want to continue..?
        pause >nul

        echo ##################################################################################
        echo !
        echo ! Deleting Items From Start Menu...
        del "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Control Panel Items\*.lnk"
        rmdir "%PROGRAMDATA%\Microsoft\Windows\Start Menu\Programs\Control Panel Items"
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

