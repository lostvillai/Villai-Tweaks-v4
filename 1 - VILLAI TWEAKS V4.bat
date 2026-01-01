@echo off
title LOSTVILLAI V4 - 2026 Gaming Optimizer
net session >nul 2>&1
if %errorLevel% neq 0 (echo Run as Admin! & pause & exit)
reg delete "HKCU\Software\Microsoft\Direct3D" /v DisableVidMemVBs /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /f >nul 2>&1
mode con cols=100 lines=32

:menu
cls
color 0B
echo.
echo  ===============================================================================
echo                   LOSTVILLAI V4 - ULTIMATE GAMING OPTIMIZER 2026
echo  ===============================================================================
echo.
echo   NETWORK              PERFORMANCE         GAMING              SYSTEM
echo   -------              -----------         ------              ------
echo   [1] DNS Auto         [5] Power Plan      [9]  FPS Boost     [13] Clean
echo   [2] Net Boost        [6] CPU Tweak       [10] Input Fix     [14] Bloat
echo   [3] Ping Fix         [7] GPU Turbo       [11] Priority      [15] Services
echo   [4] WiFi/Eth         [8] RAM Clean       [12] Fortnite      [16] Startup
echo.
echo   UTILITIES            QUICK ACTIONS
echo   ---------            -------------
echo   [17] Restore         [A] SAFE MODE - All Safe Tweaks
echo   [18] Revert          [E] EXTREME - Max Performance
echo   [19] Info            [Q] QUICK - Essential Only
echo   [20] Bench           [G] Discord  [Y] YouTube  [X] Exit
echo.
set /p c=Choice: 

if "%c%"=="1" goto dns
if "%c%"=="2" goto net
if "%c%"=="3" goto ping
if "%c%"=="4" goto wifi
if "%c%"=="5" goto power
if "%c%"=="6" goto cpu
if "%c%"=="7" goto gpu
if "%c%"=="8" goto ram
if "%c%"=="9" goto fps
if "%c%"=="10" goto input
if "%c%"=="11" goto priority
if "%c%"=="12" goto fortnite
if "%c%"=="13" goto clean
if "%c%"=="14" goto bloat
if "%c%"=="15" goto services
if "%c%"=="16" goto startup
if "%c%"=="17" goto restore
if "%c%"=="18" goto revert
if "%c%"=="19" goto info
if "%c%"=="20" goto bench
if /i "%c%"=="a" goto safe
if /i "%c%"=="e" goto extreme
if /i "%c%"=="q" goto quick
if /i "%c%"=="g" start https://discord.gg/DqAs8eZ6ue & goto menu
if /i "%c%"=="y" start https://youtube.com/@Lostvillai & goto menu
if /i "%c%"=="x" exit
goto menu

:dns
cls & color 0D
echo ===============================================================================
echo                          DNS AUTO-TEST AND CONFIG
echo ===============================================================================
pause
for /f "tokens=3*" %%i in ('netsh interface show interface ^| findstr Connected') do set adapter=%%j
netsh interface ip set dns name="%adapter%" static 1.1.1.1 >nul 2>&1
netsh interface ip add dns name="%adapter%" 1.0.0.1 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
color 0A & echo Done! Cloudflare DNS configured. & pause & goto menu

:net
cls & color 0D
echo ===============================================================================
echo                            NETWORK BOOST
echo ===============================================================================
pause
ipconfig /flushdns >nul 2>&1
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
netsh int tcp set global congestionprovider=ctcp >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xFFFFFFFF /f >nul 2>&1
color 0A & echo Done! Network optimized. & pause & goto menu

:ping
cls & color 0D
echo ===============================================================================
echo                              PING REDUCER
echo ===============================================================================
pause
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpInitialRtt /t REG_DWORD /d 300 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPDelAckTicks /t REG_DWORD /d 0 /f >nul 2>&1
color 0A & echo Done! Ping optimized. & pause & goto menu

:wifi
cls & color 0D
echo ===============================================================================
echo                         WIFI/ETHERNET PRIORITY
echo ===============================================================================
echo [1] Ethernet First    [2] WiFi First    [B] Back
set /p np=Choice: 
if "%np%"=="1" powershell "Get-NetAdapter | Where {$_.InterfaceDescription -like '*Ethernet*'} | Set-NetIPInterface -InterfaceMetric 10" >nul 2>&1 & color 0A & echo Done! Ethernet priority set. & pause
if "%np%"=="2" powershell "Get-NetAdapter | Where {$_.InterfaceDescription -like '*Wi-Fi*'} | Set-NetIPInterface -InterfaceMetric 10" >nul 2>&1 & color 0A & echo Done! WiFi priority set. & pause
goto menu

:power
cls & color 0D
echo ===============================================================================
echo                         ULTIMATE POWER PLAN
echo ===============================================================================
pause
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%i in ('powercfg -list ^| findstr Ultimate') do set guid=%%i
powercfg -changename %guid% "LOSTVILLAI Ultimate" >nul 2>&1
powercfg -setactive %guid% >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 0 /f >nul 2>&1
color 0A & echo Done! Ultimate power plan active. & pause & goto menu

:cpu
cls & color 0D
echo ===============================================================================
echo                            CPU OPTIMIZER
echo ===============================================================================
pause
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
color 0A & echo Done! CPU optimized. & pause & goto menu

:gpu
cls & color 0D
echo ===============================================================================
echo                            GPU TURBO MODE
echo ===============================================================================
pause
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
color 0A & echo Done! GPU turbo enabled (restart required). & pause & goto menu

:ram
cls & color 0D
echo ===============================================================================
echo                             RAM CLEANER
echo ===============================================================================
pause
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f >nul 2>&1
color 0A & echo Done! RAM optimized. & pause & goto menu

:fps
cls & color 0D
echo ===============================================================================
echo                            FPS BOOSTER
echo ===============================================================================
pause
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f >nul 2>&1
color 0A & echo Done! FPS boost applied. & pause & goto menu

:input
cls & color 0D
echo ===============================================================================
echo                          INPUT LAG FIX
echo ===============================================================================
pause
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f >nul 2>&1
color 0A & echo Done! Input lag reduced. & pause & goto menu

:priority
cls & color 0D
echo ===============================================================================
echo                         GAME PRIORITY SETTER
echo ===============================================================================
echo Enter game exe name (e.g., game.exe):
set /p game=
tasklist /FI "IMAGENAME eq %game%" 2>NUL | find /I "%game%" >NUL
if "%ERRORLEVEL%"=="0" (
    wmic process where name="%game%" CALL setpriority "high priority" >nul 2>&1
    color 0A & echo Done! %game% set to HIGH priority.
) else (
    color 0C & echo Game not running!
)
pause & goto menu

:fortnite
cls & color 0D
echo ===============================================================================
echo                        FORTNITE OPTIMIZER
echo ===============================================================================
pause
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul 2>&1
tasklist /FI "IMAGENAME eq FortniteClient-Win64-Shipping.exe" 2>NUL | find /I "FortniteClient" >NUL
if "%ERRORLEVEL%"=="0" wmic process where name="FortniteClient-Win64-Shipping.exe" CALL setpriority "high priority" >nul 2>&1
color 0A & echo Done! Fortnite optimized. & pause & goto menu

:clean
cls & color 0D
echo ===============================================================================
echo                          DEEP SYSTEM CLEAN
echo ===============================================================================
pause
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
del /q /f /s C:\Windows\Prefetch\* >nul 2>&1
ipconfig /flushdns >nul 2>&1
color 0A & echo Done! System cleaned. & pause & goto menu

:bloat
cls & color 0D
echo ===============================================================================
echo                        BLOATWARE REMOVER
echo ===============================================================================
pause
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
color 0A & echo Done! Bloatware disabled. & pause & goto menu

:services
cls & color 0D
echo ===============================================================================
echo                         SERVICE OPTIMIZER
echo ===============================================================================
pause
sc config SysMain start=disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
color 0A & echo Done! Services optimized. & pause & goto menu

:startup
cls & color 0D
echo ===============================================================================
echo                       STARTUP OPTIMIZER
echo ===============================================================================
pause
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v * /t REG_BINARY /d 030000000000000000000000 /f >nul 2>&1
color 0A & echo Done! Startup optimized. & pause & goto menu

:restore
cls & color 0D
echo ===============================================================================
echo                      CREATE RESTORE POINT
echo ===============================================================================
pause
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "LOSTVILLAI V4", 100, 7 >nul 2>&1
color 0A & echo Done! Restore point created. & pause & goto menu

:revert
cls & color 0C
echo ===============================================================================
echo                         REVERT ALL CHANGES
echo ===============================================================================
echo Use System Restore to revert changes.
echo Press Win+R, type: rstrui.exe
pause & goto menu

:info
cls & color 0D
echo ===============================================================================
echo                          SYSTEM INFO
echo ===============================================================================
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"
wmic cpu get name
wmic path win32_VideoController get name
pause & goto menu

:bench
cls & color 0D
echo ===============================================================================
echo                         GAMING BENCHMARK TEST
echo ===============================================================================
echo Testing network performance...
echo.
echo Fortnite Servers:
ping -n 4 qosping-aws-us-east-1.ol.epicgames.com | find "Average" 
echo.
echo Valorant Servers:
ping -n 4 104.160.131.1 | find "Average"
echo.
echo Google DNS (baseline):
ping -n 4 8.8.8.8 | find "Average"
echo.
echo Disk Performance:
powershell "Get-PhysicalDisk | Select FriendlyName, MediaType"
echo.
echo ===============================================================================
pause & goto menu
:safe
cls & color 0D
echo ===============================================================================
echo                    SAFE MODE - APPLYING ALL TWEAKS
echo ===============================================================================
pause
call :dns_silent
call :net_silent
call :ping_silent
call :power_silent
call :cpu_silent
call :gpu_silent
call :ram_silent
call :fps_silent
call :input_silent
call :clean_silent
color 0A & echo Done! All safe tweaks applied. RESTART REQUIRED. & pause & goto menu

:extreme
cls & color 0C
echo ===============================================================================
echo                  EXTREME MODE - MAXIMUM PERFORMANCE
echo ===============================================================================
echo WARNING: This applies ALL tweaks including aggressive settings!
set /p conf=Type YES to continue: 
if /i not "%conf%"=="YES" goto menu
call :safe
call :services_silent
call :bloat_silent
color 0A & echo Done! Extreme mode applied. RESTART NOW! & pause & goto menu

:quick
cls & color 0D
echo ===============================================================================
echo                    QUICK START - ESSENTIALS ONLY
echo ===============================================================================
pause
call :dns_silent
call :net_silent
call :fps_silent
color 0A & echo Done! Essential tweaks applied. & pause & goto menu

:dns_silent
for /f "tokens=3*" %%i in ('netsh interface show interface ^| findstr Connected') do set adapter=%%j
netsh interface ip set dns name="%adapter%" static 1.1.1.1 >nul 2>&1
netsh interface ip add dns name="%adapter%" 1.0.0.1 index=2 >nul 2>&1
ipconfig /flushdns >nul 2>&1
goto :eof

:net_silent
ipconfig /flushdns >nul 2>&1
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xFFFFFFFF /f >nul 2>&1
goto :eof

:ping_silent
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpInitialRtt /t REG_DWORD /d 300 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPDelAckTicks /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof

:power_silent
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
for /f "tokens=4" %%i in ('powercfg -list ^| findstr Ultimate') do set guid=%%i
powercfg -setactive %guid% >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof

:cpu_silent
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v ValueMax /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
goto :eof

:gpu_silent
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
goto :eof

:ram_silent
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof

:fps_silent
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f >nul 2>&1
goto :eof

:input_silent
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f >nul 2>&1
goto :eof

:clean_silent
del /q /f /s %TEMP%\* >nul 2>&1
del /q /f /s C:\Windows\Temp\* >nul 2>&1
ipconfig /flushdns >nul 2>&1
goto :eof

:services_silent
sc config SysMain start=disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
goto :eof

:bloat_silent
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
goto :eof