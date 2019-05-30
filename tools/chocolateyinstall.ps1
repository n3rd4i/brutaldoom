$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zandronumLocation = "$ENV:LocalAppData\Programs\Zandronum"
$freedoomLocation = "$ENV:LocalAppData\Programs\FreeDoom"
$installLocation = "$ENV:LocalAppData\Programs\BrutalDoom"
$startMenuLocation = "$ENV:AppData\Microsoft\Windows\Start Menu\Programs\BrutalDoom"
New-Item -ItemType Directory -Force -Path $installLocation

## Brutal Doom section
$BDModName = 'brutalv21'
$BDModPack = "$BDModName.pk3"
$brutalDoomArgs = @{
  packageName   = 'BrutalDoomMod'
  file           = "$toolsDir\assets\$BDModName.rar"
  unzipLocation = $installLocation
  # specificFolder = $BDModPack
  softwareName  = 'brutal*'
  checksum      = 'A42F7A1F4FBEC5B19591ECE7F9811034'
  checksumType  = 'md5'
}
Install-ChocolateyZipPackage @brutalDoomArgs

Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuLocation\BrutalDoom Manual.lnk" `
  -TargetPath "$installLocation\BRUTAL DOOM MANUAL.rtf" `
  -Description "Brutal Doom Manual for v21 GOLD Release"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuLocation\BD Start LAN Server.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "-iwad %localappdata%\Programs\FreeDoom\freedoom1.wad -file %localappdata%\Programs\BrutalDoom\brutalv21.pk3 -port 10666 +map E2M1 +sv_maxlives 0 -host +alwaysapplydmflags 1 -skill 3 +cooperative 1 +sv_hostemail "" +sv_maprotation 0 +sv_randommaprotation 0 +sv_motd "" +sv_hostname BDHome1 +sv_website "" +sv_password "" +sv_forcepassword 0 +sv_joinpassword "" +sv_forcejoinpassword 0 +sv_rconpassword "" +sv_broadcast 1 +sv_updatemaster 0 +sv_maxclients 8 +sv_maxplayers 8 -upnp +dmflags 0 +dmflags2 0 +zadmflags 0 +compatflags 0 +zacompatflags 0 +lmsallowedweapons 0 +lmsspectatorsettings 0 +sv_afk2spec 0 +sv_coop_damagefactor 1 +sv_defaultdmflags 0" `
  -Description "BrutalDoom Start LAN server" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuLocation\BD Join Local LAN Server.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "-file %localappdata%\Programs\BrutalDoom\brutalv21.pk3 -iwad freedoom1.wad -connect 127.0.0.1:10666" `
  -Description "BrutalDoom Join Local LAN server" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$startMenuLocation\BrutalDoom.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack" `
  -IconLocation "$toolsDir\assets\brutal_doom.ico" `
  -Description "Brutal Doom v21 GOLD Release" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut `
  -ShortcutFilePath "$ENV:UserProfile\Desktop\BrutalDoom.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack" `
  -IconLocation "$toolsDir\assets\brutal_doom.ico" `
  -Description "Brutal Doom v21 GOLD Release" `
  -WorkingDirectory "$installLocation"
