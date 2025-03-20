@echo off
title GOD MODE POWER PLAN ACTIVATION
color 0A
echo Enabling Godly Performance Mode...

:: Enable Ultimate Performance Plan (if not available)
powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

:: Create a Custom "God Mode" Power Plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

:: Disable CPU Throttling
powercfg -change -processor-throttle-min 100
powercfg -change -processor-throttle-max 100

:: Disable Sleep & Hibernate
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
powercfg -hibernate off

:: Max Out Performance on AC Power
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg -setacvalueindex scheme_current sub_processor IDLEDISABLE 1
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 0

:: Set Disk to Never Turn Off
powercfg -change -disk-timeout-ac 0

:: Set Display Timeout to 30 minutes
powercfg -change -monitor-timeout-ac 30

:: Registry Tweaks for Extra Boost
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

:: Apply Changes
powercfg -setactive scheme_current

echo.
echo God Mode Power Plan Activated! Your laptop is now running at peak performance.
pause
exit
