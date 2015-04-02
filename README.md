## [DTC] DownloadTableConfig
Provides easy to use download configs with file prefixes.

## File format
- Each line contains one file at max
  - e.g. `materials/decals/custom/redstar.vtf` 
- Blank and commented lines are skiped
- Each file can have prefix `[PrefixName PrefixArg1 PrefixArg2 PrefixArg3 ...] FilePath`
  - e.g. `[Mark Red 12.0 0.125] materials/decals/custom/redstar.vmt`
- Arguments cannot contain `]` (must be escaped to use `\]`)
- String arguments with whitespace must be quoted e.g. `[PrefixName 1.0 "whitespace test"]`
- Lines are trimed before proccesing, so you can indent lines with whitespaces or tabs

**File example:**
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
