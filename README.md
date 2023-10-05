Add a mapcycle on Counter Strike 2

# Installation
Drag and drop on `/game/csgo/`

Add at the end of your server.cfg  
```
sv_cheats 1
script_reload_code mapcycle
sv_cheats 0
```

# Configuration
Go to `/game/csgo/cfg/vscripts/mapcycle.ini`  
Add the mapcycle in cycle configuration, seperate the map list by a space

```
"Plugins"
{
	"cycle" "de_dust2 cs_italy cs_office de_nuke"
}
```