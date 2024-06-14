@echo off
:: Set color scheme
color 0A
title Disable Hyper-V by @its-hritika

fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion

echo --- Disable "Hypervisor" feature
bcdedit /set hypervisorlaunchtype off

:: ----------------------------------------------------------
:: ----------------Disable "Hyper-V" feature-----------------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V" feature
:: Disable the "Microsoft-Hyper-V-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Hyper-V GUI Management Tools" feature------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V GUI Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Management-Clients" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-Clients'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Hyper-V Management Tools" feature--------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Tools-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Tools-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable "Hyper-V Module for Windows PowerShell" feature--
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Module for Windows PowerShell" feature
:: Disable the "Microsoft-Hyper-V-Management-PowerShell" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-PowerShell'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) {; Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try {; Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch {; Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


REM Define the registry key paths
set "key1=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard"
set "key2=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"
set "key3=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"

REM Define the value names
set "value1=EnableVirtualizationBasedSecurity"
set "value2=LsaCfgFlags"
set "value3=Enabled"

REM Set the value data
set "data1=0"
set "data2=0"
set "data3=0"

REM Add the first registry entry
reg add "%key1%" /v "%value1%" /t REG_DWORD /d %data1% /f >nul 2>&1

REM Add the second registry entry
reg add "%key2%" /v "%value2%" /t REG_DWORD /d %data2% /f >nul 2>&1

REM Modify the value data of the third registry entry
reg add "%key3%" /v "%value3%" /t REG_DWORD /d %data3% /f >nul 2>&1

REM Check if the registry entries were added/modified successfully
if %errorlevel% equ 0 (
    echo Registry entries added/modified successfully.
) else (
    echo Failed to add/modify registry entries.
)

:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0
