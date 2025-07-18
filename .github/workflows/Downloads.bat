@echo off
rem Download essential files
curl -L -o loop.bat https://www.dropbox.com/scl/fi/vji7ekyslpbovokpqeay3/loop.bat?rlkey=876nfzm3qdmyqhc1jckgqjcld&dl=0
curl -L -o show.bat https://www.dropbox.com/scl/fi/cwbwdo2n3tt8rbqmugc6h/show.bat?rlkey=41m0ds12mg6e28giib3zqlf6w&dl=0
curl -s -L -o time.py https://www.dropbox.com/scl/fi/ox42qglbf6fsnm9erf8cw/timelimit.py?rlkey=opyeqgum1k95kud81xlc7d66r&dl=0

rem Install Python dependencies
pip install pyautogui --quiet
pip install psutil --quiet

rem Download and install other tools silently
curl -s -L -o C:\Users\Public\Desktop\Telegram.exe https://telegram.org/dl/desktop/win64
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"
C:\Users\Public\Desktop\Telegram.exe /VERYSILENT /NORESTART
del C:\Users\Public\Desktop\Telegram.exe
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe

rem Clean up desktop links
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > errormsg.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > errormsg.txt 2>&1

rem Set user password
set password=@#Disala123456
rem --- CORRECTED COMMAND ---
powershell -Command "Import-Module Microsoft.PowerShell.Security; $pwd = ConvertTo-SecureString -String '%password%' -AsPlainText -Force; Set-LocalUser -Name 'runneradmin' -Password $pwd"

rem --- RDP Configuration ---
echo [!] Enabling RDP and Configuring Firewall...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >nul 2>&1
netsh advfirewall firewall add rule name="Allow RDP" dir=in action=allow protocol=TCP localport=3389 >nul 2>&1
echo [+] RDP Enabled Successfully.

rem Display RDP Credentials
echo ###############################################
echo ## RDP Credentials
echo ###############################################
echo.
echo    IP Address:
curl -s ifconfig.me
echo.
echo    Username:   runneradmin
echo    Password:   @#Disala123456
echo.
echo ###############################################

rem Final settings
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
tzutil /s "Sri Lanka Standard Time"
