$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"
. "$toolsDir\dependenciesEnv.ps1"

$srcURL = 'https://www.moddb.com/downloads/start/95667'
$tokenURL = "($($srcURL.replace('start','mirror'))/\w+/\w+)"
$request = [System.Net.WebRequest]::Create($srcURL)
$response = $request.GetResponse().GetResponseStream()
$content = (New-Object System.IO.StreamReader $response).ReadToEnd()
$url = (select-string -Input $content -Pattern $tokenURL).Matches[0].Value

$BDModPack = "brutalv21.pk3"
$brutalDoomArgs = @{
  packageName   = 'BrutalDoomMod'
  url           = $url
  unzipLocation = $installLocation
  softwareName  = 'brutal*'
  checksum      = 'A42F7A1F4FBEC5B19591ECE7F9811034'
  checksumType  = 'md5'
}
Install-ChocolateyZipPackage @brutalDoomArgs

Install-ChocolateyShortcut -ShortcutFilePath "$lnkDesktop" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack" `
  -IconLocation "$toolsDir\assets\brutal_doom.ico" `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\BrutalDoom.lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack" `
  -IconLocation "$toolsDir\assets\brutal_doom.ico" `
  -WorkingDirectory "$installLocation"

Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\BrutalDoom Manual.lnk" `
  -TargetPath "$installLocation\BRUTAL DOOM MANUAL.rtf" `

Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\BD startServer [LAN].lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack -iwad freedoom1.wad -port 10666 -host " `
  -WorkingDirectory "$installLocation"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\BD joinLocal [LAN].lnk" `
  -TargetPath "$zandronumLocation\zandronum.exe" `
  -Arguments "$installLocation\$BDModPack -iwad freedoom1.wad -connect 127.0.0.1:10666" `
  -WorkingDirectory "$installLocation"
