# [DTC] DownloadTableConfig

Provides easy to use download configs with file prefixes.

## File format
```
// comment line
# comment line
; comment line

[GamePrepare 3] 	sound/timeleft/en/unreal/3sec.mp3
[GamePrepare 2] 	sound/timeleft/en/unreal/2sec.mp3
[GamePrepare 1] 	sound/timeleft/en/unreal/1sec.mp3

[GameEnd RedTeam]   sound/sm_hosties/noscopestart1.mp3
[GameEnd BlueTeam] 	sound/sm_hosties/noscopestart1.mp3

[PlayerSkin Red] models/player/prisoner/prisoner_red_fix.mdl
	models/player/prisoner/prisoner_red_fix.dx90.vtx
	models/player/prisoner/prisoner_red_fix.phy
	models/player/prisoner/prisoner_red_fix.vvd

[PlayerSkin Blue] models/player/prisoner/prisoner_blue_fix.mdl
	models/player/prisoner/prisoner_blue_fix.dx90.vtx
	models/player/prisoner/prisoner_blue_fix.phy
	models/player/prisoner/prisoner_blue_fix.vvd

[Mark Red 12.0 0.125] materials/decals/custom/redstar.vmt
	materials/decals/custom/redstar.vtf

[Mark Blue 12.0 0.125] materials/decals/custom/bluestar.vmt
	materials/decals/custom/bluestar.vtf
```
