# [DTC] DownloadTableConfig

Provides easy to use download configs with file prefixes.

## File format
```
// comment line
# comment line
; comment line

[GamePrepare 5] 	sound/timeleft/en/unreal/5sec.mp3
[GamePrepare 4] 	sound/timeleft/en/unreal/4sec.mp3
[GamePrepare 3] 	sound/timeleft/en/unreal/3sec.mp3
[GamePrepare 2] 	sound/timeleft/en/unreal/2sec.mp3
[GamePrepare 1] 	sound/timeleft/en/unreal/1sec.mp3

[GameEnd NoneTeam]	sound/sm_hosties/noscopestart1.mp3
[GameEnd RedTeam]   sound/sm_hosties/noscopestart1.mp3
[GameEnd BlueTeam] 	sound/sm_hosties/noscopestart1.mp3

[PlayerSkin Red] models/player/prisoner/prisoner_red_fix.mdl
	models/player/prisoner/prisoner_red_fix.dx90.vtx
	models/player/prisoner/prisoner_red_fix.phy
	models/player/prisoner/prisoner_red_fix.vvd
	materials/models/player/prisoner_red/hands.vmt
	materials/models/player/prisoner_red/hands.vtf
	materials/models/player/prisoner_red/prisoner.vmt
	materials/models/player/prisoner_red/prisoner.vtf
	materials/models/player/prisoner_red/prisoner_n.vtf

[PlayerSkin Blue] models/player/prisoner/prisoner_blue_fix.mdl
	models/player/prisoner/prisoner_blue_fix.dx90.vtx
	models/player/prisoner/prisoner_blue_fix.phy
	models/player/prisoner/prisoner_blue_fix.vvd
	materials/models/player/prisoner_blue/hands.vmt
	materials/models/player/prisoner_blue/hands.vtf
	materials/models/player/prisoner_blue/prisoner.vmt
	materials/models/player/prisoner_blue/prisoner.vtf
	materials/models/player/prisoner_blue/prisoner_n.vtf

[Mark Red 12.0 0.125] materials/decals/custom/redstar.vmt
	materials/decals/custom/redstar.vtf

[Mark Blue 12.0 0.125] materials/decals/custom/bluestar.vmt
	materials/decals/custom/bluestar.vtf
```
