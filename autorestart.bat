
REM change-me
set pathdir=/d C:\Users\PC\Desktop\Servergta
REM change-me
set startpath="Server" C:\Users\PC\Desktop\Servergta\run.cmd +exec server.cfg

:loop

Title GTARPFIVEMLAUNCHER
	@echo Clearing Server Cache Files
	 
	cd %pathdir%

	rm /s /q cache

	@echo off
	
	cls
	
	@echo Hit Enter In This Window To Restart Server Immediately, Keep This Window Open For Automatic 6 Hour Server Restarts.

	start %startpath%
	
	timeout /t 21600
	
	taskkill /f /im FXServer.exe
	
	@echo Server Shutdown Successfully.
	
	taskkill /F /FI "GTARPFIVEMLAUNCHER"

	@echo Server Is Restarting Now.

goto loop