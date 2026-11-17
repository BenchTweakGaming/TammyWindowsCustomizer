#Requires -RunAsAdministrator
#Requires -Version 5.1

#region Initial Actions
$Global:Failed = $false

# Unload and import private functions and module
Get-ChildItem -Path function: | Where-Object -FilterScript {$_.ScriptBlock.File -match "Sophia_Script_for_Windows"} | Remove-Item -Force
Remove-Module -Name SophiaScript -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Module\Manifest\SophiaScript.psd1 -PassThru -Force
Get-ChildItem -Path $PSScriptRoot\Module\Private | ForEach-Object -Process {. $_.FullName}

# The mandatory checks.
InitialActions

# Global variable if checks failed
if ($Global:Failed)
{
	exit
}
#endregion Initial Actions

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Preset configuration starts here                                    #
# Настройка пресет-файла начинается здесь                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#region Protection

# Enable script logging. Log will be recorded into the script folder. To stop logging just close the console or type "Stop-Transcript".
# Logging

# Create restore point.
CreateRestorePoint

#endregion Protection


#region Privacy & Telemetry

# Disable the "Connected User Experiences and Telemetry" service (DiagTrack), and block the connection for the Unified Telemetry Client Outbound Traffic. Disabling the "Connected User Experiences and Telemetry" service (DiagTrack) can cause you not being able to get Xbox achievements anymore and affects Feedback Hub.
DiagTrackService -Disable

# Enable the "Connected User Experiences and Telemetry" service (DiagTrack), and allow the connection for the Unified Telemetry Client Outbound Traffic (default value).
# DiagTrackService -Enable

# Set the diagnostic data collection to minimum.
DiagnosticDataLevel -Minimal

# Set the diagnostic data collection to default (default value).
# DiagnosticDataLevel -Default

# Turn off the Windows Error Reporting.
ErrorReporting -Disable

# Turn on the Windows Error Reporting (default value).
# ErrorReporting -Enable

# Change the feedback frequency to "Never".
FeedbackFrequency -Never

# Change the feedback frequency to "Automatically" (default value).
# FeedbackFrequency -Automatically

# Turn off the diagnostics tracking scheduled tasks.
ScheduledTasks -Disable

# Turn on the diagnostics tracking scheduled tasks (default value).
# ScheduledTasks -Enable

# Do not use sign-in info to automatically finish setting up device after an update.
SigninInfo -Disable

# Use sign-in info to automatically finish setting up device after an update (default value).
# SigninInfo -Enable

# Do not let websites provide locally relevant content by accessing language list.
LanguageListAccess -Disable

# Let websites provide locally relevant content by accessing language list (default value).
# LanguageListAccess -Enable

# Do not let apps show me personalized ads by using my advertising ID.
AdvertisingID -Disable

# Let apps show me personalized ads by using my advertising ID (default value).
# AdvertisingID -Enable

# Hide the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested.
WindowsWelcomeExperience -Hide

# Show the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested (default value).
# WindowsWelcomeExperience -Show

# Get tips and suggestions when I use Windows (default value).
WindowsTips -Enable

# Do not get tips and suggestions when I use Windows.
# WindowsTips -Disable

# Hide from me suggested content in the Settings app.
SettingsSuggestedContent -Hide

# Show me suggested content in the Settings app (default value).
# SettingsSuggestedContent -Show

# Turn off automatic installing suggested apps.
AppsSilentInstalling -Disable

# Turn on automatic installing suggested apps (default value).
# AppsSilentInstalling -Enable

# Do not suggest ways to get the most out of Windows and finish setting up this device.
WhatsNewInWindows -Disable

# Suggest ways to get the most out of Windows and finish setting up this device (default value).
# WhatsNewInWindows -Enable

# Don't let Microsoft use your diagnostic data for personalized tips, ads, and recommendations.
TailoredExperiences -Disable

# Let Microsoft use your diagnostic data for personalized tips, ads, and recommendations (default value).
# TailoredExperiences -Enable

# Disable Bing search in the Start Menu.
BingSearch -Disable

# Enable Bing search in the Start Menu (default value).
# BingSearch -Enable

#endregion Privacy & Telemetry


#region UI & Personalization

# Show the "This PC" icon on Desktop.
ThisPC -Show

# Hide the "This PC" icon on Desktop (default value).
# ThisPC -Hide

# Do not use item check boxes.
CheckBoxes -Disable

# Use item check boxes (default value).
# CheckBoxes -Enable

# Show hidden files, folders, and drives.
HiddenItems -Enable

# Do not show hidden files, folders, and drives (default value).
# HiddenItems -Disable

# Show file name extensions.
FileExtensions -Show

# Hide file name extensions (default value).
# FileExtensions -Hide

# Show folder merge conflicts.
MergeConflicts -Show

# Hide folder merge conflicts (default value).
# MergeConflicts -Hide

# Open File Explorer to "This PC".
OpenFileExplorerTo -ThisPC

# Open File Explorer to Quick access (default value).
# OpenFileExplorerTo -QuickAccess

# Disable File Explorer compact mode (default value).
FileExplorerCompactMode -Disable

# Enable File Explorer compact mode.
# FileExplorerCompactMode -Enable

# Hide sync provider notification within File Explorer.
OneDriveFileExplorerAd -Hide

# Show sync provider notification within File Explorer (default value).
# OneDriveFileExplorerAd -Show

# When I snap a window, do not show what I can snap next to it.
SnapAssist -Disable

# When I snap a window, show what I can snap next to it (default value).
# SnapAssist -Enable

# Show the file transfer dialog box in the detailed mode.
FileTransferDialog -Detailed

# Show the file transfer dialog box in the compact mode (default value).
# FileTransferDialog -Compact

# Display the recycle bin files delete confirmation.
RecycleBinDeleteConfirmation -Enable

# Do not display the recycle bin files delete confirmation (default value).
# RecycleBinDeleteConfirmation -Disable

# Hide recently used files in Quick access.
QuickAccessRecentFiles -Hide

# Show recently used files in Quick access (default value).
# QuickAccessRecentFiles -Show

# Hide frequently used folders in Quick access.
QuickAccessFrequentFolders -Hide

# Show frequently used folders in Quick access (default value).
# QuickAccessFrequentFolders -Show

# Set taskbar position to the bottom of the screen (default value).
# TaskbarPosition -Bottom

# Set taskbar position to the top of the screen.
# TaskbarPosition -Top

# Set taskbar position to the left side of the screen.
# TaskbarPosition -Left

# Set taskbar position to the right side of the screen.
# TaskbarPosition -Right

# Set taskbar alignment to the left.
# TaskbarAlignment -Left

# Set taskbar alignment to the center (default value).
TaskbarAlignment -Center

# Hide widgets icon on the taskbar.
TaskbarWidgets -Hide

# Show widgets icon on the taskbar (default value).
# TaskbarWidgets -Show

# Hide the search on the taskbar.
TaskbarSearch -Hide

# Show the search icon on the taskbar.
# TaskbarSearch -SearchIcon

# Show the search icon and label on the taskbar.
# TaskbarSearch -SearchIconLabel

# Show the search box on the taskbar (default value).
# TaskbarSearch -SearchBox

# Hide search highlights.
SearchHighlights -Hide

# Show search highlights (default value).
# SearchHighlights -Show

# Hide the Task view button from the taskbar.
TaskViewButton -Hide

# Show the Task View button on the taskbar (default value).
# TaskViewButton -Show

# Show seconds on the taskbar clock.
SecondsInSystemClock -Show

# Hide seconds on the taskbar clock (default value).
# SecondsInSystemClock -Hide

# Show time in Notification Center.
ClockInNotificationCenter -Show

# Hide time in Notification Center (default value).
# ClockInNotificationCenter -Hide

# Combine taskbar buttons and always hide labels (default value).
TaskbarCombine -Always

# Combine taskbar buttons and hide labels when taskbar is full.
# TaskbarCombine -Full

# Combine taskbar buttons and never hide labels.
# TaskbarCombine -Never

# Unpin Microsoft Edge, Microsoft Store, and Outlook shortcuts from the taskbar.
UnpinTaskbarShortcuts -Shortcuts Edge, Store, Outlook

# Enable end task in taskbar by right click.
TaskbarEndTask -Enable

# Disable end task in taskbar by right click (default value).
# TaskbarEndTask -Disable

# View the Control Panel icons by large icons.
ControlPanelView -LargeIcons

# View the Control Panel icons by small icons.
# ControlPanelView -SmallIcons

# View the Control Panel icons by category (default value).
# ControlPanelView -Category

# Set the default Windows mode to dark.
WindowsColorMode -Dark

# Set the default Windows mode to light (default value).
# WindowsColorMode -Light

# Set the default app mode to dark.
AppColorMode -Dark

# Set the default app mode to light (default value).
# AppColorMode -Light

# Hide first sign-in animation after the upgrade.
FirstLogonAnimation -Disable

# Show first sign-in animation after the upgrade (default value).
# FirstLogonAnimation -Enable

# Set the quality factor of the JPEG desktop wallpapers to maximum.
JPEGWallpapersQuality -Max

# Set the quality factor of the JPEG desktop wallpapers to default (default value).
# JPEGWallpapersQuality -Default

# Do not add the "- Shortcut" suffix to the file name of created shortcuts.
ShortcutsSuffix -Disable

# Add the "- Shortcut" suffix to the file name of created shortcuts (default value).
# ShortcutsSuffix -Enable

# Use the Print screen button to open screen snipping.
PrtScnSnippingTool -Enable

# Do not use the Print screen button to open screen snipping (default value).
# PrtScnSnippingTool -Disable

# Do not use a different input method for each app window (default value).
# AppsLanguageSwitch -Disable

# Let me use a different input method for each app window.
AppsLanguageSwitch -Enable

# When I grab a window's title bar and shake it, minimize all other windows.
AeroShaking -Enable

# When I grab a window's title bar and shake it, don't minimize all other windows (default value).
# AeroShaking -Disable

# Set default cursors.
# Cursors -Default

# Download and install free dark "Windows 11 Cursors Concept v2" cursors from Jepri Creations.
# Cursors -Dark

# Download and install free light "Windows 11 Cursors Concept v2" cursors from Jepri Creations.
# Cursors -Light

# Do not group files and folders in the Downloads folder.
FolderGroupBy -None

# Group files and folders by date modified in the Downloads folder (default value).
# FolderGroupBy -Default

# Do not expand to open folder on navigation pane (default value).
NavigationPaneExpand -Disable

# Expand to open folder on navigation pane.
# NavigationPaneExpand -Enable

# Hide recently added apps in Start.
RecentlyAddedStartApps -Hide

# Show recently added apps in Start (default value).
# RecentlyAddedStartApps -Show

# Unpin all Start tiles.
# UnpinAllStartTiles

# Use Category View for All Apps on Start (default value).
# StartAppsView -Category

# Use Grid View for All Apps on Start.
# StartAppsView -Grid

# Use List View for All Apps on Start.
StartAppsView -List

# Hide most used apps in Start (default value).
MostUsedStartApps -Hide

# Show most used apps in Start.
# MostUsedStartApps -Show

# Remove Recommended section in Start.
StartRecommendedSection -Hide

# Show Recommended section in Start (default value).
# StartRecommendedSection -Show

# Hide recommendations for tips, shortcuts, new apps, and more in Start.
StartRecommendationsTips -Hide

# Show recommendations for tips, shortcuts, new apps, and more in Start (default value).
# StartRecommendationsTips -Show

# Hide Microsoft account-related notifications on Start.
StartAccountNotifications -Hide

# Show Microsoft account-related notifications on Start (default value).
# StartAccountNotifications -Show

#endregion UI & Personalization


#region OneDrive

# Uninstall OneDrive. OneDrive user folder won't be removed if any files are found there.
# OneDrive -Uninstall

# Install OneDrive. Internet connection required.
# OneDrive -Install

# Install OneDrive for all users to %ProgramFiles%. Internet connection required.
# OneDrive -Install -AllUsers

#endregion OneDrive


#region System

# Turn on Storage Sense.
StorageSense -Enable

# Turn off Storage Sense (default value).
# StorageSense -Disable

# Disable hibernation. Not recommended for laptops.
Hibernation -Disable

# Enable hibernation (default value).
# Hibernation -Enable

# Enable Windows long paths support which is limited to 260 characters by default.
Win32LongPathsSupport -Enable

# Disable Windows long paths support which is limited to 260 characters by default (default value).
# Win32LongPathsSupport -Disable

# Display Stop error code when BSoD occurs.
BSoDStopError -Enable

# Do not display Stop error code when BSoD occurs (default value).
# BSoDStopError -Disable

# Choose when to be notified about changes to your computer: never notify.
AdminApprovalMode -Never

# Choose when to be notified about changes to your computer: notify me only when apps try to make changes to my computer (default value).
# AdminApprovalMode -Default

# Turn off Delivery Optimization.
DeliveryOptimization -Disable

# Turn on Delivery Optimization (default value).
# DeliveryOptimization -Enable

# Do not let Windows manage my default printer.
WindowsManageDefaultPrinter -Disable

# Let Windows manage my default printer (default value).
# WindowsManageDefaultPrinter -Enable

# Disable Windows features.
WindowsFeatures -Disable

# Enable Windows features.
# WindowsFeatures -Enable

# Uninstall Windows capabilities.
WindowsCapabilities -Uninstall

# Install Windows capabilities.
# WindowsCapabilities -Install

# Receive updates for other Microsoft products when you update Windows.
UpdateMicrosoftProducts -Enable

# Do not receive updates for other Microsoft products (default value).
# UpdateMicrosoftProducts -Disable

# Notify me when a restart is required to finish updating.
RestartNotification -Show

# Do not notify me when a restart is required to finish updating (default value).
# RestartNotification -Hide

# Restart as soon as possible to finish updating.
RestartDeviceAfterUpdate -Enable

# Don't restart as soon as possible to finish updating (default value).
# RestartDeviceAfterUpdate -Disable

# Automatically adjust active hours for me based on daily usage.
ActiveHours -Automatically

# Manually adjust active hours (default value).
# ActiveHours -Manually

# Do not get the latest updates as soon as they're available (default value).
WindowsLatestUpdate -Disable

# Get the latest updates as soon as they're available.
# WindowsLatestUpdate -Enable

# Set power plan to "High performance". Not recommended for laptops.
PowerPlan -High

# Set power plan to "Balanced" (default value).
# PowerPlan -Balanced

# Do not allow the computer to turn off the network adapters to save power. Not recommended for laptops.
NetworkAdaptersSavePower -Disable

# Allow the computer to turn off the network adapters to save power (default value).
# NetworkAdaptersSavePower -Enable

# Override for default input method: English.
InputMethod -English

# Override for default input method: use language list (default value).
# InputMethod -Default

# Change location of user folders to the root of any drive using the interactive menu. User files or folders won't be moved to a new location.
Set-UserShellFolderLocation -Root

# Select location of user folders manually using a folder browser dialog. User files or folders won't be moved to a new location.
# Set-UserShellFolderLocation -Custom

# Change user folders location to default values. User files or folders won't be moved to the new location (default value).
# Set-UserShellFolderLocation -Default

# Save screenshots on the Desktop when pressing Windows+PrtScr or using Windows+Shift+S.
WinPrtScrFolder -Desktop

# Save screenshots in the Pictures folder when pressing Windows+PrtScr or using Windows+Shift+S (default value).
# WinPrtScrFolder -Default

# Run troubleshooter automatically, then notify. In order for this feature to work, the OS level of diagnostic data gathering will be set to "Optional diagnostic data" and the error reporting feature will be turned on.
RecommendedTroubleshooting -Automatically

# Ask me before running troubleshooters. In order for this feature to work, the OS level of diagnostic data gathering will be set to "Optional diagnostic data" and the error reporting feature will be turned on (default value).
# RecommendedTroubleshooting -Default

# Disable and delete reserved storage after the next update installation.
ReservedStorage -Disable

# Enable reserved storage (default value).
# ReservedStorage -Enable

# Disable help lookup via F1.
F1HelpPage -Disable

# Enable help lookup via F1 (default value).
# F1HelpPage -Enable

# Enable Num Lock at startup.
NumLock -Enable

# Disable Num Lock at startup (default value).
# NumLock -Disable

# Disable Caps Lock.
# CapsLock -Disable

# Enable Caps Lock (default value).
# CapsLock -Enable

# Do not allow the shortcut key to start Sticky Keys when pressing the Shift key 5 times.
StickyShift -Disable

# Allow the shortcut key to start Sticky Keys when pressing the Shift key 5 times (default value).
# StickyShift -Enable

# Don't use AutoPlay for all media and devices.
Autoplay -Disable

# Use AutoPlay for all media and devices (default value).
# Autoplay -Enable

# Disable thumbnail cache removal.
ThumbnailCacheRemoval -Disable

# Enable thumbnail cache removal (default value).
# ThumbnailCacheRemoval -Enable

# Automatically save my restartable apps and restart them when I sign back in.
SaveRestartableApps -Enable

# Turn off automatically saving my restartable apps and restarting them when I sign back in (default value).
# SaveRestartableApps -Disable

# Do not restore previous folder windows at logon (default value).
RestorePreviousFolders -Disable

# Restore previous folder windows at logon.
# RestorePreviousFolders -Enable

# Register app, calculate hash, and associate with an extension with the 'How do you want to open this' pop-up hidden.
# Set-Association

# Export all Windows associations into Application_Associations.json file to script root folder.
# Export-Associations

# Import all Windows associations from an Application_Associations.json file. You need to install all apps according to an exported Application_Associations.json file to restore all associations.
# Import-Associations

# Set Windows Terminal as default terminal app to host the user interface for command-line applications.
DefaultTerminalApp -WindowsTerminal

# Set Windows Console Host as default terminal app to host the user interface for command-line applications (default value).
# DefaultTerminalApp -ConsoleHost

# Install the latest Microsoft Visual C++ Redistributable Packages 2017–2026 (x86/x64).
Install-VCRedist

# Install the latest .NET Desktop Runtime 8, 9, 10 x64.
Install-DotNetRuntimes -Runtimes NET8, NET9, NET10

# List Microsoft Edge channels to prevent desktop shortcut creation upon its update.
PreventEdgeShortcutCreation -Channels Stable, Beta, Dev, Canary

# Do not prevent desktop shortcut creation upon Microsoft Edge update (default value).
# PreventEdgeShortcutCreation -Disable

# Back up the system registry to %SystemRoot%\System32\config\RegBack folder when PC restarts and create RegIdleBackup task in the Task Scheduler to manage subsequent backups.
RegistryBackup -Enable

# Do not back up the system registry to %SystemRoot%\System32\config\RegBack folder (default value).
# RegistryBackup -Disable

# Disable Windows AI functions.
WindowsAI -Disable

# Enable Windows AI functions (default value).
# WindowsAI -Enable

#endregion System


#region WSL

# Enable Windows Subsystem for Linux (WSL) and install the latest WSL Linux kernel version.
# Install-WSL

#endregion WSL


#region UWP apps

# Uninstall UWP apps.
Uninstall-UWPApps

# Uninstall UWP apps for all users.
# Uninstall-UWPApps -AllUsers

#endregion UWP apps


#region Gaming

# Disable Xbox Game Bar. To prevent popping up the "You'll need a new app to open this ms-gamingoverlay" warning, you need to disable the Xbox Game Bar app, even if you uninstalled it before.
# XboxGameBar -Disable

# Enable Xbox Game Bar (default value).
# XboxGameBar -Enable

# Disable Xbox Game Bar tips.
# XboxGameTips -Disable

# Enable Xbox Game Bar tips (default value).
# XboxGameTips -Enable

# Turn on hardware-accelerated GPU scheduling. Restart needed. Only if you have a dedicated GPU and WDDM version is 2.7 or higher.
GPUScheduling -Enable

# Turn off hardware-accelerated GPU scheduling. Restart needed (default value).
# GPUScheduling -Disable

#endregion Gaming


#region Scheduled tasks

# Create "Windows Cleanup" scheduled task for cleaning up Windows unused files and updates.
CleanupTask -Register

# Delete "Windows Cleanup" and "Windows Cleanup Notification" scheduled tasks for cleaning up Windows unused files and updates.
# CleanupTask -Delete

# Create "SoftwareDistribution" scheduled task for cleaning up %SystemRoot%\SoftwareDistribution\Download folder.
SoftwareDistributionTask -Register

# Delete "SoftwareDistribution" scheduled task for cleaning up %SystemRoot%\SoftwareDistribution\Download folder.
# SoftwareDistributionTask -Delete

# Create "Temp" task in the Task Scheduler to clean up the %TEMP% folder. Only files older than one day will be deleted. The task runs every 60 days. Windows Script Host must be enabled for the task to run.
TempTask -Register

# Delete "Temp" scheduled task for cleaning up %TEMP% folder.
# TempTask -Delete

#endregion Scheduled tasks


#region Microsoft Defender & Security

# Enable Microsoft Defender Exploit Guard network protection.
NetworkProtection -Enable

# Disable Microsoft Defender Exploit Guard network protection (default value).
# NetworkProtection -Disable

# Enable detection for potentially unwanted applications and block them.
PUAppsDetection -Enable

# Disable detection for potentially unwanted applications (default value).
# PUAppsDetection -Disable

# Enable sandboxing for Microsoft Defender.
DefenderSandbox -Enable

# Disable sandboxing for Microsoft Defender (default value).
# DefenderSandbox -Disable

# Enable logging of running processes, including their arguments, and PowerShell scripts, and Create custom "Process Creation" view in the Event Viewer.
EventViewerCustomView -Enable

# Disable logging of running processes, including their arguments, and PowerShell scripts, and remove the custom "Process Creation" view from the Event Viewer (default value).
# EventViewerCustomView -Disable

# Microsoft Defender SmartScreen doesn't mark downloaded files from the Internet as unsafe.
# AppsSmartScreen -Disable

# Microsoft Defender SmartScreen marks downloaded files from the Internet as unsafe (default value).
AppsSmartScreen -Enable

# Disable the Attachment Manager marking files that have been downloaded from the Internet as unsafe.
SaveZoneInformation -Disable

# Enable the Attachment Manager marking files that have been downloaded from the Internet as unsafe (default value).
# SaveZoneInformation -Enable

# Enable Windows Sandbox.
# WindowsSandbox -Enable

# Disable Windows Sandbox (default value).
# WindowsSandbox -Disable

# Enable DNS-over-HTTPS using Cloudflare DNS.
DNSoverHTTPS -Cloudflare

# Enable DNS-over-HTTPS using Google Public DNS.
# DNSoverHTTPS -Google

# Enable DNS-over-HTTPS using Quad9 DNS.
# DNSoverHTTPS -Quad9

# Enable DNS-over-HTTPS using Comss.one DNS.
# DNSoverHTTPS -ComssOne

# Enable DNS-over-HTTPS using AdGuard DNS.
# DNSoverHTTPS -AdGuard

# Enable DNS-over-HTTPS using OpenDNS DNS.
# DNSoverHTTPS -OpenDNS

# Set default ISP's DNS records (default value).
# DNSoverHTTPS -Reset

# Enable Local Security Authority protection to prevent code injection without UEFI lock.
# LocalSecurityAuthority -Enable

# Disable Local Security Authority protection without UEFI lock (default value).
# LocalSecurityAuthority -Disable

#endregion Microsoft Defender & Security


#region Context menu

# Show the "Extract all" item in the Windows Installer (.msi) context menu.
MSIExtractContext -Show

# Hide the "Extract all" item from the Windows Installer (.msi) context menu (default value).
# MSIExtractContext -Hide

# Show the "Install" item in the Cabinet (.cab) filenames extensions context menu.
CABInstallContext -Show

# Hide the "Install" item from the Cabinet (.cab) filenames extensions context menu (default value).
# CABInstallContext -Hide

# Hide the "Look for an app in the Microsoft Store" item in the "Open with" dialog.
UseStoreOpenWith -Hide

# Show the "Look for an app in the Microsoft Store" item in the "Open with" dialog (default value).
# UseStoreOpenWith -Show

# Open Windows Terminal in context menu as administrator by default.
OpenWindowsTerminalAdminContext -Enable

# Do not open Windows Terminal in context menu as administrator by default (default value).
# OpenWindowsTerminalAdminContext -Disable

#endregion Context menu


#region Update Policies

# Display all policy registry keys (even manually created ones) in the Local Group Policy Editor snap-in (gpedit.msc). This can take up to 30 minutes, depending on the number of policies created in the registry and your system resources.
# ScanRegistryPolicies

#endregion Update Policies


PostActions
