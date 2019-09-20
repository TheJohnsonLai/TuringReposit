% Johnson Lai
% The Dust {RPG}

% Complete Maps for Places
% Complete Buttons and GUI
% Complete Library
% Complete Targetting
% Complete Animation
% Complete Highlighting to futtons
% Complete Storyline 8

% Cutting Lines [Will change over time] - [Ctrl + f and the words in square brackets for shortcut.]
% Variables - 80
% Friendlies - 451 [FRIENDLY1]
% Skills - 765 [SKILL1]
% Hp and GUI - 1978
% Futtons - 1663 [FUTTON1]
% Fighting - 2049 [FIGHTS1]
% Basic Procedures - 2881 [BASIC1]
% Places - 3035 [PLACES1]
% Town - [TOWN1]
% Game - [THEDUST1]
% Stats - 4613 [STATS1]

import GUI
setscreen ("graphics: 750,570")
%Draw.FillBox (1,1,700,500,white)
%Draw.Line (1,1,1,1,white)
%Draw.Line (1,1,1,1,white)
%var map : int := Pic.FileNew ("Map_Training.bmp")
%Pic.Draw (map, 0, 0, picUnderMerge)

% [Music]
process playstuffWhy
    loop
	Music.PlayFile ("Music\\Why.mp3")
    end loop
end playstuffWhy

process playstuffWhyInst
    loop
	Music.PlayFile ("Music\\Why-Inst.mp3")
    end loop
end playstuffWhyInst

process playstuffFireworks
    loop
	Music.PlayFile ("Music\\Fireworks.mp3")
    end loop
end playstuffFireworks

process playstuffSequoyah
    loop
	Music.PlayFile ("Music\\Sequoyah.mp3")
    end loop
end playstuffSequoyah


process playstuffNostalgia
    loop
	Music.PlayFile ("Music\\Nostalgia.mp3")
    end loop
end playstuffNostalgia

process playstuffSoldier
    loop
	Music.PlayFile ("Music\\Soldier.mp3")
    end loop
end playstuffSoldier

% Identification
/*
 Jasqur-33
 Na-Long-10
 GongsunSheng-103
 Seyla-106
 Ravness-40
 Lukvel-43
 Farmer-16
 Glacius-13
 Rebel-0
 Joe-11
 Frizul-12
 Basic-54
 CB-151
 */

% Vars

var Track : string
var Fly : int
var mouse : int
var Dust : int
var Call : int := 0
var exitkey : string
var mx, my, mb : int
var intfont, intfont1, intfont2, intfont3 : int
var Choice : string
var waitkey : string (1)
var Kill : int := 1
var LevelArray : array 1 .. 15 of int
for LA : 1 .. 15
    LevelArray (LA) := 0
end for
var PetArray : array 1 .. 8 of int
for PA : 1 .. 8
    PetArray (PA) := 0
end for
var LSL, LSM, LSS, Lstream : array 1 .. 4 of int
var LSN : array 1 .. 4 of string
LSN (1) := "data/Save1.txt"
LSN (2) := "data/Save2.txt"
LSN (3) := "data/Save3.txt"
LSN (4) := "data/Save4.txt"
var LSC : array 1 .. 4 of string
for i : 1 .. 4
    LSL (i) := 0
    LSM (i) := 0
    LSS (i) := 0
end for
var SlotX : int := 40
var SlotY : int := 51
var Incry : int := 0
var Incrx : int := 100
intfont := Font.New ("Garamond:19")
intfont3 := Font.New ("Garamond:7")
intfont2 := Font.New ("Garamond:10")
intfont1 := Font.New ("Garamond:13")
var DarkBlue : int := RGB.AddColour (37, 6, 159)
var CSA1, CSA2, CSA3, CSA4 : int := 0
var MissionCost : int := 0
var MissionGold : int := 0
var MissionExperience : int := 0
var MissionSelect : int := 0
var Mission : int := 0
var CreileFight : int := 0
var Character : int
var Townanswer : int
var Hillsanswer : int
var Storyanswer : int
var Traininganswer : int
var MyunertStoreanswer : int
var KligeSharpanswer : int
var Subwayanswer : int
var ZenoHQanswer : int
var Plazaanswer : int
var Libraryanswer : int
var Arclenanswer : int
var PetStoreanswer : int
var TimaStory5answer : int
var Timaanswer : int
var CreileStoryanswer : int
var Creileanswer : int
var MessHallStoryanswer : int
var TownSquareanswer : int
var Barracksanswer : int
var MoralFightanswer : int
var TownSquare : int
var Klige : int
var answer : int
var Experience : real := 0
var Level : int := 1
var Jiro : int
var Storyline : real := 0
var Name : string
var Pet : int := 0
var PetChoice : int
var PetsChoice : int
var PetBuy : string
var PetEquip : int
var Storyline4answer : string
var Personalize : int
var ChoosePet : int
var FightingPet : int
var Boole : boolean := false
var PetNothing : int := 1
var LoadGamePic : int := Pic.FileNew ("Picture\\LoadGamePic.bmp")
var TrainingPic : int := Pic.FileNew ("Picture\\Training.bmp")
var Slab : int := Pic.FileNew ("Picture\\Slab.bmp")
var RoquePic : int := Pic.FileNew ("Picture\\Roque.bmp")
var BunionPic : int := Pic.FileNew ("Picture\\Bunion.bmp")
var HairiPic : int := Pic.FileNew ("Picture\\Hairi.bmp")
var GhostBunnyPic : int := Pic.FileNew ("Picture\\GhostBunny.bmp")
var DolphiPic : int := Pic.FileNew ("Picture\\Dolphi.bmp")
var HushshPic : int := Pic.FileNew ("Picture\\Hushsh.bmp")
var TurtlePic : int := Pic.FileNew ("Picture\\Turtle.bmp")
var DrigoPic : int := Pic.FileNew ("Picture\\Drigo.bmp")
var FightingSkill : int := Pic.FileNew ("Picture\\FightingSkill.bmp")
var CreilePic : int := Pic.FileNew ("Picture\\Creile.bmp")
var Speech : int := Pic.FileNew ("Picture\\Speech.bmp")
var Myunert : int := Pic.FileNew ("Picture\\Myunert.bmp")
var Hospital : int := Pic.FileNew ("Picture\\Hospital.bmp")
var SkillScreen : int := Pic.FileNew ("Picture\\Skillscreen.bmp")
var Arclen : int := Pic.FileNew ("Picture\\Arclen.bmp")
var Lose : int := Pic.FileNew ("Picture\\Lose.bmp")
var Flash : int := Pic.FileNew ("Picture\\Flash.bmp")
var Death : int := Pic.FileNew ("Picture\\Death.bmp")
var Archer : int := Pic.FileNew ("Picture\\Archer.bmp")
var HighwayBandit_ : int := Pic.FileNew ("Picture\\HighwayBandit.bmp")
var Rogue_ : int := Pic.FileNew ("Picture\\Rogue.bmp")
var Robber_ : int := Pic.FileNew ("Picture\\Robber.bmp")
var Cadet_ : int := Pic.FileNew ("Picture\\Cadet.bmp")
var GBSoldier_ : int := Pic.FileNew ("Picture\\GBSoldier.bmp")
var RiotSoldier_ : int := Pic.FileNew ("Picture\\RiotSoldier.bmp")
var EscapedPrisonmate_ : int := Pic.FileNew ("Picture\\EscapedPrisonmate.bmp")
var Gobassin_ : int := Pic.FileNew ("Picture\\Gobassin.bmp")
var DoctorLevun_ : int := Pic.FileNew ("Picture\\DoctorLevun.bmp")
var Glabezir_ : int := Pic.FileNew ("Picture\\Glabezir.bmp")
var ZenoPracticeDummy : int := Pic.FileNew ("Picture\\ZenoPracticeDummy.bmp")
var Side_Cut : int := Pic.FileNew ("Picture\\Attack.bmp")
var Blood_Shot : int := Pic.FileNew ("Picture\\Blood_Shot.bmp")
var Bow : int := Pic.FileNew ("Picture\\Bow.bmp")
var Double_Slash : int := Pic.FileNew ("Picture\\Double_Slash.bmp")
var ManaShot : int := Pic.FileNew ("Picture\\Mana_Shot.bmp")
var Raised_Curve : int := Pic.FileNew ("Picture\\Raised_Curve.bmp")
var Shots : int := Pic.FileNew ("Picture\\Shots.bmp")
var Sinjid : int := Pic.FileNew ("Picture\\Sinjid.bmp")
var Speed_Slice : int := Pic.FileNew ("Picture\\Speed_Slice.bmp")
var Burning_Metal : int := Pic.FileNew ("Picture\\BurningMetal.bmp")
var Wind_Lash : int := Pic.FileNew ("Picture\\WindLash.bmp")
var Taggerung_ : int := Pic.FileNew ("Picture\\Taggerung.bmp")
var Jet_Stream : int := Pic.FileNew ("Picture\\JetStream.bmp")
var Regen_ : int := Pic.FileNew ("Picture\\Regen.bmp")
var White_Tundra : int := Pic.FileNew ("Picture\\WhiteTundra.bmp")
var Zenos_Sword : int := Pic.FileNew ("Picture\\ZenosSword.bmp")
var Star_Shot : int := Pic.FileNew ("Picture\\Star_Shot.bmp")
var QuadShot : int := Pic.FileNew ("Picture\\QuadShot.bmp")
var Eve : int := Pic.FileNew ("Picture\\Eve.bmp")
var HeartEndo : int := Pic.FileNew ("Picture\\HeartEndo.bmp")
var OppedShield : int := Pic.FileNew ("Picture\\OppedShield.bmp")
var Shadow : int := Pic.FileNew ("Picture\\Shadow.bmp")
var Sniper : int := Pic.FileNew ("Picture\\Sniper.bmp")
var StingingBow : int := Pic.FileNew ("Picture\\StingingBow.bmp")
var SuperScription : int := Pic.FileNew ("Picture\\SuperScription.bmp")
var TunshShot : int := Pic.FileNew ("Picture\\TunshShot.bmp")
var Mage : int := Pic.FileNew ("Picture\\Mage.bmp")
var Gunner : int := Pic.FileNew ("Picture\\Gunner.bmp")
var House : int := Pic.FileNew ("Picture\\House.bmp")
var Training_Map : int := Pic.FileNew ("Picture\\Map_Training.bmp")
var WorldMap : int := Pic.FileNew ("Picture\\World Map.bmp")
var WorldMap2 : int := Pic.FileNew ("Picture\\World Map2.bmp")
var WorldMap3 : int := Pic.FileNew ("Picture\\World Map3.bmp")
var WorldMap4 : int := Pic.FileNew ("Picture\\World Map4.bmp")
var Congratulation : int := Pic.FileNew ("Picture\\Congratulations.bmp")
var ToFields : int := Pic.FileNew ("Picture\\ToField.bmp")
var TownPic : int := Pic.FileNew ("Picture\\Town.bmp")
var InsideHouse : int := Pic.FileNew ("Picture\\InsideHouse.bmp")
var AngryFarmer : int := Pic.FileNew ("Picture\\Farmer.bmp")
var Rebel : int := Pic.FileNew ("Picture\\Rebel.bmp")
var Jexclim : int := Pic.FileNew ("Picture\\Je'xclim.bmp")
var JexclimAnimation1 : int := Pic.FileNew ("Picture\\Animation\\J'exclimAnimation1.bmp")
var JexclimAnimation2 : int := Pic.FileNew ("Picture\\Animation\\J'exclimAnimation2.bmp")
var JexclimAnimation3 : int := Pic.FileNew ("Picture\\Animation\\J'exclimAnimation3.bmp")
var Senso : int := Pic.FileNew ("Picture\\Senso.bmp")
var Ravness : int := Pic.FileNew ("Picture\\Ravness.bmp")
var GongsunSheng : int := Pic.FileNew ("Picture\\GongsunSheng.bmp")
var Seyla : int := Pic.FileNew ("Picture\\Seyla.bmp")
var NaLong : int := Pic.FileNew ("Picture\\NaLong.bmp")
var Lukvel : int := Pic.FileNew ("Picture\\Lukvel.bmp")
var Glacius : int := Pic.FileNew ("Picture\\Glacius.bmp")
var IntroMap : int := Pic.FileNew ("Picture\\IntroMap.bmp")
var Subway : int := Pic.FileNew ("Picture\\Subway.bmp")
var Plaza : int := Pic.FileNew ("Picture\\Plaza.bmp")
var ZenoMap : int := Pic.FileNew ("Picture\\Zeno.bmp")
var ZenoHQPic : int := Pic.FileNew ("Picture\\ZenoHQ.bmp")
var ZenoHQTabs : int := Pic.FileNew ("Picture\\ZenoHQTabs.bmp")
var DasMater : int := Pic.FileNew ("Picture\\DasMater.bmp")
var GBMagePic : int := Pic.FileNew ("Picture\\GBMage.bmp")
var GBGunnerPic : int := Pic.FileNew ("Picture\\GBGunner.bmp")
var GBPikePic : int := Pic.FileNew ("Picture\\GBPike.bmp")
var GBSwordPic : int := Pic.FileNew ("Picture\\GBSword.bmp")
var PersonalizationPic : int := Pic.FileNew ("Picture\\Personalization.bmp")
var TimaPic : int := Pic.FileNew ("Picture\\Tima.bmp")
var Exiting : boolean := false
var StoryStuff : boolean := false
var TabMissionsSwitching : boolean := false
var TabCurrentSwitching : boolean := false
var TabCompleteSwitching : boolean := false
var EnemyThing : int
var Skill_Level_SideCut : real := 1
var Skill_Level_AimedArrow : real := 1
var Skill_Level_BloodShot : real := 1
var Skill_Level_Mana_Shot : real := 1
var Skill_Level_SpeedSlice : real := 1
var Skill_Level_Shot_s : real := 1
var Skill_Level_DoubleSlash : real := 1
var Skill_Level_RaisedCurve : real := 0
var Skill_Level_StarShot : real := 0
var Skill_Level_WindLash : real := 0
var Skill_Level_BurningMetal : real := 1
var Skill_Level_Regen : real := 1
var Skill_Level_QuadShot : real := 0
var Skill_Level_ZenosSword : real := 0
var Skill_Level_WhiteTundra : real := 0
var Skill_Level_Taggerung : real := 0
var Skill_Level_JetStream : real := 0
var Skill_Level_Eve : real := 0
var Skill_Level_HeartEndo : real := 0
var Skill_Level_OppedShield : real := 0
var Skill_Level_Shadow : real := 0
var Skill_Level_Sniper : real := 0
var Skill_Level_StingingBow : real := 0
var Skill_Level_SuperScription : real := 0
var Skill_Level_TunshShot : real := 0
var Display : string
var EnemyMoral : int := 47
var EnemyTotalMoral : int := 100
var Paperanswer : int
var NiceChoice : int
var FFIGHT : int
var Upgrade : int
var EnemyHp : real
var EnemyTHp : real
var EnemyMana : int
var EnemyTMana : int
var EnemyDefense : real
var EnemyDamage : real
var EnemySpeed : real
var EnemyChoice : int
var EnemyIntelligence : real
var NiceHp : real
var NiceTHp : real
var NiceMana : real
var NiceTMana : real
var NiceDamage : real
var NiceIntelligence : real
var NiceSpeed : real
var JoeChoice : int
var Attacked : real := 1
var Exper : real
var Joe : int := Pic.FileNew ("Picture\\Joe.bmp")
var EMon : real
var JoeHp : real := 2700
var JoeTHp : real := 2700
var JoeDefense : real := 600
var JoeDamage : real := 866
var JoeSpeed : real := 202
var EnemyType : real
var Damage : real
var Defense : real
var Dauntless : int
var Hp : real
var ManaRegen : real
var Intelligence : real
var THp : real
var Mana : real
var TMana : real
var Mbar : int
var Speed : real
var PreviousSpeed : real := 0
var PreviousIntelligence : real := 0
var PreviousDamage : real := 0
var PreviousHp : real := 0
var AddedSpeed : real := 0
var AddedDamage : real := 0
var AddedIntelligence : real := 0
var AddedHp : real := 0
var Added : real := 0
var DisplayPoints : string
var DisplaySpeed : string
var DisplayDamage : string
var DisplayIntelligence : string
var DisplayHp : string
var Hunger : real
var Style : string
var Money : real := 0
var Jelly : int
var One : string
var Two : string
var Three : string
var Four : string
var edge : int := 100
var M : int
var a : int := 232
var b : int := 300
var a2 : int := 238
var b2 : int := 307
var ding : int := 0
var j : int := 270
var j2 : int := 277
var c : int := 232
var d : int := 300
var c2 : int := 238
var d2 : int := 307
var ding1 : int := 0
var j3 : int := 270
var j4 : int := 277
var NoTime : int
var Turn : int
var EnemyTurn : int
var continue : int
var derpy : int
var Joy : int
var EnemyMoney : real := 0
var EnemyExperience : real := 0
var Manacost : real := 0
var stream : int
var FilePosition, Selection : int
var FileName : string
var Extension, FileDir : string
var Hoole : boolean := false
var rangeX : int
var rangeY : int
var button : int
var streamstring : string
Track := "Nothing right now."
%Extension := ".db"
%FileDir := "C:\\"

procedure print_array (arr : array 1 .. * of real)
    for i : 1 .. upper (arr)
	put arr (1)
    end for
end print_array

var MArray : array 1 .. 10 of int
for AD : 1 .. 10
    MArray (AD) := 0
end for

var name : string
%var AFlexiblearray : array 1 .. 31 of real := init (Hp, THp, Mana, TMana, Style, Damage,
%Speed, Skill_Level_SideCut, Intelligence, Skill_Level_AimedArrow,Skill_Level_BloodShot,
%Skill_Level_Mana_Shot, Skill_Level_SpeedSlice, Skill_Level_Shot_s, Skill_Level_DoubleSlash,
%Skill_Level_RaisedCurve, Skill_Level_StarShot, Skill_Level_WindLash, Skill_Level_BurningMetal,
%Skill_Level_Regen,Skill_Level_ZenosSword, Skill_Level_WhiteTundra, Skill_Level_Taggerung,
% Skill_Level_JetStream, Storyline, Experience, Level, Money, Pet, Track)
%print_array (AFlexiblearray)

proc SaveGame
    Extension := ".txt"
    FileDir := "data/"
    FileName := name
    FileName += Extension
    FileDir += FileName
    if File.Exists ("data/" + FileName) then
	File.Delete ("data/" + FileName)
    end if
    open : stream, FileDir, write
    write : stream, name
    write : stream, Level
    write : stream, Money
    write : stream, Style
    write : stream, Storyline
    write : stream, Hp
    write : stream, THp
    write : stream, Mana
    write : stream, TMana
    write : stream, ManaRegen
    write : stream, Damage
    write : stream, Speed
    write : stream, Character
    write : stream, Skill_Level_SideCut
    write : stream, Intelligence
    write : stream, Skill_Level_AimedArrow
    write : stream, Skill_Level_BloodShot
    write : stream, Skill_Level_Mana_Shot
    write : stream, Skill_Level_SpeedSlice
    write : stream, Skill_Level_Shot_s
    write : stream, Skill_Level_DoubleSlash
    write : stream, Skill_Level_RaisedCurve
    write : stream, Skill_Level_StarShot
    write : stream, Skill_Level_WindLash
    write : stream, Skill_Level_BurningMetal
    write : stream, Skill_Level_Regen
    write : stream, Skill_Level_ZenosSword
    write : stream, Skill_Level_WhiteTundra
    write : stream, Skill_Level_Taggerung
    write : stream, Skill_Level_JetStream
    write : stream, Experience
    write : stream, Pet
    write : stream, FightingPet
    write : stream, Mission
    for LA : 1 .. 15
	write : stream, LevelArray (LA)
    end for
    for PA : 1 .. 8
	write : stream, PetArray (PA)
    end for
    write : stream, CreileFight
    write : stream, CSA1
    write : stream, CSA2
    write : stream, CSA3
    write : stream, CSA4
    write : stream, PreviousSpeed
    write : stream, AddedSpeed
    write : stream, PreviousDamage
    write : stream, AddedDamage
    write : stream, PreviousIntelligence
    write : stream, AddedIntelligence
    write : stream, PreviousHp
    write : stream, AddedHp
    write : stream, Added
    close : stream

    put "Game saved as: ", FileName
    delay (1500)
end SaveGame

proc Guide         %[FCN1]
    cls
    Draw.FillBox (0, 0, maxx, maxy, 111)
    put "To play this game, you need to know 2 things."
    put "1. How to type."
    put "2. How to click."
    put ""
    put "This game is still in Beta. Do not attempt to crash it."
    put "Usually, when the game appears to have stopped, press any key."
    put "By looking at the top left of the Window (The See through silverish bar) "
    put "You can notice if it says Waiting for input."
    put "Simply, press a key."
    put "However, don't spam buttons. This is because you will skip other getch codes"
    put " farther down the lines."
    put "To fight an opponent, type your skill number. And press Enter."
    put "Usually, the game will tell you when to type an answer."
    put "Type all answers perfectly. Mispelling will get an undesired result."
    put "P.S.. there's no exit button."
    put ""
    put ""
    put "Type (e) to exit"
    getch (waitkey)
end Guide

proc ExitScreen
    cls
    put "Press the red x button."
    getch (waitkey)
end ExitScreen

proc ButtonExit
    loop
	Draw.Line (300, 240, 500, 240, white)         % Top line
	Draw.Line (300, 230, 500, 230, white)         % Bottom line
	Draw.Line (298, 239, 298, 231, white)         % Left line
	Draw.Line (502, 239, 502, 231, white)         % Right line
	Draw.FillBox (b, a, b2, a2, 53)
	b := b + 10
	b2 := b2 + 10
	j2 := j2 + 10
	j := j + 10
	delay (300)
	Draw.FillBox (j, a, j2, a2, 151)
	exit when 500 <= j2
	exit when 500 <= b2

    end loop
    delay (300)
    Draw.FillBox (477, 232, 489, 238, 151)
    delay (300)
    Draw.FillBox (490, 232, 500, 238, 151)
end ButtonExit

proc MAX
    if Hp > THp then
	Hp := THp
    end if
    if Mana > TMana then
	Mana := TMana
    end if
end MAX

proc NICEMAX
    if NiceHp > NiceTHp then
	NiceHp := NiceTHp
    end if
    if NiceMana > NiceTMana then
	NiceMana := NiceTMana
    end if
end NICEMAX

proc ButtonRebuyMyunert
    cls
end ButtonRebuyMyunert
proc Button_Side_Cut
end Button_Side_Cut

% List of Friendlies [FRIENDLY1]

proc nothing
    NiceHp := 0
    NiceTHp := 0
    NiceMana := 0
    NiceTMana := 0
    NiceDamage := 0
    NiceIntelligence := 0
    NiceSpeed := 0
end nothing

proc Roque
    NiceHp := 1800 * Level
    NiceTHp := 1800 * Level
    NiceMana := 5
    NiceTMana := 5
    NiceDamage := 1 * Level
    NiceIntelligence := 1 * Level
    NiceSpeed := 1
end Roque

proc Bunion
    NiceHp := 400 * Level
    NiceTHp := 400 * Level
    NiceMana := 60
    NiceTMana := 60
    NiceDamage := 30 * Level
    NiceIntelligence := 50 * Level
    NiceSpeed := 55
end Bunion

proc Hairi
    NiceHp := 500 * Level
    NiceTHp := 500 * Level
    NiceMana := 15
    NiceTMana := 15
    NiceDamage := 70 * Level
    NiceIntelligence := 0 * Level
    NiceSpeed := 30
end Hairi

proc GhostBunny
    NiceHp := 800 * Level
    NiceTHp := 800 * Level
    NiceMana := 150
    NiceTMana := 600
    NiceDamage := 80 * Level
    NiceIntelligence := 106 * Level
    NiceSpeed := 50
end GhostBunny

proc Dolphi
    NiceHp := 500 * Level
    NiceTHp := 500 * Level
    NiceMana := 700
    NiceTMana := 700
    NiceDamage := 400 * Level
    NiceIntelligence := 80 * Level
    NiceSpeed := 180
end Dolphi

proc Hushsh
    NiceHp := 960 * Level
    NiceTHp := 960 * Level
    NiceMana := 500
    NiceTMana := 550
    NiceDamage := 130 * Level
    NiceIntelligence := 219 * Level
    NiceSpeed := 78
end Hushsh

proc Turtle
    NiceHp := 2000 * Level
    NiceTHp := 2000 * Level
    NiceMana := 700
    NiceTMana := 800
    NiceDamage := 200 * Level
    NiceIntelligence := 60 * Level
    NiceSpeed := 35
end Turtle

proc Drigo
    NiceHp := 1700 * Level
    NiceTHp := 1700 * Level
    NiceMana := 450
    NiceTMana := 550
    NiceDamage := 455 * Level
    NiceIntelligence := 180 * Level
    NiceSpeed := 350
end Drigo

proc Lukvel_
    NiceHp := 3500 * Level
    NiceTHp := 3500 * Level
    NiceMana := 17000
    NiceTMana := 18000
    NiceDamage := 560 * Level
    NiceIntelligence := 300 * Level
    NiceSpeed := 96
end Lukvel_

proc Ravness_
    NiceHp := 2200 * Level
    NiceTHp := 2200 * Level
    NiceMana := 1400 * Level
    NiceTMana := 1400 * Level
    NiceDamage := 475 * Level
    NiceIntelligence := 140 * Level
    NiceSpeed := 20 * Level
end Ravness_

proc Joe_
    NiceHp := 2700 * Level
    NiceTHp := 2200 * Level
    NiceMana := 1180 * Level
    NiceTMana := 1180 * Level
    NiceDamage := 866 * Level
    NiceIntelligence := 600 * Level
    NiceSpeed := 202 * Level
end Joe_

proc NaLong_
    NiceHp := 1679 * Level
    NiceTHp := 1680 * Level
    NiceMana := 1200 * Level
    NiceTMana := 1200 * Level
    NiceDamage := 535 * Level
    NiceIntelligence := 180 * Level
    NiceSpeed := 77 * Level
end NaLong_

proc Jasqur_
    NiceHp := 2800 * Level
    NiceTHp := 2800 * Level
    NiceMana := 1000 * Level
    NiceTMana := 1000 * Level
    NiceDamage := 380 * Level
    NiceIntelligence := 85 * Level
    NiceSpeed := 24 * Level
end Jasqur_

% List of Officers

proc Olba_
    EnemyHp := 1700 * Level
    EnemyTHp := 1700 * Level
    EnemyTMana := 3300
    EnemyMana := 3300
    EnemyDamage := 200 * Level
    EnemyIntelligence := 346 * Level
    EnemySpeed := 22 * Level
    EnemyMoney := 1 * Level
    EnemyExperience := 34 * Level
end Olba_

proc Rebel_
    EnemyHp := 1344 * Level
    EnemyTHp := 1345 * Level
    EnemyTMana := 260
    EnemyMana := 260
    EnemyDamage := 100 * Level
    EnemyIntelligence := 90 * Level
    EnemySpeed := 33 * Level
    EnemyMoney := 20 * Level
    EnemyExperience := 5 * Level
end Rebel_

proc Jexclim_
    EnemyHp := 5000 * Level
    EnemyTHp := 5000 * Level
    EnemyTMana := 400
    EnemyMana := 400
    EnemyDamage := 180 * Level
    EnemyIntelligence := 70
    EnemySpeed := 55
    % EnemyMoney := Rand.Int (11, 15) * Level
    % EnemyExperience := Rand.Int (11, 15) * Level
end Jexclim_

proc Glacius_
    EnemyHp := Rand.Int (3500, 3599) * Level
    EnemyTHp := 3599 * Level
    EnemyTMana := 2514
    EnemyMana := 500
    EnemyDamage := 350 * Level
    EnemyIntelligence := 600 * Level
    EnemySpeed := 108
    %EnemyMoney := Rand.Int (11, 15) * Level
    % EnemyExperience := Rand.Int (11, 15) * Level
end Glacius_

proc Senso_
    EnemyHp := 2000 * Level
    EnemyTHp := 2050 * Level
    EnemyTMana := 340
    EnemyMana := 340
    EnemyDamage := 150 * Level
    EnemyIntelligence := 66
    EnemySpeed := 30 * Level
    %EnemyMoney := Rand.Int (11, 15) * Level
    %EnemyExperience := Rand.Int (11, 15) * Level
end Senso_

% List of Foes

% Sparring
proc ZenoPracticeDummyArcher
    EnemyHp := Rand.Int (800, 850) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 70
    EnemyExperience := 8 * Level
end ZenoPracticeDummyArcher
proc ZenoPracticeDummyMelee
    EnemyHp := Rand.Int (1400, 1500) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 10
    EnemyExperience := 8 * Level
end ZenoPracticeDummyMelee
proc ZenoPracticeDummyGunner
    EnemyHp := Rand.Int (670, 730) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 62
    EnemyExperience := 8 * Level
end ZenoPracticeDummyGunner
proc ZenoPracticeDummyMagic
    EnemyHp := Rand.Int (590, 645) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 15
    EnemyExperience := 8 * Level
end ZenoPracticeDummyMagic
proc ZenoPracticeDummyMixed
    EnemyHp := Rand.Int (590, 1500) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 15
    EnemyExperience := 10 * Level
end ZenoPracticeDummyMixed
% Foes

proc GBMage
    EnemyHp := Rand.Int (500, 700) * Level
    EnemyTHp := 700 * Level
    EnemyTMana := 50
    EnemyMana := 50
    EnemyDamage := 110 * Level
    EnemyIntelligence := 100
    EnemySpeed := 36
    EnemyMoney := 12 * Level
    EnemyExperience := 19
end GBMage

proc GBGunner
    EnemyHp := Rand.Int (579, 600) * Level
    EnemyTHp := 600 * Level
    EnemyTMana := 30
    EnemyMana := 30
    EnemyDamage := 120 * Level
    EnemyIntelligence := 50
    EnemySpeed := 50
    EnemyMoney := 10 * Level
    EnemyExperience := 15
end GBGunner

proc GBPike
    EnemyHp := Rand.Int (800, 900) * Level
    EnemyTHp := 900 * Level
    EnemyTMana := 15
    EnemyMana := 15
    EnemyDamage := 75 * Level
    EnemyIntelligence := 20
    EnemySpeed := 10
    EnemyMoney := 4 * Level
    EnemyExperience := 8
end GBPike

proc GBSword
    EnemyHp := Rand.Int (970, 1000) * Level
    EnemyTHp := 1000 * Level
    EnemyTMana := 17
    EnemyMana := 17
    EnemyDamage := 59 * Level
    EnemyIntelligence := 36
    EnemySpeed := 19
    EnemyMoney := 4 * Level
    EnemyExperience := 8
end GBSword

proc HighwayBandit
    EnemyHp := Rand.Int (350, 1820) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 100
    EnemyMana := 60
    EnemyDamage := 69 * Level
    EnemyIntelligence := 30
    EnemySpeed := 45
    EnemyMoney := Rand.Int (11, 15) * Level
    EnemyExperience := Rand.Int (11, 15) * Level
end HighwayBandit

proc Rogue
    EnemyHp := Rand.Int (1650, 1700) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 75
    EnemyMana := 10
    EnemyDamage := Rand.Int (75, 150) * Level
    EnemyIntelligence := 63
    EnemySpeed := 78
    EnemyMoney := Rand.Int (6, 22) * Level
    EnemyExperience := Rand.Int (5, 9) * Level
end Rogue


proc Cadet
    EnemyHp := Rand.Int (1200, 1468) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 180
    EnemyMana := 80
    EnemyDamage := 105 * Level
    EnemyIntelligence := 120
    EnemySpeed := 15
    EnemyMoney := Rand.Int (30, 35) * Level
    EnemyExperience := Rand.Int (14, 18) * Level
end Cadet

proc Robber
    EnemyHp := Rand.Int (700, 1400) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 50
    EnemyMana := 48
    EnemyDamage := 280 * Level
    EnemyIntelligence := 12
    EnemySpeed := 70
    EnemyMoney := Rand.Int (50, 65) * Level
    EnemyExperience := Rand.Int (20, 25) * Level
end Robber

proc GBSoldier         % Lv 10
    EnemyHp := Rand.Int (2601, 3003) * Level
    EnemyTHp := Rand.Int (3003, 3500) * Level
    EnemyTMana := 800
    EnemyMana := 700
    EnemyDamage := Rand.Int (147, 164) * Level
    EnemyIntelligence := Rand.Int (200, 260) * Level
    EnemySpeed := 29 + (Level * 5)
    EnemyMoney := Rand.Int (45, 154) * Level
    EnemyExperience := Rand.Int (14, 50) * Level
end GBSoldier

% Creile Fight

proc RiotSoldier
    EnemyHp := Rand.Int (800, 1500) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 200
    EnemyMana := 200
    EnemyDamage := 160 * Level
    EnemyIntelligence := 40
    EnemySpeed := 25
    EnemyMoney := 4 * Level
    EnemyExperience := 27
end RiotSoldier

proc EscapedPrisonmate
    EnemyHp := Rand.Int (900, 1100) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 70
    EnemyMana := 70
    EnemyDamage := 145 * Level
    EnemyIntelligence := 34
    EnemySpeed := 40
    EnemyMoney := 3 * Level
    EnemyExperience := 25
end EscapedPrisonmate

proc Gobassin
    EnemyHp := Rand.Int (600, 999) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 200
    EnemyMana := 200
    EnemyDamage := 120 * Level
    EnemyIntelligence := 100
    EnemySpeed := 67
    EnemyMoney := 5 * Level
    EnemyExperience := 23
end Gobassin

proc DoctorLevun
    EnemyHp := Rand.Int (550, 620) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 400 * Level
    EnemyMana := 400 * Level
    EnemyDamage := 180 * Level
    EnemyIntelligence := 275 * Level
    EnemySpeed := 35 * Level
    EnemyMoney := 8 * Level
    EnemyExperience := 36
end DoctorLevun

proc Glabezir
    EnemyHp := Rand.Int (2000, 3000) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 260 * Level
    EnemyMana := 260 * Level
    EnemyDamage := 120 * Level
    EnemyIntelligence := 21 * Level
    EnemySpeed := 48 * Level
    EnemyMoney := 7 * Level
    EnemyExperience := 34
end Glabezir
% Enemy Skills [SKILL1]
proc Waitskill
end Waitskill
proc Bite
    Attacked := EnemyDamage
    Hp := Hp - Attacked
    put "*Bites* Damage Dealt: ", Attacked
end Bite
proc KnifeStab
    Attacked := EnemyDamage + Rand.Int (1, 50)
    Hp := Hp - Attacked
    put "Critical! Damage Dealt: ", Attacked
end KnifeStab
proc WhorlsofHair
    Attacked := EnemyDamage * 1.3
    Hp := Hp - Attacked
    put "Whorls of hair, make him itch! Damage Dealt: ", Attacked
end WhorlsofHair
proc Downwardsstroke
    Attacked := EnemyDamage * 0.7 + Rand.Int (10, 70)
    Hp := Hp - Attacked
    put "*Slashes downwards* Damage Dealt: ", Attacked
end Downwardsstroke
proc clawwed
    Attacked := EnemyDamage * 0.96 + 35 + Rand.Int (10, 24)
    Hp := Hp - Attacked
    put "Chaaaaahhh!!! *Claws at you* ", Attacked
end clawwed
proc EHeal
    Attacked := EnemyTHp * 0.08 * Rand.Int (60, 110) / 100
    EnemyHp := EnemyHp + Attacked
    put "Healed self: (", (Attacked), ")"
end EHeal
proc Buff_G         % Finish
    Attacked := EnemyIntelligence * 0.15
    EnemyHp := EnemyHp + EnemyIntelligence
    EnemyTHp := EnemyTHp + EnemyIntelligence
    put "'Saghu maal..' Hp Up: ", Attacked
end Buff_G
proc TripleStrike
    Attacked := EnemyDamage * 3
    Hp := Hp - Attacked
    put "Soit - Sut - Sain! 3 slices doing: ", Attacked
end TripleStrike
proc RedBurst
    Attacked := EnemyDamage + EnemyMana + EnemyIntelligence - Mana
    Hp := Hp - Attacked
    put "Malevolent Thunderstorm.. crush these hapless foes! Damag Dealt: ", Attacked
end RedBurst
proc Magna
    Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 150) + EnemyIntelligence
    Hp := Hp - Attacked
    put "Volcanoes, do not hesitate. Damage Dealt: ", Attacked
end Magna
proc SingedFeathers
    Attacked := EnemyDamage + EnemySpeed - Speed + Rand.Int (10, 50)
    Hp := Hp - Attacked
    put "I will find the power within me! Damage Dealt: ", Attacked
end SingedFeathers
proc ThroatSlash
    Attacked := EnemyDamage / 100 * Rand.Int (70, 180)
    Hp := Hp - Attacked
    put "Relish your last moment.. Die!  Damage Dealt: ", Attacked
end ThroatSlash
proc Freedom
    Attacked := (EnemyDamage + EnemyIntelligence) / 100 * Rand.Int (100, 130)
    Hp := Hp - Attacked
    EnemyHp += 100
    put "Do you chain us like dogs.. and abuse this power? I will unleash these chains!  Damage Dealt: ", Attacked
end Freedom
proc PoisonBlow
    Attacked := (EnemyDamage + EnemyIntelligence) / 100 * Rand.Int (80, 120)
    Hp -= Attacked
    put "Poison.. poison..  Damage Dealt: ", Attacked
end PoisonBlow
% Skill Animation [ANIMATION1]
var Floatx : int
var Floaty : int
proc SideCut_Animation
    var Bulletx : int := 400
    loop
	Bulletx += 50
	Draw.Line (400, 230, Bulletx, 250, black)
	Draw.Line (400, 256, Bulletx, 250, black)
	delay (80)
	exit when Bulletx >= 660
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 280, intfont, 12)
end SideCut_Animation

proc BloodShot_Animation
    var Bulletx : int
    var Bullety : int := 150
    loop
	Bulletx := Rand.Int (500, 650)
	Bullety += 30
	Draw.FillOval (Bulletx, Bullety, 3, 3, 39)
	Draw.FillOval (Bulletx, Bullety, 3, 3, 38)
	delay (150)
	exit when Bullety >= 500
	Display := realstr (Attacked / 15, 4)
	Font.Draw (Display + "", Bulletx + 5, Bullety + 5, intfont2, 39)
    end loop
end BloodShot_Animation

proc ManaShot_Animation
    var Bulletx : int := 200
    var Bullety : int := 4
    var Bulletxy : int := 0
    var Bulletyx : int := 250
    loop
	Bulletx += 20
	Bullety += 2
	Bulletxy := Rand.Int (-1, 2)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 53)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 4, Bullety - 4, 51)
	delay (30)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 0)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 4, Bullety - 4, 0)
	exit when Bulletx >= 550
    end loop
    Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 53)
    Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 4, Bullety - 4, 51)
    delay (300)
end ManaShot_Animation

proc DoubleSlash_Animation
    var Bulletx : int := 350
    loop
	Bulletx += 40
	Draw.FillBox (350, 300, Bulletx, 303, black)
	Draw.FillBox (350, 200, Bulletx, 203, black)
	delay (80)
	exit when Bulletx >= 660
    end loop
    Draw.FillBox (350, 300, Bulletx, 303, 39)
    Draw.FillBox (350, 200, Bulletx, 203, 39)
    delay (500)
end DoubleSlash_Animation

proc SpeedSlice_Animation
    var Bulletx : int
    var Bullety : int
    var Slices : int := 0
    delay (500)
    Draw.Oval (570, 260, 20, 20, 15)
    delay (350)
    Draw.Line (570, 290, 570, 260, 21)
    loop
	Slices += 1
	Bulletx := Rand.Int (560, 580)
	Bullety := Rand.Int (291, 340)
	Draw.Dot (Bulletx, Bullety, 39)
	exit when Slices >= 8
	delay (40)
    end loop
    delay (350)
    Draw.Line (552, 242, 570, 260, 21)
    Slices := 0
    loop
	Slices += 1
	Bulletx := Rand.Int (530, 552)
	Bullety := Rand.Int (210, 242)
	Draw.Dot (Bulletx, Bullety, 39)
	exit when Slices >= 8
	delay (40)
    end loop
    delay (350)
    Draw.Line (588, 242, 570, 260, 21)
    Slices := 0
    loop
	Slices += 1
	Bulletx := Rand.Int (588, 620)
	Bullety := Rand.Int (210, 242)
	Draw.Dot (Bulletx, Bullety, 39)
	exit when Slices >= 8
	delay (40)
    end loop
    delay (500)
end SpeedSlice_Animation

proc StarShot_Animation
    var Bulletx : int := 280
    var Bullety : int
    loop
	Bulletx += 30
	Draw.FillBox (210, 260, Bulletx, 270, 44)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 43)

	delay (80)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 0)

	exit when Bulletx >= 700
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 320, intfont, 16)
    Bulletx := 210
    loop
	Bulletx += 30
	Draw.FillBox (210, 260, Bulletx, 270, 44)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 43)

	delay (80)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 0)

	exit when Bulletx >= 700
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 280, intfont, 16)
    Bulletx := 210
    loop
	Bulletx += 30
	Draw.FillBox (210, 260, Bulletx, 270, 44)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 43)
	delay (80)
	Draw.FillOval (Bulletx - 5, 268, 20, 10, 0)
	exit when Bulletx >= 700
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 240, intfont, 16)

end StarShot_Animation

proc Shots_Animation
    var Bulletx : int
    var Bullety : int
    var Fired : int := 0
    Floaty := 300
    loop
	Floatx := Rand.Int (500, 530)
	Bulletx := Rand.Int (450, 600)
	Bullety := Rand.Int (170, 370)
	Fired += 1
	Draw.Oval (Bulletx, Bullety, 2, 2, red)
	delay (100)
	exit when Fired = 10
	Display := realstr (Attacked / 10, 4)
	Font.Draw (Display + "", Floatx, Floaty, intfont1, 16)
	Floaty -= 20
    end loop
end Shots_Animation

proc AimedArrow_Animation
    var Bulletx : int := 210
    var Bullety : int := 270
    var timer : int := 30
    var Sonny : int := 0
    loop
	Bulletx += 40
	Draw.Line (Bulletx, Bullety, Bulletx + 60, Bullety, 48)
	delay (100)
	Draw.Line (Bulletx, Bullety, Bulletx + 60, Bullety, 0)
	exit when Bulletx >= 480
    end loop
    loop
	Sonny += 1
	timer += 40
	Bulletx := Rand.Int (490 + (Sonny * 3), 570)
	Bullety := Rand.Int (265, 275)
	Draw.FillOval (Bulletx + 60, Bullety, 3, 3, 38)
	exit when Sonny >= 7
	delay (50 + timer)
    end loop
end AimedArrow_Animation

proc Regen_Animation
    var Bulletx : int := 150
    var Bullety : int := 440
    var Sonny : int := 1
    var Deep : int := 1
    var Switch : int := 50
    Draw.Oval (150, 440, 60, 10, 10)
    delay (100)
    Draw.Oval (150, 440, 36, 6, 10)
    delay (100)
    Draw.Oval (150, 440, 18, 3, 10)
    delay (100)
    loop
	Sonny += 4
	Deep += 1
	Draw.Line (Bulletx - Sonny, Bullety, Bulletx + Sonny, Bullety, 49)
	Draw.Line (Bulletx, Bullety - Deep, Bulletx, Bullety + Deep, 49)
	exit when Sonny >= 120
	delay (15)
    end loop
    Sonny := 1
    loop
	Sonny += 10
	Bulletx := Rand.Int (100, 240)
	Bullety := Rand.Int (100, 460 - Sonny)
	Draw.Oval (Bulletx, Bullety, 2, 2, Switch)
	if Switch = 50 then
	    Switch := 53
	else
	    Switch := 50
	end if
	delay (40)
	exit when Sonny >= 300
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 140, 160, intfont, 50)
end Regen_Animation

% Buy [BUY1]

proc Buy
    Boole := false
    Hoole := false
    var Turok : int := 0
    PreviousSpeed := AddedSpeed
    PreviousDamage := AddedDamage
    PreviousIntelligence := AddedIntelligence
    PreviousHp := AddedHp
    var DisplayMoney : string
    loop
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (SkillScreen, 0, 0, picXor)
	Pic.Draw (Side_Cut, 107, 432, picCopy)
	Pic.Draw (Blood_Shot, 129, 372, picCopy)
	Pic.Draw (ManaShot, 333, 434, picCopy)
	Pic.Draw (Double_Slash, 59, 372, picCopy)
	Pic.Draw (Speed_Slice, 214, 349, picCopy)
	Pic.Draw (Star_Shot, 418, 282, picCopy)
	Pic.Draw (Raised_Curve, 56, 273, picCopy)
	Pic.Draw (Shots, 217, 432, picCopy)
	Pic.Draw (Bow, 360, 371, picCopy)
	Pic.Draw (Regen_, 362, 371, picCopy)
	Pic.Draw (Taggerung_, 182, 234, picCopy)
	Pic.Draw (Wind_Lash, 340, 264, picCopy)
	Pic.Draw (White_Tundra, 418, 206, picCopy)
	Pic.Draw (Burning_Metal, 417, 370, picCopy)
	Pic.Draw (Jet_Stream, 216, 139, picCopy)
	Pic.Draw (Zenos_Sword, 95, 122, picCopy)
	Pic.Draw (Eve, 305, 371, picCopy)
	Pic.Draw (HeartEndo, 75, 179, picCopy)
	Pic.Draw (OppedShield, 287, 198, picCopy)
	Pic.Draw (Shadow, 356, 199, picCopy)
	Pic.Draw (Sniper, 165, 301, picCopy)
	Pic.Draw (StingingBow, 122, 235, picCopy)
	Pic.Draw (SuperScription, 311, 142, picCopy)
	Pic.Draw (TunshShot, 133, 179, picCopy)
	Pic.Draw (QuadShot, 266, 264, picCopy)
	Draw.FillBox (584, 157, 674, 173, 16)
	Draw.FillBox (614, 140, 674, 185, 16)
	Draw.FillBox (546, 118, 674, 136, 16)
	Draw.FillBox (575, 174, 674, 188, 16)
	Draw.FillBox (528, 19, 606, 41, 0)
	Draw.FillBox (599, 408, 691, 440, 0)
	DisplayPoints := realstr (Added, 4)
	Font.Draw (DisplayPoints + "", 530, 22, intfont2, 16)
	DisplaySpeed := realstr ((Speed - PreviousSpeed) + AddedSpeed, 4)
	Font.Draw (DisplaySpeed + "", 576, 178, intfont2, 0)
	DisplayDamage := realstr ((Damage - PreviousDamage * 3) + (AddedDamage * 3), 4)
	Font.Draw (DisplayDamage + "", 591, 161, intfont2, 0)
	DisplayIntelligence := realstr ((Intelligence - PreviousIntelligence * 5) + (AddedIntelligence * 5), 4)
	Font.Draw (DisplayIntelligence + "", 620, 144, intfont2, 0)
	DisplayHp := realstr ((Hp - PreviousHp * 50) + (AddedHp * 50), 4)
	Font.Draw (DisplayHp + "", 552, 123, intfont2, 0)
	DisplayMoney := realstr (Money, 6)
	Font.Draw (DisplayMoney + "", 610, 420, intfont2, 39)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 107 and rangeX <= 142) and (rangeY >= 432 and rangeY <= 467) then
		Draw.Box (107, 432, 142, 467, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 9g)", 16, 70, intfont2, 0)
		    Font.Draw ("A basic, mana adding attack.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 59 and rangeX <= 94) and (rangeY >= 372 and rangeY <= 407) then
		Draw.Box (58, 371, 94, 407, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 16)Double Slash. Hits twice of Side-Cut.", 16, 70, intfont2, 0)
		    Font.Draw ("Skill level only adds number of Side-Cuts.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 129 and rangeX <= 164) and (rangeY >= 372 and rangeY <= 407) then
		Draw.Box (129, 373, 164, 407, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 13)BloodShot. Targets the arteries of the target.", 16, 70, intfont2, 0)
		    Font.Draw ("(Damage increases with speed and skill level.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 333 and rangeX <= 368) and (rangeY >= 434 and rangeY <= 469) then
		Draw.Box (333, 434, 368, 469, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 10) Mana Shot, fires a large blue vapour to burn the target.", 16, 70, intfont2, 0)
		    Font.Draw ("First Magic skill. Does more damage with level.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 214 and rangeX <= 249) and (rangeY >= 349 and rangeY <= 384) then
		Draw.Box (214, 349, 249, 384, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 23) SpeedSlice. Strikes so fast, the target cannot react.", 16, 70, intfont2, 0)
		    Font.Draw ("Damage increases with level and speed.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 417 and rangeX <= 452) and (rangeY >= 281 and rangeY <= 317) then
		Draw.Box (417, 281, 452, 317, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 40)Star Shot. Burns the target three times, dealing 90% each.", 16, 70, intfont2, 0)
		    Font.Draw ("Burning increases with Int and Skill Level.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 217 and rangeX <= 252) and (rangeY >= 432 and rangeY <= 468) then
		Draw.Box (217, 432, 252, 468, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 11) Shots. Fires bullets on targets, dealing 50% - 250% damage", 16, 70, intfont2, 0)
		    Font.Draw ("Damage increases with Speed and Skill Level.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 266 and rangeX <= 301) and (rangeY >= 264 and rangeY <= 299) then
		Draw.Box (266, 264, 301, 299, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 100) Quad Shot, designed for gunners and archers.", 16, 70, intfont2, 0)
		    Font.Draw ("Shoots an array of projectiles, launching massive aerial damage.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 56 and rangeX <= 91) and (rangeY >= 273 and rangeY <= 308) then
		Draw.Box (56, 273, 91, 308, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 50) Raised Curve. Glints down ice and rains blows on the enemy.", 16, 70, intfont2, 0)
		    Font.Draw ("Slashes from above. Damage increases with Strength.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 356 and rangeX <= 391) and (rangeY >= 199 and rangeY <= 234) then
		Draw.Box (356, 199, 391, 234, 11)
		if Turok = 0 then
		    Font.Draw (" (Cost 94) Summon. Summon a shadow minion.", 16, 70, intfont2, 0)
		    Font.Draw ("Summons an aid with Int and Speed. Level increases with Skill Level.", 16, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 287 and rangeX <= 322) and (rangeY >= 198 and rangeY <= 233) then
		Draw.Box (287, 198, 322, 233, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost)Opped Shield. Conjures a magic shield to protect the user.", 16, 70, intfont2, 0)
		    Font.Draw ("Uses Mana and Int to protect the user. Hp increases with skill level.", 16, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 165 and rangeX <= 200) and (rangeY >= 301 and rangeY <= 336) then
		Draw.Box (165, 301, 200, 336, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 118) Sniper. May cause headshots.", 16, 70, intfont2, 0)
		    Font.Draw ("Shoots 1 - 2 arrows at varying speeds towards the target.", 16, 50, intfont2, 0)
		    Font.Draw (" Affected by level, class and speed.", 16, 30, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 340 and rangeX <= 375) and (rangeY >= 264 and rangeY <= 299) then
		Draw.Box (340, 264, 375, 299, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 65) Heals yourself hp", 16, 70, intfont2, 0)
		    Font.Draw (" Brings wind blades to soothe your lungs. Healing depends on Level and Skill level.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 362 and rangeX <= 397) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (362, 371, 397, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 29) Regen. Regenerates mana.", 16, 70, intfont2, 0)
		    Font.Draw (" Mana regenerated is affected by skill level and Int.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 417 and rangeX <= 452) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (417, 371, 452, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 35) Burning Metal. Hurls spontaneous shards of titanium towards the foes.", 16, 70, intfont2, 0)
		    Font.Draw (" More Skill Level and Int affects amount of shards.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 75 and rangeX <= 110) and (rangeY >= 179 and rangeY <= 214) then
		Draw.Box (75, 179, 110, 214, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 51) Heart Endo. Crushes the soul with a stab to the heart.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases chance to pierce the heart.", 17, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 311 and rangeX <= 346) and (rangeY >= 142 and rangeY <= 177) then
		Draw.Box (311, 142, 346, 177, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 145) Super Scription. Unleash a torrent of light to pierce enemies at random.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases arrows shot.", 17, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 133 and rangeX <= 168) and (rangeY >= 179 and rangeY <= 214) then
		Draw.Box (133, 179, 168, 214, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 56) Tunsh Shot. Shoots a shotgun shell that explodes upon impact.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases damage and spread.", 17, 50, intfont2, 0)

		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 305 and rangeX <= 340) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (305, 371, 340, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 44) Eve. Summons the evening Moon to reflect light.", 17, 70, intfont2, 0)
		    Font.Draw (" Increases next attack by 500%.", 17, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 122 and rangeX <= 157) and (rangeY >= 235 and rangeY <= 270) then
		Draw.Box (122, 235, 157, 270, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 63) Stinging bow. Slaps the bow across the cheek.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases chance of a debuff.", 17, 50, intfont2, 0)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 526 and rangeX <= 608) and (rangeY >= 68 and rangeY <= 94) then
		Draw.Box (526, 68, 608, 94, 16)
		% Reset button
		Boole := true
		Hoole := false
	    else
	    end if

	    if (rangeX >= 418 and rangeX <= 453) and (rangeY >= 206 and rangeY <= 241) then
		Draw.Box (418, 206, 453, 241, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 75) White Tundra. Sends a forthcoming northern Blizzard to deal with the enemy.", 16, 70, intfont2, 0)
		    Font.Draw ("Freezes the enemy, and deals damage to scale with Int.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 182 and rangeX <= 217) and (rangeY >= 234 and rangeY <= 269) then
		Draw.Box (182, 234, 217, 269, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 90) Unleashes the fury of the Taggerung.", 16, 70, intfont2, 0)
		    Font.Draw ("More Speed allows more ferocious attacks.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 95 and rangeX <= 130) and (rangeY >= 122 and rangeY <= 157) then
		Draw.Box (95, 122, 130, 157, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 110) Zeno's Sword. A chrome plated sword once wielded by the mighty Zeno.", 16, 70, intfont2, 0)
		    Font.Draw ("Cuts at the throat, stealing their life and soul.", 16, 50, intfont2, 0)
		    Turok := 1
		    Boole := true
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if

	    if (rangeX >= 705 and rangeX <= 723) and (rangeY >= 83 and rangeY <= 93) then
		Draw.Box (705, 83, 723, 93, 11)
		% Speed attr
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 705 and rangeX <= 723) and (rangeY >= 62 and rangeY <= 72) then
		Draw.Box (705, 62, 723, 72, 11)
		% Damage attr
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 705 and rangeX <= 723) and (rangeY >= 39 and rangeY <= 49) then
		Draw.Box (705, 39, 723, 49, 11)
		% Int attr
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 705 and rangeX <= 723) and (rangeY >= 17 and rangeY <= 28) then
		Draw.Box (705, 17, 723, 28, 11)
		% Res attr
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 216 and rangeX <= 251) and (rangeY >= 139 and rangeY <= 174) then
		Draw.Box (216, 139, 251, 174, 11)
		if Turok = 0 then
		    Font.Draw ("(160) Summons a Mighty Polar wind to sweep the Earth with gusts.", 16, 70, intfont2, 0)
		    Font.Draw ("Deals almost none to massive damage. Can kill almost any foe.", 16, 50, intfont2, 0)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    if (rangeX >= 701 and rangeX <= 730) and (rangeY >= 448 and rangeY <= 478) then
		Draw.Box (701, 448, 730, 478, 11)
		% Exit
		Boole := true
		Hoole := false
	    else
	    end if
	    % Clicking
	    Mouse.Where (rangeX, rangeY, button)
	    if (rangeX >= 705 and rangeX <= 724) and (rangeY >= 83 and rangeY <= 94) and button = 1 then
		Added -= 1
		if Added >= 0 then
		    AddedSpeed += 1
		else
		    Added := 0
		end if
		delay (100)
	    elsif (rangeX >= 705 and rangeX <= 724) and (rangeY >= 62 and rangeY <= 73) and button = 1 then
		Added -= 1
		if Added >= 0 then
		    AddedDamage += 1
		else
		    Added := 0
		end if
		delay (100)
	    elsif (rangeX >= 705 and rangeX <= 724) and (rangeY >= 39 and rangeY <= 50) and button = 1 then
		Added -= 1
		if Added >= 0 then
		    AddedIntelligence += 1
		else
		    Added := 0
		end if
		delay (100)
	    elsif (rangeX >= 705 and rangeX <= 724) and (rangeY >= 17 and rangeY <= 29) and button = 1 then
		Added -= 1
		if Added >= 0 then
		    AddedHp += 1
		else
		    Added := 0
		end if
		delay (100)
	    elsif (rangeX >= 526 and rangeX <= 608) and (rangeY >= 68 and rangeY <= 94) and button = 1 then
		Money -= 50
		if Money >= 0 then
		    AddedSpeed := 0
		    AddedDamage := 0
		    AddedIntelligence := 0
		    AddedHp := 0
		    Added := PreviousSpeed + PreviousDamage + PreviousIntelligence + PreviousHp
		else
		    Money += 50
		end if
		delay (1000)
	    elsif (rangeX >= 107 and rangeX <= 142) and (rangeY >= 432 and rangeY <= 467) and button = 1 then
		Skill_Level_SideCut := Skill_Level_SideCut + 1
		Money := Money - 9
		if Skill_Level_SideCut >= 6 then
		    Skill_Level_SideCut := Skill_Level_SideCut - 1
		    Money := Money + 9
		    put "Skill maxxed."
		elsif Money < 0 then
		    Skill_Level_SideCut := Skill_Level_SideCut - 1
		    Money := Money + 9
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 107, 432, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 59 and rangeX <= 94) and (rangeY >= 372 and rangeY <= 407) and button = 1 then
		Skill_Level_DoubleSlash := Skill_Level_DoubleSlash + 1
		Money := Money - 16
		if Skill_Level_DoubleSlash >= 6 then
		    Skill_Level_DoubleSlash := Skill_Level_DoubleSlash - 1
		    Money := Money + 26
		    put "Skill maxxed."
		elsif Money < 0 then
		    Skill_Level_DoubleSlash := Skill_Level_DoubleSlash - 1
		    Money := Money + 16
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 59, 372, picXor)
		    delay (500)
		    exit
		end if
	    elsif (rangeX >= 129 and rangeX <= 164) and (rangeY >= 372 and rangeY <= 407) and button = 1 then
		Skill_Level_BloodShot := Skill_Level_BloodShot + 1
		Money := Money - 13
		if Skill_Level_BloodShot >= 6 then
		    Skill_Level_BloodShot := Skill_Level_BloodShot - 1
		    Money := Money + 13
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_BloodShot := Skill_Level_BloodShot - 1
		    Money := Money + 13
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 129, 372, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 333 and rangeX <= 368) and (rangeY >= 434 and rangeY <= 469) and button = 1 then
		Skill_Level_Mana_Shot := Skill_Level_Mana_Shot + 1
		Money := Money - 10
		if Skill_Level_Mana_Shot >= 6 then
		    Skill_Level_Mana_Shot := Skill_Level_Mana_Shot - 1
		    Money := Money + 10
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_Mana_Shot := Skill_Level_Mana_Shot - 1
		    Money := Money + 10
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 333, 434, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 214 and rangeX <= 249) and (rangeY >= 349 and rangeY <= 384) and button = 1 then
		Skill_Level_SpeedSlice := Skill_Level_SpeedSlice + 1
		Money := Money - 23
		if Skill_Level_SpeedSlice >= 6 then
		    Skill_Level_SpeedSlice := Skill_Level_SpeedSlice - 1
		    Money := Money + 23
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_SpeedSlice := Skill_Level_SpeedSlice - 1
		    Money := Money + 23
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 214, 349, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 418 and rangeX <= 452) and (rangeY >= 282 and rangeY <= 317) and button = 1 then
		Skill_Level_StarShot := Skill_Level_StarShot + 1
		Money := Money - 40
		if Skill_Level_StarShot >= 6 then
		    Skill_Level_StarShot := Skill_Level_StarShot - 1
		    Money := Money + 40
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_StarShot := Skill_Level_StarShot - 1
		    Money := Money + 40
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 418, 282, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 217 and rangeX <= 252) and (rangeY >= 432 and rangeY <= 468) and button = 1 then
		Skill_Level_Shot_s := Skill_Level_Shot_s + 1
		Money := Money - 11
		if Skill_Level_Shot_s >= 6 then
		    Skill_Level_Shot_s := Skill_Level_Shot_s - 1
		    Money := Money + 11
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_Shot_s := Skill_Level_Shot_s - 1
		    Money := Money + 11
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 217, 434, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 56 and rangeX <= 91) and (rangeY >= 273 and rangeY <= 308) and button = 1 then
		Skill_Level_RaisedCurve := Skill_Level_RaisedCurve + 1
		Money := Money - 50
		if Skill_Level_RaisedCurve >= 6 then
		    Skill_Level_RaisedCurve := Skill_Level_RaisedCurve - 1
		    Money := Money + 50
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_RaisedCurve := Skill_Level_RaisedCurve - 1
		    Money := Money + 50
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 57, 273, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 360 and rangeX <= 395) and (rangeY >= 371 and rangeY <= 406) and button = 1 then
		Skill_Level_AimedArrow := Skill_Level_AimedArrow + 1
		Money := Money - 50
		if Skill_Level_AimedArrow >= 6 then
		    Skill_Level_AimedArrow := Skill_Level_AimedArrow - 1
		    Money := Money + 50
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_AimedArrow := Skill_Level_AimedArrow - 1
		    Money := Money + 50
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 360, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 340 and rangeX <= 375) and (rangeY >= 264 and rangeY <= 299) and button = 1 then
		Skill_Level_WindLash := Skill_Level_WindLash + 1
		Money := Money - 65
		if Skill_Level_WindLash >= 10 then
		    Skill_Level_WindLash := Skill_Level_WindLash - 1
		    Money := Money + 65
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_WindLash := Skill_Level_WindLash - 1
		    Money := Money + 65
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 340, 264, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 362 and rangeX <= 397) and (rangeY >= 371 and rangeY <= 406) and button = 1 then
		Skill_Level_Regen := Skill_Level_Regen + 1
		Money := Money - 29
		if Skill_Level_Regen >= 10 then
		    Skill_Level_Regen := Skill_Level_Regen - 1
		    Money := Money + 29
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_Regen := Skill_Level_Regen - 1
		    Money := Money + 29
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 362, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 370 and rangeY <= 405) and button = 1 then
		Skill_Level_BurningMetal := Skill_Level_BurningMetal + 1
		Money := Money - 35
		if Skill_Level_BurningMetal >= 6 then
		    Skill_Level_BurningMetal := Skill_Level_BurningMetal - 1
		    Money := Money + 35
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_BurningMetal := Skill_Level_BurningMetal - 1
		    Money := Money + 35
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 417, 370, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 266 and rangeX <= 293) and (rangeY >= 371 and rangeY <= 406) and button = 1 then
		Skill_Level_QuadShot += 1
		Money -= 82
		if Skill_Level_QuadShot > 7 then
		    Skill_Level_QuadShot -= 1
		    Money += 100
		    put "Skill at maximum shots. [7]."
		elsif Money < 0 then
		    Skill_Level_QuadShot -= 1
		    Money += 100
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 266, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 182 and rangeX <= 217) and (rangeY >= 234 and rangeY <= 269) and button = 1 then
		Skill_Level_Taggerung := Skill_Level_Taggerung + 1
		Money := Money - 90
		if Skill_Level_Taggerung >= 6 then
		    Skill_Level_Taggerung := Skill_Level_Taggerung - 1
		    Money := Money + 90
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_Taggerung := Skill_Level_Taggerung - 1
		    Money := Money + 90
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 182, 234, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 418 and rangeX <= 453) and (rangeY >= 206 and rangeY <= 241) and button = 1 then
		Skill_Level_WhiteTundra := Skill_Level_WhiteTundra + 1
		Money := Money - 75
		if Skill_Level_WhiteTundra >= 6 then
		    Skill_Level_WhiteTundra := Skill_Level_WhiteTundra - 1
		    Money := Money + 75
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_WhiteTundra := Skill_Level_WhiteTundra - 1
		    Money := Money + 75
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 418, 206, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 75 and rangeX <= 110) and (rangeY >= 179 and rangeY <= 214) and button = 1 then
		Skill_Level_ZenosSword := Skill_Level_ZenosSword + 1
		Money := Money - 110
		if Skill_Level_ZenosSword > 8 then
		    Skill_Level_ZenosSword := Skill_Level_ZenosSword - 1
		    Money := Money + 110
		    put "Skill maxxed"
		elsif Money < 0 then
		    Skill_Level_ZenosSword := Skill_Level_ZenosSword - 1
		    Money := Money + 110
		    put " Not enough money"
		else
		    Pic.Draw (Flash, 75, 179, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 216 and rangeX <= 251) and (rangeY >= 139 and rangeY <= 174) and button = 1 then
		Skill_Level_JetStream := Skill_Level_JetStream + 1
		Money := Money - 160
		if Skill_Level_RaisedCurve > 3 then
		    Skill_Level_JetStream := Skill_Level_JetStream - 1
		    Money := Money + 160
		    put "Skill maxxed out, at 3."
		elsif Money < 0 then
		    Skill_Level_JetStream := Skill_Level_JetStream - 1
		    Money := Money + 160
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 215, 139, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 356 and rangeX <= 391) and (rangeY >= 199 and rangeY <= 234) and button = 1 then
		Skill_Level_Shadow += 1
		Money -= 94
		if Skill_Level_Shadow > 5 then
		    Skill_Level_Shadow -= 1
		    Money += 94
		    put "Skill maxxed out, at 5."
		elsif Money < 0 then
		    Skill_Level_Shadow -= 1
		    Money += 94
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 356, 199, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 287 and rangeX <= 322) and (rangeY >= 198 and rangeY <= 233) and button = 1 then
		Skill_Level_OppedShield += 1
		Money -= 134
		if Skill_Level_OppedShield > 5 then
		    Skill_Level_OppedShield -= 1
		    Money += 134
		    put "Skill maxxed out, at 5."
		elsif Money < 0 then
		    Skill_Level_OppedShield -= 1
		    Money += 134
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 287, 198, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 165 and rangeX <= 200) and (rangeY >= 301 and rangeY <= 336) and button = 1 then
		Skill_Level_Sniper += 1
		Money -= 118
		if Skill_Level_Sniper > 5 then
		    Skill_Level_Sniper -= 1
		    Money += 118
		    put "Skill maxxed out, at 5."
		elsif Money < 0 then
		    Skill_Level_Sniper -= 1
		    Money += 118
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 165, 301, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 75 and rangeX <= 110) and (rangeY >= 179 and rangeY <= 214) and button = 1 then
		Skill_Level_HeartEndo += 1
		Money -= 82
		if Skill_Level_HeartEndo > 5 then
		    Skill_Level_HeartEndo -= 1
		    Money += 82
		    put "Skill maxxed out, at 5."
		elsif Money < 0 then
		    Skill_Level_HeartEndo -= 1
		    Money += 82
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 75, 179, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 311 and rangeX <= 346) and (rangeY >= 142 and rangeY <= 177) and button = 1 then
		Skill_Level_SuperScription += 1
		Money -= 145
		if Skill_Level_SuperScription > 5 then
		    Skill_Level_SuperScription -= 1
		    Money += 145
		    put "Skill maxxed out, at 5."
		elsif Money < 0 then
		    Skill_Level_SuperScription -= 1
		    Money += 145
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 311, 142, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 133 and rangeX <= 168) and (rangeY >= 179 and rangeY <= 214) and button = 1 then
		Skill_Level_TunshShot += 1
		Money -= 126
		if Skill_Level_TunshShot > 5 then
		    Skill_Level_TunshShot -= 1
		    Money += 126
		    put "Skill maxxed out."
		elsif Money < 0 then
		    Skill_Level_TunshShot -= 1
		    Money += 126
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 133, 179, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 305 and rangeX <= 340) and (rangeY >= 371 and rangeY <= 406) and button = 1 then
		Skill_Level_Eve += 1
		Money -= 126
		if Skill_Level_Eve > 8 then
		    Skill_Level_Eve -= 1
		    Money += 44
		    put "Skill maxxed, 7"
		elsif Money < 0 then
		    Skill_Level_Eve -= 1
		    Money += 44
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 305, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 122 and rangeX <= 157) and (rangeY >= 235 and rangeY <= 270) and button = 1 then
		Skill_Level_StingingBow += 1
		Money -= 78
		if Skill_Level_StingingBow > 8 then
		    Skill_Level_StingingBow -= 1
		    Money += 78
		    put "Skill maxxed, 7"
		elsif Money < 0 then
		    Skill_Level_StingingBow -= 1
		    Money += 78
		    put " Not enough money."
		else
		    Pic.Draw (Flash, 122, 235, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 701 and rangeX <= 730) and (rangeY >= 448 and rangeY <= 478) and button = 1 then
		Exiting := true
		exit
	    end if
	    if Boole = false and Hoole = false then
		Draw.Box (107, 432, 142, 467, 0)
		Draw.Box (58, 371, 94, 407, 0)
		Draw.Box (129, 373, 164, 407, 0)
		Draw.Box (333, 434, 368, 469, 0)
		Draw.Box (214, 349, 249, 384, 0)
		Draw.Box (218, 432, 252, 467, 0)
		Draw.Box (417, 281, 452, 317, 0)
		Draw.Box (266, 264, 301, 299, 0)
		Draw.Box (56, 273, 91, 308, 0)
		Draw.Box (340, 264, 375, 299, 0)
		Draw.Box (362, 371, 397, 406, 0)
		Draw.Box (417, 370, 452, 405, 0)
		Draw.Box (418, 206, 453, 241, 0)
		Draw.Box (182, 234, 217, 269, 0)
		Draw.Box (75, 179, 110, 214, 0)
		Draw.Box (216, 139, 251, 174, 0)
		Draw.Box (525, 68, 608, 94, 10)
		Draw.Box (705, 83, 723, 93, 0)
		Draw.Box (705, 62, 723, 72, 0)
		Draw.Box (705, 39, 723, 49, 0)
		Draw.Box (705, 17, 723, 28, 0)
		Draw.Box (701, 448, 730, 478, 0)
		Draw.Box (356, 199, 391, 234, 0)
		Draw.Box (287, 198, 322, 233, 0)
		Draw.Box (165, 301, 200, 336, 0)
		Draw.Box (75, 179, 110, 214, 0)
		Draw.Box (311, 142, 346, 177, 0)
		Draw.Box (133, 179, 168, 214, 0)
		Draw.Box (305, 371, 340, 406, 0)
		Draw.Box (122, 235, 157, 270, 0)
		Draw.FillBox (16, 15, 514, 79, 16)
		Draw.FillBox (584, 157, 674, 173, 16)
		Draw.FillBox (614, 140, 674, 185, 16)
		Draw.FillBox (546, 118, 674, 136, 16)
		Draw.FillBox (575, 174, 674, 188, 16)
		Draw.FillBox (528, 19, 606, 41, 0)
		DisplayPoints := realstr (Added, 4)
		Font.Draw (DisplayPoints + "", 530, 22, intfont2, 16)
		DisplaySpeed := realstr ((Speed - PreviousSpeed) + AddedSpeed, 4)
		Font.Draw (DisplaySpeed + "", 576, 178, intfont2, 0)
		DisplayDamage := realstr ((Damage - PreviousDamage) + AddedDamage, 4)
		Font.Draw (DisplayDamage + "", 591, 161, intfont2, 0)
		DisplayIntelligence := realstr ((Intelligence - PreviousIntelligence) + AddedIntelligence, 4)
		Font.Draw (DisplayIntelligence + "", 620, 144, intfont2, 0)
		DisplayHp := realstr ((Hp - PreviousHp) + AddedHp, 4)
		Font.Draw (DisplayHp + "", 552, 123, intfont2, 0)
		Draw.FillBox (599, 408, 691, 440, 0)
		DisplayMoney := realstr (Money, 6)
		Font.Draw (DisplayMoney + "", 610, 420, intfont2, 39)
		Hoole := true
		Turok := 0
	    else
	    end if
	    Boole := false
	end loop
	Speed := (Speed - PreviousSpeed) + AddedSpeed
	Damage := (Damage - PreviousDamage * 3) + (AddedDamage * 3)
	Intelligence := (Intelligence - PreviousIntelligence * 5) + (AddedIntelligence * 5)
	Hp := (Hp - PreviousHp * 50) + (AddedHp * 50)
	cls
	if Exiting = true then
	    exit
	else
	end if
    end loop
end Buy


% Pet

proc PetFight
    PetsChoice := Rand.Int (1, 8)
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    if PetsChoice = 1 then
	Attacked := NiceDamage + Rand.Int (50, 200)
	EnemyHp := EnemyHp - Attacked
	locatexy (10, 560)
	put "EEiiii.... Damage Dealt: ", Attacked
    elsif PetsChoice = 2 then
	Attacked := NiceDamage + NiceSpeed + NiceIntelligence
	EnemyHp := EnemyHp - Attacked
    elsif PetsChoice = 3 then
	Attacked := NiceIntelligence * Rand.Int (1, 10)
	Hp := Hp + Attacked
	locatexy (10, 560)
	put "Hushhhshhs.... Healed: ", Attacked
    elsif PetsChoice = 4 then
	Attacked := NiceDamage * 1.6
	EnemyHp := EnemyHp - Attacked
	locatexy (10, 560)
	put "Raa raaa    Damage Dealt: ", Attacked
    elsif PetsChoice = 5 then
	Attacked := NiceDamage / 100 * Rand.Int (80, 150)
	EnemyHp := EnemyHp - Attacked
	locatexy (10, 560)
	put "Moi .. moi .. Damage Dealt: ", Attacked
    elsif PetsChoice = 6 then
	Attacked := NiceDamage / 100 * Rand.Int (10, 500)
	EnemyHp := EnemyHp - Attacked
	locatexy (10, 560)
	put "Eiinya!   Damage Dealt: ", Attacked
    elsif PetsChoice = 7 then
	Attacked := NiceDamage * 2
	EnemyHp := EnemyHp - Attacked
	locatexy (10, 560)
	put "Miiuu.. 2 .. Damage Dealt: ", Attacked
    else
	Attacked := NiceDamage + NiceIntelligence
	Hp := Hp + Attacked
	locatexy (10, 560)
	put "-Jirch- Healed: ", Attacked
    end if
end PetFight
% Skills [SKILL2]
proc SideCut
    Attacked := (Skill_Level_SideCut * 0.10 + 1) * Damage / 100 * Rand.Int (95, 105)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := -20
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
    end if
    SideCut_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Hyaa!! Damage dealt: ", Attacked
    Turn := Turn - 1
end SideCut
proc AimedArrow
    if Style = "Ranged" then
	Attacked := (Skill_Level_AimedArrow * 0.16 + 1) * Damage / 100 * Rand.Int (100, 500) + Speed
    else
	Attacked := (Skill_Level_AimedArrow * 0.16 + 1) * Damage / 100 * Rand.Int (100, 150) + Speed
    end if
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := -20
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    AimedArrow_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " You cannot hide from the Brynhilder. Damage Dealt: ", Attacked
    Turn := Turn - 1
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 290, intfont, 50)
end AimedArrow
proc BloodShot
    if Style = "Gunner" then
	Attacked := ((Skill_Level_BloodShot * 0.18 + 1) * Damage / 100 * Rand.Int (87, 135) + (Speed - EnemyIntelligence)) * 6
    else
	Attacked := ((Skill_Level_BloodShot * 0.18 + 1) * Damage / 100 * Rand.Int (87, 135) + (Speed - EnemyIntelligence)) * 2
    end if
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 15
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    BloodShot_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Stay still, please. Damage dealt: ", Attacked
    Turn := Turn - 1
end BloodShot
proc DoubleSlash
    var EnemyCoop : real
    EnemyCoop := EnemyHp
    if Skill_Level_DoubleSlash = 1 then
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 2 then
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 3 then
	SideCut
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 4 then
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 5 then
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
    end if
    Mana := Mana + ManaRegen
    Mana := Mana - 54
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked * Skill_Level_DoubleSlash
	Mana += Manacost
    end if
    DoubleSlash_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Nort - Tun - Chea! Damage dealt: ", EnemyCoop - EnemyHp
    Turn := Turn - 1
end DoubleSlash
proc Mana_Shot
    Attacked := (Skill_Level_Mana_Shot * 0.2 + 1) * Damage + Intelligence + Rand.Int (80, 135) + (Mana / 10)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 99
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    ManaShot_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Ripple forth, ye cursed dirge! Damage dealt: ", Attacked
    Turn := Turn - 1
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 290, intfont, 54)
end Mana_Shot
proc SpeedSlice
    Attacked := (Skill_Level_SpeedSlice * 0.25 + 1) * Damage + Rand.Int (50, 80) + (Speed * Skill_Level_SpeedSlice)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 28
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    SpeedSlice_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " May the heavens blow you asunder.. Damage dealt: ", Attacked
    Turn := Turn - 1
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 290, intfont, 80)
end SpeedSlice
proc StarShot
    Attacked := (Skill_Level_StarShot * 0.23 + 1) + Damage / 100 * Rand.Int (90, 115) + Intelligence * Skill_Level_StarShot
    EnemyHp := EnemyHp - Attacked
    EnemyHp := EnemyHp - Attacked
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 100
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    StarShot_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Mhurkinfa..heruikine! Damage dealt: ", Attacked, " + ", Attacked, " + ", Attacked
    Turn := Turn - 1
end StarShot
proc RaisedCurve
    Attacked := (Skill_Level_RaisedCurve * 0.5 + 1) + Damage / 100 * Rand.Int (50, 250) + Speed * Skill_Level_RaisedCurve
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 45
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " I'll tickle your throat, you ass-faced demon! Damage dealt: ", Attacked
    Turn := Turn - 1
end RaisedCurve
proc Shot_s
    Attacked := (Skill_Level_Shot_s * 0.07 + 1) + Damage / 100 * Rand.Int (50, 250)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := -13
    Mana := Mana - Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    Shots_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Rraaa ! Damage dealt: ", Attacked
    Turn := Turn - 1
end Shot_s
proc WindLash
    Attacked := (Skill_Level_WindLash * 0.25 + 1) * Level * Rand.Int (90, 110) + (THp * 0.1)
    Hp := Hp + Attacked
    Mana := Mana + ManaRegen
    Manacost := 38
    Mana -= Manacost
    if Mana < 0 then
	Hp := Hp - Attacked
	Mana += Manacost
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Wounds, revile! Amount healed: ", Attacked
    Turn := Turn - 1
end WindLash
proc BurningMetal
    Attacked := (Skill_Level_BurningMetal * 0.14 + 2) + Damage / 100 * Rand.Int (100, 150)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 59
    Mana -= Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	Mana += Manacost
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Can you notwithstand the pain? Damage dealt: ", Attacked
    Turn := Turn - 1
end BurningMetal
proc Regen
    Attacked := Skill_Level_Regen + Rand.Int (10, 18) + Speed
    Mana := Mana + Attacked
    Mana := Mana + ManaRegen
    Manacost := 25
    if Mana - Attacked - ManaRegen < 25 then
	Mana := Mana - Attacked - ManaRegen
    end if
    Regen_Animation
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " You won't surpass these walls. Mana Raised: ", Attacked
    Turn := Turn - 1
end Regen
proc Sniper_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Sleep. Sleep forever. Damage dealt: ", Attacked
end Sniper_
proc TunshShot_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Die Libelle. Damage dealt: ", Attacked
end TunshShot_
proc StingingBow_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Humph. So you think you can run away from my discipline? Damage dealt: ", Attacked
end StingingBow_
proc HeartEndo_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Drag my sword across your heart, cross! Damage dealt: ", Attacked
end HeartEndo_
proc QuadShot_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " -Hssk hhsk hssk hskks- Damage dealt: ", Attacked
end QuadShot_
proc OppedShield_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Summon- Opped Shield! Shielding provided: ", Attacked
end OppedShield_
proc Shadow_
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Welcome, my shadow. Shadow's Level: ", Attacked
end Shadow_
proc SuperScription_
end SuperScription_
proc ZenosSword
    Attacked := (Skill_Level_ZenosSword * 0.3 + 2.4) * Rand.Int (90, 121) + (Speed * Skill_Level_ZenosSword)
    EnemyHp -= Attacked
    Mana += ManaRegen
    EnemyTHp -= (EnemyTHp * 0.2)
    Hp += (Hp * 0.3)
    Manacost := 245
    Mana -= Manacost
    if Mana < 0 then
	EnemyHp := EnemyHp + Attacked
	EnemyTHp := EnemyTHp + (EnemyTHp * 0.2)
	Hp := Hp - (Hp * 0.3)
	Mana += Manacost
    end if
    EnemyMana := EnemyMana - (50 + Rand.Int (30, 70))
    Turn := Turn - 1
end ZenosSword
proc WhiteTundra
    Attacked := (Skill_Level_WhiteTundra * 0.43 + 1.57) * Damage * 0.73 / 100 * Rand.Int (70, 160) + Intelligence
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 160
    Mana -= Manacost
    EnemyTurn := EnemyTurn - 3
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " I will shred your spine apart! Curse wither! (Freeze) Damage dealt: ", Attacked
    Turn := Turn - 1
end WhiteTundra
proc Taggerung
    Attacked := (Skill_Level_Taggerung * 0.7 + 3.13) * Damage / 100 * Rand.Int (50, 115) + Speed * Skill_Level_Taggerung
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 210
    Mana -= Manacost
    EnemyTurn -= 1
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Dayna says no. Damage dealt: ", Attacked
    Turn := Turn - 1
end Taggerung
proc JetStream
    Attacked := (Skill_Level_JetStream * 0.62 + 1.9) * Damage * 1.7 / 100 * Rand.Int (1, 999)
    EnemyHp := EnemyHp - Attacked
    Mana := Mana + ManaRegen
    Manacost := 140
    Hp := Hp + 270
    Mana -= Manacost
    if Mana < 0 then
	EnemyHp += Attacked
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    put " Come to me, my Einherjars.. Damage dealt: ", Attacked
    Turn := Turn - 1
end JetStream

% Buttons & Futtons [FUTTON1]

proc Skill_Screen
    loop
	%var button : int := GUI.CreateButton (200, 50, 0, "Exit", ButtonExit) For reference
	%var button2 : int := GUI.CreateButton (400, 50, 0, "Rebuy Stuff", ButtonRebuyMyunert)
	var Skill_Side_Cut_button : real := GUI.CreateButton (22, 35, 0, " ", SideCut)
	var Skill_DoubleSlash_button : real := GUI.CreateButton (211, 40, 0, " ", DoubleSlash)
	var Skill_BloodShot_button : real := GUI.CreateButton (171, 40, 0, " ", BloodShot)
	var Skill_Mana_Shot_button : real := GUI.CreateButton (171, 83, 0, " ", Mana_Shot)
	var Skill_SpeedSlice_button : real := GUI.CreateButton (211, 83, 0, " ", SpeedSlice)
	var Skill_StarShot_button : real := GUI.CreateButton (249, 40, 0, " ", StarShot)
	var Skill_RaisedCurve_button : real := GUI.CreateButton (247, 83, 0, " ", RaisedCurve)
	var Skill_Shot_s_button : real := GUI.CreateButton (287, 40, 0, " ", Shot_s)
	Pic.Draw (Side_Cut, 20, 30, picXor)
	Pic.Draw (Blood_Shot, 169, 35, picXor)
	Pic.Draw (ManaShot, 169, 77, picXor)
	Pic.Draw (Double_Slash, 209, 35, picXor)
	Pic.Draw (Speed_Slice, 209, 77, picXor)
	Pic.Draw (Star_Shot, 247, 35, picXor)
	Pic.Draw (Raised_Curve, 245, 77, picXor)
	Pic.Draw (Shots, 285, 35, picXor)
	exit when GUI.ProcessEvent
    end loop
end Skill_Screen

proc ScreenSet
    Pic.Draw (FightingSkill, 0, 0, picXor)
    Pic.Draw (Side_Cut, 306, 492, picCopy)
    Pic.Draw (Shots, 343, 492, picCopy)
    Pic.Draw (ManaShot, 380, 492, picCopy)
    Pic.Draw (Double_Slash, 417, 492, picCopy)
    Pic.Draw (Bow, 454, 492, picCopy)
    Pic.Draw (Blood_Shot, 491, 492, picCopy)
    Pic.Draw (Speed_Slice, 528, 492, picCopy)
    Pic.Draw (Regen_, 565, 492, picCopy)
    Pic.Draw (Star_Shot, 602, 492, picCopy)
    Pic.Draw (Raised_Curve, 639, 492, picCopy)
    Pic.Draw (Taggerung_, 676, 492, picCopy)
    Pic.Draw (Wind_Lash, 713, 492, picCopy)
    Pic.Draw (Burning_Metal, 306, 455, picCopy)
    Pic.Draw (White_Tundra, 343, 455, picCopy)
    Pic.Draw (Sniper, 380, 455, picCopy)
    Pic.Draw (TunshShot, 417, 455, picCopy)
    Pic.Draw (StingingBow, 454, 455, picCopy)
    Pic.Draw (HeartEndo, 491, 455, picCopy)
    Pic.Draw (QuadShot, 528, 455, picCopy)
    Pic.Draw (OppedShield, 565, 455, picCopy)
    Pic.Draw (Shadow, 602, 455, picCopy)
    Pic.Draw (SuperScription, 639, 455, picCopy)
    Pic.Draw (Zenos_Sword, 676, 455, picCopy)
    Pic.Draw (Jet_Stream, 713, 455, picCopy)
end ScreenSet
proc Futton
    Boole := true
    ScreenSet
    loop
	mousewhere (rangeX, rangeY, button)
	if (rangeX >= 306 and rangeX <= 341) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (306, 492, 341, 526, 37)
	    Boole := false
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (343, 492, 378, 526, 37)
	    Boole := false
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (380, 492, 415, 526, 37)
	    Boole := false
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (417, 492, 452, 526, 37)
	    Boole := false
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (454, 492, 489, 526, 37)
	    Boole := false
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (491, 492, 526, 526, 37)
	    Boole := false
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (528, 492, 563, 526, 37)
	    Boole := false
	elsif (rangeX >= 306 and rangeX <= 341) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (306, 455, 341, 489, 37)
	    Boole := false
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (565, 492, 600, 526, 37)
	    Boole := false
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (602, 492, 637, 526, 37)
	    Boole := false
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (639, 492, 674, 526, 37)
	    Boole := false
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (676, 492, 711, 526, 37)
	    Boole := false
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (713, 492, 748, 526, 37)
	    Boole := false
	elsif (rangeX >= 306 and rangeX <= 341) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (306, 455, 341, 489, 37)
	    Boole := false
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (343, 455, 378, 489, 37)
	    Boole := false
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (380, 455, 415, 489, 37)
	    Boole := false
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (417, 455, 452, 489, 37)
	    Boole := false
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (454, 455, 489, 489, 37)
	    Boole := false
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (491, 455, 489, 489, 37)
	    Boole := false
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (528, 455, 563, 489, 37)
	    Boole := false
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (565, 455, 600, 489, 37)
	    Boole := false
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (602, 455, 637, 489, 37)
	    Boole := false
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (639, 455, 674, 489, 37)
	    Boole := false
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (676, 455, 711, 489, 37)
	    Boole := false
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (713, 455, 748, 489, 37)
	    Boole := false
	else
	end if
	% Clicking
	if (rangeX >= 306 and rangeX <= 341) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    SideCut
	    exit
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    Shot_s
	    exit
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    Mana_Shot
	    exit
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    DoubleSlash
	    exit
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    AimedArrow
	    exit
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    BloodShot
	    exit
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    SpeedSlice
	    exit
	elsif (rangeX >= 306 and rangeX <= 341) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    BurningMetal
	    exit
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    Regen
	    exit
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    StarShot
	    exit
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    RaisedCurve
	    exit
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    Taggerung
	    exit
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 492 and rangeY <= 526) and button = 1 then
	    ZenosSword
	    exit
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    WhiteTundra
	    exit
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    Sniper_
	    exit
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    TunshShot_
	    exit
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    StingingBow_
	    exit
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    HeartEndo_
	    exit
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    QuadShot_
	    exit
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    OppedShield_
	    exit
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    Shadow_
	    exit
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    SuperScription_
	    exit
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    WindLash
	    exit
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 455 and rangeY <= 489) and button = 1 then
	    JetStream
	    exit
	    /* elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     Opped Shield
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     Shadow
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     TimeConversion
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     DimensionalFlip
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     Headshot
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     Spray
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     FlyingPoison
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     Swiftuppercut
	     elsif (rangeX >= 400 and rangeX <= 450) and (rangeY >= 50 and rangeY <= 100) and button = 1 then
	     TheDivide
	     */
	else
	end if
	if Boole = true then
	    Draw.Box (306, 492, 341, 526, 51)
	    Draw.Box (343, 492, 378, 526, 51)
	    Draw.Box (380, 492, 415, 526, 51)
	    Draw.Box (417, 492, 452, 526, 51)
	    Draw.Box (454, 492, 489, 526, 51)
	    Draw.Box (491, 492, 526, 526, 51)
	    Draw.Box (528, 492, 563, 526, 51)
	    Draw.Box (306, 455, 341, 489, 51)
	    Draw.Box (565, 492, 600, 526, 51)
	    Draw.Box (602, 492, 637, 526, 51)
	    Draw.Box (639, 492, 674, 526, 51)
	    Draw.Box (676, 492, 711, 526, 51)
	    Draw.Box (713, 492, 748, 526, 51)
	    Draw.Box (343, 455, 378, 489, 51)
	    Draw.Box (676, 455, 711, 489, 51)
	    Draw.Box (713, 455, 748, 489, 51)
	else
	end if
	Boole := true
    end loop
end Futton

proc stats (ATRICK : real)
    if Style = "Melee" then
	Hp := Hp + 1100 + (ATRICK * 10)
	Intelligence := Intelligence + 25
	Speed := Speed + 8
	THp := THp + 1100 + (ATRICK * 10)
	TMana := TMana + 30
	Mana := Mana + 12
	Damage := Damage + 23
    elsif Style = "Ranged" then
	Hp := Hp + 1000
	Intelligence := Intelligence + 64
	Speed := Speed + 14 + ATRICK
	THp := THp + 1003
	TMana := TMana + 40 + ATRICK
	Mana := Mana + 35 + ATRICK
	Damage := Damage + 29
    elsif Style = "Magic" then
	Hp := Hp + 840
	Intelligence := Intelligence + 88
	Speed := Speed + 14
	THp := THp + 850
	TMana := TMana + 80 + (ATRICK * 10)
	Mana := Mana + 42 + (ATRICK * 10)
	Damage := Damage + 25
    elsif Style = "Gunner" then
	Hp := Hp + 940
	Intelligence := Intelligence + 41
	Speed := Speed + 20
	THp := THp + 955
	TMana := TMana + 50
	Mana := Mana + 41
	Damage := Damage + 35 + (ATRICK * 1.5)
    end if
end stats
proc level         %[LEVEL1]
    if Experience >= 10000 and LevelArray (15) = 0 then
	Level := 15
	stats (Damage div 100)
	stats (215)
	stats (Intelligence div 10 * 1.5)
	ManaRegen := TMana * 0.05
	LevelArray (15) := 1
	Added += 30
    elsif Experience >= 8000 and LevelArray (14) = 0 then
	Level := 14
	stats (105)
	ManaRegen := TMana * 0.05
	LevelArray (14) := 1
	Added += 10
    elsif Experience >= 6300 and LevelArray (13) = 0 then
	Level := 13
	stats (90)
	ManaRegen := TMana * 0.05
	LevelArray (13) := 1
	Added += 10
    elsif Experience >= 5000 and LevelArray (12) = 0 then
	Level := 12
	stats (75)
	ManaRegen := TMana * 0.05
	LevelArray (12) := 1
	Added += 10
    elsif Experience >= 4000 and LevelArray (11) = 0 then
	Level := 11
	stats (56)
	ManaRegen := TMana * 0.05
	LevelArray (11) := 1
	Added += 10
    elsif Experience >= 3100 and LevelArray (10) = 0 then
	Level := 10
	stats (45)
	ManaRegen := TMana * 0.05
	LevelArray (10) := 1
	Added += 20
    elsif Experience >= 2500 and LevelArray (9) = 0 then
	Level := 9
	stats (34)
	ManaRegen := TMana * 0.05
	LevelArray (9) := 1
	Added += 10
    elsif Experience >= 1735 and LevelArray (8) = 0 then
	Level := 8
	stats (30)
	ManaRegen := TMana * 0.05
	LevelArray (8) := 1
	Added += 10
    elsif Experience >= 1280 and LevelArray (7) = 0 then
	Level := 7
	stats (36)
	ManaRegen := TMana * 0.05
	LevelArray (7) := 1
	Added += 10
    elsif Experience >= 860 and LevelArray (6) = 0 then
	Level := 6
	stats (25)
	ManaRegen := TMana * 0.05
	LevelArray (6) := 1
	Added += 10
    elsif Experience >= 550 and LevelArray (5) = 0 then
	Level := 5
	stats (20)
	ManaRegen := TMana * 0.05
	LevelArray (5) := 1
	Added += 15
    elsif Experience >= 350 and LevelArray (4) = 0 then
	Level := 4
	stats (15)
	ManaRegen := TMana * 0.05
	LevelArray (4) := 1
	Added += 10
    elsif Experience >= 200 and LevelArray (3) = 0 then
	Level := 3
	stats (10)
	ManaRegen := TMana * 0.05
	LevelArray (3) := 1
	Added += 10
    elsif Experience >= 100 and LevelArray (2) = 0 then
	Level := 2
	stats (5)
	ManaRegen := TMana * 0.05
	LevelArray (2) := 1
	Added += 10
    else
	Level := 1
    end if
end level

% Procedures..

proc Congratulations
    cls
    Pic.Draw (Congratulation, 0, 0, picXor)
end Congratulations

proc Failed
    Draw.FillBox (0, 0, maxx, maxy, red)
    put " You died.."
    put " Game over."
    getch (waitkey)
    put " If you want to redo it... pay 50g"
    getch (waitkey)
    Money := Money - 50
end Failed

proc EnemyHpbar (EnemyHp, EnemyTHp : real)
    derpy := EnemyHp * 100 div EnemyTHp + 500
    Draw.FillBox (500, 30, derpy, 40, 12)
    Draw.Line (500, 29, 600, 29, 57)
    Draw.Line (500, 41, 600, 41, 57)
    Draw.Line (500, 29, 500, 41, 57)
    Draw.Line (600, 29, 600, 41, 57)
    locatexy (505, 60)
    put "Health :", EnemyHp, " / ", EnemyTHp
end EnemyHpbar

proc Manabar (Mana, TMana : real)
    Draw.FillBox (50, 16, 150, 22, 0)
    Mbar := Mana * 100 div TMana + 50
    Draw.FillBox (50, 16, Mbar, 22, 53)
    Draw.Line (50, 15, 150, 15, 9)
    Draw.Line (50, 23, 150, 23, 9)
    Draw.Line (50, 15, 50, 23, 9)
    Draw.Line (150, 15, 150, 23, 9)
    locatexy (170, 20)
    put "Mp: ", Mana, " / ", TMana
end Manabar

proc NiceManabar (NiceMana, NiceTMana : real)
    Draw.FillBox (50, 63, 150, 69, 0)
    Mbar := NiceMana * 100 div NiceTMana + 50
    Draw.FillBox (50, 63, Mbar, 69, 53)
    Draw.Line (50, 62, 150, 62, 16)
    Draw.Line (50, 70, 150, 70, 16)
    Draw.Line (50, 62, 50, 70, 16)
    Draw.Line (150, 62, 150, 70, 16)
    locatexy (170, 65)
    put "Mp: ", NiceMana, " / ", NiceTMana
end NiceManabar

proc Hpbar (Hp, THp : real)
    Draw.FillBox (50, 30, 150, 40, 0)
    MAX
    edge := Hp * 100 div THp + 50
    Draw.FillBox (50, 30, edge, 40, 13)
    Draw.Line (50, 29, 150, 29, 16)
    Draw.Line (50, 41, 150, 41, 16)
    Draw.Line (50, 29, 50, 41, 16)
    Draw.Line (150, 29, 150, 41, 16)
    locatexy (170, 40)
    put "Hp: ", Hp, " / ", THp
end Hpbar

proc NiceHpbar (NiceHp, NiceTHp : real)
    var Flung : int
    Draw.FillBox (50, 77, 150, 87, 0)
    NICEMAX
    Flung := NiceHp * 100 div NiceTHp + 50
    Draw.FillBox (50, 77, Flung, 87, 48)
    Draw.Line (50, 76, 150, 76, 16)
    Draw.Line (50, 88, 150, 88, 16)
    Draw.Line (50, 76, 50, 88, 16)
    Draw.Line (150, 76, 150, 88, 16)
    locatexy (170, 60)
    put "Hp: ", NiceHp, " / ", NiceTHp
end NiceHpbar

proc NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana : real)
    var Flung : int
    Draw.FillBox (50, 77, 150, 87, 0)
    NICEMAX
    Flung := NiceHp * 100 div NiceTHp + 50
    Draw.FillBox (50, 77, Flung, 87, 48)
    Draw.Line (50, 76, 150, 76, 16)
    Draw.Line (50, 88, 150, 88, 16)
    Draw.Line (50, 76, 50, 88, 16)
    Draw.Line (150, 76, 150, 88, 16)
    Draw.FillBox (50, 63, 150, 69, 0)
    Mbar := NiceMana * 100 div NiceTMana + 50
    Draw.FillBox (50, 63, Mbar, 69, 53)
    Draw.Line (50, 62, 150, 62, 16)
    Draw.Line (50, 70, 150, 70, 16)
    Draw.Line (50, 62, 50, 70, 16)
    Draw.Line (150, 62, 150, 70, 16)
    locatexy (170, 65)
    put "Mp: ", NiceMana, " / ", NiceTMana
    locatexy (170, 85)
    put "Hp: ", NiceHp, " / ", NiceTHp
end NiceCombo

proc JoeHpbar (JoeHp, JoeTHp : real)
    Joy := JoeHp * 100 div JoeTHp + 50
    Draw.FillBox (50, 50, Joy, 60, 52)
    Draw.Line (50, 49, 150, 49, 55)
    Draw.Line (50, 61, 150, 61, 55)
    Draw.Line (50, 49, 50, 61, 55)
    Draw.Line (150, 49, 150, 61, 55)
    locatexy (170, 57)
    put "", JoeHp, " / ", JoeTHp
end JoeHpbar

proc Moral
    M := EnemyMoral * 100 div EnemyTotalMoral + 100
    Draw.FillBox (100, 50, M, 60, 52)
    Draw.Line (100, 49, 200, 49, 55)
    Draw.Line (100, 61, 200, 61, 55)
    Draw.Line (100, 49, 100, 61, 55)
    Draw.Line (200, 49, 200, 61, 55)
end Moral

proc FightGUI
    Pic.Draw (Character, 20, 100, picXor)
    Pic.Draw (EnemyThing, 500, 100, picXor)
    Pic.Draw (FightingPet, 150, 150, picXor)
    Hpbar (Hp, THp)
    Manabar (Mana, TMana)
    NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
    EnemyHpbar (EnemyHp, EnemyTHp)
end FightGUI
% Fighting Procedures [FIGHTS1]
procedure FarmerFight (Character : int)
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    EnemyHp := 2896
    EnemyTHp := 3000
    EnemyIntelligence := 70
    EnemyDamage := 70
    EnemySpeed := 4
    Turn := 0
    EnemyTurn := 0
    EnemyThing := AngryFarmer
    Joe_
    loop
	loop
	    Draw.FillBox (0, 550, maxx, maxy, 0)
	    locatexy (2, 560)
	    put " YOUR Turn"
	    delay (1)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    Pic.Draw (Joe, 150, 110, picXor)
	    FightGUI
	    Turn := Turn + 1
	    Futton
	    delay (1700)
	    cls
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    Pic.Draw (Joe, 150, 110, picXor)
	    FightGUI
	    ScreenSet
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (2, 560)
	    put " Joe's Turn.."
	    delay (4000)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    JoeChoice := Rand.Int (1, 7)
	    if JoeChoice = 1 then
		EnemyHp := EnemyHp - 866
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hyaa!! Damage dealt: 866"
	    elsif JoeChoice = 2 then
		EnemyHp := EnemyHp - JoeDefense
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " Hiiyyyaaa!!!", JoeDefense
	    elsif JoeChoice = 3 then
		EnemyHp := EnemyHp - 164
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " 164 damage.."
	    elsif JoeChoice = 4 then
		JoeHp := JoeHp + 170
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " That was nice, healed myself. (170)"
	    elsif JoeChoice = 5 then
		Hp := Hp + 132
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " Really nice, 132 hp for you."
	    elsif JoeChoice = 6 then
		EnemyHp := 1
		Display := realstr (99.99, 4)
		Font.Draw ("-" + Display + "%", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " DIE!"
	    elsif JoeChoice = 7 then
		EnemyHp := EnemyHp - 1602
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " I will crush your soul. (1602)"
	    end if
	    if EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1000)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " The Farmer's Turn"
	    delay (4000)
	    EnemyChoice := Rand.Int (1, 6)
	    EnemyTurn += 1
	    loop
		if EnemyTurn <= 0 then
		    exit
		end if
		if EnemyChoice = 1 then
		    JoeHp := JoeHp - Rand.Int (59, 243)
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 250, 350, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Fhuq u zonen swine! "
		elsif EnemyChoice = 2 then
		    JoeHp := JoeHp - 257
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 250, 350, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Guttural Slice!! (257)"
		elsif EnemyChoice = 3 then
		    EnemyDamage := EnemyDamage + 25
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " hah, i helz myseiph sum 25 attack."
		elsif EnemyChoice = 4 then
		    Hp := Hp - 68
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 140, 270, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " I WILL KILL YOU! (68)"
		elsif EnemyChoice = 5 then
		    locatexy (500, 550)
		    put " IMA KILL YEH"
		elsif EnemyChoice = 6 then
		    EnemyHp := EnemyHp + Rand.Int (60, 200)
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 560, 290, intfont, 48)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Agggg hhaaaa!!! (Heals self random hp)"
		end if
		exit
	    end loop
	    delay (1500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	    MAX
	    NICEMAX
	end loop
	delay (1500)
	if Hp <= 0 then
	    cls
	    Failed
	elsif EnemyHp <= 0 then
	    exit
	end if
    end loop
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("The Farmer screams in agony as Joe thrusts his daggers into his chest.", 100, 450, intfont1, 16)
    delay (2000)
    Font.Draw ("He gapes wide-eyed at you two. 'U're...naught Zeno?'", 100, 420, intfont1, 16)
    delay (2000)
    Font.Draw ("He collapses, dead.", 100, 390, intfont1, 16)
    delay (2000)
    Font.Draw (" Joe: Go to Town of Billejun. There should be a training site there. ", 100, 300, intfont1, 11)
    delay (2000)
    Font.Draw (" Joe: I'll start you off. Here's an item... ", 100, 270, intfont1, 11)
    Font.Draw (" Joe: And some money.. (60)", 100, 240, intfont1, 11)
    if Style = "Melee" then
	Damage := Damage + 40
	locatexy (20, 10)
	put "Obtained Necklace of Joe (+ 40 Attack)"
    elsif Style = "Ranged" then
	Speed := Speed + 35
	locatexy (20, 10)
	put "Obtained The Horned Gizzard (+ 35 Speed)"
    elsif Style = "Gunner" then
	Skill_Level_Shot_s := 3
	locatexy (20, 10)
	put "Obtained Tome of Lazard (+ Shot Skill level)"
    elsif Style = "Magic" then
	Intelligence := Intelligence + 70
	locatexy (20, 10)
	put "Obtained Ten'shaar Shoulderplates (+ 70 Int)"
    end if
    delay (2000)
    Font.Draw ("..Ok..", 100, 100, intfont1, 0)
    Font.Draw ("(Press any key)", 100, 50, intfont1, 0)
    getch (waitkey)
    locatexy (10, 10)
    Money := Money + 75
    Experience += 15
    Storyline += 1
    Congratulations
    put "Money gained: + 15 + 60"
    put "Experience gained: + 15"
    getch (waitkey)
    cls
end FarmerFight

proc NaLongVsRebel
    Rebel_
    NaLong_
    fork playstuffSoldier
    Track := "Soldier"
    EnemyTurn := 0
    loop
	loop
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    colorback (0)
	    Pic.Draw (FightingSkill, 0, 0, picXor)
	    Pic.Draw (Rebel, 500, 110, picXor)
	    Pic.Draw (NaLong, 20, 110, picXor)
	    NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Na-Long's Turn"
	    delay (3000)
	    NiceChoice := Rand.Int (1, 5)
	    if NiceChoice = 1 then
		Attacked := (4 * Rand.Int (90, 121) + NiceSpeed) * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Shadow No.14  Kicks felt: ", Attacked
	    elsif NiceChoice = 2 then
		Attacked := (1 * 0.6 + 2) + NiceDamage / 100 * Rand.Int (70, 500)
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Exquisite darts.. fly! Shots fired and pierced: ", Attacked
	    elsif NiceChoice = 3 then
		Attacked := NiceDamage * 0.73 / 100 * Rand.Int (300, 450) + NiceIntelligence
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Nan jing, wo bu shuo, hai mei li!  Damage dealt: ", Attacked
	    elsif NiceChoice = 4 then
		Attacked := 999 * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Do you want to die? Damage dealt: ", Attacked
	    elsif NiceChoice = 5 then
		NiceHp := NiceTHp
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Wounds, revile! Amount healed: ", Attacked
	    elsif NiceChoice = 6 then
		EnemyHp := EnemyHp / 2
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "Begin.. to seperate!  Body Sliced: ", EnemyHp / 2
	    end if
	    NICEMAX
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " The Rebel's turn"
	    delay (4000)
	    EnemyChoice := Rand.Int (1, 5)
	    EnemyTurn := EnemyTurn + 1
	    if EnemyTurn <= 0 then
		exit
	    end if
	    if EnemyChoice = 1 then
		Attacked := EnemyDamage + EnemySpeed - NiceSpeed - NiceIntelligence
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Curses! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 2 then
		Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 88)
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "I will fight, for the glory of Gobalan! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 3 then
		Attacked := EnemyDamage * 0.5 + Rand.Int (50, 70)
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Neeeeaaaaaaiiiihhh! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 4 then
		Attacked := EnemyDamage * 1.3
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Whorls; of hair! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 5 then
		Attacked := EnemyDamage * 3
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Soit - Sut - Sain! 3 slices doing: ", Attacked
	    end if
	    delay (1500)
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif NiceHp <= 0 then
	    cls
	    Failed
	    cls
	end if
    end loop
end NaLongVsRebel

proc JoeVsOlba
    Joe_
    Olba_
    loop
	loop
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    colorback (0)
	    Pic.Draw (FightingSkill, 0, 0, picXor)
	    Pic.Draw (Joe, 20, 110, picXor)
	    % Pic.Draw (Olba, 500, 110, picXor)
	    NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Joe's Turn"
	    delay (3000)
	    NiceChoice := Rand.Int (1, 5)
	    if NiceChoice = 1 then
		Attacked := NiceDamage
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hyaa!! Damage Dealt: ", Attacked
	    elsif NiceChoice = 2 then
		Attacked := JoeDefense + NiceIntelligence
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hiiyyyaaa!!! ", Attacked
	    elsif NiceChoice = 3 then
		Attacked := 345
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "345.. you say "
	    elsif NiceChoice = 4 then
		Attacked := 999 * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Fallengin, crush my foe! Damage Dealt: ", Attacked
	    elsif NiceChoice = 5 then
		Attacked := NiceTHp * 0.7
		NiceHp := NiceHp + Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " That was nice, healed myself!  (", Attacked, ")"
	    elsif NiceChoice = 6 then
		EnemyHp := 1
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "DIE!"
	    end if
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Olba's turn"
	    delay (4000)
	    EnemyChoice := Rand.Int (1, 5)
	    EnemyTurn += 1
	    if EnemyTurn <= 0 then
		exit
	    end if
	    if EnemyChoice = 1 then
		Attacked := EnemyDamage + EnemySpeed - NiceSpeed - NiceIntelligence
		NiceHp := NiceHp - Attacked
		put "Curses! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 2 then
		Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 88)
		NiceHp := NiceHp - Attacked
		put "I will fight, for the glory of Gobalan! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 3 then
		Attacked := EnemyDamage * 0.5 + Rand.Int (50, 70)
		NiceHp := NiceHp - Attacked
		put "Neeeeaaaaaaiiiihhh! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 4 then
		Attacked := EnemyDamage * 1.3
		NiceHp := NiceHp - Attacked
		put "Whorls; of hair! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 5 then
		Attacked := EnemyDamage * 3
		NiceHp := NiceHp - Attacked
		put "Soit - Sut - Sain! 3 slices doing: ", Attacked
	    end if
	    delay (1500)
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif NiceHp <= 0 then
	    cls
	    Failed
	    cls
	end if
    end loop
    EMon := EnemyMoney
    Money += EMon
    Exper := EnemyExperience
    Experience += Exper
end JoeVsOlba

proc CreileStoryLine7Fight
    EnemyTurn := 0
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("A horn sounds.", 50, 540, intfont1, 54)
    delay (400)
    Font.Draw ("The Gobalan are coming!", 50, 520, intfont1, 54)
    delay (350)
    Font.Draw ("You rush onto the Ramparts. Behind the ballista, you see about 1500 tired soldiers slowly moving to Creile.", 50, 500, intfont1, 54)
    delay (700)
    Font.Draw ("Crezin soldiers rush by you, loading bows, explosives and guns.", 50, 480, intfont1, 54)
    delay (1500)
    Font.Draw ("Joe on the pipes: Capture them when they surrender. That is our focus goal.", 50, 450, intfont1, 11)
    delay (1200)
    Font.Draw ("When they panic away from the large projectiles, use a ranged item to shoot at them. ", 50, 430, intfont1, 11)
    delay (1200)
    Font.Draw ("Try to kill as many as possible, not just kill the closest to the gates. When they reach the gate..", 50, 410, intfont1, 11)
    delay (1200)
    Font.Draw (".. pour the steaming sludge onto their armor and fire more explosives.", 50, 390, intfont1, 11)
    delay (1200)
    Font.Draw ("When the gate is about to fall, light the brush pile on fire and brun the gate down.", 50, 370, intfont1, 11)
    delay (1200)
    Font.Draw ("Then, once the fire is out, and they begin the final charge..", 50, 350, intfont1, 11)
    delay (1200)
    Font.Draw ("Drop the spike net on top of them.", 50, 330, intfont1, 11)
    delay (1200)
    Font.Draw ("Any survivors that fight, let our captains and lieutenants deal with.", 50, 310, intfont1, 11)
    delay (1200)
    Font.Draw ("Assassins, snipe their leaders, and kill them. Follow me.", 50, 290, intfont1, 11)
    Font.Draw ("(Press any button)", 100, 100, intfont1, 54)
    getch (waitkey)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("You enter a chamber, with an outwards window. Inside are the assassins.", 100, 400, intfont1, 54)
    delay (900)
    Font.Draw ("Lukvel: We wait here until they enter the gate. ", 30, 350, intfont1, 43)
    delay (900)
    Font.Draw ("Ravness has a gun pointed out of the window, and is shooting at a flagbearer. ", 10, 300, intfont1, 54)
    delay (900)
    Font.Draw (" A second later, the flag disappears.", 10, 275, intfont1, 54)
    delay (500)
    Font.Draw ("Lukvel: We must remian hidden from view. If a survive decides to flee.. ", 30, 250, intfont1, 43)
    delay (900)
    Font.Draw ("Lukvel: they cannot report that assassins commanded this.", 30, 225, intfont1, 43)
    delay (100)
    Font.Draw ("Lukvel: Currently, they will believe that credit goes to Na-Long, Jasqur and the Crezin army.", 30, 200, intfont1, 43)
    delay (900)
    Font.Draw ("Joe: You're tired, right? Sleep. We'll need the energy.", 20, 150, intfont1, 11)
    delay (900)
    Font.Draw ("  Sleep... I do need it..", 100, 100, intfont1, 54)
    getch (waitkey)
    % Draw battle scenes
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("An unknown amount of time passes. Now, Ravness is tossing jars of spiders,", 10, 400, intfont1, 54)
    Font.Draw (" eggs, insects and grubs out of the window.", 10, 375, intfont1, 54)
    delay (900)
    Font.Draw ("The field is splattered with dead bodies..", 100, 350, intfont1, 54)
    delay (900)
    Font.Draw ("The brush is being set on fire, with some Gobalani burning with it.", 100, 300, intfont1, 54)
    delay (900)
    Font.Draw ("Some swordsmen rush forward, to be warded off by the heat. A few are cooked alive.", 100, 250, intfont1, 54)
    delay (900)
    Font.Draw ("You pass 6 floors and jump out to a roof.", 100, 200, intfont1, 54)
    delay (900)
    Font.Draw ("Nearby, the Gobalani are putting out the fire with dead, dying and injured bodies.", 100, 150, intfont1, 54)
    delay (900)
    Font.Draw ("The remains of the army are a tattered group, barely numbering 90.", 100, 100, intfont1, 54)
    delay (900)
    getch (waitkey)
    loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Font.Draw ("Enemy Moral Remaining", 260, 50, intfont1, red)
	Moral
	if EnemyMoral <= 0 then
	    exit
	else
	end if

	Font.Draw ("The enemy is spreading into the town! Who do you target?", 100, 400, intfont1, 54)
	Font.Draw ("[1] A Mage", 110, 200, intfont1, 53)
	Font.Draw ("[2] A Gunner", 110, 170, intfont1, 53)
	Font.Draw ("[3] A Pikesman", 110, 140, intfont1, 53)
	Font.Draw ("[4] A Swordsman", 110, 110, intfont1, 53)
	get MoralFightanswer
	if MoralFightanswer = 1 then
	    GBMage
	    EnemyThing := GBMagePic
	    EnemyMoral := EnemyMoral - 7
	elsif MoralFightanswer = 2 then
	    GBGunner
	    EnemyThing := GBGunnerPic
	    EnemyMoral := EnemyMoral - 5
	elsif MoralFightanswer = 3 then
	    GBPike
	    EnemyThing := GBPikePic
	    EnemyMoral := EnemyMoral - 3
	elsif MoralFightanswer = 4 then
	    GBSword
	    EnemyThing := GBSwordPic
	    EnemyMoral := EnemyMoral - 2
	end if
	if Track = "Winter Fireworks" then
	else
	    fork playstuffFireworks
	    Track := "Winter Fireworks"
	end if
	if Pet = 0 then
	    nothing
	elsif Pet = 1 then
	    Roque
	elsif Pet = 2 then
	    Bunion
	elsif Pet = 3 then
	    Hairi
	elsif Pet = 4 then
	    GhostBunny
	elsif Pet = 5 then
	    Dolphi
	elsif Pet = 6 then
	    Hushsh
	elsif Pet = 7 then
	    Turtle
	elsif Pet = 8 then
	    Drigo
	end if
	loop
	    cls
	    Turn := 0
	    Pic.Draw (Character, 20, 100, picXor)
	    loop
		MAX
		NICEMAX
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 550)
		put " YOUR Turn"
		delay (1)
		Draw.FillBox (0, 550, maxx, 570, 0)
		FightGUI
		Turn += 1
		Futton
		delay (1700)
		cls
		Draw.FillBox (0, 550, maxx, 570, 0)
		FightGUI
		ScreenSet
		if Hp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		else
		end if
		Draw.FillBox (500, 30, 600, 40, 0)
		EnemyHpbar (EnemyHp, EnemyTHp)
		delay (1500)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 550)
		put "Pet's Turn.. if any"
		PetFight
		delay (500)
		if Hp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		else
		end if
		Draw.FillBox (500, 30, 600, 40, 0)
		EnemyHpbar (EnemyHp, EnemyTHp)
		delay (1500)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 550)
		put " Opponent's Turn"
		delay (4000)
		EnemyChoice := Rand.Int (1, 6)
		EnemyTurn += 1
		loop
		    if EnemyTurn <= 0 then
			exit
		    end if
		    if EnemyChoice = 1 then
			Magna
		    elsif EnemyChoice = 2 then         %% put enemy skill procedures here
			SingedFeathers
		    elsif EnemyChoice = 3 then
			EHeal
		    elsif EnemyChoice = 4 then
			WhorlsofHair
		    elsif EnemyChoice = 5 then
			KnifeStab
		    elsif EnemyChoice = 6 then
			RedBurst
		    end if
		    exit
		end loop
		delay (1500)
		if Hp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		end if
		cls
	    end loop
	    delay (1500)
	    if EnemyHp <= 0 then
		exit
	    elsif Hp <= 0 then
		cls
		Failed
		cls
	    end if
	end loop
	Congratulations
	Exper := EnemyExperience
	Experience += Exper
	EMon := EnemyMoney
	Money += EMon
	locatexy (10, 560)
	put "Money gained: ", EMon
	put "Experience gained: ", Exper
	getch (waitkey)
	cls
    end loop
    if EnemyMoral < 0 then
	Money += 50
	Experience += 60
    else
    end if
    level
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("The Gobalani forces have fallen below 0 moral.. they have surrendered!", 100, 400, intfont1, 54)
    getch (waitkey)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("Your foot is on top of an injured Mage. His pride left his body minutes ago,", 50, 260, intfont1, 54)
    delay (1)
    Font.Draw ("what is left of his courage is a hollow bag of skin and bones.", 50, 240, intfont1, 54)
    delay (1000)
    Font.Draw ("A mage: Who knew it would come to this? Has Commander Anscelsior-Haltin left us for dead?", 50, 220, intfont1, 55)
    delay (2000)
    Font.Draw ("Joe calls from overhead:", 10, 550, intfont1, 11)
    delay (200)
    Font.Draw ("All of you. Soldiers, magic users, snipers. You hail from Gobalan. You are our enemy.", 20, 530, intfont1, 11)
    delay (1000)
    Font.Draw ("We will spare you. Consider it a favour.", 20, 510, intfont1, 11)
    delay (1000)
    Font.Draw ("The cowardly soldiers nod in agreement, eager to taste life again.", 50, 200, intfont1, 54)
    delay (1000)
    Font.Draw ("You will join the ranks of townspeople, and till the fields. Provide bountiful crops for Zeno.", 20, 490, intfont1, 11)
    delay (400)
    Font.Draw ("If anyone disagrees, make your voice heard.", 20, 470, intfont1, 11)
    delay (100)
    Font.Draw ("The same mage from last time: I'll CULL YOU, you Crezin demon!", 50, 180, intfont1, 59)
    delay (1000)
    Font.Draw ("Joe smiles. ", 30, 450, intfont1, 11)
    delay (200)
    Font.Draw ("Joe: Come here. ", 20, 430, intfont1, 11)
    delay (1000)
    Font.Draw ("A raggedy mage steps forth. 'I am Olba, son of the Magician Hezlow.'", 20, 160, intfont1, 59)
    delay (800)
    Font.Draw ("Joe: Pshh, who's Hezlow? ", 20, 410, intfont1, 11)
    delay (300)
    Font.Draw ("Olba: You dare silence me? You have no chance!", 30, 140, intfont1, 59)
    delay (760)
    Font.Draw ("Joe laughs. 'Come. Here.'", 20, 390, intfont1, 11)
    getch (waitkey)
    cls
    JoeVsOlba
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("Olba: Im.--..imposss---..bbll!!ee!!", 30, 400, intfont1, 59)
    delay (3000)
    Font.Draw ("Olba: Forgive me, father..", 30, 370, intfont1, 59)
    delay (2500)
    Font.Draw ("Olba's dead body falls off the podium. Money falls out of his cloak.", 30, 300, intfont1, 59)
    delay (2500)
    Font.Draw ("Joe: What's done is irreversible. Now, let's move on.. to a new future!", 30, 200, intfont1, 11)
    delay (500)
    Storyline := 8
    getch (waitkey)
end CreileStoryLine7Fight

proc Fight
    EnemyTurn := 0
    if Track = "Winter Fireworks" then
    else
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    Pic.Draw (Character, 20, 100, picXor)
    if Level >= 10 then
	EnemyType := Rand.Int (1, 5)
    elsif Level >= 5 then
	EnemyType := Rand.Int (1, 4)
    elsif Level >= 1 then
	EnemyType := Rand.Int (1, 3)
    end if
    if EnemyType = 1 then
	HighwayBandit
	EnemyThing := HighwayBandit_
	Pic.Draw (HighwayBandit_, 500, 100, picXor)
    elsif EnemyType = 2 then
	Rogue
	EnemyThing := Rogue_
	Pic.Draw (Rogue_, 500, 100, picXor)
    elsif EnemyType = 3 then
	Robber
	EnemyThing := Robber_
	Pic.Draw (Robber_, 500, 100, picXor)
    elsif EnemyType = 4 then
	Cadet
	EnemyThing := Cadet_
	Pic.Draw (Cadet_, 500, 100, picXor)
    elsif EnemyType = 5 then
	GBSoldier
	EnemyThing := GBSoldier_
	Pic.Draw (GBSoldier_, 500, 100, picXor)
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	loop
	    MAX
	    NICEMAX
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " YOUR Turn"
	    delay (1)
	    FightGUI
	    Turn += 1
	    Futton
	    delay (1700)
	    cls
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    FightGUI
	    ScreenSet
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put "Pet's Turn.. if any"
	    PetFight
	    delay (500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " Opponent's Turn"
	    delay (4000)
	    EnemyChoice := Rand.Int (1, 6)
	    EnemyTurn += 1
	    loop
		if EnemyTurn <= 0 then
		    exit
		end if
		if EnemyChoice = 1 then
		    Bite
		    EnemyTurn -= 1
		elsif EnemyChoice = 2 then         %% put enemy skill procedures here
		    clawwed
		    EnemyTurn -= 1
		elsif EnemyChoice = 3 then
		    EHeal
		    EnemyTurn -= 1
		elsif EnemyChoice = 4 then
		    WhorlsofHair
		    EnemyTurn -= 1
		elsif EnemyChoice = 5 then
		    KnifeStab
		    EnemyTurn -= 1
		elsif EnemyChoice = 6 then
		    RedBurst
		    EnemyTurn -= 1
		end if
		exit
	    end loop
	    delay (1500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    cls
	end if
    end loop
    Congratulations
    Exper := EnemyExperience
    Experience += Exper
    EMon := EnemyMoney
    Money += EMon
    locatexy (10, 560)
    put "Money gained: ", EMon
    put "Experience gained: ", Exper
    getch (waitkey)
    cls
    level
end Fight
% [FIGHT2]
proc Fight2
    EnemyTurn := 0
    if Track = "Winter Fireworks" then
    else
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    if Level >= 5 then
	EnemyType := Rand.Int (1, 5)
    elsif Level >= 3 then
	EnemyType := Rand.Int (1, 4)
    elsif Level >= 1 then
	EnemyType := Rand.Int (1, 3)
    end if
    if EnemyType = 1 then
	RiotSoldier
	EnemyThing := RiotSoldier_
    elsif EnemyType = 2 then
	EscapedPrisonmate
	EnemyThing := EscapedPrisonmate_
    elsif EnemyType = 3 then
	Gobassin
	EnemyThing := Gobassin_
    elsif EnemyType = 4 then
	DoctorLevun
	EnemyThing := DoctorLevun_
    elsif EnemyType = 5 then
	Glabezir
	EnemyThing := Glabezir_
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	loop
	    MAX
	    NICEMAX
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " YOUR Turn"
	    delay (1)
	    FightGUI
	    Turn := Turn + 1
	    Futton
	    delay (1700)
	    cls
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    FightGUI
	    ScreenSet
	    Turn += 1
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put "Pet's Turn.. if any"
	    PetFight
	    delay (500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " Opponent's Turn"
	    delay (4000)
	    if EnemyType = 4 then
		EnemyChoice := Rand.Int (3, 9)
	    elsif EnemyType = 5 then
		EnemyChoice := Rand.Int (1, 7)
	    else
		EnemyChoice := Rand.Int (1, 6)
	    end if
	    EnemyTurn += 1
	    loop
		if EnemyTurn <= 0 then
		    exit
		end if
		if EnemyChoice = 1 then
		    Downwardsstroke
		    EnemyTurn -= 1
		elsif EnemyChoice = 2 then         %% put enemy skill procedures here
		    KnifeStab
		    EnemyTurn -= 1
		elsif EnemyChoice = 3 then
		    Buff_G
		    EnemyTurn -= 1
		elsif EnemyChoice = 4 then
		    SingedFeathers
		    EnemyTurn -= 1
		elsif EnemyChoice = 5 then
		    Magna
		    EnemyTurn -= 1
		elsif EnemyChoice = 6 then
		    RedBurst
		    EnemyTurn -= 1
		elsif EnemyChoice = 7 then
		    ThroatSlash
		    EnemyTurn -= 1
		elsif EnemyChoice = 8 then
		    Freedom
		    EnemyTurn -= 2
		elsif EnemyChoice = 9 then
		    PoisonBlow
		    EnemyTurn -= 1
		end if
		exit
	    end loop
	    delay (1500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    cls
	end if
    end loop
    Congratulations
    Exper := EnemyExperience
    Experience += Exper
    EMon := EnemyMoney
    Money += EMon
    locatexy (10, 560)
    put "Money gained: ", EMon
    put "Experience gained: ", Exper
    getch (waitkey)
    cls
    level
end Fight2

% [BASIC1]
proc Skills
    cls
    colorback (0)
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Buy
    cls
end Skills

procedure Ending
    put "Yah yah. boring ending. I'm working on it."
    put "The game ended. So what."
end Ending

procedure loading2
    loop
	Draw.Line (300, 240, 500, 240, red)                                             % Top line
	Draw.Line (300, 230, 500, 230, red)                                             % Bottom line
	Draw.Line (298, 239, 298, 231, red)                                             % Left line
	Draw.Line (502, 239, 502, 231, red)                                             % Right line
	Draw.FillBox (b, a, b2, a2, 151)
	b := b + 10
	b2 := b2 + 10
	j2 := j2 + 10
	j := j + 10
	delay (50)
	Draw.FillBox (j, a, j2, a2, 0)
	exit when 500 <= j2
	exit when 500 <= b2
    end loop
    delay (50)
    Draw.FillBox (477, 232, 489, 238, 0)
    delay (50)
    Draw.FillBox (490, 232, 500, 238, 0)
    b := 300
    b2 := 307
    j2 := 277
    j := 270
    a := 232
    a2 := 238
end loading2

proc loading3
    cls
    Draw.FillBox (0, 0, maxx, maxy, 16)
    Draw.Line (150, 400, 600, 400, 0)
    Font.Draw ("Town", 200, 260, intfont, 49)
    Draw.Line (150, 170, 600, 170, 0)
    delay (1000)
end loading3

procedure loading
    loop
	Draw.Line (300, 240, 500, 240, white)                                             % Top line
	Draw.Line (300, 230, 500, 230, white)                                             % Bottom line
	Draw.Line (298, 239, 298, 231, white)                                             % Left line
	Draw.Line (502, 239, 502, 231, white)                                             % Right line
	Draw.FillBox (b, a, b2, a2, 53)
	b := b + 10
	b2 := b2 + 10
	j2 := j2 + 10
	j := j + 10
	delay (50)
	Draw.FillBox (j, a, j2, a2, 151)
	exit when 500 <= j2
	exit when 500 <= b2
    end loop
    delay (50)
    Draw.FillBox (477, 232, 489, 238, 151)
    delay (50)
    Draw.FillBox (490, 232, 500, 238, 151)
    b := 300
    b2 := 307
    j2 := 277
    j := 270
    a := 232
    a2 := 238
end loading

% [PLACES1]
proc KligeSharp
    loop
	cls
	colourback (151)
	Font.Draw ("Klige Sharp", 100, 500, intfont, 54)
	Font.Draw ("(1-50g)Hp Potion (+ 30% Hp)", 10, 200, intfont1, 54)
	Font.Draw ("(2-50g)Mana Potion (+ 40% mana)", 10, 180, intfont1, 54)
	Font.Draw ("(3-14g)Horn of Fury (+ 10 Attack)", 10, 160, intfont1, 54)
	Font.Draw ("(4-10g)Dead Elephant's Ivory(+ 10 Int)", 10, 140, intfont1, 54)
	Font.Draw ("(5-80g)Gobalani Velvet trinket (+ Random Attack)", 10, 120, intfont1, 54)
	Font.Draw ("(6-15g)Durable (+ 135 Hp and 60 Mana) ", 10, 100, intfont1, 54)
	Font.Draw ("(7)Exit ", 10, 80, intfont1, red)
	get KligeSharpanswer
	if KligeSharpanswer = 1 then
	    Hp += Hp * 0.3
	    Money -= 50
	elsif KligeSharpanswer = 2 then
	    Mana += Mana * 0.4
	    Money -= 50
	elsif KligeSharpanswer = 3 then
	    Damage += +10
	    Money -= 14
	elsif KligeSharpanswer = 4 then
	    Intelligence += 10
	    Money -= 10
	elsif KligeSharpanswer = 5 then
	    Jiro := Rand.Int (1, 4)
	    Money -= 80
	    if Jiro = 1 then
		Damage := Damage + 3
	    elsif Jiro = 2 then
		Damage := Damage * 1.05
	    elsif Jiro = 3 then
		Damage := Damage + 24
	    elsif Jiro = 4 then
		Damage := Damage + 10 * 1.009
	    end if
	elsif KligeSharpanswer = 6 then
	    Money -= 15
	    Hp += 135
	    Mana += 60
	elsif KligeSharpanswer = 7 then
	    exit
	else
	    put "Not an option.."
	end if
	MAX
	NICEMAX
	getch (waitkey)
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
    end loop
end KligeSharp

procedure Hills
    Exiting := false
    put "The hills.."
    if Track = "Sequoyah" then
    else
	fork playstuffSequoyah
	fork playstuffSequoyah
	fork playstuffSequoyah
	Track := "Sequoyah"
    end if
    loading2
    loop

	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Pic.Draw (House, 0, 0, picXor)
	NoTime := Rand.Int (1, 16)
	if NoTime = 1 then
	    Font.Draw ("The wolf howls (40%) not at the moon, but at strangers. ", 100, 50, intfont1, 54)
	elsif NoTime = 2 then
	    Font.Draw ("Objects that have gone to space smell like hot metal from radiation.", 100, 50, intfont1, 54)
	elsif NoTime = 3 then
	    Font.Draw ("A sharp sword cuts meat as well as a dull blade.", 100, 50, intfont1, 54)
	elsif NoTime = 4 then
	    Font.Draw ("Mallard and black ducks are only a few thousand years apart.", 100, 50, intfont1, 54)
	elsif NoTime = 5 then
	    Font.Draw ("Human eyes range from 1-14 dioptres. A dog is 1. A cormorant is 1-50.", 100, 50, intfont1, 54)
	elsif NoTime = 6 then
	    Font.Draw ("Square root of -1 is actually 1. 1i.", 100, 50, intfont1, 54)
	elsif NoTime = 7 then
	    Font.Draw ("In 1973, a drunk driver killed the World's Most Isolated tree. In the Sahara Desert.", 100, 50, intfont1, 54)
	elsif NoTime = 8 then
	    Font.Draw ("The Library is hidden, yet it reveals the most knowledge.", 100, 50, intfont1, 54)
	elsif NoTime = 9 then
	    Font.Draw ("The first conflict was the Battle of Chort Teah.", 100, 50, intfont1, 54)
	elsif NoTime = 10 then
	    Font.Draw ("Level 15 is the limit.", 100, 50, intfont1, 54)
	elsif NoTime = 11 then
	    Font.Draw ("Dhun Ghablian has two sons, Jerofiz and Muganri. His cousin is Guiha.", 100, 50, intfont1, 54)
	elsif NoTime = 12 then
	    Font.Draw ("Zeno killed Lazard in the 15th century.", 100, 50, intfont1, 54)
	elsif NoTime = 13 then
	    Font.Draw ("Bat lake in Algonquin is acidic and teems of Salamanders.", 100, 50, intfont1, 54)
	elsif NoTime = 14 then
	    Font.Draw ("Sequoyahs are the tallest trees on Earth.", 100, 50, intfont1, 54)
	elsif NoTime = 15 then
	    Font.Draw ("Weasels rarely lives to two years of age, and are impregnated when they are infants.", 100, 50, intfont1, 54)
	else
	    Font.Draw ("The Hills whistle their consent. The Library is in the Plaza.", 100, 50, intfont1, 9)
	end if
	delay (7000)
	Font.Draw ("Where to..", 100, 520, intfont, 33)
	Font.Draw ("1 : Back to Town  ", 100, 100, intfont1, 34)
	Font.Draw ("2 : Revisit the Hills  ", 100, 80, intfont1, 35)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 95 and rangeX <= 240) and (rangeY >= 98 and rangeY <= 117) then
		Draw.Box (95, 98, 240, 117, 11)
		Boole := true
	    else
	    end if
	    if (rangeX >= 95 and rangeX <= 240) and (rangeY >= 76 and rangeY <= 95) then
		Draw.Box (95, 76, 240, 95, 11)
		Boole := true
	    else
	    end if
	    if (rangeX >= 95 and rangeX <= 240) and (rangeY >= 98 and rangeY <= 117) and button = 1 then
		Exiting := true
		exit
	    elsif (rangeX >= 95 and rangeX <= 240) and (rangeY >= 76 and rangeY <= 95) and button = 1 then
		exit
	    else
	    end if

	    if Boole = false then
		Draw.Box (95, 98, 240, 117, 16)
		Draw.Box (95, 76, 240, 95, 16)
	    else
	    end if

	    Boole := false
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
end Hills

procedure Training
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    colorback (151)
    put "Training.."
    loading
    loop
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Pic.Draw (TrainingPic, 0, 0, picXor)
	Font.Draw ("The Fields ", 35, 211, intfont1, 49)
	Font.Draw ("Skill room ", 35, 147, intfont1, 16)
	Font.Draw ("Exit ", 35, 88, intfont1, 39)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 19 and rangeX <= 169) and (rangeY >= 185 and rangeY <= 233) then
		Draw.Box (19, 185, 169, 233, 11)
		Draw.FillBox (20, 186, 168, 232, 57)
		Font.Draw ("The Fields ", 35, 211, intfont1, 49)
		Boole := true
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 124 and rangeY <= 173) then
		Draw.Box (19, 124, 169, 173, 11)
		Draw.FillBox (20, 125, 168, 172, 57)
		Font.Draw ("Skill room ", 35, 147, intfont1, 16)
		Boole := true
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 65 and rangeY <= 113) then
		Draw.Box (19, 65, 169, 113, 11)
		Draw.FillBox (20, 66, 168, 112, 57)
		Font.Draw ("Exit ", 35, 88, intfont1, 39)
		Boole := true
	    end if
	    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
	    if (rangeX >= 19 and rangeX <= 169) and (rangeY >= 185 and rangeY <= 233) and button = 1 then
		Fight
		exit
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 124 and rangeY <= 173) and button = 1 then
		Skills
		exit
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 65 and rangeY <= 113) and button = 1 then
		Exiting := true
		exit
	    else
	    end if
	    if Boole = false then
		Draw.Box (19, 185, 169, 233, 16)
		Draw.FillBox (20, 186, 168, 232, 29)
		Draw.Box (19, 124, 169, 173, 16)
		Draw.FillBox (20, 125, 168, 172, 29)
		Draw.Box (19, 65, 169, 113, 16)
		Draw.FillBox (20, 66, 168, 112, 29)
		Font.Draw ("The Fields ", 35, 211, intfont1, 49)
		Font.Draw ("Skill room ", 35, 147, intfont1, 16)
		Font.Draw ("Exit ", 35, 88, intfont1, 39)
	    else
	    end if
	    delay (50)
	    Boole := false
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
end Training

procedure Training2
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    colorback (151)
    put "Training.."
    loading
    loop
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Pic.Draw (TrainingPic, 0, 0, picXor)
	Font.Draw ("The Fields ", 35, 211, intfont1, 49)
	Font.Draw ("Skill room ", 35, 147, intfont1, 16)
	Font.Draw ("Exit ", 35, 88, intfont1, 39)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 19 and rangeX <= 169) and (rangeY >= 185 and rangeY <= 233) then
		Draw.Box (19, 185, 169, 233, 11)
		Draw.FillBox (20, 186, 168, 232, 57)
		Font.Draw ("The Fields ", 35, 211, intfont1, 49)
		Boole := true
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 124 and rangeY <= 173) then
		Draw.Box (19, 124, 169, 173, 11)
		Draw.FillBox (20, 125, 168, 172, 57)
		Font.Draw ("Skill room ", 35, 147, intfont1, 16)
		Boole := true
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 65 and rangeY <= 113) then
		Draw.Box (19, 65, 169, 113, 11)
		Draw.FillBox (20, 66, 168, 112, 57)
		Font.Draw ("Exit ", 35, 88, intfont1, 39)
		Boole := true
	    end if
	    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
	    if (rangeX >= 19 and rangeX <= 169) and (rangeY >= 185 and rangeY <= 233) and button = 1 then
		Fight2
		exit
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 124 and rangeY <= 173) and button = 1 then
		Skills
		exit
	    elsif (rangeX >= 19 and rangeX <= 169) and (rangeY >= 65 and rangeY <= 113) and button = 1 then
		Exiting := true
		exit
	    else
	    end if
	    if Boole = false then
		Draw.Box (19, 185, 169, 233, 16)
		Draw.FillBox (20, 186, 168, 232, 29)
		Draw.Box (19, 124, 169, 173, 16)
		Draw.FillBox (20, 125, 168, 172, 29)
		Draw.Box (19, 65, 169, 113, 16)
		Draw.FillBox (20, 66, 168, 112, 29)
		Font.Draw ("The Fields ", 35, 211, intfont1, 49)
		Font.Draw ("Skill room ", 35, 147, intfont1, 16)
		Font.Draw ("Exit ", 35, 88, intfont1, 39)
	    else
	    end if
	    delay (50)
	    Boole := false
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
end Training2

proc AcceptDeclineFuttons
    loop
	% Accept and Decline Buttons
	mousewhere (rangeX, rangeY, button)
	if (rangeX >= 335 and rangeX <= 415) and (rangeY >= 170 and rangeY <= 200) then
	    Draw.Box (335, 170, 415, 200, 11)
	    Hoole := false
	    Boole := true
	else
	end if
	if (rangeX >= 425 and rangeX <= 504) and (rangeY >= 170 and rangeY <= 200) then
	    Draw.Box (425, 170, 504, 200, 11)
	    Hoole := false
	    Boole := true
	else
	end if
	if Mission = 1 then
	    MissionCost := 5
	elsif Mission = 2 then
	    MissionCost := 7
	elsif Mission = 3 then
	    MissionCost := 6
	elsif Mission = 4 then
	    MissionCost := 10
	elsif Mission = 5 then
	    MissionCost := 10
	elsif Mission = 6 then
	    MissionCost := 11
	elsif Mission = 7 then
	    MissionCost := 12
	elsif Mission = 8 then
	    MissionCost := 13
	elsif Mission = 9 then
	    MissionCost := 13
	elsif Mission = 10 then
	    MissionCost := 15
	else
	    MissionCost := 0
	end if
	if (rangeX >= 335 and rangeX <= 415) and (rangeY >= 170 and rangeY <= 200) and button = 1 then
	    MArray (Mission) := 1
	    Money -= MissionCost
	    exit
	elsif (rangeX >= 425 and rangeX <= 504) and (rangeY >= 170 and rangeY <= 200) and button = 1 then
	    exit
	else
	end if
	if Hoole = false and Boole = false then
	    Draw.Box (335, 170, 415, 200, 0)
	    Draw.Box (425, 170, 504, 200, 0)
	    Hoole := true
	else
	end if
	Boole := false
    end loop
end AcceptDeclineFuttons

proc TabMissions
end TabMissions
proc TabCurrent
end TabCurrent

proc TabComplete
    TabCompleteSwitching := false
end TabComplete

proc Lounge
    var Loungeanswer : int
    var LoungeGongsunSheng : int
    var LoungeSeyla : int
    var LoungeStoryline8answer : int
    if Storyline = 8.2 then
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" Gongsun Sheng: Oh, it's you. The new guy. ", 40, 120, intfont1, 103)
	delay (1000)
	Font.Draw (" Isn't everyone new? ", 50, 90, intfont1, 54)
	delay (500)
	Font.Draw (" Haha. I guess so. I overheard Frizul in the other room.. you want to know about tabs? ", 40, 60, intfont1, 103)
	delay (1000)
	Font.Draw (" [1] Yes, please. ", 50, 40, intfont2, 54)
	Font.Draw (" [2] Not from you. ", 50, 20, intfont2, 54)
	get LoungeStoryline8answer
	if LoungeStoryline8answer = 1 then
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" I'm glad we see it our ways. ", 40, 120, intfont1, 103)
	    delay (1000)
	    Font.Draw (" Let me tell you all about it. ", 40, 90, intfont1, 103)
	    getch (waitkey)
	elsif LoungeStoryline8answer = 2 then
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" Gongsun Sheng begins to speak, because he didn't want your opinion anyways. ", 40, 120, intfont1, 16)
	    delay (1000)
	    Font.Draw (" It all started when I was a little boy. ", 40, 90, intfont1, 103)
	    delay (1000)
	    Font.Draw (" Nahh I'm playing with you. Anyways, about tabs.", 40, 60, intfont1, 103)
	    getch (waitkey)
	else
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" Sorry? I didn't hear? Oh, you do want to know! Of course. ", 40, 120, intfont1, 103)
	    delay (1000)
	    Font.Draw (" A tab is a common. We receive many requests every month.", 40, 90, intfont1, 103)
	    getch (waitkey)
	end if
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" These tabs -  they're our relationship with the Gobalani people. ", 40, 120, intfont1, 103)
	delay (1000)
	Font.Draw (" When we help out the people they feel as if we are their protectors. ", 40, 90, intfont1, 103)
	delay (1000)
	Font.Draw (" We are, in a way. ", 40, 60, intfont1, 103)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" By strengthening our knowledge of their needs, and forming a basic relationship, ", 40, 120, intfont1, 103)
	delay (1000)
	Font.Draw (" we can assert control over a Village or Town with little to no struggle. ", 40, 90, intfont1, 103)
	delay (1000)
	Font.Draw (" This is very important in Gobalan. Many citizens are brainwashed into thinking we have ", 40, 60, intfont1, 103)
	delay (1000)
	Font.Draw (" an evil coalition set out to leave Gobalani homeless. ", 40, 30, intfont1, 103)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" In reality, our goal is to kill the leader. This is quite impossible without their co-operation. ", 40, 120, intfont1, 103)
	delay (1000)
	Font.Draw (" The food, immediate supplies, and shelters are made by them. You know Crezin? They could ", 40, 90, intfont1, 103)
	delay (1000)
	Font.Draw (" kill the leader, but risk killing millions of innocents. So they must push the borders slowly. ", 40, 60, intfont1, 103)
	delay (1000)
	Font.Draw (" That is our job, as assassins. We'll take over a line of fortresses leading the the leader's house. ", 40, 30, intfont1, 103)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" Then we kill him. ", 40, 120, intfont1, 103)
	delay (1000)
	Font.Draw (" Saves alot of deaths, agreed? ", 40, 90, intfont1, 103)
	delay (1000)
	Font.Draw (" Remember, the more tabs are completed the better our relations are with the Gobalani.", 40, 60, intfont1, 103)
	delay (1000)
	Font.Draw (" It's good to start off with one right now. Give it a try.", 40, 30, intfont1, 103)
	getch (waitkey)
	Storyline := 8.3
    else
	loop
	    colourback (0)
	    Pic.Draw (GongsunSheng, 50, 145, picMerge)
	    Pic.Draw (Seyla, 500, 145, picMerge)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" Talk to: ", 40, 120, intfont1, 16)
	    Font.Draw (" [1] Gongsun Sheng ", 40, 90, intfont1, 103)
	    Font.Draw (" [2] Seyla", 40, 60, intfont1, 106)
	    get Loungeanswer
	    if Loungeanswer = 1 then
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw (" Hey, want to know about anything? I know it all. ", 40, 120, intfont1, 103)
		Font.Draw (" All except the Library. Don't ask me that. ", 40, 90, intfont1, 103)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw (" [1] Tabs", 40, 130, intfont2, 16)
		Font.Draw (" [2] Experience", 40, 110, intfont2, 16)
		Font.Draw (" [3] Gobalan", 40, 90, intfont2, 16)
		Font.Draw (" [4] The Library", 40, 70, intfont2, 16)
		Font.Draw (" [5] Transtelon", 40, 50, intfont2, 16)
		Font.Draw (" [6] Zeno HQ", 40, 30, intfont2, 16)
		Font.Draw (" [7] Foes", 40, 10, intfont2, 16)
		get LoungeGongsunSheng
		Pic.Draw (Speech, 1, 1, picCopy)
		if LoungeGongsunSheng = 1 then
		elsif LoungeGongsunSheng = 2 then
		    getch (waitkey)
		elsif LoungeGongsunSheng = 3 then
		    getch (waitkey)
		elsif LoungeGongsunSheng = 4 then
		    getch (waitkey)
		elsif LoungeGongsunSheng = 5 then
		    getch (waitkey)
		elsif LoungeGongsunSheng = 6 then
		    getch (waitkey)
		elsif LoungeGongsunSheng = 7 then
		    getch (waitkey)
		else
		end if
	    elsif Loungeanswer = 2 then
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw (" Feel free to get tips from me. ", 40, 120, intfont1, 103)
		Font.Draw (" I sneak into Gobalan alot! ", 40, 90, intfont1, 103)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw (" [1] Items", 40, 130, intfont2, 16)
		Font.Draw (" [2] Gold", 40, 110, intfont2, 16)
		Font.Draw (" [3] Equipment", 40, 90, intfont2, 16)
		Font.Draw (" [4] Music", 40, 70, intfont2, 16)
		Font.Draw (" [5] Fighting", 40, 50, intfont2, 16)
		Font.Draw (" [6] Skills", 40, 30, intfont2, 16)
		Font.Draw (" [7] Pets and Teammates", 40, 10, intfont2, 16)
		get LoungeSeyla
		Pic.Draw (Speech, 1, 1, picCopy)
		if LoungeSeyla = 1 then
		    getch (waitkey)
		elsif LoungeSeyla = 2 then
		    getch (waitkey)
		elsif LoungeSeyla = 3 then
		    getch (waitkey)
		elsif LoungeSeyla = 4 then
		    getch (waitkey)
		elsif LoungeSeyla = 5 then
		    getch (waitkey)
		elsif LoungeSeyla = 6 then
		    getch (waitkey)
		elsif LoungeSeyla = 7 then
		    getch (waitkey)
		else
		end if
	    else
	    end if
	end loop
    end if
end Lounge

proc Tabs
    StoryStuff := false
    Exiting := false
    Hoole := false
    Boole := false
    TabMissionsSwitching := false
    TabCurrentSwitching := false
    TabCurrentSwitching := false
    % talk
    % Bubble + face
    loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (ZenoHQTabs, 0, 0, picCopy)
	% Tutorial blab
	if Storyline = 8.3 then
	    Font.Draw (" You can view available Tabs here. 'Current' are Tabs you are in progress of doing, while 'Recent' are finished ones. ", 10, 45, intfont2, 0)
	    Font.Draw (" The Tab description will appear overhead. Here will be cost, requirements and Exp for the Tab. ", 10, 25, intfont2, 0)
	    Font.Draw (" You can find more Tabs available over the duration of the Story. Also, certain choices affect Tabs. Good luck! ", 10, 5, intfont2, 0)
	    getch (waitkey)
	    Draw.FillBox (0, 0, maxx, 56, black)
	    Storyline := 8.4
	else
	end if
	% Highlighting Main selections
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 19 and rangeX <= 176) and (rangeY >= 496 and rangeY <= 546) then
		Draw.Box (19, 496, 176, 546, 0)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 496 and rangeY <= 546) then
		Draw.Box (180, 496, 337, 546, 0)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 341 and rangeX <= 498) and (rangeY >= 496 and rangeY <= 546) then
		Draw.Box (341, 496, 498, 546, 0)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then
		Draw.Line (605, 508, 605, 546, 11)
		Draw.Line (706, 508, 706, 546, 11)
		Hoole := false
		Boole := true
	    end if
	    % Clicked on Tabs button
	    if (rangeX >= 19 and rangeX <= 176) and (rangeY >= 496 and rangeY <= 546) and button = 1 or (TabMissionsSwitching = true) then
		StoryStuff := false
		Hoole := false
		Boole := false
		Draw.FillBox (19, 166, 503, 490, 16)
		if Storyline = 8.4 then
		    Font.Draw ("A missing cat", 35, 447, intfont, 13)
		    Mission := 1
		    loop
			if MArray (1) = 2 then
			    Font.Draw ("Frizul: Well done, your first Tab completed. I'll give you 4g because I feel like it.", 15, 135, intfont2, 12)
			    delay (500)
			    Font.Draw ("Gained: 4g", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: Silver Ringlet (+40 TMana) ", 10, 25, intfont2, 0)
			    Font.Draw ("Exp: +11 ", 10, 5, intfont2, 0)
			    Money += 4
			    TMana += 40
			    Experience += 11
			    Storyline := 8.5
			    exit
			else
			end if         % Highlighting for Tabs
			mousewhere (rangeX, rangeY, button)
			if (rangeX >= 30 and rangeX <= 220) and (rangeY >= 440 and rangeY <= 474) then
			    Draw.Box (30, 440, 220, 474, 11)
			    Hoole := false
			    Boole := true
			else
			end if
			if (rangeX >= 180 and rangeX <= 337) and (rangeY >= 496 and rangeY <= 546) then
			    Draw.Box (180, 497, 337, 546, 0)
			    Hoole := false
			    Boole := true
			else
			end if
			if (rangeX >= 341 and rangeX <= 498) and (rangeY >= 496 and rangeY <= 546) then
			    Draw.Box (341, 497, 498, 546, 0)
			    Hoole := false
			    Boole := true
			else
			end if
			if (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then
			    Draw.Line (605, 508, 605, 546, 11)
			    Draw.Line (706, 508, 706, 546, 11)
			    Hoole := false
			    Boole := true
			else
			end if
			%Mouse clicking for
			if (rangeX >= 30 and rangeX <= 220) and (rangeY >= 440 and rangeY <= 474) and button = 1 then
			    Font.Draw ("I lost my cat Fhesh last night.. and I can't find her! I'm getting really worried now.", 15, 135, intfont2, 13)
			    Font.Draw ("If anyone could find her for me, I'd be willing to part with my ringlet. I lost her near Tima. ", 15, 115, intfont2, 13)
			    Font.Draw ("She's a grey tabby, and responds to 'Fhesh.' Any help is appreciated! ", 15, 95, intfont2, 13)
			    Font.Draw ("Cost: 5g to Frizul.", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: Chance of Silver Ringlet, Exp ", 10, 25, intfont2, 0)
			    Font.Draw ("Requirement: A knowledge of cats ", 10, 5, intfont2, 0)
			    Hoole := false
			    Boole := false
			    Font.Draw ("[Accept Tab]    [Decline]", 340, 175, intfont2, 0)
			    AcceptDeclineFuttons
			    Hoole := false
			    Boole := false
			    Draw.FillBox (10, 65, 738, 151, 0)
			    exit
			elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 497 and rangeY <= 556) and button = 1 then
			    StoryStuff := true
			    TabCurrentSwitching := true
			    exit
			elsif (rangeX >= 341 and rangeX <= 498) and (rangeY >= 497 and rangeY <= 556) and button = 1 then
			    StoryStuff := true
			    TabCompleteSwitching := true
			    exit
			elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) and button = 1 then
			    Exiting := true
			    exit
			else
			end if
			if Hoole = false and Boole = false then
			    Draw.Box (30, 440, 220, 474, 0)
			    Draw.Box (180, 496, 337, 546, 2)
			    Draw.Box (341, 496, 498, 546, 12)
			    Draw.Line (605, 508, 605, 546, 12)
			    Draw.Line (706, 508, 706, 546, 12)
			    Hoole := true
			else
			end if
			Boole := false
		    end loop
		elsif Storyline >= 15 then
		elsif Storyline >= 8 then
		elsif Storyline >= 3 then
		    loop
			% Finishing results (All missions)
			Draw.FillBox (19, 166, 503, 490, 16)         % Clears main box
			Font.Draw ("The Billejun Bandits", 35, 447, intfont, 13)         % Mission 2
			Font.Draw ("The way to Black Gull", 35, 447, intfont, 13)         % Mission 3
			Font.Draw ("How far?", 35, 447, intfont, 13)         % Mission 4
			if MArray (2) = 2 then
			    Font.Draw ("Frizul: The Bandits? Ahh.. I knew the Leader. Wron, his name?.", 15, 135, intfont2, 12)
			    delay (500)
			    Font.Draw ("Gained: 46g", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: A note from Rretulok", 10, 25, intfont2, 0)
			    Font.Draw ("Exp: + 27", 10, 5, intfont2, 0)
			    Money += 4
			    TMana += 40
			    Experience += 11
			    exit
			elsif MArray (3) = 2 then
			    Font.Draw ("Frizul: The Black Gull was once a bustling village in Gobalan.. until Karhen visited it.", 15, 135, intfont2, 12)
			    delay (500)
			    Font.Draw ("Gained: 21g", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: The Black Gull's feather", 10, 25, intfont2, 0)
			    Font.Draw ("Exp: + 25", 10, 5, intfont2, 0)
			    Money += 4
			    TMana += 40
			    Experience += 11
			    exit
			elsif MArray (4) = 2 then
			    Font.Draw ("Frizul: Joseph? Hah, you're funny. He died 10 years ago!.", 15, 135, intfont2, 12)
			    delay (500)
			    Font.Draw ("Gained: 25g", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: A memorial ticket", 10, 25, intfont2, 0)
			    Font.Draw ("Exp: + 31", 10, 5, intfont2, 0)
			    Money += 4
			    TMana += 40
			    Experience += 11
			    exit
			end if
			mousewhere (rangeX, rangeY, button)
			if (rangeX >= 30 and rangeX <= 220) and (rangeY >= 440 and rangeY <= 474) then
			    Draw.Box (30, 440, 220, 474, 11)
			    Hoole := false
			    Boole := true
			elsif (rangeX >= 30 and rangeX <= 220) and (rangeY >= 366 and rangeY <= 400) then
			    Draw.Box (30, 366, 220, 400, 11)
			    Hoole := false
			    Boole := true
			elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 496 and rangeY <= 546) then
			    Draw.Box (180, 497, 337, 546, 0)
			    Hoole := false
			    Boole := true
			elsif (rangeX >= 341 and rangeX <= 498) and (rangeY >= 496 and rangeY <= 546) then
			    Draw.Box (341, 497, 498, 546, 0)
			    Hoole := false
			    Boole := true
			elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then
			    Draw.Line (605, 508, 605, 546, 11)
			    Draw.Line (706, 508, 706, 546, 11)
			    Hoole := false
			    Boole := true
			end if
			%Displaying information for Missions [Description, rewards and accepting.]
			if (rangeX >= 30 and rangeX <= 220) and (rangeY >= 440 and rangeY <= 474) and button = 1 then
			    Mission := 2
			    Font.Draw ("Somebody, please help! We're the village of Rretulok. We're quite far up North, so we need to trade", 15, 135, intfont2, 13)         %Main box description , Low
			    Font.Draw ("for many of our items. Usually, we have a surplus of goods as our Mammoth fur and Fetrin metal are ", 15, 115, intfont2, 13)         %A line lower
			    Font.Draw ("rare to other regions. However, a group of Billejun Bandits have started to raid our traders. Route them! ", 15, 95, intfont2, 13)         %2 lines lower
			    Font.Draw ("Cost: 5g to Frizul.", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: 26 Exp ", 10, 25, intfont2, 0)
			    Font.Draw ("Save the Rretulok Chief his grief and pain! Kill the Bandit leader. ", 10, 5, intfont2, 0)
			    Hoole := false
			    Boole := false
			    Font.Draw ("[Accept Tab]    [Decline]", 340, 175, intfont2, 0)
			    AcceptDeclineFuttons
			    Hoole := false
			    Boole := false
			    Draw.FillBox (10, 65, 738, 151, 0)
			    exit
			elsif (rangeX >= 30 and rangeX <= 220) and (rangeY >= 366 and rangeY <= 400) and button = 1 then
			    Mission := 3
			    Font.Draw ("", 15, 135, intfont2, 13)
			    Font.Draw (" ", 15, 115, intfont2, 13)
			    Font.Draw (" ", 15, 95, intfont2, 13)
			    Font.Draw ("Cost: g to Frizul.", 10, 45, intfont2, 0)
			    Font.Draw ("Reward: , Exp ", 10, 25, intfont2, 0)
			    Font.Draw ("Requirement:  ", 10, 5, intfont2, 0)
			    Hoole := false
			    Boole := false
			    Font.Draw ("[Accept Tab]    [Decline]", 340, 175, intfont2, 0)
			    AcceptDeclineFuttons
			    Hoole := false
			    Boole := false
			    Draw.FillBox (10, 65, 738, 151, 0)
			    exit
			elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 497 and rangeY <= 556) and button = 1 then
			    StoryStuff := true
			    TabCurrentSwitching := true
			    exit
			elsif (rangeX >= 341 and rangeX <= 498) and (rangeY >= 497 and rangeY <= 556) and button = 1 then
			    StoryStuff := true
			    TabCompleteSwitching := true
			    exit
			elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) and button = 1 then
			    Exiting := true
			    exit
			else
			end if
			if Hoole = false and Boole = false then
			    Draw.Box (30, 440, 220, 474, 0)
			    Draw.Box (180, 496, 337, 546, 2)
			    Draw.Box (341, 496, 498, 546, 12)
			    Draw.Line (605, 508, 605, 546, 12)
			    Draw.Line (706, 508, 706, 546, 12)
			    Hoole := true
			else
			end if
			Boole := false
		    end loop
		else
		end if
		if Exiting = true then
		    Exiting := false
		    exit
		elsif TabCurrentSwitching = true then
		    exit
		elsif TabCompleteSwitching = true then
		    exit
		else
		end if
		TabMissionsSwitching := false
		% Main Current Selection
	    elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 496 and rangeY <= 546) and button = 1 or (TabCurrentSwitching = true) then
		TabCurrent
		TabCurrentSwitching := false
	    elsif (rangeX >= 341 and rangeX <= 398) and (rangeY >= 496 and rangeY <= 546) and button = 1 or (TabCompleteSwitching = true) then
		TabComplete
		TabCompleteSwitching := false
	    elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) and button = 1 or (Exiting = true) then
		Exiting := true
		exit
	    else
	    end if
	    if Hoole = false and Boole = false then
		Draw.Box (19, 496, 176, 546, 55)
		Draw.Box (180, 496, 337, 546, 2)
		Draw.Box (341, 496, 498, 546, 12)
		Draw.Line (605, 508, 605, 546, 12)
		Draw.Line (706, 508, 706, 546, 12)
		Hoole := true
	    else
	    end if
	    Boole := false
	    if StoryStuff = true then
		StoryStuff := false
		exit
	    elsif Exiting = true then
		exit
	    else
	    end if
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
    Exiting := false
end Tabs

proc SpecialTraining
    % Code to choose difficulty
    put "Enter a number 1-5 for difficulty"
    get EnemyType
    % change
    EnemyTurn := 0
    if Track = "Soldier" then
    else
	fork playstuffSoldier
	Track := "Soldier"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    EnemyThing := ZenoPracticeDummy
    if EnemyType = 1 then
	ZenoPracticeDummyArcher
    elsif EnemyType = 2 then
	ZenoPracticeDummyMelee
    elsif EnemyType = 3 then
	ZenoPracticeDummyGunner
    elsif EnemyType = 4 then
	ZenoPracticeDummyMagic
    elsif EnemyType = 5 then
	ZenoPracticeDummyMixed
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	loop
	    MAX
	    NICEMAX
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " YOUR Turn"
	    delay (1)
	    FightGUI
	    Turn := Turn + 1
	    Futton
	    delay (1700)
	    cls
	    FightGUI
	    ScreenSet
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    EnemyExperience += 4
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    if Pet = 0 then
	    else
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 560)
		put "Pet's Turn.. if any"
		PetFight
		delay (500)
		if Hp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		else
		end if
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " Dummy's Turn"
	    delay (4000)
	    if EnemyType = 1 then
		EnemyChoice := Rand.Int (1, 3)
		EnemyExperience += 3
		% Archer
	    elsif EnemyType = 2 then
		EnemyChoice := Rand.Int (4, 6)
		EnemyExperience += 3
		% Melee
	    elsif EnemyType = 3 then
		EnemyChoice := Rand.Int (7, 9)
		EnemyExperience += 3
		% Gunner
	    elsif EnemyType = 4 then
		EnemyChoice := Rand.Int (10, 12)
		EnemyExperience += 3
		% Magic
	    elsif EnemyType = 5 then
		EnemyChoice := Rand.Int (1, 14)
		EnemyExperience += 5
	    else
		EnemyChoice := Rand.Int (3, 10)
	    end if
	    EnemyTurn := EnemyTurn + 1
	    loop
		if EnemyTurn <= 0 then
		    exit
		end if
		if EnemyChoice = 1 then
		    Hp := Hp - 30
		    put "30 damage."
		elsif EnemyChoice = 2 then         %% put enemy skill procedures here
		    Hp := Hp - 50
		    put "50 damage."
		elsif EnemyChoice = 3 then
		    EnemyHp += 60
		    put "Heals self 60."
		elsif EnemyChoice = 4 then
		    Hp := Hp - 32
		    put "32 damage - slice"
		elsif EnemyChoice = 5 then
		    Hp := Hp - 47
		    put "47 damage - cut"
		elsif EnemyChoice = 6 then
		    Hp := Hp - 27
		    put "27 damage - stab"
		elsif EnemyChoice = 7 then
		    Hp -= 40
		    put "Bullet shot. 40 damage."
		elsif EnemyChoice = 8 then
		    Hp -= 42
		    put "Lung Shot. 42 damage."
		elsif EnemyChoice = 9 then
		    EnemyHp += 70
		    put "Reloading. Heals 70."
		elsif EnemyChoice = 10 then
		    Hp -= 10
		    put "Fizz of vapour. 10 damage."
		elsif EnemyChoice = 11 then
		    Hp -= 50
		    put "Earth toss. 50 damage."
		elsif EnemyChoice = 12 then
		    EnemyHp += 130
		    put "Rejuvinate. 130 healed."
		end if
		exit
	    end loop
	    EnemyTurn := EnemyTurn - 1
	    delay (1500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    cls
	end if
    end loop
    Congratulations
    Exper := EnemyExperience
    Experience += Exper
    locatexy (10, 560)
    put "Money gained: 0"
    put "Experience gained: ", Exper
    getch (waitkey)
    cls
    level
end SpecialTraining

var ZenoHQStoryline8answer : int

proc ZenoHQ
    var StoryStuff : boolean := false
    Exiting := false
    Hoole := false
    Boole := false
    % talk
    % Bubble + face
    loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (ZenoHQPic, 0, 0, picCopy)
	if Storyline = 8.1 then
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" Frizul: Huh..? How'd you get in? ", 40, 125, intfont1, 12)
	    delay (1000)
	    Font.Draw (" [1] Uh.. I opened the door and entered. ", 40, 90, intfont2, 54)
	    Font.Draw (" [2] Joe gave me a key! ", 40, 60, intfont2, 54)
	    Font.Draw (" [3] I teleported. [:D] ", 40, 30, intfont2, 54)
	    get ZenoHQStoryline8answer
	    Pic.Draw (Speech, 1, 1, picCopy)
	    if ZenoHQStoryline8answer = 1 then
		Font.Draw (" You .. WOT M8? SHENG! GET YO ASS HERE. ", 40, 120, intfont1, 12)
		delay (700)
		Font.Draw (" Gongsun Sheng: Ni shuo shi ma? ", 40, 90, intfont1, 103)
		delay (1000)
		Font.Draw (" Frizul: Stahp that spewing and why'd you leave the door unlocked?! ", 40, 60, intfont1, 12)
		delay (1000)
		Font.Draw (" Gongsun Sheng: I did? I think it was Seyla. ", 40, 30, intfont1, 103)
		getch (waitkey)
	    elsif ZenoHQStoryline8answer = 2 then
		Font.Draw (" JOE? HE DUN HAFF A KEY! ", 40, 120, intfont1, 12)
		delay (1000)
		Font.Draw (" You lyin'.. you lyin' wit me. ", 40, 90, intfont1, 12)
		delay (600)
		Font.Draw (" Get real dawg, ain't nobody got time fo dat. ", 40, 60, intfont1, 12)
		delay (1000)
		Font.Draw (" Sheng probably left the door open. Dat oaf. ", 40, 30, intfont1, 12)
		getch (waitkey)
	    elsif ZenoHQStoryline8answer = 3 then
		Font.Draw (" Wha... okay. ", 40, 120, intfont1, 12)
		delay (2000)
		Font.Draw (" Did you use the Transtelon?? ", 40, 90, intfont1, 12)
		delay (1000)
		Font.Draw (" No? ", 40, 60, intfont1, 12)
		delay (1000)
		Font.Draw (" I guess Seyla opened the door.. ", 40, 30, intfont1, 12)
		getch (waitkey)
	    end if
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" What's that in your hand? ", 50, 120, intfont1, 12)
	    delay (1000)
	    Font.Draw (" Oh. A letter, from Joe. To you. ", 40, 90, intfont1, 54)
	    delay (1000)
	    Font.Draw (" You hand the letter to Frizul. ", 40, 60, intfont1, 16)
	    delay (1000)
	    Font.Draw (" He leafs through the letter, and looks up. ", 40, 30, intfont1, 16)
	    getch (waitkey)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" Well.. I guess you should learn about tabs. ", 50, 120, intfont1, 12)
	    getch (waitkey)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" How about the letter? ", 50, 120, intfont1, 54)
	    getch (waitkey)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" It doesn't concern you. ", 50, 120, intfont1, 12)
	    delay (1000)
	    Font.Draw (" Anyways, tabs are requests sent from nearby towns and villages. Yours'll be in Gobalan. ", 50, 90, intfont1, 12)
	    delay (1000)
	    Font.Draw (" The people pay me beforehand, so when they are complete, I can hand you your money. ", 50, 60, intfont1, 12)
	    delay (1000)
	    Font.Draw (" Think of it like a mission. Accept a tab, and complete it. Then you get paid. ", 50, 30, intfont1, 12)
	    getch (waitkey)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw (" On that tangent.. speak with Gongsun Sheng in the Lounge. He knows alot about the base. ", 50, 120, intfont1, 12)
	    getch (waitkey)
	    Font.Draw (" Alright. ", 40, 50, intfont, 54)
	    delay (2000)
	    StoryStuff := true
	    Storyline := 8.2
	else
	end if
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 442 and rangeX <= 578) and (rangeY >= 158 and rangeY <= 199) then
		Draw.Box (442, 158, 578, 198, 54)
		Draw.Line (449, 167, 449, 190, 62)
		Draw.Line (572, 167, 572, 190, 62)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 115 and rangeY <= 156) then
		Draw.Box (442, 115, 578, 155, 54)
		Draw.Line (449, 124, 449, 147, 41)
		Draw.Line (572, 124, 572, 147, 41)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 70 and rangeY <= 111) then
		Draw.Box (442, 70, 578, 111, 54)
		Draw.Line (449, 79, 449, 102, 24)
		Draw.Line (572, 79, 572, 102, 24)
		Hoole := false
		Boole := true
	    elsif (rangeX >= 619 and rangeX <= 746) and (rangeY >= 3 and rangeY <= 66) then
		Draw.Box (619, 3, 746, 66, 0)
		Draw.Line (629, 53, 735, 53, 11)
		Draw.Line (629, 16, 736, 16, 11)
		Hoole := false
		Boole := true
	    end if
	    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
	    if (rangeX >= 442 and rangeX <= 578) and (rangeY >= 158 and rangeY <= 199) and button = 1 then
		Lounge
		exit
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 115 and rangeY <= 156) and button = 1 then
		Tabs
		exit
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 70 and rangeY <= 111) and button = 1 then
		SpecialTraining
		exit
	    elsif (rangeX >= 619 and rangeX <= 746) and (rangeY >= 3 and rangeY <= 66) and button = 1 then
		Exiting := true
		exit
	    else
	    end if
	    if Hoole = false and Boole = false then
		Draw.Box (442, 158, 578, 198, 0)
		Draw.Box (442, 115, 578, 155, 0)
		Draw.Box (442, 70, 578, 111, 0)
		Draw.Box (619, 3, 746, 66, 11)
		Draw.Line (629, 53, 735, 53, 16)
		Draw.Line (629, 16, 736, 16, 16)
		Draw.Line (449, 167, 449, 190, 16)
		Draw.Line (572, 167, 572, 190, 16)
		Draw.Line (449, 124, 449, 147, 16)
		Draw.Line (572, 124, 572, 147, 16)
		Draw.Line (449, 79, 449, 102, 16)
		Draw.Line (572, 79, 572, 102, 16)
		Hoole := true
	    else
	    end if
	    Boole := false
	    if StoryStuff = true then
		StoryStuff := false
		exit
	    else
	    end if
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
    Exiting := false
end ZenoHQ

proc Transtelon
    %
    %
    %
end Transtelon

proc Zeno
    Exiting := false
    Hoole := false
    Boole := false
    loop
	if Track = "Nostalgia" then
	else
	    fork playstuffNostalgia
	    Track := "Nostalgia"
	end if
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (ZenoMap, 0, 0, picXor)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 491 and rangeX <= 589) and (rangeY >= 273 and rangeY <= 307) then
		Draw.Box (491, 273, 589, 307, 0)
		Hoole := false
		Boole := true
	    else
	    end if
	    if (rangeX >= 491 and rangeX <= 589) and (rangeY >= 235 and rangeY <= 268) then
		Draw.Box (491, 235, 589, 268, 0)
		Hoole := false
		Boole := true
	    else
	    end if
	    if (rangeX >= 491 and rangeX <= 589) and (rangeY >= 196 and rangeY <= 229) then
		Draw.Box (491, 196, 589, 229, 0)
		Hoole := false
		Boole := true
	    else
	    end if
	    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
	    if (rangeX >= 491 and rangeX <= 589) and (rangeY >= 273 and rangeY <= 307) and button = 1 then
		ZenoHQ
		exit
	    elsif (rangeX >= 491 and rangeX <= 589) and (rangeY >= 235 and rangeY <= 268) and button = 1 then
		Transtelon
		exit
	    elsif (rangeX >= 491 and rangeX <= 589) and (rangeY >= 196 and rangeY <= 229) and button = 1 then
		Exiting := true
		exit
	    else
	    end if
	    if Hoole = false and Boole = false then
		Draw.Box (491, 273, 589, 307, 36)
		Draw.Box (491, 235, 589, 268, 36)
		Draw.Box (491, 196, 589, 229, 36)
		Hoole := true
	    else
	    end if
	    Boole := false
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
    Exiting := false
end Zeno


proc PetStore
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, 400, maxy, 151)
    Draw.FillBox (401, 0, maxx, maxy, 28)
    if Storyline = 3 then
	Font.Draw (" The Pet Store ", 100, 530, intfont, 107)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" DasMater: Welcome to my pet store! ", 40, 135, intfont2, 49)
	delay (1500)
	Font.Draw (" DasMater: The pets here are raised by me. They are all very strong and smart. ", 40, 115, intfont2, 49)
	delay (2500)
	Font.Draw (" DasMater: They can help you in your journeys. You look like a traveler. I'll give you one for free! ", 40, 955, intfont2, 49)
	delay (1500)
	Font.Draw (" You: .. Ok .. ", 40, 55, intfont2, 54)
	delay (2500)
	Font.Draw (" DasMater: Come by later! And remember to check out the pets! ", 40, 15, intfont2, 49)
	getch (waitkey)
	cls
	Storyline := 4
    else
	loop
	    if Storyline = 3 then
	    else
		Font.Draw (" The Pet Store (DasMater)", 100, 530, intfont, 41)
		Font.Draw (" [1] Pet Selection: ", 40, 260, intfont1, 52)
		Font.Draw (" [2] Pet Guide: ", 40, 240, intfont1, 52)
		Font.Draw (" [3] Exit Store: ", 40, 220, intfont1, 52)
		put "Money", Money
		get PetStoreanswer
		if PetStoreanswer = 1 then
		    Font.Draw (" Pet Selection: ", 30, 100, intfont1, 52)
		    Font.Draw (" Select pet for more info. [y to buy, n to cancel.]", 30, 80, intfont2, 52)         %%%% Put description of pet and yes no buy scene
		    Font.Draw (" [1]Roque  [2]Bunion  [3]Hairi  [4]GhostBunny ", 30, 60, intfont2, 52)
		    Font.Draw (" [5]Dolphi  [6]Hushsh  [7]Turtle  [8]Drigo ", 30, 40, intfont2, 52)
		    get PetChoice
		    if PetChoice = 1 then
			Pic.Draw (RoquePic, 450, 200, picXor)
			put "This pet is a pet rock. It barely does any damage, but has extremely high hp."
			put "Buy pet? [10g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 10
			    if Money < 0 then
				Money := Money + 10
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 1         %%%%% Make pet numbers
				PetArray (1) := 1
				FightingPet := RoquePic
				Font.Draw (" No reaction from the Roque. ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 2 then
			Pic.Draw (BunionPic, 450, 200, picXor)
			put "The Bunion is a fluffy ball, capable of dealing damage and healing."
			put "Buy pet? [100g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 100
			    if Money < 0 then
				Money := Money + 100
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 2
				PetArray (2) := 1
				FightingPet := BunionPic
				Font.Draw (" It looks at its new owner. ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 3 then
			Pic.Draw (HairiPic, 450, 200, picXor)
			put "Hairis are monstrous little animals that can fly."
			put "Purchase pet? [110g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 110
			    if Money < 0 then
				Money := Money + 110
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 3
				PetArray (3) := 1
				FightingPet := HairiPic
				Font.Draw (" Puchase complete. ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 4 then
			Pic.Draw (GhostBunnyPic, 450, 200, picXor)
			put "Ghost Bunnies can deal high damage, and are very intelligent."
			put "Buy a Ghost Bunny? [185g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 185
			    if Money < 0 then
				Money := Money + 185
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 4
				PetArray (4) := 1
				FightingPet := GhostBunnyPic
				Font.Draw (" Boo! ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 5 then
			Pic.Draw (DolphiPic, 450, 200, picXor)
			put "The Dolphi is a rare land mammal that resembles a small Killer Whale."
			put "They have high damage at the cost of a weak body. Buy a Dolphi? [213g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 213
			    if Money < 0 then
				Money := Money + 213
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 5
				PetArray (5) := 1
				FightingPet := DolphiPic
				Font.Draw (" Have fun with it! ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 6 then
			Pic.Draw (HushshPic, 450, 200, picXor)
			put "A Hushsh is a Pillow that can talk and move. They are resilient, and smart."
			put "Buy a Hushsh? [250g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 250
			    if Money < 0 then
				Money := Money + 250
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 6
				PetArray (6) := 1
				FightingPet := HushshPic
				Font.Draw (" Done! ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 7 then
			Pic.Draw (TurtlePic, 450, 200, picXor)
			put "Turtles have extremely high defense. They are also fluffy."
			put "Get a Fluffy Turtle? [400g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 400
			    if Money < 0 then
				Money := Money + 400
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 7
				PetArray (7) := 1
				FightingPet := TurtlePic
				Font.Draw (" Done! ", 30, 20, intfont1, 0)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    elsif PetChoice = 8 then
			Pic.Draw (DrigoPic, 450, 200, picXor)
			put "A rare dragon, the Drigo can fly and throw burning flames."
			put "Drigos are dangerous. Buy one? [450g]"
			get PetBuy
			if PetBuy = "y" then
			    Money := Money - 450
			    if Money < 0 then
				Money := Money + 450
				Font.Draw (" Cannot buy. ", 30, 20, intfont1, red)
				exit
			    else
				Pet := 8
				PetArray (8) := 1
				FightingPet := DrigoPic
				Font.Draw (" Purchase successful. ", 30, 20, intfont1, white)
			    end if
			elsif PetBuy = "n" then
			    exit
			end if
		    end if
		elsif PetStoreanswer = 2 then
		    put "The pet guide."
		    put "Not finished yet."
		    put "Pets can perform a varying amount of helpful skills. This includes healing, attacking and absorbing damage."
		    put "Also, pet cannot die. If they are killed in battle they will revive. (But be more hungry.)"
		    put "Battles make a pet hungry. They need food."
		    put "However, food is easy to buy. The only hindrance is that pets cost alot."
		    put "Pets are rewarding for their price. Pets level up too, and can gain extra abilities with higher levels."
		    getch (waitkey)
		elsif PetStoreanswer = 3 then
		    exit
		else
		end if
	    end if
	    cls
	end loop
    end if
end PetStore

proc JiriUpgrades
    put "Not done"
    delay (3000)
end JiriUpgrades

proc Library % Unfinished
    put "Not done, but secret place"
    put "What do you want to read about?"
    put "1. Gobalan 2. The Secret base 3. Crezin 4. Tam-Hutzi 5. Joe"
    get Libraryanswer
    if Libraryanswer = 1 then
	put "Gobalan is an ancient country, usually reigned by a dominant military leader."
    elsif Libraryanswer = 2 then
	put "The HQ in Zeno is an operations base for assassinations and scoutings."
    elsif Libraryanswer = 3 then
	put "Crezin is currently the largest and most powerful force in the world, with a huge technology base."
    elsif Libraryanswer = 4 then
	put "Tam-Hutzi is a small country devoted to the skills and training of Rezla. "
    elsif Libraryanswer = 5 then
	put "Joe is a fake name for the unknown man who works at Zeno Secret Base."
    end if
    getch (waitkey)
end Library

proc Plaza_
    loop
	cls
	colorback (0)
	Pic.Draw (Plaza, 0, 0, picXor)
	Font.Draw (" The GHF Plaza ", 100, 550, intfont, 41)
	Font.Draw (" Where to?: ", 40, 120, intfont, 0)
	Font.Draw ("1 :[The Pet Store] 2 :[Jiri's Upgrades] 3 : [Exit]", 40, 70, intfont1, 11)
	get Plazaanswer
	if Plazaanswer = 1 then
	    PetStore
	elsif Plazaanswer = 2 then
	    JiriUpgrades
	elsif Plazaanswer = 3 then
	    exit
	elsif Plazaanswer = 4 then
	    Library
	else
	    put "Eh, go nowhere?"
	end if
    end loop
    cls
end Plaza_

proc Hospital_
    if Storyline = 2 then
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (Hospital, 0, 0, picXor)
	Font.Draw ("Guess she isn't awake..", 50, 70, intfont1, 54)
	Storyline := 2.1
	getch (waitkey)
    else
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (Hospital, 0, 0, picXor)
	Font.Draw ("The patient is asleep..", 50, 70, intfont1, 57)
	Font.Draw ("(Leave)", 50, 50, intfont1, 57)
	getch (waitkey)
	cls
    end if
end Hospital_

proc Garden
    put "Unfinished"
    put "So what? Now what? Don't you interrupt me."
    delay (5000)
    cls
end Garden

var Explode : int
var Aerial : int
proc AerialExplosion
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 78 - Explode, 45, 78 + Explode, purple)
	Draw.Line (45 - Aerial, 78, 45 + Aerial, 78, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion
proc AerialExplosion2
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 58 - Explode, 45, 58 + Explode, purple)
	Draw.Line (45 - Aerial, 58, 45 + Aerial, 58, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion2
proc AerialExplosion3
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 38 - Explode, 45, 38 + Explode, purple)
	Draw.Line (45 - Aerial, 38, 45 + Aerial, 38, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion3

proc Arclen_
    Hoole := false
    if Track = "Nostalgia" then
    else
	fork playstuffNostalgia
	Track := "Nostalgia"
    end if
    loop
	if Storyline = 1.1 then
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    Pic.Draw (Arclen, 0, 0, picXor)
	    Draw.FillBox (0, 0, maxx, 130, 0)
	    Font.Draw ("Lukvel: ...and then we will kill the Grand Duke or Varmiosa.", 50, 100, intfont1, 43)
	    delay (3000)
	    Font.Draw ("Ravness: Ah, our new recruit just arrived.", 50, 80, intfont1, 40)
	    delay (2000)
	    Font.Draw ("Lukvel: Anyways, we first must pass Western Creile's Gate. ", 50, 60, intfont1, 43)
	    delay (2000)
	    Font.Draw ("Ravness: You. Follow us. ", 50, 40, intfont1, 40)
	    getch (waitkey)
	    Storyline := 1.2
	else
	    if Track = "Nostalgia" then
	    else
		fork playstuffNostalgia
		Track := "Nostalgia"
	    end if
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    Pic.Draw (Arclen, 0, 0, picXor)
	    Draw.FillBox (40, 25, 77, 86, 0)
	    Draw.Box (40, 25, 77, 86, 34)
	    Font.Draw (" [1] To the Hospital ", 50, 70, intfont1, 13)
	    Font.Draw (" [2] To the Gardens ", 50, 50, intfont1, 13)
	    Font.Draw (" [3] To the Subway ", 50, 30, intfont1, red)
	    loop
		mousewhere (rangeX, rangeY, button)
		if (rangeX >= 40 and rangeX <= 240) and (rangeY >= 68 and rangeY <= 88) then
		    AerialExplosion
		    Hoole := true
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 48 and rangeY <= 68) then
		    AerialExplosion2
		    Hoole := true
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 28 and rangeY <= 48) then
		    AerialExplosion3
		    Hoole := true
		end if
		%Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
		if (rangeX >= 40 and rangeX <= 240) and (rangeY >= 68 and rangeY <= 88) and button = 1 then
		    Hospital_
		    exit
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 48 and rangeY <= 68) and button = 1 then
		    Garden
		    exit
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 28 and rangeY <= 48) and button = 1 then
		    Exiting := true
		    exit
		else
		end if
		if Hoole = false then
		    Draw.Line (45, 70, 45, 85, 0)
		    Draw.Line (41, 78, 49, 78, 0)
		    Draw.Line (45, 50, 45, 65, 0)
		    Draw.Line (41, 58, 49, 58, 0)
		    Draw.Line (45, 30, 45, 45, 0)
		    Draw.Line (41, 38, 49, 38, 0)
		else
		end if
		Hoole := false
	    end loop
	end if
	if Exiting = true then
	    exit
	else
	end if
    end loop
    cls
    Exiting := false
end Arclen_

proc Hringe
    put "Unfinished"
    getch (waitkey)
end Hringe

proc Barracks
    put "Unfinished"
    getch (waitkey)
end Barracks

proc MessHall
    put "Unfinished"
    getch (waitkey)
end MessHall

proc TownSquare_
    put "Unfinished"
    getch (waitkey)
end TownSquare_

proc Creile         % [CREILE1]
    Exiting := false
    loop
	loop
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    if Storyline = 6 then
		if CreileFight >= 5 then
		    Storyline := 7
		    Exiting := false
		else
		end if
		if CSA1 = 0 then
		    cls
		    Draw.FillBox (0, 0, maxx, maxy, 151)
		    Font.Draw (" You enter the Castle with Kiru-Beltzam, of 45th platoon. ", 50, 530, intfont1, 58)
		    delay (2000)
		    Font.Draw (" As the horse trots past the gate, you are met with a Town Square. ", 50, 510, intfont1, 58)
		    delay (2000)
		    Font.Draw (" Houses line the skirts of the street, with townspeople staring confused out of their windows.  ", 50, 490, intfont1, 58)
		    delay (2000)
		    Font.Draw (" The troops divert to the Barracks, while the Officers move to the Mess hall. ", 50, 470, intfont1, 58)
		    CSA1 := 1
		else
		end if
		Font.Draw (" Where do you head? ", 50, 300, intfont1, 58)
		delay (500)
		Font.Draw (" [1]Barracks  [2]Mess Hall  [3]Town Square   ", 50, 200, intfont1, 58)
		get CreileStoryanswer
		if CreileStoryanswer = 1 then
		    CreileFight += 1
		    cls
		    if CSA2 = 0 then
			Font.Draw (" You follow the Crezin soldiers into the Barracks.  ", 50, 500, intfont1, 41)
			delay (1000)
			Font.Draw (" It is a large, fortified building with 2 floors and an underground floor. ", 50, 470, intfont1, 41)
			delay (1000)
			Font.Draw (" The beds have belongings at the sides, kept neat and clean as if too much time was spent here.  ", 50, 340, intfont1, 41)
			delay (1000)
			Font.Draw (" You find a spot near the door and sit down.   ", 50, 310, intfont1, 41)
			delay (1000)
			Font.Draw (" Beside the bed is a photograph of a Serf.  ", 50, 280, intfont1, 41)
			delay (1000)
			Font.Draw (" She has braided hair, brown hair, and is indistinguishable from the people on the street.", 50, 250, intfont1, 41)
			delay (1000)
			Font.Draw (" 'A voice shouts: Ye better get ready, the Gobbers'll be commun any time soon fer a thrashin.' ", 50, 200, intfont1, 38)
			getch (waitkey)
			CSA2 := 1
		    else
		    end if
		    cls
		    Font.Draw (" The Barracks ", 10, 500, intfont1, 16)
		    Font.Draw (" [1] Check the bed ", 10, 110, intfont1, 16)
		    Font.Draw (" [2] Talk ", 10, 80, intfont1, 16)
		    Font.Draw (" [3] Exit ", 10, 50, intfont1, 16)
		    get Barracksanswer
		    if Barracksanswer = 1 then
			cls
			Draw.FillBox (0, 0, maxx, maxy, 151)
			Font.Draw (" You look at a note on the bed.", 25, 500, intfont2, 71)
			Font.Draw (" It reads: i luff u", 25, 480, intfont2, 71)
			Font.Draw (" It reads: frum, Seeaira", 25, 460, intfont2, 71)
			getch (waitkey)
		    elsif Barracksanswer = 2 then
			cls
			Draw.FillBox (0, 0, maxx, maxy, 151)
			Font.Draw (" Raliken: I'm not gonna die. I'm not gonna die.", 30, 400, intfont1, 38)
			delay (1300)
			Font.Draw (" Fursaz: You're an assassin, right? Kill them!", 30, 360, intfont1, 38)
			delay (1300)
			Font.Draw (" Yufin: Watch, my gun will spray everywhere! ", 30, 320, intfont1, 38)
			delay (1300)
			Font.Draw (" Torshed: I'm hungry.", 30, 280, intfont1, 38)
			delay (1300)
			Font.Draw (" Yufin: Haha.. this loser thinks he'll survive! *He holds up a letter he pulls from the bed*", 30, 240, intfont1, 38)
			delay (1300)
			Font.Draw (" Raliken: Put that down, who knows?", 30, 200, intfont1, 38)
			delay (1300)
			Font.Draw (" Torshed: The Mess Hall! ", 30, 160, intfont1, 38)
			getch (waitkey)
		    elsif Barracksanswer = 3 then
			exit
		    end if
		elsif CreileStoryanswer = 2 then
		    CreileFight += 1
		    cls
		    Draw.FillBox (0, 0, maxx, maxy, 151)
		    if CSA3 = 0 then
			Font.Draw (" You follow the Captain and Lieutenants into the Mess Hall. (Perobia)  ", 50, 500, intfont1, 41)
			delay (1300)
			Font.Draw (" Inside, a frightened Friar and cooks are busy churning up hot Beetroot and carrot soup.  ", 50, 480, intfont1, 41)
			delay (1300)
			Font.Draw (" Vanilla tarts with strawberry filling, a meal of oat and porridge are on the menu list.  ", 50, 460, intfont1, 41)
			delay (1300)
			Font.Draw (" [Cpt.]Kiru-Beltzam seats himself and everyone else follows suit. People begin to yell at the cooks.  ", 10, 440, intfont1, 41)
			delay (1300)
			getch (waitkey)
			Font.Draw (" 'Marm, over here, giff me a good 'ole bowl of soup.'  ", 10, 420, intfont1, 41)
			delay (2500)
			Font.Draw (" 'No,no, cook give iffo me!'  ", 10, 400, intfont1, 41)
			delay (700)
			Font.Draw (" 'Shaddap, you two! Friar, send those tarts this way!'  ", 10, 380, intfont1, 41)
			delay (300)
			Font.Draw (" 'Hey, that's mine!'  ", 10, 360, intfont1, 41)
			delay (100)
			Font.Draw (" 'No, it's mine!'  ", 10, 340, intfont1, 41)
			delay (1000)
			Font.Draw (" 'Excuse me, do you have any spoons?'  ", 10, 320, intfont1, 41)
			delay (560)
			Font.Draw (" 'No one wants porridge. All for me!'  ", 10, 300, intfont1, 41)
			delay (273)
			Font.Draw (" 'Friar, the spoons? You're not busy, are you?'  ", 10, 280, intfont1, 41)
			delay (678)
			Font.Draw (" 'Hey, my bowl's dirty!'  ", 10, 260, intfont1, 41)
			delay (900)
			Font.Draw (" 'Mmm.. this soup's delicious! Hot and steamy.'  ", 10, 240, intfont1, 41)
			getch (waitkey)
			Font.Draw (" The Kitchen crew are running willy-nilly in the attempt to feed the hungry officers.  ", 10, 220, intfont1, 41)
			delay (1500)
			Font.Draw (" 'This might be your last meal, so eat well,' says a cook.  ", 50, 200, intfont1, 54)
			delay (2500)
			Font.Draw (" Silence betroths the room.  ", 100, 180, intfont1, 0)
			delay (1500)
			Font.Draw (" Heads turn.                                          Eyes scan. ", 10, 160, intfont1, 0)
			delay (1000)
			Font.Draw (" The other cooks push the culprit out. He panics, shoving other cooks out of the way to flee. ", 10, 140, intfont1, 41)
			delay (2200)
			Font.Draw (" The Lieutenants look at each other.  ", 10, 120, intfont1, 41)
			delay (1500)
			Font.Draw (" Hah.. we won't die! Maybe a few soldiers.  ", 10, 100, intfont1, 38)
			getch (waitkey)
			CSA3 := 1
		    else
		    end if
		    cls
		    Draw.FillBox (0, 0, maxx, maxy, 0)
		    Font.Draw (" [1]Eat  ", 10, 140, intfont1, 72)
		    Font.Draw (" [2]Talk  ", 10, 110, intfont1, 72)
		    Font.Draw (" [3]Leave  ", 10, 80, intfont1, 72)
		    get MessHallStoryanswer
		    if MessHallStoryanswer = 1 then
			Font.Draw (" You're amazed at how fast the cooks prepare food. They must have been feeding lots of mouths everyday.  ", 10, 400, intfont1, 54)
			getch (waitkey)
		    elsif MessHallStoryanswer = 2 then
			Font.Draw (" [Cpt.]Kiru-Beltzam: Har! This food's not too good, but it'll do.  ", 10, 370, intfont1, 38)
			delay (1500)
			Font.Draw (" [Lt.]Shaffer: Wot you say, tubby? You want more?  ", 10, 340, intfont1, 38)
			delay (500)
			Font.Draw (" [Cpt.]Kiru-Beltzam: Tubby, he calls me! This guy's a walking bag of provisions!  ", 10, 310, intfont1, 38)
			delay (100)
			Font.Draw (" [Mjr.]Curcinagr: I'm going to eat light, battle before dusk.  ", 10, 280, intfont1, 38)
			delay (1000)
			Font.Draw (" [Cpt.]Kiru-Beltzam: Oh, so the walking stick can't handle the mighty bowl of porridge. Boo hoo!  ", 10, 250, intfont1, 38)
			delay (900)
			Font.Draw (" [Mjr.]Curcinagr: 'Xcuse me?!1  ", 10, 220, intfont1, 38)
			delay (500)
			Font.Draw (" [Cpt.]Kiru-Beltzam: *Guffaw* Does he speak english? Why'd he say one after that?  ", 10, 190, intfont1, 38)
			delay (1400)
			Font.Draw (" [Lt.]Shaffer: He's choking on the porridge, lard bath. Watch out.  ", 10, 160, intfont1, 38)
			getch (waitkey)
		    elsif MessHallStoryanswer = 3 then
			exit
		    else
		    end if
		elsif CreileStoryanswer = 3 then
		    CreileFight += 1
		    cls
		    Draw.FillBox (0, 0, maxx, maxy, 151)
		    if CSA4 = 0 then
			Font.Draw (" You follow Ravness, Lukvel, Jasqur and Na-Long into the Town Square.  ", 50, 550, intfont1, 54)
			delay (1100)
			Font.Draw (" The area is a large, cobblestone laden centerpiece adorned with Mountain poppies.  ", 50, 530, intfont1, 54)
			delay (1100)
			Font.Draw (" In the middle, an old fountain spurts water at a lopsided pond.   ", 50, 510, intfont1, 54)
			delay (1100)
			Font.Draw (" The place is packed with the townspeople, all clamouring around a higher platform.  ", 50, 490, intfont1, 54)
			delay (1100)
			Font.Draw (" On it, a man is shouting.  ", 50, 470, intfont1, 54)
			delay (1100)
			Font.Draw (" Rebel: We let our soldiers leave us, and the enemy arrives!  ", 50, 450, intfont1, 54)
			delay (1100)
			Font.Draw (" How can we live with our hearts in betrayal, our hands of no faith?  ", 50, 430, intfont1, 54)
			delay (1100)
			Font.Draw (" Must we allow the Evil stretch of Crezin to taint our families?  ", 50, 410, intfont1, 54)
			delay (1100)
			Font.Draw (" Our loved ones?  ", 50, 390, intfont1, 54)
			delay (1100)
			Font.Draw (" Your children?  ", 50, 370, intfont1, 54)
			delay (1100)
			Font.Draw (" We can stop this! Arm yourselves with a dangerous tool, and like angels, purge these tyrants!  ", 50, 350, intfont1, 54)
			delay (1100)
			Font.Draw (" People: 'Yeah!' 'That's right!' 'Only sense is truth!'  ", 50, 330, intfont1, 54)
			delay (1100)
			Font.Draw (" Na-Long arrives into the throng of the crowd. ", 50, 310, intfont1, 10)
			delay (1100)
			getch (waitkey)
			cls
			Draw.FillBox (0, 0, maxx, maxy, 151)
			Font.Draw (" Na-Long: 'Heyth! Ifth weef attackith thath Crebin solthers, welf dieth!' ", 50, 400, intfont1, 10)
			delay (1100)
			Font.Draw (" Na-Long: 'How can weef listen to doth worth of dangerf? ' ", 50, 380, intfont1, 10)
			delay (1100)
			Font.Draw (" Na-Long: 'Our childrenth will beef orfans, the pain and hungreth in dere eyesh!' ", 50, 360, intfont1, 10)
			delay (1100)
			Font.Draw (" Na-Long: 'Quell thith foe, as he is a worker of harbinging!' ", 50, 340, intfont1, 10)
			delay (1100)
			Font.Draw (" Person: 'I agree! Ask yourself, who is paid to do nothing? ", 50, 320, intfont1, 54)
			delay (1100)
			Font.Draw (" Person: 'Who gets paid to raid your stores, filth my floors, and beat my sons?' ", 50, 300, intfont1, 54)
			delay (1100)
			Font.Draw (" Person: 'Crezin is a prosperous country. Would it do any harm to be lead by them?' ", 50, 280, intfont1, 54)
			delay (1100)
			Font.Draw (" Person: 'Might there riches spread among us?' ", 50, 260, intfont1, 54)
			delay (1100)
			Font.Draw (" Rebel: 'I'll kill ye! Traiterous bastards, you only folly upon the comfort of your limbs, ", 50, 240, intfont1, 0)
			delay (200)
			Font.Draw (" Rebel:  the full of your stomach!' ", 50, 220, intfont1, 0)
			delay (1100)
			Font.Draw (" Person: 'Is that not what man needs to suffice? How can you withhold life?' ", 50, 200, intfont1, 54)
			delay (1100)
			Font.Draw (" Na-Long: Raaaaaahhhhhhghhh!! ", 190, 150, intfont1, 10)
			getch (waitkey)
			NaLongVsRebel
			Money := Money + EnemyMoney
			Experience := Experience + EnemyExperience
			cls
			Draw.FillBox (0, 0, maxx, maxy, 151)
			Font.Draw (" The Rebel stares aghast at the wooden protruding through his lung. He had attained 7 fatal wounds. ", 10, 500, intfont1, 54)
			delay (400)
			Font.Draw (" His struggles over, he falls down over the podium and onto a mass of observers. ", 20, 460, intfont1, 54)
			delay (1000)
			Font.Draw (" They quickly part so the body cracks upon the ground. ", 30, 420, intfont1, 54)
			delay (500)
			Font.Draw ("   T  H  U  D", 100, 260, intfont, 44)
			delay (1000)
			Font.Draw (" Na-Long: 'How can you trust a leader that can't fight? He lofth to me, a pharmer!' ", 10, 200, intfont1, 10)
			delay (1100)
			Font.Draw (" Person: 'Yeah. That was cool though, was it Kung fu?' ", 10, 160, intfont1, 54)
			delay (200)
			Font.Draw (" Another Person: 'Agreed! The loser calling for us to fight - absurd!' ", 10, 120, intfont1, 54)
			getch (waitkey)
			CSA4 := 1
		    else
		    end if
		    cls
		    Font.Draw (" [1]Ca' d'Oro ", 50, 100, intfont1, 57)
		    Font.Draw (" [2]Na-Long ", 50, 80, intfont1, 57)
		    Font.Draw (" [3]Jasqur ", 50, 60, intfont1, 57)
		    Font.Draw (" [4]Exit ", 50, 40, intfont1, 57)
		    get TownSquareanswer
		    if TownSquareanswer = 1 then
			cls
			Font.Draw (" The House plate says: Estate of Branel ", 200, 495, intfont, 54)
			getch (waitkey)
		    elsif TownSquareanswer = 2 then
			cls
			Font.Draw (" Na-Long: I lied about being a farmer. ", 100, 370, intfont1, 10)
			delay (1300)
			Font.Draw (" Na-Long: I'm actually Adreizu's Special Ops Commander. ", 100, 330, intfont1, 10)
			delay (600)
			Font.Draw (" Na-Long: You should visit the Barracks and Mess Hall.. get ready to fight. ", 100, 290, intfont1, 10)
			getch (waitkey)

		    elsif TownSquareanswer = 3 then
			cls
			Font.Draw (" Jasqur: Yeah.. Na Long's an interesting girl. ", 10, 430, intfont1, 33)
			delay (1800)
			Font.Draw (" Jasqur: You didn't notice? He had a gender change. ", 10, 400, intfont1, 33)
			delay (500)
			Font.Draw (" He looks pretty masculine to me.. ", 50, 370, intfont1, 54)
			getch (waitkey)
			Font.Draw (" Jasqur: Uh huh.. I didn't know it too, when I met him. Her. ", 10, 340, intfont1, 33)
			delay (1000)
			Font.Draw (" Jasqur: Nice stop to that upstart, eh?", 10, 310, intfont1, 33)
			delay (1000)
			Font.Draw (" Jasqur: You want to know more about me? Nahh.. you don't.", 10, 280, intfont1, 33)
			delay (500)
			Font.Draw (" Jasqur: I'm not telling you, because you don't want to know!", 10, 250, intfont1, 33)
			getch (waitkey)
		    elsif TownSquareanswer = 4 then
			exit
		    else
		    end if
		else
		end if
	    elsif Storyline = 7 then
		CreileStoryLine7Fight
	    else
		if Track = "Nostalgia" then
		else
		    fork playstuffNostalgia
		    Track := "Nolstalgia"
		end if
		Pic.Draw (CreilePic, 0, 0, picXor)
		colour (18)
		put " Money: ", Money, " Experience: ", Experience, " Level: ", Level
		colour (53)
		put "  Hp: ", Hp, "/", THp, " Attack: ", Damage, " Intelligence: ", Intelligence, " Mana: ", Mana, "/", TMana, " Speed: ", Speed
		colour (35)
		put "  Track playing: ", Track
		Font.Draw (" Visit the massive Castle of Creile ", 100, 378, intfont1, 56)
		Font.Draw ("  Train in the Grounds ", 90, 348, intfont1, 57)
		Font.Draw ("  Barracks ", 90, 326, intfont1, 57)
		Font.Draw ("  Mess Hall ", 90, 304, intfont1, 57)
		Font.Draw ("  The Town Square ", 90, 282, intfont1, 57)
		Font.Draw ("  Tima ", 90, 260, intfont1, 57)
		Boole := false
		loop
		    mousewhere (rangeX, rangeY, button)
		    if (rangeX >= 90 and rangeX <= 330) and (rangeY >= 346 and rangeY <= 367) then
			Draw.Box (88, 355, 91, 358, 12)
			Boole := true
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 324 and rangeY <= 343) then
			Draw.Box (88, 333, 91, 336, 12)
			Boole := true
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 302 and rangeY <= 321) then
			Draw.Box (88, 311, 91, 314, 12)
			Boole := true
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 280 and rangeY <= 299) then
			Draw.Box (88, 289, 91, 292, 12)
			Boole := true
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 258 and rangeY <= 277) then
			Draw.Box (88, 267, 91, 270, 12)
			Boole := true
		    end if
		    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
		    if (rangeX >= 90 and rangeX <= 330) and (rangeY >= 346 and rangeY <= 367) and button = 1 then
			Training2
			Exiting := false
			exit
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 324 and rangeY <= 343) and button = 1 then
			Barracks
			Exiting := false
			exit
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 302 and rangeY <= 321) and button = 1 then
			MessHall
			Exiting := false
			exit
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 280 and rangeY <= 299) and button = 1 then
			TownSquare_
			Exiting := false
			exit
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 258 and rangeY <= 277) and button = 1 then
			Exiting := true
			exit
		    else
		    end if
		    if Boole = false then
			Draw.Box (88, 355, 91, 358, 0)
			Draw.Box (88, 333, 91, 336, 0)
			Draw.Box (88, 311, 91, 314, 0)
			Draw.Box (88, 289, 91, 292, 0)
			Draw.Box (88, 267, 91, 270, 0)
		    else
		    end if
		    delay (50)
		    Boole := false
		end loop
		if Exiting = true then
		    exit
		else
		end if
		Exiting := false
	    end if
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
end Creile

proc Tima
    % Cutscene
    var TimaMission1answer : int
    var TimaCutsceney : int
    var TimaCutsceney2 : int
    var ColourChange : int
    ColourChange := 16
    TimaCutsceney := 560
    TimaCutsceney2 := 10
    var TimaTrainx : int
    var TimaTrainy : int
    cls
    loop
	TimaTrainx := Rand.Int (-5, 5)
	TimaTrainy := Rand.Int (-10, 10)
	Pic.Draw (Subway, TimaTrainx, TimaTrainy, picCopy)
	Draw.FillBox (0, 570, maxx, TimaCutsceney, 16)
	Draw.FillBox (0, 0, maxx, TimaCutsceney2, 16)
	TimaCutsceney -= 9
	TimaCutsceney2 += 4
	delay (75)
	exit when TimaCutsceney <= 215
    end loop
    loop
	Mouse.Where (rangeX, rangeY, button)
	ColourChange += 1
	Font.Draw (" T I M A    M A N S I O N", 10, 130, intfont, ColourChange)
	if ColourChange >= 31 or button = 1 then
	    exit
	else
	end if
	delay (200)
    end loop
    delay (500)
    loop
	if MArray (1) = 1 then
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 151)
	    Pic.Draw (TimaPic, 0, 0, picCopy)
	    Pic.Draw (Speech, 0, 0, picCopy)
	    Font.Draw (" You see a grey tabby on the garden's largest tree.", 10, 120, intfont1, 54)
	    delay (1000)
	    Font.Draw (" She's too high for you to climb to. What do you call?", 10, 90, intfont1, 54)
	    delay (400)
	    Font.Draw (" [1] Fhesh!", 10, 70, intfont1, 54)
	    Font.Draw (" [2] Flesh!", 10, 50, intfont1, 54)
	    Font.Draw (" [3] Here, kitty!", 10, 30, intfont1, 54)
	    get TimaMission1answer
	    if TimaMission1answer = 1 then
		MArray (1) := 2
		Font.Draw (" The cat looks interestingly at you.", 10, 5, intfont1, 16)
		getch (waitkey)
		Pic.Draw (Speech, 0, 0, picCopy)
		Font.Draw (" The cat falls into your arms.", 10, 120, intfont1, 54)
		Font.Draw (" It appears to be at ease. ", 10, 90, intfont1, 54)
		Font.Draw (" (Take her to Zeno HQ)", 10, 45, intfont1, 16)
		getch (waitkey)
		exit
	    elsif TimaMission1answer = 2 then
		Font.Draw (" The cat glares at you and disappears into the tree.", 10, 5, intfont1, 16)
		delay (1000)
		exit
	    elsif TimaMission1answer = 3 then
		Font.Draw (" The cat doesn't respond.", 10, 5, intfont1, 16)
		delay (1000)
		exit
	    else
		Font.Draw (" The cat looks at you in an odd way.", 10, 5, intfont1, 16)
		delay (1000)
		exit
	    end if
	elsif Storyline = 5 then
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 151)
	    Pic.Draw (TimaPic, 0, 0, picCopy)
	    Pic.Draw (Speech, 0, 0, picCopy)
	    Font.Draw (" As you approach the Mansion, a Crezin soldier stops you.", 10, 130, intfont1, 54)
	    delay (1500)
	    Font.Draw (" 'Halt! Stop immediately, or face a gunshot! [Shot] Identify youself! ", 30, 115, intfont1, 42)
	    delay (1500)
	    Font.Draw (" [1] I am an Assassin under Tam-Hutzi. Move, or die. ", 30, 100, intfont1, 42)
	    Font.Draw (" [2] Seriously? Who do you think you are? ", 30, 85, intfont1, 42)
	    Font.Draw (" [3] *Sarcastically* A Gobalani General, of course.", 30, 70, intfont1, 42)
	    get TimaStory5answer
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 151)
	    Pic.Draw (TimaPic, 0, 0, picCopy)
	    Pic.Draw (Speech, 0, 0, picCopy)
	    if TimaStory5answer = 1 then
		Font.Draw (" O...ok!! I'll get Ravness. ", 30, 130, intfont1, 42)
	    elsif TimaStory5answer = 2 then
		Font.Draw (" What?? I'm Officer. Kiru-Beltzam, of 45th platoon! Stay there. ", 30, 130, intfont1, 42)
	    elsif TimaStory5answer = 3 then
		Font.Draw (" 'Yraagghhh!' He flees, to return hiding behind Ravness. ", 30, 130, intfont1, 42)
	    else
		Font.Draw (" O...ok!! I'll get Ravness. ", 30, 130, intfont1, 42)
	    end if
	    delay (1500)
	    Font.Draw (" Ravness: Oh, that's our new member. Nothing to worry about. Back to your post. ", 100, 115, intfont1, 40)
	    delay (1500)
	    Font.Draw (" Ok.. *eyes you suspiciously* ", 30, 100, intfont1, 42)
	    delay (1500)
	    Font.Draw (" You poke him as you walk by. ", 30, 85, intfont1, 54)
	    delay (1500)
	    Font.Draw (" Eghrhh!! Shoo!! Stay away from me! *Squealing noises* ", 30, 70, intfont1, 42)
	    delay (1500)
	    getch (waitkey)
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 151)
	    Pic.Draw (Ravness, 200, 120, picCopy)
	    Font.Draw (" Ravness: A quick summary during your absence. We've received around 110 soldiers, including the CMDR. ", 10, 100, intfont2, 40)
	    delay (1500)
	    Font.Draw (" Ravness: They're able men and women, with varying styles and skill. We're almost off. ", 10, 70, intfont1, 40)
	    delay (1500)
	    Font.Draw (" Meet us at Creile. ", 100, 40, intfont1, 40)
	    Storyline := 6
	    getch (waitkey)
	else
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    Pic.Draw (TimaPic, 0, 0, picCopy)
	    Draw.Box (50, 190, 150, 220, 0)
	    Draw.Box (50, 140, 150, 170, 0)
	    Draw.Box (50, 90, 150, 120, 0)
	    Font.Draw (" Destination ", 50, 270, intfont2, 53)
	    Font.Draw (" Creile Castle ", 50, 200, intfont1, 54)
	    Font.Draw (" Hringe River ", 50, 150, intfont1, 54)
	    Font.Draw (" Subway ", 50, 100, intfont1, 54)
	    loop
		mousewhere (rangeX, rangeY, button)
		if (rangeX >= 50 and rangeX <= 150) and (rangeY >= 190 and rangeY <= 220) then
		    Draw.Box (50, 190, 150, 220, 11)
		    Boole := true
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 140 and rangeY <= 170) then
		    Draw.Box (50, 140, 150, 170, 11)
		    Boole := true
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 90 and rangeY <= 120) then
		    Draw.Box (50, 90, 150, 120, 11)
		    Boole := true
		else
		end if
		%Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
		if (rangeX >= 50 and rangeX <= 150) and (rangeY >= 190 and rangeY <= 220) and button = 1 then
		    Creile
		    Exiting := false
		    exit
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 140 and rangeY <= 170) and button = 1 then
		    Hringe
		    Exiting := false
		    exit
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 90 and rangeY <= 120) and button = 1 then
		    Exiting := true
		    exit
		else
		end if
		if Boole = false then
		    Draw.Box (50, 190, 150, 220, 0)
		    Draw.Box (50, 140, 150, 170, 0)
		    Draw.Box (50, 90, 150, 120, 0)
		else
		end if
		delay (50)
		Boole := false
	    end loop
	    if Exiting = true then
		exit
	    else
	    end if
	    Exiting := false
	end if
    end loop
end Tima

proc Hezlow
    put "Contact admin."
    delay (5000)
end Hezlow

proc Story
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    if Storyline = 1 then
	Font.Draw (" Joe pulls you aside and slips you a piece of paper. Then he vanishes. ", 100, 550, intfont1, 14)
	delay (3000)
	Font.Draw (" Read the paper? (1) Yes (2) No ", 100, 530, intfont1, 0)
	get Paperanswer
	if Paperanswer = 1 then
	    Font.Draw (" As you unfold it, the stench of the farmer fans out.", 100, 510, intfont1, 54)
	elsif Paperanswer = 2 then
	    Font.Draw (" You drop it, to realize that the paper is open. You read it anyways.", 100, 510, intfont1, 54)
	else
	    Font.Draw (" No one knows what you type.. but you open the paper.", 100, 510, intfont1, 54)
	end if
	delay (1500)
	Font.Draw (" Dear Dhun. I... I have your cousin. ", 10, 480, intfont2, 10)
	Font.Draw (" She's safe with me. Don't worry about the Gornstagg Spear. ", 10, 460, intfont2, 10)
	Font.Draw (" I'll make sure no one will ever find out about it. ", 10, 440, intfont2, 10)
	Font.Draw (" I know we're in hard times as of now, but fate will find us worthy to press on in battle. ", 10, 420, intfont2, 10)
	Font.Draw (" I fear the worst for our Western front. We have only 15 guards stationed there. ", 10, 400, intfont2, 10)
	Font.Draw (" My only concern is of an assassin group known as Trazel. They will likely slip through the West and pursue a route ", 10, 380, intfont2, 10)
	Font.Draw (" to the Mansion.", 10, 360, intfont2, 10)
	Font.Draw (" As of this letter, I will be hidden in the barn as a Blueneck. My wishes to the messenger Heggelsnoa. Pay him well. ", 10, 340, intfont2, 10)
	Font.Draw ("                                   - Signed  [Kl. Jarhen ]. ", 10, 240, intfont2, 10)
	getch (waitkey)
	cls
	colorback (151)
	Font.Draw (" Isn't Dhun the leader of Gobalan..? ", 100, 500, intfont1, 40)
	delay (2000)
	Font.Draw (" Who is Kl. Jarhen.. and how did Joe get the paper? ", 100, 450, intfont1, 40)
	delay (2000)
	Font.Draw (" Why is Joe's name so simple...? ", 100, 400, intfont1, 40)
	delay (2000)
	Font.Draw (" Hmmm... the note mentioned a mansion... maybe the Temple can help. ", 100, 350, intfont1, 40)
	Storyline := 1.1
	getch (waitkey)
	Draw.FillBox (0, 0, maxx, maxy, 0)
    elsif Storyline = 1.1 then
	Font.Draw (" To the Temple. ", 100, 350, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 1.2 then
	Font.Draw (" -On route to Creile- ", 50, 500, intfont1, 0)
	delay (4500)
	Font.Draw (" As you approach the gate, a man jumps on front of Lukvel's horse. ", 50, 350, intfont1, 40)
	delay (1500)
	Font.Draw (" Je'xclim: Heheee.... you think you can best the Mighty Je'xclim?! ", 80, 330, intfont1, 48)
	delay (1500)
	Font.Draw (" Luvkel: I'll handle this.  ", 100, 310, intfont1, 43)
	delay (2500)
	Font.Draw (" Je'xclim: 'I'll handle this' he says. Hah! Such confident words- I'll put them on your coffin! ", 80, 290, intfont1, 48)
	delay (2500)
	Font.Draw (" Luvkel: Out of my way, infidel!  ", 100, 270, intfont1, 43)
	delay (2500)
	Font.Draw (" Je'xclim: I'll tickle yer throat wit' me blade! ", 80, 250, intfont1, 48)
	delay (2500)
	Font.Draw (" Ravness: Oh no, you're not going to fight, are you? ", 100, 230, intfont1, 40)
	delay (2500)
	Font.Draw (" Lukvel: Ahgrhhh!!! I'll shove my sword up your ass!  ", 100, 210, intfont1, 43)
	delay (500)
	Font.Draw (" Je'xclim: Mggreeerrr!!.. Myaaaa!!!! Double Slash! ", 80, 190, intfont1, 48)
	getch (waitkey)
	Jexclim_
	Lukvel_
	fork playstuffWhyInst
	Track := "Why, or why not"
	EnemyTurn := 0
	loop
	    loop
		cls
		Draw.FillBox (0, 0, maxx, maxy, 0)
		colorback (0)
		Pic.Draw (Lukvel, 20, 110, picXor)
		Pic.Draw (Jexclim, 500, 110, picXor)
		NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
		EnemyHpbar (EnemyHp, EnemyTHp)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 560)
		put " Lukvel's Turn"
		delay (3000)
		NiceChoice := Rand.Int (1, 6)
		if NiceChoice = 1 then
		    Attacked := (2 * 0.3 + 2.4) * Rand.Int (90, 121) + (NiceSpeed * 1)
		    EnemyHp := EnemyHp - Attacked
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " I call upon you, ZENO! Defense Increased: ", Attacked
		elsif NiceChoice = 2 then
		    Attacked := (2 * 0.14 + 2) + NiceDamage / 100 * Rand.Int (100, 150)
		    EnemyHp := EnemyHp - Attacked
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " Burnn..... in HELL. Damage dealt: ", Attacked
		elsif NiceChoice = 3 then
		    Attacked := (4 * 0.43 + 1.57) * NiceDamage * 0.73 / 100 * Rand.Int (70, 160) + NiceIntelligence
		    EnemyHp := EnemyHp - Attacked
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " Freeze the enemy, WHITE TUNDRA! (Freeze) Damage dealt: ", Attacked
		elsif NiceChoice = 4 then
		    Attacked := (2 * 0.62 + 1.9) * NiceDamage * 1.7 / 100 * Rand.Int (1, 999)
		    EnemyHp := EnemyHp - Attacked
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " Come to me, my Einherjars.. (KILL)Damage dealt: ", Attacked
		elsif NiceChoice = 5 then
		    NiceHp := NiceTHp
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " Wounds, revile! Amount healed: ", Attacked
		elsif NiceChoice = 6 then
		    Attacked := 5.55 * NiceDamage / 100 * Rand.Int (90, 167) + NiceIntelligence
		    EnemyHp := EnemyHp - Attacked
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (0, 560)
		    put " I will destroy you, with the FIRE-SPARK!! (Explosion) Damage dealt: ", Attacked
		end if
		if NiceHp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		else
		end if
		Draw.FillBox (500, 30, 600, 40, 0)
		EnemyHpbar (EnemyHp, EnemyTHp)
		delay (1500)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (10, 560)
		put " Je'xclim's turn"
		delay (4000)
		EnemyChoice := Rand.Int (1, 5)
		EnemyTurn := EnemyTurn + 1
		if EnemyTurn <= 0 then
		    put "Frozen.. No damage"
		    exit
		end if
		if EnemyChoice = 1 then
		    Attacked := EnemyDamage + EnemySpeed - NiceSpeed + Rand.Int (10, 50)
		    NiceHp := NiceHp - Attacked
		    put "I will find the power within me! Damage Dealt: ", Attacked
		elsif EnemyChoice = 2 then         %% put enemy skill procedures here
		    Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 150) + EnemyIntelligence
		    NiceHp := NiceHp - Attacked
		    put "Volcanoes, do not hesitate. Damage Dealt: ", Attacked
		elsif EnemyChoice = 3 then
		    Attacked := EnemyDamage * 0.7 + Rand.Int (90, 300)
		    NiceHp := NiceHp - Attacked
		    put "I shall wreck you! : ", Attacked
		elsif EnemyChoice = 4 then
		    Attacked := EnemyDamage * 1.3
		    NiceHp := NiceHp - Attacked
		    put "Whorls; of hair! Damage Dealt: ", Attacked
		elsif EnemyChoice = 5 then
		    Attacked := EnemyDamage * 3
		    NiceHp := NiceHp - Attacked
		    put "Soit - Sut - Sain! 3 slices doing: ", Attacked
		end if
		delay (1500)
		if NiceHp <= 0 then
		    exit
		elsif EnemyHp <= 0 then
		    exit
		end if
		cls
	    end loop
	    delay (1500)
	    if EnemyHp <= 0 then
		exit
	    elsif NiceHp <= 0 then
		cls
		Failed
		cls
	    end if
	end loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 151)
	Font.Draw (" Lukvel stabs the man with his claws.. ", 50, 350, intfont1, 54)
	delay (2500)
	Font.Draw (" Je'xclim stares up, blankly. Then with his last breath: ", 50, 330, intfont1, 54)
	delay (1500)
	Font.Draw (" Je'xclim: Im...imposii....you'll never find the Gornstagg.", 50, 310, intfont1, 48)
	delay (1500)
	Font.Draw (" Ravness: Let's go. As for you, you need more training.", 50, 290, intfont1, 40)
	delay (1500)
	Font.Draw (" Ravness: Do you know the Temple where we met, Arclen? Go there.", 50, 270, intfont1, 40)
	delay (1500)
	Font.Draw (" Ravness: There's an injured patient in there. You should meet her.", 50, 250, intfont1, 40)
	Storyline := 2
	getch (waitkey)
    elsif Storyline = 2 then
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (Ravness, 50, 70, picXor)
	Font.Draw (" Meet the girl at Arclen Temple", 30, 30, intfont1, 40)
	getch (waitkey)
	cls
    elsif Storyline = 2.1 then
	Font.Draw (" Joe: Hey. Come here.", 50, 250, intfont1, 11)
	delay (2000)
	Font.Draw (" You come here.", 50, 190, intfont1, 54)
	delay (2000)
	Font.Draw (" Joe: I found more info on the Creile Gate. Read this.", 50, 230, intfont1, 11)
	delay (2000)
	Font.Draw (" Joe vanishes.", 50, 210, intfont1, 0)
	delay (2000)
	Font.Draw (" Ill tidings, Your Majesty.", 50, 150, intfont2, 10)
	Font.Draw (" The assassins have killed my Stunt Double and Guiha's Double. Also, Je'xclim is reported as missing.", 50, 130, intfont2, 10)
	Font.Draw (" We can only assume the worst. Please send us Elite Shoulders 4-Y. We request 50 units.", 50, 110, intfont2, 10)
	Font.Draw (" I can only expect that the assassins have perpetrated into the Creile area. We have been pierced.", 50, 90, intfont2, 10)
	Font.Draw (" It's colder than a witch's teat out here. I hope you have good dreams.", 50, 70, intfont2, 10)
	Font.Draw ("      - [Kl. Jarhen] P.S Give tidings to the messenger, Hegglesnoa", 200, 30, intfont2, 10)
	getch (waitkey)
	cls
	colorback (151)
	Font.Draw (" How did Joe get more messages..? ", 100, 500, intfont1, 40)
	delay (2000)
	Font.Draw (" Who is Kl. Jarhen.. the Blue Farmer? ", 100, 450, intfont1, 40)
	delay (2000)
	Font.Draw (" Is the messenger a double cross? ", 100, 400, intfont1, 40)
	delay (2000)
	Font.Draw (" Hmmm... the note mentioned Creile.... maybe the Plaza can help me prepare for it. ", 100, 350, intfont1, 40)
	Storyline := 3
	getch (waitkey)
	cls
	Pic.Draw (JexclimAnimation1, 0, 0, picCopy)
	delay (3000)
	Pic.Draw (JexclimAnimation2, 0, 0, picCopy)
	delay (200)
	Pic.Draw (JexclimAnimation3, 0, 0, picCopy)
	Pic.Draw (Speech, 0, 0, picCopy)
	Font.Draw (" I... Je'xclim.. cannot die!  ", 50, 50, intfont1, 48)
	delay (3000)
    elsif Storyline = 3 then
	Font.Draw (" You can buy pets at the Plaza and Enhancements.", 50, 250, intfont1, 54)
	getch (waitkey)
    elsif Storyline = 4 then
	Font.Draw (" Ravness: Hey, we've obtained an encoded message from Joe. ", 50, 550, intfont1, 40)
	delay (1000)
	Font.Draw (" Ravness: He is currently within the walls of Creile Fortress. (Castle) ", 50, 520, intfont1, 40)
	delay (1000)
	Font.Draw (" Ravness: You can read it if you like.. :: [Y]Yes - [N]No ::", 50, 490, intfont1, 40)
	get Storyline4answer
	if Storyline4answer = "y" or Storyline4answer = "Y" then
	    Font.Draw (" You unfold the crinkled paper. ", 50, 465, intfont1, 40)
	elsif Storyline4answer = "n" or Storyline4answer = "N" then
	    Font.Draw (" Ravness gives it to you anyways, and you read it. ", 50, 465, intfont1, 40)
	else
	    Font.Draw (" The nonsense coming from your mouth suggests you want to read it. ", 50, 465, intfont1, 40)
	end if
	delay (1000)
	Font.Draw (" I am currently inside the bedroom of Cmdr. Anscelsior-Haltin. He was sweet talking a hairy 'playmate' ", 50, 420, intfont2, 11)
	Font.Draw (" when he found out there was a knife attached to his lungs. The 'bedtime friend' also found it a surprise ", 50, 400, intfont2, 11)
	Font.Draw (" when his/her head could fall into his/her hands. ", 50, 380, intfont2, 11)
	Font.Draw (" Anyways, I have masked myself as the Commander and am mobilizing all of the forces to the mountains. ", 50, 360, intfont2, 11)
	Font.Draw (" I want you to bring Crezin Troops to reinforce the castle. There, the half starved and dazed troops ", 50, 340, intfont2, 11)
	Font.Draw (" will return to blades at gunpoint. Sounds nice, eh? ", 50, 320, intfont2, 11)
	Font.Draw (" Upgrade your skills, and level - up. We need strong people here. - [Joe] ", 50, 300, intfont2, 11)
	getch (waitkey)
	Font.Draw (" Ravness: It looks like we're off to Tima. We can recruit there. ", 50, 260, intfont1, 40)
	getch (waitkey)
	Storyline := 5
    elsif Storyline = 5 then
	Font.Draw (" Go to Tima ", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 6 then
	Font.Draw (" To Castle Creile", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 7 then
	Font.Draw (" Help Joe at Creile ", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 8 then
	Font.Draw (" Joe: A successful mission, just like always. ", 10, 500, intfont1, 11)
	delay (1000)
	Font.Draw (" Jasqur: Hmph. You do know it wasn't a solo? ", 10, 470, intfont1, 33)
	delay (1000)
	Font.Draw (" Joe: Eh, solo. That reminds me, I gotta finish this tab. ", 10, 440, intfont1, 11)
	delay (1000)
	Font.Draw (" Jasqur: A tab? You mean.. those notes in Zeno? ", 10, 410, intfont1, 33)
	delay (1000)
	Font.Draw (" Joe: Yeah. Did you check them out? ", 10, 380, intfont1, 11)
	delay (1000)
	Font.Draw (" Jasqur: No.. looked like Frizul's scraps to me. Crazy old guy. ", 10, 350, intfont1, 33)
	delay (1000)
	Font.Draw (" Joe: Hey. Hey you. ", 10, 320, intfont1, 11)
	delay (1000)
	Font.Draw (" Me? ", 50, 280, intfont1, 11)
	delay (1000)
	Font.Draw (" Joe: Yeah. Go to the HQ - talk to Frizul. ", 10, 240, intfont1, 11)
	delay (1000)
	Font.Draw (" Joe: He's probably waiting for my letter. Here, take this.", 10, 210, intfont1, 11)
	delay (1000)
	Font.Draw (" Obtained [Joe's Letter] ", 50, 170, intfont1, 0)
	Storyline := 8.1
	getch (waitkey)
    elsif Storyline = 8.1 then
	Font.Draw (" Don't open Joe's Letter.. hand it to Frizul. ", 50, 170, intfont1, 0)
	getch (waitkey)
    elsif Storyline = 8.2 then
	Font.Draw (" Gongsun Sheng.. sounds like a warlord? The lounge.", 50, 170, intfont1, 0)
	getch (waitkey)
    elsif Storyline = 9 then
    elsif Storyline = 10 then
    elsif Storyline = 11 then
    elsif Storyline = 12 then
    elsif Storyline = 13 then
    elsif Storyline = 14 then
    elsif Storyline = 15 then
	put "Over"
    end if
end Story

var Light : int
var Poke : int
proc LightMovement
    Light := 0
    Poke := 0
    loop
	Draw.Line (89 - Light, 503, 106 + Light, 503, 0)
	Draw.FillBox (89, 500, 106, 502, 0)
	Draw.Line (98, 500 - Poke, 98, 501 + Poke, 0)
	Light += 1
	exit when Light = 69
	if Light = 20 or Light = 40 or Light = 60 then
	    Poke += 1
	else
	end if
	delay (5)
    end loop
end LightMovement
proc LightMovement2
    Light := 0
    Poke := 0
    loop
	Draw.Line (347 - Light, 503, 357 + Light, 503, 0)
	Draw.FillBox (347, 500, 357, 502, 0)
	Draw.Line (352, 500 - Poke, 352, 501 + Poke, 0)
	Light += 1
	exit when Light = 28
	if Light = 8 or Light = 16 or Light = 24 then
	    Poke += 1
	else
	end if
	delay (5)
    end loop
end LightMovement2
proc LightMovement3
    Light := 0
    Poke := 0
    loop
	Draw.Line (607 - Light, 503, 619 + Light, 503, 0)
	Draw.FillBox (607, 500, 619, 502, 0)
	Draw.Line (613, 500 - Poke, 613, 501 + Poke, 0)
	Light += 1
	exit when Light = 25
	if Light = 7 or Light = 14 or Light = 21 then
	    Poke += 1
	else
	end if
	delay (5)
    end loop
end LightMovement3

proc Personalization
    loop
	Hoole := false
	Pic.Draw (PersonalizationPic, 0, 0, picCopy)
	% Font.Draw ("[1] Save the Game", 50, 90, intfont1, 0)
	% Font.Draw ("[2] Your Pets ", 50, 60, intfont1, 0)
	% Font.Draw ("[3] Exit ", 50, 30, intfont1, 0)
	Exiting := false
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 16 and rangeX <= 176) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement
		Boole := true
	    elsif (rangeX >= 306 and rangeX <= 441) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement2
		Boole := true
	    elsif (rangeX >= 570 and rangeX <= 692) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement3
		Boole := true
	    end if
	    % Click
	    if (rangeX >= 16 and rangeX <= 176) and (rangeY >= 511 and rangeY <= 540) and button = 1 then
		Font.Draw (" Write a name for your save file: ", 50, 70, intfont1, 0)
		Font.Draw (" Type Cancel to cancel.", 50, 50, intfont1, 8)
		get name
		if name = "Cancel" or name = "cancel" then
		    exit
		else
		    SaveGame
		end if
		exit
	    end if
	    % Click Pet
	    if (rangeX >= 306 and rangeX <= 441) and (rangeY >= 511 and rangeY <= 540) and button = 1 then
		Pic.Draw (RoquePic, 25, 335, picCopy)
		Pic.Draw (BunionPic, 135, 335, picCopy)
		Pic.Draw (HairiPic, 245, 335, picCopy)
		Pic.Draw (GhostBunnyPic, 355, 335, picCopy)
		Pic.Draw (DolphiPic, 465, 335, picCopy)
		Pic.Draw (HushshPic, 575, 335, picCopy)
		Pic.Draw (TurtlePic, 245, 225, picCopy)
		Pic.Draw (DrigoPic, 465, 225, picCopy)
		Pic.Draw (FightingPet, 21, 135, picCopy)
		Font.Draw (" Choose pet: 1-8 ", 50, 70, intfont1, 16)
		loop
		    % Hover
		    mousewhere (rangeX, rangeY, button)
		    if (rangeX >= 25 and rangeX <= 125) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (25, 335, 125, 435, 12)
			Boole := true
		    elsif (rangeX >= 135 and rangeX <= 235) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (135, 335, 235, 435, 12)
			Boole := true
		    elsif (rangeX >= 245 and rangeX <= 345) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (245, 335, 345, 435, 12)
			Boole := true
		    elsif (rangeX >= 355 and rangeX <= 455) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (355, 335, 455, 435, 12)
			Boole := true
		    elsif (rangeX >= 465 and rangeX <= 565) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (465, 335, 565, 435, 12)
			Boole := true
		    elsif (rangeX >= 575 and rangeX <= 675) and (rangeY >= 335 and rangeY <= 435) then
			Draw.Box (575, 335, 675, 435, 12)
			Boole := true
		    elsif (rangeX >= 245 and rangeX <= 345) and (rangeY >= 225 and rangeY <= 325) then
			Draw.Box (245, 225, 345, 325, 12)
			Boole := true
		    elsif (rangeX >= 465 and rangeX <= 565) and (rangeY >= 225 and rangeY <= 325) then
			Draw.Box (465, 225, 565, 325, 12)
			Boole := true
		    elsif (rangeX >= 662 and rangeX <= 726) and (rangeY >= 141 and rangeY <= 168) then
			Draw.Box (662, 141, 726, 168, red)
			Boole := true
		    end if
		    % Hover ends
		    if (rangeX >= 25 and rangeX <= 125) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (1) = 1 then
			    Pet := 1
			    FightingPet := RoquePic
			    Font.Draw ("Pet set to: Roque", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    Exiting := true
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 135 and rangeX <= 235) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (2) = 1 then
			    Pet := 2
			    FightingPet := BunionPic
			    Font.Draw ("Pet set to: Bunion", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 245 and rangeX <= 345) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (3) = 1 then
			    Pet := 3
			    FightingPet := HairiPic
			    Font.Draw ("Pet set to: Hairi", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 355 and rangeX <= 455) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (4) = 1 then
			    Pet := 4
			    FightingPet := GhostBunnyPic
			    Font.Draw ("Pet set to: Ghost Bunny", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 465 and rangeX <= 565) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (5) = 1 then
			    Pet := 5
			    FightingPet := DolphiPic
			    Font.Draw ("Pet set to: Dolphi", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 575 and rangeX <= 675) and (rangeY >= 335 and rangeY <= 435) and button = 1 then
			if PetArray (6) = 1 then
			    Pet := 6
			    FightingPet := HushshPic
			    Font.Draw ("Pet set to: Hushsh", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 245 and rangeX <= 345) and (rangeY >= 225 and rangeY <= 325) and button = 1 then
			if PetArray (7) = 1 then
			    Pet := 7
			    FightingPet := TurtlePic
			    Font.Draw ("Pet set to: Turtle", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 465 and rangeX <= 565) and (rangeY >= 225 and rangeY <= 325) and button = 1 then
			if PetArray (8) = 1 then
			    Pet := 8
			    FightingPet := DrigoPic
			    Font.Draw ("Pet set to: Drigo", 20, 100, intfont1, 16)
			    Pic.Draw (FightingPet, 20, 141, picCopy)
			    Draw.Box (19, 140, 121, 242, red)
			    delay (1500)
			    exit
			else
			    put "No pet here."
			    delay (1000)
			    Exiting := true
			    exit
			end if
		    elsif (rangeX >= 662 and rangeX <= 726) and (rangeY >= 141 and rangeY <= 168) and button = 1 then
			Exiting := true
			exit
		    end if
		    if Boole = false then
			Draw.Box (25, 335, 125, 435, 0)
			Draw.Box (135, 335, 235, 435, 0)
			Draw.Box (245, 335, 345, 435, 0)
			Draw.Box (355, 335, 455, 435, 0)
			Draw.Box (465, 335, 565, 435, 0)
			Draw.Box (575, 335, 675, 435, 0)
			Draw.Box (245, 225, 345, 325, 0)
			Draw.Box (465, 225, 565, 325, 0)
			Draw.Box (662, 141, 726, 168, 0)
		    else
		    end if
		    Boole := false
		end loop
	    elsif (rangeX >= 570 and rangeX <= 692) and (rangeY >= 511 and rangeY <= 540) and button = 1 then
		Exiting := true
		Hoole := true
		exit
	    else
	    end if
	    if Boole = false then
		Draw.FillBox (19, 497, 730, 504, 104)
	    else
	    end if
	    Boole := false
	    if Exiting = true then
		exit
	    else
	    end if
	end loop
	cls
	if Hoole = true then
	    exit
	else
	end if
    end loop
end Personalization

proc Town         % [TOWN1]
    Boole := false
    Hoole := false
    Exiting := false
    var Evolution : int := 0
    MAX
    if Mission = 2 then
	if MArray (2) = 0 then
	    MArray (2) := 1
	elsif MArray (2) = 1 then
	end if
    elsif Mission = 5 then
    else
	Font.Draw (" TOWN ", 300, 370, intfont, 11)
	loading3
	cls
	colorback (0)
	Draw.FillBox (0, 0, maxx, maxy, 0)
	level
	Font.Draw ("Billejun", 170, 480, intfont, 54)
	Pic.Draw (TownPic, 0, 0, picXor)
	locatexy (10, 555)
	colour (18)
	put " Money: ", Money, " Experience: ", Experience, " Level: ", Level
	colour (53)
	put "  Hp: ", Hp, "/", THp, " Attack: ", Damage, " Intelligence: ", Intelligence, " Mana: ", Mana, "/", TMana, " Speed: ", Speed
	colour (35)
	put "  Track playing: ", Track
	% Begin futtons
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 100 and rangeX <= 213) and (rangeY >= 65 and rangeY <= 82) then
		if Evolution = 0 then
		    Font.Draw ("1 : [Myunert's Store] ", 100, 65, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 217 and rangeX <= 315) and (rangeY >= 65 and rangeY <= 82) then
		if Evolution = 0 then
		    Font.Draw ("2 : [Klige Sharp]", 224, 65, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 319 and rangeX <= 398) and (rangeY >= 65 and rangeY <= 82) then
		if Evolution = 0 then
		    Font.Draw ("3 : [Training]", 327, 65, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 400 and rangeX <= 487) and (rangeY >= 65 and rangeY <= 82) then
		if Evolution = 0 then
		    Font.Draw ("4 : [The Hills] ", 412, 65, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 100 and rangeX <= 183) and (rangeY >= 47 and rangeY <= 63) then
		if Evolution = 0 then
		    Font.Draw ("5 : [Subway]", 100, 50, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 191 and rangeX <= 275) and (rangeY >= 47 and rangeY <= 63) then
		if Evolution = 0 then
		    Font.Draw ("6 : [Zeno-HQ]", 201, 50, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 283 and rangeX <= 344) and (rangeY >= 47 and rangeY <= 63) then
		if Evolution = 0 then
		    Font.Draw ("7 : [Story]", 290, 50, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 366 and rangeX <= 488) and (rangeY >= 47 and rangeY <= 63) then
		if Evolution = 0 then
		    Font.Draw ("8 : [Personalization]", 377, 50, intfont2, 11)
		    Evolution := 1
		else
		end if
		Boole := true
		Hoole := false
	    else
	    end if
	    %Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)

	    if (rangeX >= 100 and rangeX <= 213) and (rangeY >= 65 and rangeY <= 82) and button = 1 then
		if Track = "Winter Fireworks" then
		else
		    fork playstuffFireworks
		    Track := "Winter Fireworks"
		end if
		loop
		    cls
		    colourback (0)
		    locatexy (10, 520)
		    put "Your money: ", Money, "g"
		    put " Your Hp: ", Hp, " / ", THp
		    put " Your mana: ", Mana, " / ", TMana
		    %var button : int := GUI.CreateButton (200, 50, 0, "Exit", ButtonExit)
		    %var button2 : int := GUI.CreateButton (400, 50, 0, "Rebuy Stuff", ButtonRebuyMyunert)
		    Font.Draw ("Myunert's Store", 100, 540, intfont, 10)
		    Font.Draw ("(1 -17g)Cereal (+ 150 Hp and 100 Mana)", 10, 240, intfont1, 41)
		    Font.Draw ("(2 -1g) Rice (+ 8 Hp and 8 Mana )", 10, 220, intfont1, 41)
		    Font.Draw ("(3 -40g)Jellyfish (Random effect)", 10, 200, intfont1, 41)
		    Font.Draw ("(4 -21g)Chocolate (+ 500 mana)", 10, 180, intfont1, 41)
		    Font.Draw ("(5 -45g)Salad (+ 50% Hp and 10 mana)", 10, 160, intfont1, 41)
		    Font.Draw ("(6 -5g) Sushi (+ 5 Hunger) ", 10, 140, intfont1, 41)
		    Font.Draw ("(7) Exit", 10, 120, intfont1, 39)
		    Font.Draw ("(8) Talk to Myunert", 10, 100, intfont1, 49)
		    get MyunertStoreanswer
		    if MyunertStoreanswer = 1 then
			Money := Money - 17
			Hp := Hp + 30
			Mana := Mana + 50
		    elsif MyunertStoreanswer = 2 then
			Money := Money - 1
			Hp := Hp + 2
			Mana := Mana + 2
		    elsif MyunertStoreanswer = 3 then
			Money := Money - 40
			Jelly := Rand.Int (1, 5)
			if Jelly = 1 then
			    Hp := Hp + 60
			elsif Jelly = 2 then
			    Mana := Mana + 60
			elsif Jelly = 3 then
			    Hp := Hp - 30
			elsif Jelly = 4 then
			    Damage := Damage + 4
			elsif Jelly = 5 then
			    Intelligence := Intelligence + 4
			else
			    Font.Draw (" Your weapon looks ready.. ", 10, 500, intfont1, 54)
			    cls
			end if
		    elsif MyunertStoreanswer = 4 then
			Money := Money - 21
			Mana := Mana + 200
		    elsif MyunertStoreanswer = 5 then
			Money := Money - 45
			Hp := Hp + THp div 2
		    elsif MyunertStoreanswer = 6 then
			Money := Money - 5
			Hunger := Hunger + 5
		    elsif MyunertStoreanswer = 7 then
			exit
		    elsif MyunertStoreanswer = 8 then
			cls
			Draw.FillBox (0, 0, 520, maxy, 151)
			Pic.Draw (Myunert, 520, 100, picXor)
			Font.Draw (" Once.. our country was a peaceful nation.", 10, 500, intfont1, 121)
			delay (1900)
			Font.Draw (" I know you're a foreigner. I can see it in your eyes.", 10, 470, intfont1, 121)
			delay (1900)
			Font.Draw (" We used to be in the Court. Did you know, we started it? Yes, we did!", 10, 440, intfont1, 121)
			delay (1900)
			Font.Draw (" Then.. our Vice broke the laws.. and began to attack other countries.", 10, 410, intfont1, 121)
			delay (1900)
			Font.Draw (" Hah! How ironic, that we are in a dire position now.", 10, 380, intfont1, 121)
			getch (waitkey)
		    else
			put "Noo...."
		    end if

		    if Money < 0 then
			Font.Draw ("You can't buy that.", 10, 50, intfont1, red)

			delay (2000)
		    end if
		end loop
		exit
	    elsif (rangeX >= 217 and rangeX <= 315) and (rangeY >= 65 and rangeY <= 82) and button = 1 then
		cls
		KligeSharp
		exit
	    elsif (rangeX >= 319 and rangeX <= 398) and (rangeY >= 65 and rangeY <= 82) and button = 1 then
		cls
		Training
		exit
	    elsif (rangeX >= 400 and rangeX <= 487) and (rangeY >= 65 and rangeY <= 82) and button = 1 then
		cls
		Hills
		exit
	    elsif (rangeX >= 100 and rangeX <= 183) and (rangeY >= 47 and rangeY <= 63) and button = 1 then
		Exiting := false
		loop
		    cls
		    Pic.Draw (Subway, 0, 0, picCopy)
		    loop
			mousewhere (rangeX, rangeY, button)
			if (rangeX >= 28 and rangeX <= 155) and (rangeY >= 310 and rangeY <= 336) then
			    Hoole := true
			    Draw.Oval (157, 321, 3, 3, 54)
			else
			end if
			if (rangeX >= 34 and rangeX <= 148) and (rangeY >= 273 and rangeY <= 307) then
			    Hoole := true
			    Draw.Oval (157, 287, 3, 3, 54)
			else
			end if
			if (rangeX >= 43 and rangeX <= 157) and (rangeY >= 236 and rangeY <= 264) then
			    Hoole := true
			    Draw.Oval (157, 256, 3, 3, 54)
			else
			end if
			if (rangeX >= 62 and rangeX <= 170) and (rangeY >= 169 and rangeY <= 213) then
			    Hoole := true
			    Draw.Oval (172, 190, 3, 3, 54)
			else
			end if
			if (rangeX >= 66 and rangeX <= 188) and (rangeY >= 121 and rangeY <= 160) then
			    Hoole := true
			    Draw.Oval (186, 142, 3, 3, 54)
			else
			end if
			%Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
			if (rangeX >= 28 and rangeX <= 155) and (rangeY >= 310 and rangeY <= 336) and button = 1 then
			    Plaza_
			    exit
			elsif (rangeX >= 34 and rangeX <= 148) and (rangeY >= 273 and rangeY <= 307) and button = 1 then
			    Hezlow
			    exit
			elsif (rangeX >= 43 and rangeX <= 157) and (rangeY >= 236 and rangeY <= 264) and button = 1 then
			    Arclen_
			    exit
			elsif (rangeX >= 62 and rangeX <= 170) and (rangeY >= 169 and rangeY <= 213) and button = 1 then
			    Tima
			    Exiting := false
			    exit
			elsif (rangeX >= 66 and rangeX <= 188) and (rangeY >= 121 and rangeY <= 160) and button = 1 then
			    Exiting := true
			    exit
			else
			end if
			if Hoole = false then
			    Draw.Oval (157, 321, 3, 3, 0)
			    Draw.Oval (157, 287, 3, 3, 0)
			    Draw.Oval (157, 256, 3, 3, 0)
			    Draw.Oval (172, 190, 3, 3, 0)
			    Draw.Oval (186, 142, 3, 3, 0)
			else
			end if
			Hoole := false
		    end loop
		    if Exiting = true then
			exit
		    else
		    end if
		end loop
		exit
	    elsif (rangeX >= 191 and rangeX <= 275) and (rangeY >= 47 and rangeY <= 63) and button = 1 then
		cls
		Zeno
		exit
	    elsif (rangeX >= 283 and rangeX <= 344) and (rangeY >= 47 and rangeY <= 63) and button = 1 then
		Story
		exit
	    elsif (rangeX >= 366 and rangeX <= 488) and (rangeY >= 47 and rangeY <= 63) and button = 1 then
		Personalization
		exit
	    else
	    end if
	    if Boole = false and Hoole = false then
		Draw.FillBox (0, 0, 700, 80, black)
		Font.Draw ("1 : [Myunert's Store] ", 100, 65, intfont2, 0)
		Font.Draw ("2 : [Klige Sharp]", 224, 65, intfont2, 0)
		Font.Draw ("3 : [Training]", 327, 65, intfont2, 0)
		Font.Draw ("4 : [The Hills] ", 412, 65, intfont2, 0)
		Font.Draw ("5 : [Subway]", 100, 50, intfont2, 0)
		Font.Draw ("6 : [Zeno-HQ]", 201, 50, intfont2, 0)
		Font.Draw ("7 : [Story]", 290, 50, intfont2, 0)
		Font.Draw ("8 : [Personalization]", 377, 50, intfont2, 0)
		Evolution := 0
		Hoole := true
	    else
	    end if
	    Boole := false
	end loop
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
end Town

% Starting [LOAD1]
var CutterScram : int
proc LoadGame
    CutterScram := 1
    loop
	put "Enter File name."
	put "Type Cancel to cancel, Exit to quit."
	get FileName
	if FileName = "Cancel" or FileName = "cancel" then
	    CutterScram := 2
	    exit
	elsif FileName = "Exit" or FileName = "exit" then
	    quit
	else
	end if
	Extension := ".txt"
	FileDir := "data/"
	FileName += Extension
	FileDir += FileName
	if File.Exists (FileDir) then
	    open : stream, FileDir, read
	    read : stream, name
	    read : stream, Level
	    read : stream, Money
	    read : stream, Style
	    read : stream, Storyline
	    read : stream, Hp
	    read : stream, THp
	    read : stream, Mana
	    read : stream, TMana
	    read : stream, ManaRegen
	    read : stream, Damage
	    read : stream, Speed
	    read : stream, Character
	    read : stream, Skill_Level_SideCut
	    read : stream, Intelligence
	    read : stream, Skill_Level_AimedArrow
	    read : stream, Skill_Level_BloodShot
	    read : stream, Skill_Level_Mana_Shot
	    read : stream, Skill_Level_SpeedSlice
	    read : stream, Skill_Level_Shot_s
	    read : stream, Skill_Level_DoubleSlash
	    read : stream, Skill_Level_RaisedCurve
	    read : stream, Skill_Level_StarShot
	    read : stream, Skill_Level_WindLash
	    read : stream, Skill_Level_BurningMetal
	    read : stream, Skill_Level_Regen
	    read : stream, Skill_Level_ZenosSword
	    read : stream, Skill_Level_WhiteTundra
	    read : stream, Skill_Level_Taggerung
	    read : stream, Skill_Level_JetStream
	    read : stream, Experience
	    read : stream, Pet
	    read : stream, FightingPet
	    read : stream, Mission
	    for LA : 1 .. 15
		read : stream, LevelArray (LA)
	    end for
	    for PA : 1 .. 8
		read : stream, PetArray (PA)
	    end for
	    read : stream, CreileFight
	    read : stream, CSA1
	    read : stream, CSA2
	    read : stream, CSA3
	    read : stream, CSA4
	    read : stream, PreviousSpeed
	    read : stream, AddedSpeed
	    read : stream, PreviousDamage
	    read : stream, AddedDamage
	    read : stream, PreviousIntelligence
	    read : stream, AddedIntelligence
	    read : stream, PreviousHp
	    read : stream, AddedHp
	    read : stream, Added
	    close : stream
	    exit
	else
	    put "No save file.. Rechecking."
	    delay (1000)
	    cls
	end if
    end loop
    if CutterScram = 2 then
	Exiting := false
	cls
    else
    end if
    loop
	exit when CutterScram = 2
	Town
    end loop
end LoadGame
proc LoadGame2
    cls
    Exiting := false
    Hoole := false
    Boole := false
    Call := 0
    for i : 1 .. 4
	open : Lstream (i), LSN (i), read
	read : Lstream (i), name
	read : Lstream (i), LSL (i)
	read : Lstream (i), LSM (i)
	read : Lstream (i), LSS (i)
	read : Lstream (i), LSC (i)
	close : Lstream (i)
    end for
    Incry := 0
    Pic.Draw (LoadGamePic, 0, 0, picCopy)
    for i : 1 .. 4
	Font.Draw (intstr (LSL (i)), 550, 450 - Incry, intfont1, 16)
	Font.Draw (intstr (LSL (i)), 600, 450 - Incry, intfont1, 42)
	Font.Draw (intstr (LSL (i)), 550, 415 - Incry, intfont1, 38)
	Font.Draw (intstr (LSL (i)), 500, 500 - Incry, intfont1, 54)
	Incry += 100
    end for
    loop
	mousewhere (rangeX, rangeY, button)
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 38)
	    Boole := true
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 then
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 38)
	    Boole := true
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 then
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 38)
	    Boole := true
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 then
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 38)
	    Boole := true
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 23 then
	    Draw.Box (643, 6, 709, 33, 0)
	    Boole := true
	end if
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 and button = 1 then
	    FileDir := LSN (1)
	    Call += 1
	    exit
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 and button = 1 then
	    FileDir := LSN (2)
	    Call += 1
	    exit
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 and button = 1 then
	    FileDir := LSN (3)
	    Call += 1
	    exit
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 and button = 1 then
	    FileDir := LSN (4)
	    Call += 1
	    exit
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 23 and button = 1 then
	    Exiting := true
	    exit
	end if
	if Boole = false then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 54)
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 54)
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 54)
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 54)
	    Draw.Box (643, 6, 709, 33, 38)
	end if
	Boole := false
    end loop
    if Exiting = true then
	Exiting := false
    elsif Call > 0 then
	if File.Exists (FileDir) then
	    open : stream, FileDir, read
	    read : stream, name
	    read : stream, Level
	    read : stream, Money
	    read : stream, Style
	    read : stream, Storyline
	    read : stream, Hp
	    read : stream, THp
	    read : stream, Mana
	    read : stream, TMana
	    read : stream, ManaRegen
	    read : stream, Damage
	    read : stream, Speed
	    read : stream, Character
	    read : stream, Skill_Level_SideCut
	    read : stream, Intelligence
	    read : stream, Skill_Level_AimedArrow
	    read : stream, Skill_Level_BloodShot
	    read : stream, Skill_Level_Mana_Shot
	    read : stream, Skill_Level_SpeedSlice
	    read : stream, Skill_Level_Shot_s
	    read : stream, Skill_Level_DoubleSlash
	    read : stream, Skill_Level_RaisedCurve
	    read : stream, Skill_Level_StarShot
	    read : stream, Skill_Level_WindLash
	    read : stream, Skill_Level_BurningMetal
	    read : stream, Skill_Level_Regen
	    read : stream, Skill_Level_ZenosSword
	    read : stream, Skill_Level_WhiteTundra
	    read : stream, Skill_Level_Taggerung
	    read : stream, Skill_Level_JetStream
	    read : stream, Experience
	    read : stream, Pet
	    read : stream, FightingPet
	    read : stream, Mission
	    for LA : 1 .. 15
		read : stream, LevelArray (LA)
	    end for
	    for PA : 1 .. 8
		read : stream, PetArray (PA)
	    end for
	    read : stream, CreileFight
	    read : stream, CSA1
	    read : stream, CSA2
	    read : stream, CSA3
	    read : stream, CSA4
	    read : stream, PreviousSpeed
	    read : stream, AddedSpeed
	    read : stream, PreviousDamage
	    read : stream, AddedDamage
	    read : stream, PreviousIntelligence
	    read : stream, AddedIntelligence
	    read : stream, PreviousHp
	    read : stream, AddedHp
	    read : stream, Added
	    close : stream
	else
	    put "File is empty."
	    delay (1000)
	end if
	loop
	    Town
	end loop
    else
	put "File is empty."
	delay (1000)
    end if
    cls
end LoadGame2

% Game Begins [THEDUST1]


FightingPet := Slab

loop
    Pic.Draw (IntroMap, 0, 0, picXor)
    Font.Draw (" Start Game", 568, 270, intfont, 53)
    Font.Draw (" Guide", 568, 170, intfont, 52)
    Font.Draw (" Load", 568, 90, intfont, 51)
    Font.Draw (" Exit", 568, 43, intfont, 50)
    loop
	mousewhere (rangeX, rangeY, button)

	if (rangeX >= 563 and rangeX <= 728) and (rangeY >= 235 and rangeY <= 304) then
	    Draw.Box (563, 235, 728, 304, 11)
	    Boole := true
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 138 and rangeY <= 210) then
	    Draw.Box (563, 138, 728, 210, 11)
	    Boole := true
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 78 and rangeY <= 118) then
	    Draw.Box (563, 78, 728, 118, 11)
	    Boole := true
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 34 and rangeY <= 76) then
	    Draw.Box (563, 34, 728, 76, 11)
	    Boole := true
	else
	end if
	%Mouse.ButtonWait ("downup", rangeX, rangeY, Fly, mouse)
	if (rangeX >= 563 and rangeX <= 728) and (rangeY >= 235 and rangeY <= 304) and button = 1 then
	    Exiting := true
	    exit
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 138 and rangeY <= 210) and button = 1 then
	    Guide
	    cls
	    exit
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 78 and rangeY <= 118) and button = 1 then
	    cls
	    Exiting := true
	    LoadGame2
	    exit
	elsif (rangeX >= 563 and rangeX <= 728) and (rangeY >= 34 and rangeY <= 76) and button = 1 then
	    quit
	else
	end if
	if Boole = false then
	    Draw.Box (563, 235, 728, 304, 16)
	    Draw.Box (563, 138, 728, 210, 16)
	    Draw.Box (563, 78, 728, 118, 16)
	    Draw.Box (563, 34, 728, 76, 16)
	else
	end if
	Boole := false
    end loop
    if Exiting = true then
	exit
    else
    end if
end loop


% Intro

Draw.FillBox (0, 0, maxx, maxy, 151)
Font.Draw ("The Dust. . .", 280, 300, intfont, 54)
Font.Draw ("A little intro.. when the window says waiting for input press any key.(getch) Do not spam.", 1, 1, intfont1, 0)
loading
loading
cls


% Game
Draw.FillBox (0, 0, maxx, maxy, 0)

% Main characters
Draw.FillBox (0, 0, maxx, maxy, 151)
Font.Draw ("What style do you prefer?", 10, 490, intfont1, 54)
Draw.FillBox (10, 515, 110, 540, 126)
Draw.FillBox (120, 515, 220, 540, 126)
Draw.FillBox (230, 515, 330, 540, 126)
Draw.FillBox (340, 515, 440, 540, 126)
Font.Draw ("Ranged", 12, 519, intfont1, 42)
Font.Draw ("Melee", 122, 519, intfont1, 12)
Font.Draw ("Magic", 232, 519, intfont1, 48)
Font.Draw ("Gunner", 342, 519, intfont1, 35)
Boole := false
loop
    loop
	mousewhere (rangeX, rangeY, button)
	if (rangeX >= 10 and rangeX <= 110) and (rangeY >= 515 and rangeY <= 540) then
	    Draw.Box (10, 515, 110, 540, 11)
	    Boole := true
	else
	end if
	if (rangeX >= 120 and rangeX <= 220) and (rangeY >= 515 and rangeY <= 540) then
	    Draw.Box (120, 515, 220, 540, 11)
	    Boole := true
	else
	end if
	if (rangeX >= 230 and rangeX <= 330) and (rangeY >= 515 and rangeY <= 540) then
	    Draw.Box (230, 515, 330, 540, 11)
	    Boole := true
	else
	end if
	if (rangeX >= 340 and rangeX <= 440) and (rangeY >= 515 and rangeY <= 540) then
	    Draw.Box (340, 515, 440, 540, 11)
	    Boole := true
	else
	end if
	if (rangeX >= 10 and rangeX <= 110) and (rangeY >= 515 and rangeY <= 540) and button = 1 then
	    Style := "Ranged"
	    Exiting := true
	    exit
	elsif (rangeX >= 120 and rangeX <= 220) and (rangeY >= 515 and rangeY <= 540) and button = 1 then
	    Style := "Melee"
	    Exiting := true
	    exit
	elsif (rangeX >= 230 and rangeX <= 330) and (rangeY >= 515 and rangeY <= 540) and button = 1 then
	    Style := "Magic"
	    Exiting := true
	    exit
	elsif (rangeX >= 340 and rangeX <= 440) and (rangeY >= 515 and rangeY <= 540) and button = 1 then
	    Style := "Gunner"
	    Exiting := true
	    exit
	else
	end if
	if Boole = false then
	    Draw.Box (10, 515, 110, 540, 126)
	    Draw.Box (120, 515, 220, 540, 126)
	    Draw.Box (230, 515, 330, 540, 126)
	    Draw.Box (340, 515, 440, 540, 126)
	else
	end if

	Boole := false
    end loop
    if Exiting = true then
	exit
    else
    end if
end loop
Draw.FillBox (10, 10, 290, 450, 0)


% Ranges
if Style = "Ranged" then
    Character := Archer
elsif Style = "Melee" then
    Character := Sinjid
elsif Style = "Gunner" then
    Character := Gunner
elsif Style = "Magic" then
    Character := Mage
end if

fork playstuffWhy
Track := "Why, or Why not"

% Choice [STATS1]
if Style = "Ranged" then
    put "You have chosen the Archer."
    put "Advantage : Speed"
    Pic.Draw (Archer, 40, 40, picXor)
    Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
    Font.Draw ("Hp : 1400", 400, 370, intfont2, 54)
    Hp := 1400
    THp := 1400
    Font.Draw ("Mana : 110", 400, 340, intfont2, 54)
    Mana := 110
    TMana := 110
    ManaRegen := TMana * 0.05
    Font.Draw ("Damage : 110", 400, 310, intfont2, 54)
    Damage := 110
    Font.Draw ("Intelligence : 50", 400, 280, intfont2, 54)
    Intelligence := 50
    Font.Draw ("Speed : 75", 400, 250, intfont2, 54)
    Speed := 75
elsif Style = "Melee" then
    put "You should wield knives like a pro."
    put "Advantage : Health"
    Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
    Font.Draw ("Hp : 1500", 400, 370, intfont2, 54)
    Hp := 1500
    THp := 1500
    Font.Draw ("Mana : 60", 400, 340, intfont2, 54)
    Mana := 60
    TMana := 60
    ManaRegen := TMana * 0.05
    Font.Draw ("Damage : 90", 400, 310, intfont2, 54)
    Damage := 90
    Font.Draw ("Intelligence : 10", 400, 280, intfont2, 54)
    Intelligence := 10
    Font.Draw ("Speed : 45", 400, 250, intfont2, 54)
    Speed := 45
    Pic.Draw (Sinjid, 40, 40, picXor)
elsif Style = "Magic" then
    put "Mysteriously.. magic."
    put "Advantage : Mana"
    Pic.Draw (Mage, 40, 40, picXor)
    Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
    Font.Draw ("Hp :1100", 400, 370, intfont2, 54)
    Hp := 1100
    THp := 1100
    Font.Draw ("Mana : 280", 400, 340, intfont2, 54)
    Mana := 280
    TMana := 280
    ManaRegen := TMana * 0.05
    Font.Draw ("Damage : 100", 400, 310, intfont2, 54)
    Damage := 100
    Font.Draw ("Intelligence : 130", 400, 280, intfont2, 54)
    Intelligence := 130
    Font.Draw ("Speed : 50", 400, 250, intfont2, 54)
    Speed := 50
elsif Style = "Gunner" then
    put "You are a gunner."
    put "Advantage : Damage"
    Pic.Draw (Gunner, 40, 40, picXor)
    Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
    Font.Draw ("Hp :1400", 400, 370, intfont2, 54)
    Hp := 1400
    THp := 1400
    Font.Draw ("Mana : 180", 400, 340, intfont2, 54)
    Mana := 180
    TMana := 180
    ManaRegen := TMana * 0.05
    Font.Draw ("Damage : 110", 400, 310, intfont2, 54)
    Damage := 110
    Font.Draw ("Intelligence : 30", 400, 280, intfont2, 54)
    Intelligence := 30
    Font.Draw ("Speed : 90", 400, 250, intfont2, 54)
    Speed := 90
end if


getch (waitkey)
cls
if Style = "Ranged" then
    Font.Draw ("Ranged..", 310, 300, intfont, 54)
    loading2
elsif Style = "Melee" then
    Font.Draw ("Melee..", 310, 300, intfont, 54)
    loading2
elsif Style = "Magic" then
    Font.Draw ("Mage..", 310, 300, intfont, 54)
    loading2
elsif Style = "Gunner" then
    Font.Draw ("Sniper..", 310, 300, intfont, 54)
    loading2
end if

/*
 % Beginning

 Draw.FillBox (0, 0, maxx, maxy, 151)
 colourback (151)
 delay (1000)
 Font.Draw ("The Gobalan - Global war has only begun 10 years ago...", 100, 400, intfont1, 0)
 delay (2000)
 Font.Draw (".. There are currently 564,401 military deaths.", 100, 200, intfont1, 0)
 delay (2000)
 Font.Draw (" and an estimated 5,103,000 civillian deaths..(Press any key)", 80, 80, intfont1, 0)
 delay (500)
 getch (waitkey)
 cls

 Draw.FillBox (0, 0, maxx, maxy, 0)
 colourback (0)
 Pic.Draw (WorldMap, 0, 0, picXor)
 Font.Draw ("In the year 3754, tensions between country superpowers Gobalan and Crezin had risen.", 10, 70, intfont1, 0)
 delay (1500)
 Font.Draw ("Crezin was claiming control to a coastline of Hilyk (Fish) surrounding one of their islands.", 10, 50, intfont1, 0)
 delay (1500)
 Font.Draw ("As it was partially within Gobalan territory, Gobalan attacked fishing boats from the island.", 10, 30, intfont1, 0)
 getch (waitkey)
 cls
 Pic.Draw (WorldMap, 0, 0, picXor)
 Font.Draw ("The Civillian country Global and Grilore decided to take the matters to international court,", 10, 70, intfont1, 0)
 Font.Draw ("where their populations decided the case.", 10, 55, intfont1, 0)
 delay (1500)
 Font.Draw ("The decision was for Gobalan to discontinue aggression or to risk an invasion. ", 10, 40, intfont1, 0)
 delay (1500)
 Font.Draw ("However, Gobalan leader Dhun Ghablian disagreed, and decided to launch an attack on the court. ", 10, 25, intfont1, 0)
 delay (1)
 getch (waitkey)
 Pic.Free (WorldMap)
 cls
 Pic.Draw (WorldMap2, 0, 0, picXor)
 Font.Draw (" Global City almost fell within a week. Ambassadors were sent to allies immediately after the attack. ", 10, 70, intfont1, 0)
 delay (1500)
 Font.Draw (" With Global was the Engima, and the Enigma-Alliance", 10, 50, intfont1, 0)
 delay (1500)
 Font.Draw (" It consisted of Crezin, Zeno, Adreizu, Arnak, Tam-Hutzi, Andreos, Emerghuj, Klirantak and G'lispi.", 10, 30, intfont1, 0)
 getch (waitkey)
 Pic.Free (WorldMap2)
 cls
 Pic.Draw (WorldMap3, 0, 0, picXor)
 Font.Draw (" Arnak, Adreizu and Tam-Hutzi quickly responded to arms. Crezin and the rest followed later.", 10, 70, intfont1, 0)
 delay (1500)
 Font.Draw (" Gobalan quickly realized they had exposed their flank, and created the Torzon-Alliance. ", 10, 55, intfont1, 0)
 delay (1500)
 Font.Draw (" The old alliance of Torzon consisted of Phalack, Jreitcho and Hrizoq.", 10, 40, intfont1, 0)
 delay (1000)
 Font.Draw (" Phalack dropped out due to economical issues. The other countries followed Gobalan's path.", 10, 25, intfont1, 0)
 delay (1)
 getch (waitkey)
 Pic.Free (WorldMap3)
 cls
 Pic.Draw (WorldMap4, 0, 0, picXor)
 Font.Draw (" Horrendously, Gobalan's troops began to slaughter the Global civillians while Crezin ", 10, 75, intfont1, 0)
 Font.Draw ("took over their homebase.", 10, 59, intfont1, 0)
 delay (1500)
 Font.Draw (" Within 8 years Jreitcho and Hrizoq surrendered.", 10, 43, intfont1, 54)
 delay (1500)
 Font.Draw (" YOU are an assassin under Tam-Hutzi...", 10, 25, intfont1, 54)
 getch (waitkey)
 Pic.Free (WorldMap4)
 cls
 Draw.FillBox (0, 0, maxx, maxy, 151)
 colorback (151)
 Font.Draw (" 20:31, January.11.3765", 20, 500, intfont1, 0)
 Font.Draw (" Zeno Secret Base - Commander Frizul", 20, 540, intfont1, 54)
 delay (4000)
 Font.Draw (" A secret meeting occurs at Tam-Hutzi Assassin HQ", 40, 460, intfont1, 0)
 delay (3000)
 Font.Draw (" You have been invited as a guest.", 60, 420, intfont1, 0)
 delay (3000)
 Font.Draw (" Frizul: Ravness, you and Joe will travel East into Gobalan Highlands and infiltrate them.", 80, 380, intfont1, 14)
 delay (3000)
 Font.Draw (" Frizul: Once you reach the Bahanna Oxbow lake, locate a cabin on a hill...", 100, 340, intfont1, 14)
 delay (2500)
 Font.Draw (" Frizul: ..Ravness, you will continue to the lake. Meet Lukvel there.", 120, 300, intfont1, 14)
 delay (2000)
 Font.Draw (" Frizul: Joe, kill Lt. Ji-Lun. Then follow Ravness.", 140, 260, intfont1, 14)
 delay (1500)
 Font.Draw (" Frizul: As for you.. follow Joe. Find his note, and go to the town.", 10, 50, intfont1, 54)
 delay (1500)
 Font.Draw (" Frizul: Further orders will be there...", 10, 10, intfont1, 54)
 getch (waitkey)
 cls

 % Story
 loop
 Draw.FillBox (0, 0, maxx, maxy, 0)
 colorback (0)
 Pic.Draw (House, 0, 0, picXor)
 Font.Draw ("You arrive upon an empty house.", 100, 95, intfont1, 54)
 delay (2500)
 Font.Draw ("There appears to be no one inside..", 100, 75, intfont1, 54)
 delay (2500)
 Font.Draw ("You decide to investigate.", 100, 55, intfont1, 54)
 delay (2500)
 Font.Draw ("As you arrive, the ghosts dissipate. You find a note on the door..(Press any key)", 100, 35, intfont1, 54)
 delay (1)
 getch (waitkey)
 cls
 Pic.Draw (InsideHouse, 0, 0, picXor)
 delay (3500)
 Font.Draw ("It looks like Joe was successful..(Press any key)", 100, 95, intfont1, 0)
 delay (1)
 getch (waitkey)
 Pic.Free (InsideHouse)
 cls
 Draw.FillBox (0, 0, maxx, maxy, 151)
 colorback (151)
 Font.Draw ("You read the note left on the door:", 100, 500, intfont1, 11)
 delay (2000)
 Font.Draw (" - You. I killed that old bag. Now, it's time to make quick of their leaders.", 100, 460, intfont1, 11)
 delay (1400)
 Font.Draw (" Those doddering old fools can't lead a war; they're just playing Chess with each other.", 100, 420, intfont1, 11)
 delay (1400)
 Font.Draw (" We can end this now. Let's kill 'em!", 100, 380, intfont1, 11)
 delay (1400)
 Font.Draw (" Do you agree to your mission (1) ? Or flee from this life (2) ?", 100, 320, intfont1, 54)
 get answer
 if answer = 1 then
 exit
 elsif answer = 2 then
 cls
 Font.Draw ("You decide to not take part of this murderous rampage. At the expense of your fellow men.", 10, 300, intfont1, 54)
 delay (500)
 Font.Draw ("You walk out of the house.", 100, 250, intfont1, 54)
 delay (500)
 Font.Draw ("Joe kills you.", 100, 200, intfont1, 40)
 put "Think about it..."
 delay (10000)
 end if
 end loop
 cls

 Font.Draw (" A slithering noise is coming from the roof.. ", 70, 500, intfont1, 11)
 delay (1800)
 Font.Draw (" Joe : ..Hey! .. New guy..", 70, 460, intfont1, 11)
 delay (1800)
 Font.Draw (" Joe : Glad you chose to help us. Gimme a hand.", 70, 420, intfont1, 11)
 delay (1000)
 Font.Draw (" You give Joe a hand.", 100, 200, intfont1, 54)
 delay (3000)
 Font.Draw (" Joe : ...I don't need a dead body's hand...", 70, 380, intfont1, 11)
 delay (1000)
 getch (waitkey)
 cls
 Draw.FillBox (0, 0, maxx, maxy, 0)
 colorback (0)
 Pic.Draw (ToFields, 0, 0, picXor)                                                % Unfinished
 Font.Draw (" Joe : You need practice, eh? As a senior, it's my duty to ensure the success of our mission. ", 70, 500, intfont1, 11)
 delay (2500)
 Font.Draw ("         *He points to a structure on a field.*", 70, 480, intfont1, 0)
 delay (3000)
 Font.Draw (" You know what they said about Gobalani field farmers. Bluenecks, the lot of them.", 70, 460, intfont1, 11)
 delay (2300)
 Font.Draw (" I'll help you check it out. Why would there only be one farm out here?", 70, 100, intfont1, black)
 getch (waitkey)
 Font.Draw (" ..Ok..", 150, 70, intfont, 54)
 delay (1500)
 cls
 Draw.FillBox (0, 0, maxx, maxy, 0)
 colorback (0)

 % Fight AngryFarmer

 cls
 Draw.FillBox (0, 0, maxx, maxy, 151)
 colorback (151)
 Font.Draw (" As you near the farm.. a man in a bush approaches you.", 100, 400, intfont1, 0)
 delay (2000)
 Font.Draw (" Farmer: Whjy's y'all wantin in this hure lans?", 70, 360, intfont1, 16)
 delay (2000)
 Font.Draw (" Joe: Stand down, or die!", 70, 320, intfont1, 11)
 delay (1000)
 Font.Draw (" Farmer: Fhuq ye, ye'l be Zonen Swine! Guiha, cuhm ter me!", 70, 280, intfont1, 16)
 delay (1000)
 Font.Draw (" Joe looses an arrow at the bush. A slovenly dressed man ... (err woman)  ", 100, 240, intfont1, 0)
 Font.Draw (" falls out with the arrow pinned between its eyes.   ", 100, 210, intfont1, 0)
 delay (2500)
 Font.Draw (" Farmer: !AEEIIIEIEEEEGHHHHH, KILL, KILL, KILL¡ GULO! GULO! GULO!", 70, 170, intfont1, 16)
 delay (1000)
 Font.Draw (" Joe: Watch what I do...  ", 70, 130, intfont1, 11)
 getch (waitkey)
 cls
 Pic.Draw (ToFields, 0, 0, picXor)
 FarmerFight (Character)

 Storyline := 8.3
 Money := 9999
 Experience := 80
 Pet := 8
 PetArray (8) := 1
 FightingPet := DrigoPic
 ManaRegen := TMana * 0.5
 */
loop
    Town
end loop

% Note: Save File "Johnson" is Lv.1, has Drigo, on Story line 7, 900g Enemy Moral at the Battle of Creile is 1.
% It is also half corrupt.



