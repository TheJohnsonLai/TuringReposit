%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:  Johnson  Lai
%Date: November 25, 2013
%Course:  ICS3CU1
%Teacher: Mr.Holik
%Program Name: Turing
%Descriptions:  Variables - Contains all Global Variables {No pun}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var Track : string
var Flee : boolean := false
var Tutorial : int := 1
var GenericInt : int := 0
var DFont := Font.New ("Complex:24:Bold")
var SideCutSword : int := Pic.FileNew ("Picture\\SideCutSword.bmp")
var SwordSwipeX : int := 200
var SwordSwipeY : int := 220
var IC : int := 10
var GG : boolean := false
var Logo : int := Pic.FileNew ("Picture\\Logo.bmp")
var IntroFut1 : int := 0
var IntroFut2 : int := 0
var IntroFut3 : int := 0
var IntroFut4 : int := 0
var IntroFut5 : int := 0
var CreditPicture : array 1 .. 5 of int
% Change this into names.
var Fly : int
var mouse : int
var Dust : int
var Call : int := 0
var exitkey : string
var mx, my, mb : int
var intfont, intfont1, intfont2, intfont3, intfont4 : int
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
var LSL, LSM, Lstream : array 1 .. 4 of int
var LSS : array 1 .. 4 of real
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
    LSC (i) := ""
end for
var SlotX : int := 40
var SlotY : int := 51
var Incry : int := 0
var Incrx : int := 100
intfont := Font.New ("Garamond:19")
intfont4 := Font.New ("Garamond:16:UnderLine")
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
var FilePic : array 1 .. 5 of int
%for s : 1 .. 5
%    FilePic (s) := Pic.FileNew ("Picture\\FilePic"+s, ".bmp")
%end for
var Exiting : boolean := false
var StoryStuff : boolean := false
var TabMissionsSwitching : boolean := false
var TabCurrentSwitching : boolean := false
var TabCompleteSwitching : boolean := false
var EnemyThing : int
var TabBandit : int := 0
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
var Skill_Level_OppedShield : int := 0
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
var EMon : real
var JoeHp : real := 2700
var JoeTHp : real := 2700
var JoeDefense : real := 600
var JoeDamage : real := 866
var JoeSpeed : real := 202
var EnemyType : real
var StackHp : real := 0
var StackDamage : real := 0
var StackIntelligence : real := 0
var Damage : real
var Defense : real
var Dauntless : int
var Hp : real
var ManaRegen : real := 10
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
var Style : string := ""
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
var CutterScram : int
var FilePosition, Selection : int
var FileName : string
var Extension, FileDir : string
var Hoole : boolean := false
var rangeX : int
var rangeY : int
var button : int
var streamstring : string
var name : string
var Floatx : int
var Floaty : int
var HeartCrit : int
var Explode : int
var Aerial : int
var Light : int
var Poke : int
var QuadShots : array 1 .. 4 of real
var SShotA : array 1 .. 3 of real
var MArray : array 1 .. 10 of int
for AD : 1 .. 10
    MArray (AD) := 0
end for
var CC : boolean := false
var HH : boolean := false
var RJuice : array 1 .. 3 of string
var Juice : string
var Teleport : boolean := false
var FirstKey : int := 0
var Debt : real := 0
var Transcision : int := 0
var RandomChoose : int
var DemoMode : boolean := false
var SCL : array 1 .. 3 of int := init (39, 48, 54)
var PicturePlacement : array 1 .. 4 of int
PicturePlacement (1) := 421
PicturePlacement (2) := 311
PicturePlacement (3) := 162
PicturePlacement (4) := 51
var SLGunner : int := Pic.FileNew ("Picture\\SavePicGunner.bmp")
var SLMage : int := Pic.FileNew ("Picture\\SavePicMage.bmp")
var SLMelee : int := Pic.FileNew ("Picture\\SavePicMelee.bmp")
var SLRanged : int := Pic.FileNew ("Picture\\SavePicRanged.bmp")
var ClassSelect : int := Pic.FileNew ("Picture\\ClassSelect.bmp")
var IntroGUISG : int := Pic.FileNew ("Picture\\IntroGUISG.bmp")
var IntroGUIGUIDE : int := Pic.FileNew ("Picture\\IntroGUIGUIDE.bmp")
var IntroGUILG : int := Pic.FileNew ("Picture\\IntroGUILG.bmp")
var IntroGUIEXIT : int := Pic.FileNew ("Picture\\IntroGUIEXIT.bmp")
var LoadGamePic : int := Pic.FileNew ("Picture\\LoadGamePic.bmp")
var SaveGamePic : int := Pic.FileNew ("Picture\\SaveGamePic.bmp")
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
var Joe : int := Pic.FileNew ("Picture\\Joe.bmp")
var IP : int := Pic.FileNew ("Picture\\IntroductionPic.bmp")
var Olba : int := Pic.FileNew ("Picture\\Olba.bmp")
CreditPicture (1) := Pic.FileNew ("Picture\\CreditPicture1.bmp")
CreditPicture (2) := Pic.FileNew ("Picture\\CreditPicture2.bmp")
CreditPicture (3) := Pic.FileNew ("Picture\\CreditPicture3.bmp")
CreditPicture (4) := Pic.FileNew ("Picture\\CreditPicture4.bmp")
CreditPicture (5) := Pic.FileNew ("Picture\\CreditPicture5.bmp")
var StartPic:= Pic.FileNew ("Picture\\StartPic.bmp")
var Wurbul_ := Pic.FileNew ("Picture\\Wurbul.bmp")
var Oreg_ := Pic.FileNew ("Picture\\Oreg.bmp")
var TranstelonPic := Pic.FileNew ("Picture\\TranstelonPic.bmp")
var ZenoHQStoryline8answer : int

