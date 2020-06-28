$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

& $ENV:COMSPEC /C IF EXIST $pk3_lnk DEL /S /Q $pk3_lnk

Remove-Item $startMenuDir -recurse -force
Remove-Item $installLocation -exclude *.ini, *.zds -recurse -force
