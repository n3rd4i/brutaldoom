# Zandronum install
## Build package
Brutal Doom download Website (checksum visibile in this link):
1. Go to download website: https://www.moddb.com/downloads/start/95667/all
2. Right+Click on any mirror and copy hyperlink
3. Set url variable with new copied hyperlink: `url='LINK_HERE'`
4. Download the asset: `wget -nc -O tools/assets/brutalv21.rar $url`
5. Calculate MD5 Hash: %chocolateyinstall%\tools\checksum tools\assets\brutalv21.rar
6. Check MD5 Hash: a42f7a1f4fbec5b19591ece7f9811034

## References
* Download [link](https://www.moddb.com/downloads/start/95667/all)
* [BrutalDoom](https://www.moddb.com/mods/brutal-doom/downloads/brutal-doom-v21-beta)
