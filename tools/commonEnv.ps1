$installLocation = "$ENV:LocalAppData\Programs\BrutalDoom"
$lnkDesktop = "$ENV:UserProfile\Desktop\BrutalDoom.lnk"
$startMenuDir = "$ENV:AppData\Microsoft\Windows\Start Menu\Programs\BrutalDoom"

$BDModPack = "brutalv21.pk3"
$pk3_lnk = "$(Join-Path $ENV:DOOMWADDIR $BDModPack)"
