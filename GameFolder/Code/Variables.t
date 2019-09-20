% Variables, picture creation, etc

% Story
var Chapter : int := 0
%var Silver : int := 1 %% (Currency) Declared in CHaracter

% Basic variables
var Mx, My, Mb : int
var StoredY : int := 0
var MovedX, MovedY : int := 0
var Pressed : array char of boolean
var MouseReady : boolean := true
var stream : int
var Filex : string
var Exit : boolean := false

% Battle variables
var FoeOverallHealth : int := 0
var PartyOverallHealth : int := 0
var WonBattleOutcome : boolean := false
var Damage : int := 0
var FinishedTurn : boolean := false
var SkillSelected : int := 0
var Cast : boolean := false % is casting skill?
var HighlightSkill : int := 0
var HighlightBody : int := 0
var TPAnimation : int := 0
var TPX : int := 0
var TPY : int := 0
var TPMax : int := 200
var TPup : boolean := false
var ActiveUser, ActiveTarget : int := 1 %(CurrentPerson doing skilkls)
var MoveCT, MoveCTX : int := 0
var CurrentTurnOrder : array 1 .. 5 of int
var Forfeit : boolean := false
var CurrentTurn : int := 1
var ProgressToFight : boolean := false
var BattleMenuboolean : boolean := false
var BattleHelpboolean : boolean := false
var BattleBackground : int := BattleScene_Raceway

% Intro Screen
var SaveName : string := ""

% Party management
var Dragged : boolean := false
var DraggedBase : boolean := false
var DraggedBaseHighlight : boolean := false
var ActiveSkill : int := 1
var TargetSkill : int := 1
var PartyLoadedSkillX : array 1 .. 6 of int
var PartyLoadedSkillY : array 1 .. 6 of int
PartyLoadedSkillX (1) := 243
PartyLoadedSkillX (2) := 243
PartyLoadedSkillX (3) := 243
PartyLoadedSkillX (4) := 339
PartyLoadedSkillX (5) := 339
PartyLoadedSkillX (6) := 339
PartyLoadedSkillY (1) := 536
PartyLoadedSkillY (2) := 470
PartyLoadedSkillY (3) := 403
PartyLoadedSkillY (4) := 536
PartyLoadedSkillY (5) := 470
PartyLoadedSkillY (6) := 403
var PartyBaseSkillX : array 1 .. 10 of int
var PartyBaseSkillY : array 1 .. 10 of int
PartyBaseSkillX (1) := 457
PartyBaseSkillX (2) := 578
PartyBaseSkillX (3) := 700
PartyBaseSkillX (4) := 805
PartyBaseSkillX (5) := 805
PartyBaseSkillX (6) := 941
PartyBaseSkillX (7) := 941
PartyBaseSkillX (8) := 1070
PartyBaseSkillX (9) := 1070
PartyBaseSkillX (10) := 1201
PartyBaseSkillY (1) := 196
PartyBaseSkillY (2) := 196
PartyBaseSkillY (3) := 196
PartyBaseSkillY (4) := 262
PartyBaseSkillY (5) := 138
PartyBaseSkillY (6) := 262
PartyBaseSkillY (7) := 138
PartyBaseSkillY (8) := 262
PartyBaseSkillY (9) := 138
PartyBaseSkillY (10) := 262

% Inventory
var DragCharacterShards : boolean := false
var TargetShard : int
var ActiveShard : int
var DragInventory : boolean := false
var AITempType : int
var AITempStat : int
var ActiveInventoryH : int := 1
var ActiveInventoryV : int := 1
var TargetInventory : int := 1
var Combinationboolean : boolean := false
var Identificationboolean : boolean := false
%var CombinationType2 : InventoryType
type InventoryTypeCombination :
    record
	Type : int
	Stat : int
    end record
var Combination : array 1 .. 3 of InventoryTypeCombination
var Identification : InventoryTypeCombination
Identification.Type := 0
Identification.Stat := 0
for CycleCombination : 1 .. 3
    Combination (CycleCombination).Type := 0
    Combination (CycleCombination).Stat := 0
end for

% File IO
var ActiveName : string := ""
var FileName : string
var CurrentOperatingFileName : string := "Sillness"
var CurrentOperatingFileNumber : int := 0
var FileSelectedboolean : boolean := false
var FileSaveboolean : boolean := false
var FileLoadboolean : boolean := false

% main Menu
var UnlockedMap : boolean := false
var MapStoryboolean : boolean := false
var MapPartyboolean : boolean := false
var MapInventoryboolean : boolean := false
var MapFileIOboolean : boolean := false
var MapSettingsboolean : boolean := false
var PinkSpiritboolean : boolean := false
var PSX, PSXvalue, PSYvalue, PSY : int := 1
var AnimationTime : int := 0

% Inventory Slots
var TrackInvenX, TrackInvenY : int := 0

%%% Settings
var MapSettingsSoundboolean : boolean := false
var MapSettingsInstructionsboolean : boolean := false
var MapSettingsNotesboolean : boolean := false
var MapSettingsCutsceneboolean : boolean := false

%%%%% Colours

var Gold : int := 1
var BorderBlue : int := 2
var BGBlue : int := 3
var BasicText : int := 4
var FoeRed : int := 5
var Orange : int := 6
var BasicBlue : int := 7
var Bronze : int := 8
var HealthBlue : int := 9
var PowerWhite : int := 10
var MelGreen : int := 11
var HealthPink : int := 12
var GlowPurple : int := 251
var GlowAqua : int := 13
var ChatGrey : int := 255
var PSOWhite : int := 254
var PSOBlue : int := 253
var PSODarkBlue : int := 252
RGB.SetColor (Gold, 247 / 255, 219 / 255, 144 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (BorderBlue, 53 / 255, 62 / 255, 69 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (BGBlue, 3 / 255, 10 / 255, 12 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (BasicText, 201 / 255, 208 / 255, 224 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (FoeRed, 198 / 255, 0.00, 33 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (Orange, 255 / 255, 89 / 255, 0.00) % (Colour Index / 255 = 0.-)
RGB.SetColor (BasicBlue, 119 / 255, 185 / 255, 1.00) % (Colour Index / 255 = 0.-)
RGB.SetColor (Bronze, 129 / 255, 107 / 255, 92 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (HealthBlue, 65 / 255, 161 / 255, 234 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (PowerWhite, 203 / 255, 242 / 255, 230 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (MelGreen, 75 / 255, 193 / 255, 81 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (HealthPink, 168 / 255, 42 / 255, 193 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (GlowAqua, 25 / 255, 130 / 255, 157 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (ChatGrey, 230 / 255, 237 / 255, 248 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (PSOWhite, 200 / 255, 222 / 255, 233 / 255) % PSO
RGB.SetColor (PSOBlue, 56 / 255, 139 / 255, 173 / 255) %PSO
RGB.SetColor (PSODarkBlue, 19 / 255, 40 / 255, 53 / 255) % PSO
RGB.SetColor (GlowPurple, 71 / 255, 30 / 255, 122 / 255) % PSO


% Fonts
var FontLocked := Font.New ("Kravitz Thermal:8")
var FontLockedIMAGE := Font.New ("Kravitz Thermal:30")
var FontVictoryScene := Font.New ("DFP Sc Sans Heue30_103:24")
var FontDescriptionTitle := Font.New ("DFP Sc Sans Heue30_103:12")
var FontDescription := Font.New ("DFP Sc Sans Heue30_103:9")
var FontDescriptionSkill := Font.New ("Marcellus:10")
var FontDamage := Font.New ("Marcellus:40")
var Font1 := Font.New ("Mamelon:14")
var Font2 := Font.New ("Marcellus:7")
var Font3 := Font.New ("Mamelon:12")
var Font4 := Font.New ("Mamelon:16")
var Font5 := Font.New ("Marcellus:12")
var Font6 := Font.New ("Marcellus:20")
var Font7 := Font.New ("Kravitz Thermal:11")
var Font8 := Font.New ("Mamelon:25")
var Font9 := Font.New ("Kravitz:17")
var Font10 := Font.New ("Kravitz Thermal:15")
var Font11 := Font.New ("Marcellus:36")
var Font12 := Font.New ("Mamelon:17")
var Font13 := Font.New ("DFP Sc Sans Heue30_103:17")
var Font14 := Font.New ("Kravitz Thermal:20")
var Font15 := Font.New ("Kravitz Extra Thermal:7")
var FontBattle := Font.New ("DFP Sc Sans Heue30_103:14")
var FontInfo := Font.New ("DFP Sc Sans Heue30_103:12") %% Copied before
var FontChat := Font.New ("DFP Sc Sans Heue30_103:16")
var FontChatName := Font.New ("Kravitz:30")

% fontchat CAP = 14.5p x
% fontchat Lower = 11p x
% fontchat number = 12.5p x
% fontchat space = 5p x

% Map Cities and Locations MxMy Center points & Descriptions
type Locate :
    record
	X : int
	Y : int
	N : string
	D : string
	T : int %% 0 = City, 1 = Special, 2 = Fight, 3 = Major City
	U : boolean % Unlocked
    end record

var LocationSize : int := 44
var Location : array 1 .. LocationSize of Locate

for Cycle : 1 .. LocationSize
    Location (Cycle).U := false
end for

Location (1).X := 701
Location (1).Y := 687
Location (1).N := "Balenos"
Location (1).D := "Sea"
Location (1).T := 1
Location (1).U := true

Location (2).X := 767
Location (2).Y := 542
Location (2).N := "Velia"
Location (2).D := "Town"
Location (2).T := 0

Location (3).X := 797
Location (3).Y := 616
Location (3).N := "Cron"
Location (3).D := "Castle"
Location (3).T := 2

Location (4).X := 958
Location (4).Y := 592
Location (4).N := "Mausoleum"
Location (4).D := "Tomb"
Location (4).T := 2

Location (5).X := 1018
Location (5).Y := 513
Location (5).N := "Elric"
Location (5).D := "Shrine"
Location (5).T := 2

Location (6).X := 1110
Location (6).Y := 559
Location (6).N := "Sausans"
Location (6).D := "Garrison"
Location (6).T := 2

Location (7).X := 1135
Location (7).Y := 445
Location (7).N := "Mediah"
Location (7).D := "Water Stronghold"
Location (7).T := 3

Location (8).X := 1153
Location (8).Y := 332
Location (8).N := "Owen's"
Location (8).D := "Fire Cave"
Location (8).T := 1

Location (9).X := 1255
Location (9).Y := 255
Location (9).N := "Altinova"
Location (9).D := "City"
Location (9).T := 0

Location (10).X := 1225
Location (10).Y := 173
Location (10).N := "Marni's"
Location (10).D := "Laboratory"
Location (10).T := 2

Location (11).X := 1155
Location (11).Y := 233
Location (11).N := "Abandoned Iron"
Location (11).D := "Mine"
Location (11).T := 2

Location (12).X := 1063
Location (12).Y := 262
Location (12).N := "Tarif"
Location (12).D := "Town"
Location (12).T := 0

Location (13).X := 1013
Location (13).Y := 151
Location (13).N := "Hasl'a"
Location (13).D := "Precipice"
Location (13).T := 1

Location (14).X := 1007
Location (14).Y := 353
Location (14).N := "Ato's"
Location (14).D := "Farm"
Location (14).T := 2

Location (15).X := 915
Location (15).Y := 444
Location (15).N := "Crevasse of Antiquity"
Location (15).D := "Collections"
Location (15).T := 2

Location (16).X := 880
Location (16).Y := 309
Location (16).N := "Eastern"
Location (16).D := "Boundry"
Location (16).T := 2

Location (17).X := 748
Location (17).Y := 351
Location (17).N := "Heidel"
Location (17).D := "City"
Location (17).T := 3

Location (18).X := 691
Location (18).Y := 228
Location (18).N := "Glish"
Location (18).D := "Marsh"
Location (18).T := 2

Location (19).X := 583
Location (19).Y := 242
Location (19).N := "Southern"
Location (19).D := "Neutral Zone"
Location (19).T := 2

Location (20).X := 476
Location (20).Y := 227
Location (20).N := "Keplan"
Location (20).D := "Town"
Location (20).T := 0

Location (21).X := 375
Location (21).Y := 226
Location (21).N := "Trina"
Location (21).D := "Fort"
Location (21).T := 2

Location (22).X := 443
Location (22).Y := 138
Location (22).N := "Titan"
Location (22).D := "Hills"
Location (22).T := 2

Location (23).X := 350
Location (23).Y := 90
Location (23).N := "Witch's"
Location (23).D := "Chapel"
Location (23).T := 2
%%%%% CHapel
Location (24).X := 254
Location (24).Y := 125
Location (24).N := "Behr"
Location (24).D := "Town"
Location (24).T := 0

Location (25).X := 173
Location (25).Y := 112
Location (25).N := "Gynip Arbor"
Location (25).D := "Reconnaissance Post"
Location (25).T := 2

Location (26).X := 114
Location (26).Y := 172
Location (26).N := "Trent"
Location (26).D := "Village"
Location (26).T := 0

Location (27).X := 120
Location (27).Y := 253
Location (27).N := "Abandoned"
Location (27).D := "Monastary"
Location (27).T := 2

Location (28).X := 125
Location (28).Y := 359
Location (28).N := "West Calpheon"
Location (28).D := "Castle Ruins"
Location (28).T := 1

Location (29).X := 209
Location (29).Y := 327
Location (29).N := "East Kaia"
Location (29).D := "Ferry"
Location (29).T := 2

Location (30).X := 620
Location (30).Y := 381
Location (30).N := "Northern Serendia"
Location (30).D := "Plains"
Location (30).T := 2

Location (31).X := 527
Location (31).Y := 386
Location (31).N := "Delphi Knight"
Location (31).D := "Castle"
Location (31).T := 1

Location (32).X := 492
Location (32).Y := 467
Location (32).N := "Kruto"
Location (32).D := "Cavern"
Location (32).T := 2

Location (33).X := 650
Location (33).Y := 507
Location (33).N := "Western Guard"
Location (33).D := "Camp"
Location (33).T := 2
%%% WOlf
Location (34).X := 599
Location (34).Y := 579
Location (34).N := "Wolf"
Location (34).D := "Hills"
Location (34).T := 2

Location (35).X := 545
Location (35).Y := 650
Location (35).N := "Olvia"
Location (35).D := "Town"
Location (35).T := 0

Location (36).X := 440
Location (36).Y := 669
Location (36).N := "Florin"
Location (36).D := "Gateway"
Location (36).T := 2

Location (37).X := 257
Location (37).Y := 626
Location (37).N := "Epheria's"
Location (37).D := "Pass"
Location (37).T := 1

Location (38).X := 202
Location (38).Y := 552
Location (38).N := "Epheria's"
Location (38).D := "Post"
Location (38).T := 0

Location (39).X := 356
Location (39).Y := 545
Location (39).N := "Ginte"
Location (39).D := "Hill"
Location (39).T := 2

Location (40).X := 359
Location (40).Y := 480
Location (40).N := "Northern"
Location (40).D := "Castle Gate"
Location (40).T := 2

Location (41).X := 382
Location (41).Y := 401
Location (41).N := "Eastern"
Location (41).D := "Castle Gate"
Location (41).T := 2

Location (42).X := 303
Location (42).Y := 372
Location (42).N := "Western"
Location (42).D := "Castle Gate"
Location (42).T := 2

Location (43).X := 354
Location (43).Y := 332
Location (43).N := "Southern"
Location (43).D := "Gateway"
Location (43).T := 2

Location (44).X := 309
Location (44).Y := 454
Location (44).N := "Calpheon"
Location (44).D := "Castle"
Location (44).T := 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Map overlay coordinates
%%%%%%%%%%%%%%%%%%%%%%%%%

type MOP :
    record
	X : int
	Y : int
	U : boolean
    end record

var MapOverlayPosition : array 1 .. 15 of MOP

MapOverlayPosition (1).X := 3
MapOverlayPosition (1).Y := 3
MapOverlayPosition (1).U := true
MapOverlayPosition (2).X := 4
MapOverlayPosition (2).Y := 3
MapOverlayPosition (2).U := true
MapOverlayPosition (3).X := 5
MapOverlayPosition (3).Y := 3
MapOverlayPosition (3).U := false
MapOverlayPosition (4).X := 5
MapOverlayPosition (4).Y := 2
MapOverlayPosition (4).U := false
MapOverlayPosition (5).X := 5
MapOverlayPosition (5).Y := 1
MapOverlayPosition (5).U := false
MapOverlayPosition (6).X := 4
MapOverlayPosition (6).Y := 2
MapOverlayPosition (6).U := false
MapOverlayPosition (7).X := 4
MapOverlayPosition (7).Y := 1
MapOverlayPosition (7).U := false
MapOverlayPosition (8).X := 3
MapOverlayPosition (8).Y := 2
MapOverlayPosition (8).U := false
MapOverlayPosition (9).X := 3
MapOverlayPosition (9).Y := 1
MapOverlayPosition (9).U := false
MapOverlayPosition (10).X := 2
MapOverlayPosition (10).Y := 1
MapOverlayPosition (10).U := false
MapOverlayPosition (11).X := 1
MapOverlayPosition (11).Y := 1
MapOverlayPosition (11).U := false
MapOverlayPosition (12).X := 1
MapOverlayPosition (12).Y := 2
MapOverlayPosition (12).U := false
MapOverlayPosition (13).X := 2
MapOverlayPosition (13).Y := 3
MapOverlayPosition (13).U := false
MapOverlayPosition (14).X := 1
MapOverlayPosition (14).Y := 3
MapOverlayPosition (14).U := false
MapOverlayPosition (15).X := 2
MapOverlayPosition (15).Y := 2
MapOverlayPosition (15).U := false



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
