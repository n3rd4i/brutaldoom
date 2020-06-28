$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"
. "$toolsDir\dependenciesEnv.ps1"

$url = Get-ModdbDlUrl 'https://www.moddb.com/downloads/start/95667'
$brutalDoomArgs = @{
  packageName   = 'BrutalDoomMod'
  url           = $url
  unzipLocation = $installLocation
  checksum      = '088C35D934B0CE29715B0CA8F4C67BC82EFCE7DA8458D42337A026E7F5E68D19'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @brutalDoomArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk

# Install symbolic link for later use
$pk3_src = "$(Join-Path $installLocation $BDModPack)"
& $ENV:COMSPEC /C MKLINK $pk3_lnk $pk3_src

# StartMenu
Install-ChocolateyShortcut "$startMenuDir\BD startServer [LAN].lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack -iwad freedoom1.wad -port 10666 -host " `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut "$startMenuDir\BD joinLocal [LAN].lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack -iwad freedoom1.wad -connect 127.0.0.1:10666" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut "$startMenuDir\BrutalDoom Manual.lnk" `
  -TargetPath "$installLocation\BRUTAL DOOM MANUAL.rtf" `

Install-ChocolateyShortcut "$startMenuDir\BrutalDoom.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack" `
  -IconLocation "$toolsDir\assets\brutal_doom.ico" `
  -WorkingDirectory "$installLocation"
