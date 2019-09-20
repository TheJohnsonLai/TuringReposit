% Variables, picture creation, etc

var Silver : int := 1000 % 100,000 = good 1,000,000 = great limit = 100,000,000

var InventoryStockType : array 1 .. 7, 1 .. 6 of int
var InventoryStockStat : array 1 .. 7, 1 .. 6 of int

type InventoryType :
    record
	Type : int
	Stat : int
    end record

var Inventory : array 1 .. 7, 1 .. 6 of InventoryType
for IHori : 1 .. 7
    for IVert : 1 .. 6
	Inventory (IHori, IVert).Type := 0
	Inventory (IHori, IVert).Stat := 0
    end for
end for

% People info
type Skills :
    record
	SkillID : int % ID Linked to procedure, calculation, animation
	Level : int % Level of 1/6 current skills
	Picture : int % Picture of 1/6 current skills

    end record

type ID :
    record
	Body : int
	Identity : int %0 = non existent, 1 = normal, 2 = enemy, 3 = boss, 4 = Top 3 slots, 5 = NPC on team
	UB : int % Picture for unlocked body (Fullscreen)
	Avatar : int
	Experience : int
	Name : string
	Level : int
	TotalLevel : int
	ChangeLevel : int
	Party : int % 1 = team, 0 = None, 2 = Foe
	Health : int
	TotalHealth : int %% 1
	Attack : int %% 3
	TotalAttack : int %% 3
	ChangeAttack : int
	Defense : int %% 4
	ChangeDefense : int
	Weapon : int
	TotalDefense : int %% 4
	CritChance : int % Base is 5-15%% %% 5 (7-10)
	TotalCritChance : int % Base is 5-15%% %% 5 (7-10)
	ChangeCritChance : int
	CritDamage : int % base is 110-140% %% 6
	TotalCritDamage : int % base is 110-140% %% 6
	ChangeCritDamage : int
	Power : int
	TotalPower : int %% 2
	Speed : int %%%% 50 = super fast, (80-110 Ave.),150 = super slow %%%%
	ChangeSpeed : int %%%% 50 = super fast, (80-110 Ave.),150 = super slow %%%%
	TotalSpeed : int %%%% 50 = super fast, (80-110 Ave.),150 = super slow %%%%
	PositionX : int
	PositionY : int
	GearType : array 1 .. 3 of int % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
	GearStat : array 1 .. 3 of int %% NUmber amount
	Skill : array 1 .. 6 of Skills
	BaseSkill : array 1 .. 10 of Skills
    end record

%%%%% Create Identities to cycle
var Character : array 0 .. 12 of ID
var Party : array 1 .. 10 of ID
var TempID : ID %%%%% Temporary person for swapping

for Cycle : 1 .. 12
    if Cycle < 11 then
	Character (Cycle).Identity := 0
	Character (Cycle).Name := ""
	Party (Cycle).Identity := 0
	Party (Cycle).Name := ""
    else
	Character (Cycle).Identity := 0
    end if
end for


var Sillness : ID % `1 Sillness Furlenstorn
var Ravness : ID % 2 Ravness Loxaerion
var Drin : ID % Altinova % D-Rin Shibu
var Zefan : ID % Mountain Zefan De Lune
var Cosseus : ID % MEdiah Cosseus Reganton

var Wolfe : ID % Heidel Wolfe Shane
var Rage : ID % Epheria Rage Rhinstone
var Cleo : ID % Delphi  Cleo Succubus
var Aeron : ID % Second Stage (Achievement) % Aeron Cas Grae
var Seira : ID % Calpheon Seira Von Herain
%%%% Party Identity

%%%%%%%%%%%%%%%Battle Turns
type CurrentT :
    record
	ID : int
	LIST : int
	Speed : int
    end record
var CT : array 1 .. 36 of CurrentT
var tempID : int
var tempSpeed : int
var CurrentTID : int := -1
var IsSortDone : boolean := true
%%%%%%%%%%%%%%%%%%%%%%%
var SkillSize : int := 110
var SkillPic : array 1 .. SkillSize of int %% Skill picture
for SC : 1 .. SkillSize
    SkillPic (SC) := Skill_CrescentSlash
end for
SkillPic (1) := Skill_CrescentSlash
SkillPic (2) := Skill_HeartWrench
SkillPic (3) := Skill_NebulaBurst
SkillPic (4) := Skill_PhantomBurst
SkillPic (5) := Skill_Concentration %:= Pic.FileNew ("Images\\Skills\\Skill_Concentration.bmp") % Concentration
SkillPic (6) := Skill_SingleShot % := Pic.FileNew ("Images\\Skills\\Skill_SingleShot.bmp") % Single shot
SkillPic (7) := Skill_FeatherStrike  %:= Pic.FileNew ("Images\\Skills\\Skill_FeatherStrike.bmp") % Feather strike
SkillPic (8) := Skill_QuickStrike  %:= Pic.FileNew ("Images\\Skills\\Skill_QuickStrike.bmp") % Quick Strike
%%%% 5
% Sillness
SkillPic (10) := Skill_Cloak  %: int := Pic.FileNew ("Images\\Skills\\Skill_Cloak.bmp") %5 Defense +
SkillPic (11) := Skill_DoubleImpact  %: int := Pic.FileNew ("Images\\Skills\\Skill_DoubleImpact.bmp") %6 Hits twice (x2) crescent slash
SkillPic (12) := Skill_QuickStep  %: int := Pic.FileNew ("Images\\Skills\\Skill_QuickStep.bmp") %7 Speed +
SkillPic (13) := Skill_SlowStep  %: int := Pic.FileNew ("Images\\Skills\\Skill_SlowStep.bmp") %8 Rejuvenate
SkillPic (14) := Skill_LightningPierce %:
SkillPic (17) := Skill_ShadowLotus  %:
SkillPic (15) := Skill_LightningRend %:
SkillPic (16) := Skill_RainbowNuke  %:
%%%% Ravness
SkillPic (20) := Skill_HalberdSlam  %: int := Pic.FileNew ("Images\\Skills\\Skill_HalberdSlam.bmp") % Halberd Slam
SkillPic (21) := Skill_SwingingCarve %: int := Pic.FileNew ("Images\\Skills\\Skill_SwingingCarve.bmp") % Swinging Carve
SkillPic (22) := Skill_PoleBash  %: int := Pic.FileNew ("Images\\Skills\\Skill_PoleBash.bmp") % Pole Bash
SkillPic (23) := Skill_NeckPenetration  %: int := Pic.FileNew ("Images\\Skills\\Skill_NeckPenetration.bmp") % Neck Penetration
SkillPic (24) := Skill_ArmoredDestruction  %: int
SkillPic (25) := Skill_Resurrect %
SkillPic (26) := Skill_Typhoon  %: int :
SkillPic (27) := Skill_Earthquake  %: in
%%%% Cosseus
SkillPic (30) := Skill_DivineArmor  %: int := Pic.FileNew ("Images\\Skills\\Skill_DivineArmor.bmp") % Divine Armor
SkillPic (31) := Skill_CrushingRoar % : int := Pic.FileNew ("Images\\Skills\\Skill_CrushingRoar.bmp") % Aggro
SkillPic (32) := Skill_MultiLaser  %: int := Pic.FileNew ("Images\\Skills\\Skill_MultiLaser.bmp") % Multi-Laser
SkillPic (33) := Skill_BodySlam %: int := Pic.FileNew ("Images\\Skills\\Skill_BodySlam.bmp") % Body Slam
SkillPic (34) := Skill_ShieldBlast  %: int :
%SkillPic (35) := Skill_Resurrect % : int
SkillPic (36) := Skill_MaserCannon  %: inser
SkillPic (37) := Skill_Quasar
%%%% Drin
SkillPic (40) := Skill_DualShot  %: int := Pic.FileNew ("Images\\Skills\\Skill_DualShot.bmp") % Dual Shot
SkillPic (41) := Skill_HeadShot  %: int := Pic.FileNew ("Images\\Skills\\Skill_HeadShot.bmp") % Headshot
SkillPic (42) := Skill_Spinfire  %: int := Pic.FileNew ("Images\\Skills\\Skill_Spinfire.bmp") % Spinfire
SkillPic (43) := Skill_CriticalShot %: int := Pic.FileNew ("Images\\Skills\\Skill_CriticalShot.bmp") % Critical Shot
SkillPic (44) := Skill_RestrainShot  %:
SkillPic (45) := Skill_VirusShot  %:
%SkillPic (46) := Skill_Spinfire  %: HandsBlazin
%SkillPic (47) := Skill_CriticalShot %: Thief
%%% 9
% Wolfe
SkillPic (50) := Skill_ClaweStrike % : int := Pic.FileNew ("Images\\Skills\\Skill_ClaweStrike.bmp") %9 Hits 2 people, one and one on top 50%
SkillPic (51) := Skill_Ferenspirr  %: int := Pic.FileNew ("Images\\Skills\\Skill_Ferenspirr.bmp") %10 Hits 1, damage increases if their turn is closer
SkillPic (52) := Skill_SilentShadow  %: int := Pic.FileNew ("Images\\Skills\\Skill_SilentShadow.bmp") % Silent Shadow (Speed ++ Att++)
SkillPic (53) := Skill_HunterOfTheNight  %: int := Pic.FileNew ("Images\\Skills\\Skill_HunterOfTheNight.bmp") % Hunter of the night (Based on ownspeed + 5%max)
SkillPic (54) := Skill_Roundhauser % : i
SkillPic (55) := Skill_SearingPalms  %: int :
SkillPic (56) := Skill_BusterJam  %: int :
SkillPic (57) := Skill_FivePointStrike  %: int :
%%%% Rage
%%SkillPic (5) :=  shot
SkillPic (61) := Skill_Electrocute % : int := Pic.FileNew ("Images\\Skills\\Skill_Electrocute.bmp") % Electrocute
SkillPic (62) := Skill_BackhandShot % : int := Pic.FileNew ("Images\\Skills\\Skill_BackhandShot.bmp") % Backhand shot
SkillPic (63) := Skill_ZeroEnergy  %: int := Pic.FileNew ("Images\\Skills\\Skill_ZeroEnergy.bmp") % Zero Energy
SkillPic (64) := Skill_ElectricVortex % : in
SkillPic (66) := Skill_HandsBlazin % : in
SkillPic (65) := Skill_Thief  %:
%%% 11
% Seira
SkillPic (70) := Skill_KatanaDualWield % : int := Pic.FileNew ("Images\\Skills\\Skill_KatanaDualWield.bmp") %11 Stun 1turn (Speed +Total)
SkillPic (71) := Skill_KatanaFlash % : int := Pic.FileNew ("Images\\Skills\\Skill_KatanaFlash.bmp") %12 Heavy damage multiplier
SkillPic (72) := Skill_Singularity  %: int := Pic.FileNew ("Images\\Skills\\Skill_Singularity.bmp") %13 Deals damage using teammates
SkillPic (73) := Skill_ThousandSlashes  %: int := Pic.FileNew ("Images\\Skills\\Skill_ThousandSlashes.bmp") %14 Hits 2 people, 60% damage multiple times
SkillPic (74) := Skill_Focus % : in
SkillPic (75) := Skill_Parry % : int := P
SkillPic (76) := Skill_LonelySpirit %: in
SkillPic (77) := Skill_GodHand
%% 15
% Zefan
SkillPic (80) := Skill_GyroBurn  %: int := Pic.FileNew ("Images\\Skills\\Skill_GyroBurn.bmp") %15 Damage
SkillPic (81) := Skill_PhotonBlaze  %: int := Pic.FileNew ("Images\\Skills\\Skill_PhotonBlaze.bmp") %16 Damage + increase their speed by 5
SkillPic (82) := Skill_PillarofLight % : int := Pic.FileNew ("Images\\Skills\\Skill_PillarofLight.bmp") %17 Hits 3-5 enemies, + shape
SkillPic (83) := Skill_SplitLaser % : int := Pic.FileNew ("Images\\Skills\\Skill_SplitLasers.bmp") %18 Hits all enemies at 40% damage
SkillPic (84) := Skill_Regenerate  %:
SkillPic (85) := Skill_PhotonVortex  %:
SkillPic (86) := Skill_MeteorShower % :
SkillPic (87) := Skill_PhotonExplosion
%%% 19
% Cleo
SkillPic (90) := Skill_WorldEdit % : int := Pic.FileNew ("Images\\Skills\\Skill_WorldEdit.bmp") %19 Removes 12-20%% hp
SkillPic (91) := Skill_BloodOust % : int := Pic.FileNew ("Images\\Skills\\Skill_BloodOust.bmp") % Blood Oust (Heal)
SkillPic (92) := Skill_DemonCall % : int := Pic.FileNew ("Images\\Skills\\Skill_DemonCall.bmp") % Demon Call (2% + dmg)
SkillPic (93) := Skill_Signify % : int := Pic.FileNew ("Images\\Skills\\Skill_Signify.bmp") % Signify (Damage, -own hp)
SkillPic (94) := Skill_PowerOust %
SkillPic (95) := Skill_ChainedLinks %
SkillPic (96) := Skill_DestroyNature %
SkillPic (97) := Skill_DragonCall % :
%%%% Aeron
SkillPic (100) := Skill_CenterFocus
SkillPic (101) := Skill_KingOfSpades
SkillPic (102) := Skill_QueensMercy
SkillPic (103) := Skill_HiddenAce
SkillPic (104) := Skill_Wise
SkillPic (105) := Skill_AllUp
SkillPic (106) := Skill_OrbOfThePast
%%%% /*
/*
 SkillPic (20) := Skill_HeartWrench
 SkillPic (21) := Skill_NebulaBurst
 SkillPic (22) := Skill_PhantomBurst
 SkillPic (23) := Skill_Cloak
 SkillPic (24) := Skill_DoubleImpact
 */
% Sillness
Sillness.Avatar := AV_Sillness %%% Role: Ninja
Sillness.Body := CB_Sillness
Sillness.UB := UB_Sillness
Sillness.Identity := 4
Sillness.Name := "Sillness"
Sillness.Experience := 0
Sillness.Level := 1
Sillness.Party := 1
Sillness.Health := 500
Sillness.TotalHealth := 500
Sillness.Attack := 52
Sillness.TotalLevel := 1
Sillness.TotalAttack := 52
Sillness.TotalDefense := 9
Sillness.TotalCritChance := 11
Sillness.TotalCritDamage := 125
Sillness.ChangeLevel := 0
Sillness.ChangeAttack := 0
Sillness.ChangeDefense := 0
Sillness.ChangeCritChance := 0
Sillness.ChangeCritDamage := 0
Sillness.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Sillness.Defense := 9
Sillness.CritChance := 11
Sillness.CritDamage := 125
Sillness.Power := 100
Sillness.TotalPower := 100
Sillness.Speed := 77
Sillness.TotalSpeed := 77
Sillness.PositionX := 1
Sillness.PositionY := 1
Sillness.GearType (1) := 0  % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
Sillness.GearStat (1) := 0 %% Value of said stat
Sillness.GearType (2) := 0
Sillness.GearStat (2) := 0
Sillness.GearType (3) := 0
Sillness.GearStat (3) := 0
Sillness.Skill (1).Level := 1
Sillness.Skill (2).Level := 1
Sillness.Skill (3).Level := 1
Sillness.Skill (4).Level := 1
Sillness.Skill (5).Level := 1
Sillness.Skill (6).Level := 1
Sillness.Skill (1).SkillID := 1
Sillness.Skill (2).SkillID := 3
Sillness.Skill (3).SkillID := 10
Sillness.Skill (4).SkillID := 11
Sillness.Skill (5).SkillID := 12
Sillness.Skill (6).SkillID := 13
Sillness.BaseSkill (1).Level := 1
Sillness.BaseSkill (2).Level := 1
Sillness.BaseSkill (3).Level := 1
Sillness.BaseSkill (4).Level := 1
Sillness.BaseSkill (5).Level := 1
Sillness.BaseSkill (6).Level := 1
Sillness.BaseSkill (7).Level := 1
Sillness.BaseSkill (8).Level := 1
Sillness.BaseSkill (9).Level := 1
Sillness.BaseSkill (10).Level := 1
Sillness.BaseSkill (1).SkillID := 1
Sillness.BaseSkill (2).SkillID := 3
Sillness.BaseSkill (3).SkillID := 10
Sillness.BaseSkill (4).SkillID := 15
Sillness.BaseSkill (5).SkillID := 12
Sillness.BaseSkill (6).SkillID := 11
Sillness.BaseSkill (7).SkillID := 13
Sillness.BaseSkill (8).SkillID := 14
Sillness.BaseSkill (9).SkillID := 17
Sillness.BaseSkill (10).SkillID := 16

% Ravness
Ravness.Avatar := AV_Ravness %%% Role: Tank
Ravness.Body := CB_Ravness
Ravness.UB := UB_Ravness
Ravness.Identity := 1
Ravness.Experience := 0
Ravness.Name := "Ravness"
Ravness.Level := 1
Ravness.Party := 1
Ravness.Health := 660
Ravness.TotalHealth := 660
Ravness.TotalLevel := 1
Ravness.TotalAttack := 48
Ravness.TotalDefense := 16
Ravness.TotalCritChance := 7
Ravness.TotalCritDamage := 140
Ravness.ChangeLevel := 0
Ravness.ChangeAttack := 0
Ravness.ChangeDefense := 0
Ravness.ChangeCritChance := 0
Ravness.ChangeCritDamage := 0
Ravness.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Ravness.Attack := 48
Ravness.Defense := 16
Ravness.CritChance := 7
Ravness.CritDamage := 140
Ravness.Power := 55
Ravness.TotalPower := 55
Ravness.Speed := 95
Ravness.TotalSpeed := 95
Ravness.PositionX := 1
Ravness.PositionY := 1
Ravness.GearType (1) := 0
Ravness.GearStat (1) := 0
Ravness.GearType (2) := 0
Ravness.GearStat (2) := 0
Ravness.GearType (3) := 0
Ravness.GearStat (3) := 0
Ravness.Skill (1).Level := 1
Ravness.Skill (2).Level := 1
Ravness.Skill (3).Level := 1
Ravness.Skill (4).Level := 1
Ravness.Skill (5).Level := 1
Ravness.Skill (6).Level := 1
Ravness.Skill (1).SkillID := 1
Ravness.Skill (2).SkillID := 8
Ravness.Skill (3).SkillID := 20
Ravness.Skill (4).SkillID := 21
Ravness.Skill (5).SkillID := 22
Ravness.Skill (6).SkillID := 23
Ravness.BaseSkill (1).Level := 1
Ravness.BaseSkill (2).Level := 1
Ravness.BaseSkill (3).Level := 1
Ravness.BaseSkill (4).Level := 1
Ravness.BaseSkill (5).Level := 1
Ravness.BaseSkill (6).Level := 1
Ravness.BaseSkill (7).Level := 1
Ravness.BaseSkill (8).Level := 1
Ravness.BaseSkill (9).Level := 1
Ravness.BaseSkill (10).Level := 1
Ravness.BaseSkill (1).SkillID := 8
Ravness.BaseSkill (2).SkillID := 2
Ravness.BaseSkill (3).SkillID := 20
Ravness.BaseSkill (4).SkillID := 21
Ravness.BaseSkill (5).SkillID := 22
Ravness.BaseSkill (6).SkillID := 23
Ravness.BaseSkill (7).SkillID := 24
Ravness.BaseSkill (8).SkillID := 26
Ravness.BaseSkill (9).SkillID := 25
Ravness.BaseSkill (10).SkillID := 27

% Drin
Drin.Avatar := AV_Drin %%% Role: Support
Drin.Body := CB_Drin
Drin.UB := UB_Drin
Drin.Identity := 1
Drin.Name := "D-rin"
Drin.Experience := 0
Drin.Level := 1
Drin.Party := 1
Drin.Health := 470
Drin.TotalHealth := 470
Drin.TotalLevel := 1
Drin.TotalAttack := 49
Drin.TotalDefense := 10
Drin.TotalCritChance := 9
Drin.TotalCritDamage := 122
Drin.ChangeLevel := 0
Drin.ChangeAttack := 0
Drin.ChangeDefense := 0
Drin.ChangeCritChance := 0
Drin.ChangeCritDamage := 0
Drin.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Drin.Attack := 49
Drin.Defense := 10
Drin.CritChance := 9
Drin.CritDamage := 122
Drin.Power := 85
Drin.TotalPower := 85
Drin.Speed := 87
Drin.TotalSpeed := 87
Drin.PositionX := 1
Drin.PositionY := 1
Drin.GearType (1) := 0
Drin.GearStat (1) := 0
Drin.GearType (2) := 0
Drin.GearStat (2) := 0
Drin.GearType (3) := 0
Drin.GearStat (3) := 0
Drin.Skill (1).Level := 1
Drin.Skill (2).Level := 1
Drin.Skill (3).Level := 1
Drin.Skill (4).Level := 1
Drin.Skill (5).Level := 1
Drin.Skill (6).Level := 1
Drin.Skill (1).SkillID := 1
Drin.Skill (2).SkillID := 6
Drin.Skill (3).SkillID := 40
Drin.Skill (4).SkillID := 41
Drin.Skill (5).SkillID := 42
Drin.Skill (6).SkillID := 43
Drin.BaseSkill (1).Level := 1
Drin.BaseSkill (2).Level := 1
Drin.BaseSkill (3).Level := 1
Drin.BaseSkill (4).Level := 1
Drin.BaseSkill (5).Level := 1
Drin.BaseSkill (6).Level := 1
Drin.BaseSkill (7).Level := 1
Drin.BaseSkill (8).Level := 1
Drin.BaseSkill (9).Level := 1
Drin.BaseSkill (10).Level := 1
Drin.BaseSkill (1).SkillID := 6
Drin.BaseSkill (2).SkillID := 40
Drin.BaseSkill (3).SkillID := 84
Drin.BaseSkill (4).SkillID := 41
Drin.BaseSkill (5).SkillID := 43
Drin.BaseSkill (6).SkillID := 42
Drin.BaseSkill (7).SkillID := 65
Drin.BaseSkill (8).SkillID := 66
Drin.BaseSkill (9).SkillID := 44
Drin.BaseSkill (10).SkillID := 45

% Cosseus
Cosseus.Avatar := AV_Cosseus %%% Role: Tank
Cosseus.Body := CB_Cosseus
Cosseus.UB := UB_Cosseus
Cosseus.Identity := 1
Cosseus.Name := "Cosseus"
Cosseus.Experience := 0
Cosseus.Level := 1
Cosseus.Party := 1
Cosseus.Health := 700
Cosseus.TotalHealth := 700
Cosseus.TotalLevel := 1
Cosseus.TotalAttack := 42
Cosseus.TotalDefense := 30
Cosseus.TotalCritChance := 5
Cosseus.TotalCritDamage := 110
Cosseus.ChangeLevel := 0
Cosseus.ChangeAttack := 0
Cosseus.ChangeDefense := 0
Cosseus.ChangeCritChance := 0
Cosseus.ChangeCritDamage := 0
Cosseus.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Cosseus.Attack := 42
Cosseus.Defense := 30
Cosseus.CritChance := 5
Cosseus.CritDamage := 110
Cosseus.Power := 47
Cosseus.TotalPower := 47
Cosseus.Speed := 105
Cosseus.TotalSpeed := 105
Cosseus.PositionX := 1
Cosseus.PositionY := 1
Cosseus.GearType (1) := 0
Cosseus.GearStat (1) := 0
Cosseus.GearType (2) := 0
Cosseus.GearStat (2) := 0
Cosseus.GearType (3) := 0
Cosseus.GearStat (3) := 0
Cosseus.Skill (1).Level := 1
Cosseus.Skill (2).Level := 1
Cosseus.Skill (3).Level := 1
Cosseus.Skill (4).Level := 1
Cosseus.Skill (5).Level := 1
Cosseus.Skill (6).Level := 1
Cosseus.Skill (1).SkillID := 1
Cosseus.Skill (2).SkillID := 2
Cosseus.Skill (3).SkillID := 30
Cosseus.Skill (4).SkillID := 31
Cosseus.Skill (5).SkillID := 32
Cosseus.Skill (6).SkillID := 33
Cosseus.BaseSkill (1).Level := 1
Cosseus.BaseSkill (2).Level := 1
Cosseus.BaseSkill (3).Level := 1
Cosseus.BaseSkill (4).Level := 1
Cosseus.BaseSkill (5).Level := 1
Cosseus.BaseSkill (6).Level := 1
Cosseus.BaseSkill (7).Level := 1
Cosseus.BaseSkill (8).Level := 1
Cosseus.BaseSkill (9).Level := 1
Cosseus.BaseSkill (10).Level := 1
Cosseus.BaseSkill (1).SkillID := 1
Cosseus.BaseSkill (2).SkillID := 2
Cosseus.BaseSkill (3).SkillID := 30
Cosseus.BaseSkill (4).SkillID := 32
Cosseus.BaseSkill (5).SkillID := 25
Cosseus.BaseSkill (6).SkillID := 33
Cosseus.BaseSkill (7).SkillID := 84
Cosseus.BaseSkill (8).SkillID := 36
Cosseus.BaseSkill (9).SkillID := 31
Cosseus.BaseSkill (10).SkillID := 37

% Zefan
Zefan.Avatar := AV_Zefan %%% Role: DPS
Zefan.Body := CB_Zefan
Zefan.UB := UB_Zefan
Zefan.Identity := 1
Zefan.Name := "Zefan"
Zefan.Experience := 0
Zefan.Level := 1
Zefan.Party := 1
Zefan.Health := 610
Zefan.TotalHealth := 610
Zefan.TotalLevel := 1
Zefan.TotalAttack := 65
Zefan.TotalDefense := 10
Zefan.TotalCritChance := 12
Zefan.TotalCritDamage := 155
Zefan.ChangeLevel := 0
Zefan.ChangeAttack := 0
Zefan.ChangeDefense := 0
Zefan.ChangeCritChance := 0
Zefan.ChangeCritDamage := 0
Zefan.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Zefan.Attack := 65
Zefan.Defense := 10
Zefan.CritChance := 12
Zefan.CritDamage := 155
Zefan.Power := 130
Zefan.TotalPower := 130
Zefan.Speed := 82
Zefan.TotalSpeed := 82
Zefan.PositionX := 1
Zefan.PositionY := 1
Zefan.GearType (1) := 0
Zefan.GearStat (1) := 0
Zefan.GearType (2) := 0
Zefan.GearStat (2) := 0
Zefan.GearType (3) := 0
Zefan.GearStat (3) := 0
Zefan.Skill (1).Level := 1
Zefan.Skill (2).Level := 1
Zefan.Skill (3).Level := 1
Zefan.Skill (4).Level := 1
Zefan.Skill (5).Level := 1
Zefan.Skill (6).Level := 1
Zefan.Skill (1).SkillID := 5
Zefan.Skill (2).SkillID := 4
Zefan.Skill (3).SkillID := 80
Zefan.Skill (4).SkillID := 81
Zefan.Skill (5).SkillID := 82
Zefan.Skill (6).SkillID := 83
Zefan.BaseSkill (1).Level := 1
Zefan.BaseSkill (2).Level := 1
Zefan.BaseSkill (3).Level := 1
Zefan.BaseSkill (4).Level := 1
Zefan.BaseSkill (5).Level := 1
Zefan.BaseSkill (6).Level := 1
Zefan.BaseSkill (7).Level := 1
Zefan.BaseSkill (8).Level := 1
Zefan.BaseSkill (9).Level := 1
Zefan.BaseSkill (10).Level := 1
Zefan.BaseSkill (1).SkillID := 5
Zefan.BaseSkill (2).SkillID := 4
Zefan.BaseSkill (3).SkillID := 80
Zefan.BaseSkill (4).SkillID := 83
Zefan.BaseSkill (5).SkillID := 81
Zefan.BaseSkill (6).SkillID := 82
Zefan.BaseSkill (7).SkillID := 84
Zefan.BaseSkill (8).SkillID := 86
Zefan.BaseSkill (9).SkillID := 85
Zefan.BaseSkill (10).SkillID := 87

%%%%%%%%%%%%%%%%%%%%%%%%%%%% FWT
Wolfe.Avatar := AV_Wolfe %%% Role: Melee dot
Wolfe.Body := CB_Wolfe
Wolfe.UB := UB_Wolfe
Wolfe.Identity := 1
Wolfe.Name := "Wolfe"
Wolfe.Experience := 0
Wolfe.Level := 1
Wolfe.Party := 1
Wolfe.Health := 635
Wolfe.TotalHealth := 635
Wolfe.TotalLevel := 1
Wolfe.TotalAttack := 46
Wolfe.TotalDefense := 18
Wolfe.TotalCritChance := 10
Wolfe.TotalCritDamage := 141
Wolfe.ChangeLevel := 0
Wolfe.ChangeAttack := 0
Wolfe.ChangeDefense := 0
Wolfe.ChangeCritChance := 0
Wolfe.ChangeCritDamage := 0
Wolfe.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Wolfe.Attack := 46
Wolfe.Defense := 18
Wolfe.CritChance := 10
Wolfe.CritDamage := 141
Wolfe.Power := 69
Wolfe.TotalPower := 69
Wolfe.Speed := 79
Wolfe.TotalSpeed := 79
Wolfe.PositionX := 1
Wolfe.PositionY := 1
Wolfe.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
Wolfe.GearStat (1) := 0 %% Value of said stat
Wolfe.GearType (2) := 0
Wolfe.GearStat (2) := 0
Wolfe.GearType (3) := 0
Wolfe.GearStat (3) := 0
Wolfe.Skill (1).Level := 1
Wolfe.Skill (2).Level := 1
Wolfe.Skill (3).Level := 1
Wolfe.Skill (4).Level := 1
Wolfe.Skill (5).Level := 1
Wolfe.Skill (6).Level := 1
Wolfe.Skill (1).SkillID := 8
Wolfe.Skill (2).SkillID := 83
Wolfe.Skill (3).SkillID := 50
Wolfe.Skill (4).SkillID := 51
Wolfe.Skill (5).SkillID := 52
Wolfe.Skill (6).SkillID := 53
Wolfe.BaseSkill (1).Level := 1
Wolfe.BaseSkill (2).Level := 1
Wolfe.BaseSkill (3).Level := 1
Wolfe.BaseSkill (4).Level := 1
Wolfe.BaseSkill (5).Level := 1
Wolfe.BaseSkill (6).Level := 1
Wolfe.BaseSkill (7).Level := 1
Wolfe.BaseSkill (8).Level := 1
Wolfe.BaseSkill (9).Level := 1
Wolfe.BaseSkill (10).Level := 1
Wolfe.BaseSkill (1).SkillID := 8
Wolfe.BaseSkill (2).SkillID := 50
Wolfe.BaseSkill (3).SkillID := 83
Wolfe.BaseSkill (4).SkillID := 51
Wolfe.BaseSkill (5).SkillID := 52
Wolfe.BaseSkill (6).SkillID := 54
Wolfe.BaseSkill (7).SkillID := 53
Wolfe.BaseSkill (8).SkillID := 56
Wolfe.BaseSkill (9).SkillID := 55
Wolfe.BaseSkill (10).SkillID := 57

Rage.Avatar := AV_Rage % 7 %%% Role:  Ranged  effect
Rage.Body := CB_Rage
Rage.UB := UB_Rage
Rage.Identity := 1
Rage.Name := "Rage"
Rage.Experience := 0
Rage.Level := 1
Rage.Party := 1
Rage.Health := 480
Rage.TotalHealth := 480
Rage.TotalLevel := 1
Rage.TotalAttack := 55
Rage.TotalDefense := 5
Rage.TotalCritChance := 13
Rage.TotalCritDamage := 135
Rage.ChangeLevel := 0
Rage.ChangeAttack := 0
Rage.ChangeDefense := 0
Rage.ChangeCritChance := 0
Rage.ChangeCritDamage := 0
Rage.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Rage.Attack := 55
Rage.Defense := 5
Rage.CritChance := 13
Rage.CritDamage := 135
Rage.Power := 75
Rage.TotalPower := 75
Rage.Speed := 85
Rage.TotalSpeed := 85
Rage.PositionX := 1
Rage.PositionY := 1
Rage.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
Rage.GearStat (1) := 0 %% Value of said stat
Rage.GearType (2) := 0
Rage.GearStat (2) := 0
Rage.GearType (3) := 0
Rage.GearStat (3) := 0
Rage.Skill (1).Level := 1
Rage.Skill (2).Level := 1
Rage.Skill (3).Level := 1
Rage.Skill (4).Level := 1
Rage.Skill (5).Level := 1
Rage.Skill (6).Level := 1
Rage.Skill (1).SkillID := 6
Rage.Skill (2).SkillID := 40
Rage.Skill (3).SkillID := 32
Rage.Skill (4).SkillID := 61
Rage.Skill (5).SkillID := 62
Rage.Skill (6).SkillID := 63
Rage.BaseSkill (1).Level := 1
Rage.BaseSkill (2).Level := 1
Rage.BaseSkill (3).Level := 1
Rage.BaseSkill (4).Level := 1
Rage.BaseSkill (5).Level := 1
Rage.BaseSkill (6).Level := 1
Rage.BaseSkill (7).Level := 1
Rage.BaseSkill (8).Level := 1
Rage.BaseSkill (9).Level := 1
Rage.BaseSkill (10).Level := 1
Rage.BaseSkill (1).SkillID := 6
Rage.BaseSkill (2).SkillID := 32
Rage.BaseSkill (3).SkillID := 40
Rage.BaseSkill (4).SkillID := 61
Rage.BaseSkill (5).SkillID := 84
Rage.BaseSkill (6).SkillID := 62
Rage.BaseSkill (7).SkillID := 63
Rage.BaseSkill (8).SkillID := 64
Rage.BaseSkill (9).SkillID := 65
Rage.BaseSkill (10).SkillID := 66

Cleo.Avatar := AV_Cleo % 8 %%% Role: MAgician
Cleo.Body := CB_Cleo
Cleo.UB := UB_Cleo
Cleo.Identity := 1
Cleo.Name := "Cleo"
Cleo.Experience := 0
Cleo.Level := 1
Cleo.Party := 1
Cleo.Health := 580
Cleo.TotalHealth := 580
Cleo.TotalLevel := 1
Cleo.TotalAttack := 50
Cleo.TotalDefense := 13
Cleo.TotalCritChance := 8
Cleo.TotalCritDamage := 128
Cleo.ChangeLevel := 0
Cleo.ChangeAttack := 0
Cleo.ChangeDefense := 0
Cleo.ChangeCritChance := 0
Cleo.ChangeCritDamage := 0
Cleo.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Cleo.Attack := 50
Cleo.Defense := 13
Cleo.CritChance := 8
Cleo.CritDamage := 128
Cleo.Power := 130
Cleo.TotalPower := 130
Cleo.Speed := 92
Cleo.TotalSpeed := 92
Cleo.PositionX := 1
Cleo.PositionY := 1
Cleo.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
Cleo.GearStat (1) := 0 %% Value of said stat
Cleo.GearType (2) := 0
Cleo.GearStat (2) := 0
Cleo.GearType (3) := 0
Cleo.GearStat (3) := 0
Cleo.Skill (1).Level := 1
Cleo.Skill (2).Level := 1
Cleo.Skill (3).Level := 1
Cleo.Skill (4).Level := 1
Cleo.Skill (5).Level := 1
Cleo.Skill (6).Level := 1
Cleo.Skill (1).SkillID := 7
Cleo.Skill (2).SkillID := 3
Cleo.Skill (3).SkillID := 90
Cleo.Skill (4).SkillID := 91
Cleo.Skill (5).SkillID := 92
Cleo.Skill (6).SkillID := 93
Cleo.BaseSkill (1).Level := 1
Cleo.BaseSkill (2).Level := 1
Cleo.BaseSkill (3).Level := 1
Cleo.BaseSkill (4).Level := 1
Cleo.BaseSkill (5).Level := 1
Cleo.BaseSkill (6).Level := 1
Cleo.BaseSkill (7).Level := 1
Cleo.BaseSkill (8).Level := 1
Cleo.BaseSkill (9).Level := 1
Cleo.BaseSkill (10).Level := 1
Cleo.BaseSkill (1).SkillID := 7
Cleo.BaseSkill (2).SkillID := 3
Cleo.BaseSkill (3).SkillID := 90
Cleo.BaseSkill (4).SkillID := 92
Cleo.BaseSkill (5).SkillID := 91
Cleo.BaseSkill (6).SkillID := 93
Cleo.BaseSkill (7).SkillID := 94
Cleo.BaseSkill (8).SkillID := 96
Cleo.BaseSkill (9).SkillID := 95
Cleo.BaseSkill (10).SkillID := 97

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Seira.Avatar := AV_Seira % 9 %%% Role: DPM + Ultimate
Seira.Body := CB_Seira
Seira.UB := UB_Seira
Seira.Identity := 1
Seira.Name := "Seira"
Seira.Experience := 0
Seira.Level := 1
Seira.Party := 1
Seira.Health := 410
Seira.TotalHealth := 410
Seira.TotalLevel := 1
Seira.TotalAttack := 60
Seira.TotalDefense := 14
Seira.TotalCritChance := 12
Seira.TotalCritDamage := 133
Seira.ChangeLevel := 0
Seira.ChangeAttack := 0
Seira.ChangeDefense := 0
Seira.ChangeCritChance := 0
Seira.ChangeCritDamage := 0
Seira.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Seira.Attack := 60
Seira.Defense := 14
Seira.CritChance := 12
Seira.CritDamage := 133
Seira.Power := 150
Seira.TotalPower := 150
Seira.Speed := 83
Seira.TotalSpeed := 83
Seira.PositionX := 1
Seira.PositionY := 1
Seira.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
Seira.GearStat (1) := 0 %% Value of said stat
Seira.GearType (2) := 0
Seira.GearStat (2) := 0
Seira.GearType (3) := 0
Seira.GearStat (3) := 0
Seira.Skill (1).Level := 1
Seira.Skill (2).Level := 1
Seira.Skill (3).Level := 1
Seira.Skill (4).Level := 1
Seira.Skill (5).Level := 1
Seira.Skill (6).Level := 1
Seira.Skill (1).SkillID := 1
Seira.Skill (2).SkillID := 2
Seira.Skill (3).SkillID := 70
Seira.Skill (4).SkillID := 71
Seira.Skill (5).SkillID := 72
Seira.Skill (6).SkillID := 73
Seira.BaseSkill (1).Level := 1
Seira.BaseSkill (2).Level := 1
Seira.BaseSkill (3).Level := 1
Seira.BaseSkill (4).Level := 1
Seira.BaseSkill (5).Level := 1
Seira.BaseSkill (6).Level := 1
Seira.BaseSkill (7).Level := 1
Seira.BaseSkill (8).Level := 1
Seira.BaseSkill (9).Level := 1
Seira.BaseSkill (10).Level := 1
Seira.BaseSkill (1).SkillID := 1
Seira.BaseSkill (2).SkillID := 2
Seira.BaseSkill (3).SkillID := 70
Seira.BaseSkill (4).SkillID := 72
Seira.BaseSkill (5).SkillID := 74
Seira.BaseSkill (6).SkillID := 71
Seira.BaseSkill (7).SkillID := 75
Seira.BaseSkill (8).SkillID := 73
Seira.BaseSkill (9).SkillID := 76
Seira.BaseSkill (10).SkillID := 77

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Aeron.Avatar := AV_Aeron % 10 %%% Role: All rounder + CC
Aeron.Body := CB_Aeron
Aeron.UB := UB_Aeron
Aeron.Identity := 1
Aeron.Name := "Aeron"
Aeron.Experience := 0
Aeron.Level := 1
Aeron.Party := 1
Aeron.Health := 560
Aeron.TotalHealth := 560
Aeron.TotalLevel := 1
Aeron.TotalAttack := 58
Aeron.TotalDefense := 20
Aeron.TotalCritChance := 15
Aeron.TotalCritDamage := 117
Aeron.ChangeLevel := 0
Aeron.ChangeAttack := 0
Aeron.ChangeDefense := 0
Aeron.ChangeCritChance := 0
Aeron.ChangeCritDamage := 0
Aeron.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
Aeron.Attack := 58
Aeron.Defense := 20
Aeron.CritChance := 15
Aeron.CritDamage := 117
Aeron.Power := 140
Aeron.TotalPower := 140
Aeron.Speed := 86
Aeron.TotalSpeed := 86
Aeron.PositionX := 1
Aeron.PositionY := 1
Aeron.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
Aeron.GearStat (1) := 0 %% Value of said stat
Aeron.GearType (2) := 0
Aeron.GearStat (2) := 0
Aeron.GearType (3) := 0
Aeron.GearStat (3) := 0
Aeron.Skill (1).Level := 1
Aeron.Skill (2).Level := 1
Aeron.Skill (3).Level := 1
Aeron.Skill (4).Level := 1
Aeron.Skill (5).Level := 1
Aeron.Skill (6).Level := 1
Aeron.Skill (1).SkillID := 7
Aeron.Skill (2).SkillID := 80
Aeron.Skill (3).SkillID := 100
Aeron.Skill (4).SkillID := 101
Aeron.Skill (5).SkillID := 102
Aeron.Skill (6).SkillID := 103
Aeron.BaseSkill (1).Level := 1
Aeron.BaseSkill (2).Level := 1
Aeron.BaseSkill (3).Level := 1
Aeron.BaseSkill (4).Level := 1
Aeron.BaseSkill (5).Level := 1
Aeron.BaseSkill (6).Level := 1
Aeron.BaseSkill (7).Level := 1
Aeron.BaseSkill (8).Level := 1
Aeron.BaseSkill (9).Level := 1
Aeron.BaseSkill (10).Level := 1
Aeron.BaseSkill (1).SkillID := 1
Aeron.BaseSkill (2).SkillID := 80
Aeron.BaseSkill (3).SkillID := 100
Aeron.BaseSkill (4).SkillID := 83
Aeron.BaseSkill (5).SkillID := 102
Aeron.BaseSkill (6).SkillID := 101
Aeron.BaseSkill (7).SkillID := 104
Aeron.BaseSkill (8).SkillID := 103
Aeron.BaseSkill (9).SkillID := 105
Aeron.BaseSkill (10).SkillID := 106

%%% Default calls, new game.
%% Weapon ID
Sillness.Weapon := 0
Ravness.Weapon := 0
Cosseus.Weapon := 0
Drin.Weapon := 0
Wolfe.Weapon := 0
Zefan.Weapon := 0
Rage.Weapon := 0
Seira.Weapon := 0
Cleo.Weapon := 0
Aeron.Weapon := 0
%%%%%%%%%%%% Call PArty
Party (1) := Sillness
Party (2) := Ravness
Party (3) := Cosseus
Party (4) := Drin
Party (5) := Wolfe
Party (6) := Rage
Party (7) := Cleo
Party (8) := Zefan
Party (9) := Seira
Party (10) := Aeron
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Character (1) := Sillness %%% Team Starters
%Character (2) := Wolfe
%Character (3) := Seira

%%%%%%%%% Reinstall image variables when new game.
proc ReinstallImages (CharacterName : string, CharacterNumber : int)
    if CharacterName = "Sillness" then
	Party (CharacterNumber).Avatar := AV_Sillness
	Party (CharacterNumber).Body := CB_Sillness
	Party (CharacterNumber).UB := UB_Sillness
    elsif CharacterName = "Ravness" then
	Party (CharacterNumber).Avatar := AV_Ravness
	Party (CharacterNumber).Body := CB_Ravness
	Party (CharacterNumber).UB := UB_Ravness
    elsif CharacterName = "D-rin" then
	Party (CharacterNumber).Avatar := AV_Drin %%% Role: Support
	Party (CharacterNumber).Body := CB_Drin
	Party (CharacterNumber).UB := UB_Drin
    elsif CharacterName = "Cosseus" then
	Party (CharacterNumber).Avatar := AV_Cosseus %%% Role: Tank
	Party (CharacterNumber).Body := CB_Cosseus
	Party (CharacterNumber).UB := UB_Cosseus
    elsif CharacterName = "Zefan" then
	Party (CharacterNumber).Avatar := AV_Zefan %%% Role: DPS
	Party (CharacterNumber).Body := CB_Zefan
	Party (CharacterNumber).UB := UB_Zefan
    elsif CharacterName = "Wolfe" then
	Party (CharacterNumber).Avatar := AV_Wolfe %%% Role: Melee dot
	Party (CharacterNumber).Body := CB_Wolfe
	Party (CharacterNumber).UB := UB_Wolfe
    elsif CharacterName = "Rage" then
	Party (CharacterNumber).Avatar := AV_Rage % 7 %%% Role:  Ranged  effect
	Party (CharacterNumber).Body := CB_Rage
	Party (CharacterNumber).UB := UB_Rage
    elsif CharacterName = "Cleo" then
	Party (CharacterNumber).Avatar := AV_Cleo  % 8 %%% Role: MAgician
	Party (CharacterNumber).Body := CB_Cleo
	Party (CharacterNumber).UB := UB_Cleo
    elsif CharacterName = "Seira" then
	Party (CharacterNumber).Avatar := AV_Seira % 9 %%% Role: DPM + Ultimate
	Party (CharacterNumber).Body := CB_Seira
	Party (CharacterNumber).UB := UB_Seira
    elsif CharacterName = "Aeron" then
	Party (CharacterNumber).Avatar := AV_Aeron % 10 %%% Role: All rounder + CC
	Party (CharacterNumber).Body := CB_Aeron %% Char body
	Party (CharacterNumber).UB := UB_Aeron %% Unlocked image
    else
    end if
end ReinstallImages

