%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:  Johnson  Lai
%Date: January 15, 2014
%Course:  ICS3CU1
%Teacher: Mr.Holik
%Program Name: Dust
%Descriptions:  The Dust, a game set in a world where a World War has displaced
% millions of people. The goal is to assassinate the leader of the opposing force.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Dust {RPG}

% Complete AirBird
% Complete Pass and Potion Buttons
% Complete Library / Transtelon
% Upload SavingLoading,Skills,Variables,Main,FightingScenes,ImportMusic,Guide,NPCStats,FightignGUI,PWurbul,POreg,Futtons,PFIghtingSkill,Loadingscenes,Transetlon
% Complete Animations for Sciption
% URGENT - Upgrade Stores
% Complete Storyline 10  Missions

% [Index of Files]
% Animations - Movement of items on the screen, for Settings Menu
% Dust Additions - Older file, should not be used
% FightingGUI - GUI procedures for Fighting Scenes
% FightingScenes - Almost every combat procedure is here
% Futtons - Button pressing and selection of combat
% Guide - Guide and Credit scenes from the Main menu
% ImportMusic - Music Files
% ImportStart - Loads all files into Main.t
% Introduction - Introduction scene to the game and Logo beginning
% LoadingScenes - Most loading scenes for intervals between towns
% NPCStats - Statistics to load in battle for foes and allies
% ResultScenes - Results to combat
% SavingLoading - All save modes, No.3 begins used
% Skills - Skills and their animations for combat
% UndefinedSaver - Old file, creates save locations
% Variables - Has almost every global variable and picture
% Main.t - Has approximately all Towns, calls and main lines of code

include "Code/Programs/ImportStart.t"
setscreen ("graphics: 750,570")

% [Speaker] Identification by font colour
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

Track := "Nothing right now."

% [Skill room] [BUY1]

proc Buy %
    Boole := false
    Hoole := false
    var Turok : int := 0
    var DisplayMoney : string
    var DisplayLevel : string
    loop
	PreviousSpeed := AddedSpeed
	PreviousDamage := AddedDamage
	PreviousIntelligence := AddedIntelligence
	PreviousHp := AddedHp
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
	Pic.Draw (Bow, 280, 431, picCopy)
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
	DisplayDamage := realstr ((Damage + StackDamage - PreviousDamage * 3) + (AddedDamage * 3), 4)
	Font.Draw (DisplayDamage + "", 591, 161, intfont2, 0)
	DisplayIntelligence := realstr ((Intelligence + StackIntelligence - PreviousIntelligence * 5) + (AddedIntelligence * 5), 4)
	Font.Draw (DisplayIntelligence + "", 620, 144, intfont2, 0)
	DisplayHp := realstr ((Hp + StackHp - PreviousHp * 50) + (AddedHp * 50), 4)
	Font.Draw (DisplayHp + "", 552, 123, intfont2, 0)
	DisplayMoney := realstr (Money, 6)
	Font.Draw (DisplayMoney + "", 610, 420, intfont2, 39)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 107 and rangeX <= 142) and (rangeY >= 432 and rangeY <= 467) then
		Draw.Box (107, 432, 142, 467, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 9g) Side Cut.", 16, 70, intfont2, 0)
		    Font.Draw ("A basic, mana adding attack.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_SideCut, 2)
		    Font.Draw (DisplayLevel + " / 9", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 59 and rangeX <= 94) and (rangeY >= 372 and rangeY <= 407) then
		Draw.Box (58, 371, 94, 407, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 16)Double Slash. Hits twice of Side-Cut.", 16, 70, intfont2, 0)
		    Font.Draw ("Skill level only adds number of Side-Cuts.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_DoubleSlash, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 129 and rangeX <= 164) and (rangeY >= 372 and rangeY <= 407) then
		Draw.Box (129, 373, 164, 407, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 13)BloodShot. Targets the arteries of the target.", 16, 70, intfont2, 0)
		    Font.Draw ("(Damage increases with speed and skill level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_BloodShot, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif rangeX >= 280 and rangeX <= 314 and rangeY >= 431 and rangeY <= 466 then
		Draw.Box (280, 431, 314, 466, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 20) Aimed Arrow. Launch 2 arrows towards the target.", 16, 70, intfont2, 0)
		    Font.Draw ("First bow skill. Speed helps damage.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Mana_Shot, 2)
		    Font.Draw (DisplayLevel + " / 6", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 333 and rangeX <= 368) and (rangeY >= 434 and rangeY <= 469) then
		Draw.Box (333, 434, 368, 469, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 10) Mana Shot, fires a large blue vapour to burn the target.", 16, 70, intfont2, 0)
		    Font.Draw ("First Magic skill. Does more damage with level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Mana_Shot, 2)
		    Font.Draw (DisplayLevel + " / 6", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 214 and rangeX <= 249) and (rangeY >= 349 and rangeY <= 384) then
		Draw.Box (214, 349, 249, 384, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 23) SpeedSlice. Strikes so fast, the target cannot react.", 16, 70, intfont2, 0)
		    Font.Draw ("Damage increases with level and speed.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_SpeedSlice, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 281 and rangeY <= 317) then
		Draw.Box (417, 281, 452, 317, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 40)Star Shot. Burns the target three times, dealing 90% each.", 16, 70, intfont2, 0)
		    Font.Draw ("Burning increases with Int and Skill Level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_StarShot, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 217 and rangeX <= 252) and (rangeY >= 432 and rangeY <= 468) then
		Draw.Box (217, 432, 252, 468, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 11) Shots. Fires bullets on targets, dealing 50% - 250% damage", 16, 70, intfont2, 0)
		    Font.Draw ("Damage increases with Speed and Skill Level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Shot_s, 2)
		    Font.Draw (DisplayLevel + " / 7", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 266 and rangeX <= 301) and (rangeY >= 264 and rangeY <= 299) then
		Draw.Box (266, 264, 301, 299, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 100) Quad Shot, designed for gunners and archers.", 16, 70, intfont2, 0)
		    Font.Draw ("Shoots an array of projectiles, launching massive aerial damage.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_QuadShot, 2)
		    Font.Draw (DisplayLevel + " / 6", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 56 and rangeX <= 91) and (rangeY >= 273 and rangeY <= 308) then
		Draw.Box (56, 273, 91, 308, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 50) Raised Curve. Glints down space and rains blows on the enemy.", 16, 70, intfont2, 0)
		    Font.Draw ("Slashes from above. Damage increases with Hp.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_RaisedCurve, 2)
		    Font.Draw (DisplayLevel + " / 3", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 356 and rangeX <= 391) and (rangeY >= 199 and rangeY <= 234) then
		Draw.Box (356, 199, 391, 234, 11)
		if Turok = 0 then
		    Font.Draw (" (Cost 94) Summon. Summon a shadow minion.", 16, 70, intfont2, 0)
		    Font.Draw ("Summons an aid that recovers mana and deals damage. Level affects amount dealt.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Shadow, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 287 and rangeX <= 322) and (rangeY >= 198 and rangeY <= 233) then
		Draw.Box (287, 198, 322, 233, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 134)Opped Shield. Conjures a magic shield to protect the user.", 16, 70, intfont2, 0)
		    Font.Draw ("Uses Mana and Int to protect the user. Hp increases with skill level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_OppedShield, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 165 and rangeX <= 200) and (rangeY >= 301 and rangeY <= 336) then
		Draw.Box (165, 301, 200, 336, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 118) Sniper. May cause headshots.", 16, 70, intfont2, 0)
		    Font.Draw ("Shoots 1 - 2 arrows at varying speeds towards the target.", 16, 50, intfont2, 0)
		    Font.Draw (" Affected by level, class and speed.", 16, 30, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Sniper, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 10, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 340 and rangeX <= 375) and (rangeY >= 264 and rangeY <= 299) then
		Draw.Box (340, 264, 375, 299, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 65) Wind Lash. Heals your Hp.", 16, 70, intfont2, 0)
		    Font.Draw (" Brings wind blades to soothe your lungs. Healing depends on Level and Skill level.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_WindLash, 2)
		    Font.Draw (DisplayLevel + " / 9", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 362 and rangeX <= 397) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (362, 371, 397, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 29) Regen. Regenerates mana.", 16, 70, intfont2, 0)
		    Font.Draw (" Mana regenerated is affected by skill level and Int.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Regen, 3)
		    Font.Draw (DisplayLevel + " / 9", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (417, 371, 452, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 35) Burning Metal. Hurls spontaneous shards of titanium towards the foes.", 16, 70, intfont2, 0)
		    Font.Draw (" More Skill Level and Int affects amount of shards.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_BurningMetal, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 75 and rangeX <= 110) and (rangeY >= 179 and rangeY <= 214) then
		Draw.Box (75, 179, 110, 214, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 51) Heart Endo. Crushes the soul with a stab to the heart.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases chance to pierce the heart.", 17, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_HeartEndo, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 311 and rangeX <= 346) and (rangeY >= 142 and rangeY <= 177) then
		Draw.Box (311, 142, 346, 177, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 145) Super Scription. Unleash a torrent of light to pierce enemies at random.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases arrows shot.", 17, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_SuperScription, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 133 and rangeX <= 168) and (rangeY >= 179 and rangeY <= 214) then
		Draw.Box (133, 179, 168, 214, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 56) Tunsh Shot. Shoots a shotgun shell that explodes upon impact.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases damage and spread.", 17, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_TunshShot, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 305 and rangeX <= 340) and (rangeY >= 371 and rangeY <= 406) then
		Draw.Box (305, 371, 340, 406, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 44) Eve. Summons the evening Moon to reflect light.", 17, 70, intfont2, 0)
		    Font.Draw (" Leaves the opponent at a lower % of Hp.", 17, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Eve, 2)
		    Font.Draw (DisplayLevel + " / 8", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 122 and rangeX <= 157) and (rangeY >= 235 and rangeY <= 270) then
		Draw.Box (122, 235, 157, 270, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 63) Stinging bow. Slaps the bow across the cheek.", 17, 70, intfont2, 0)
		    Font.Draw (" A higher skill level increases chance of a debuff.", 17, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_StingingBow, 2)
		    Font.Draw (DisplayLevel + " / 8", 16, 30, intfont2, 54)
		    Turok := 1
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 525 and rangeX <= 608) and (rangeY >= 68 and rangeY <= 94) then
		Draw.Box (525, 68, 608, 94, 16)
		% Reset button
		Boole := true
		Hoole := false
	    elsif (rangeX >= 418 and rangeX <= 453) and (rangeY >= 206 and rangeY <= 241) then
		Draw.Box (418, 206, 453, 241, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 75) White Tundra. Sends a forthcoming northern Blizzard to deal with the enemy.", 16, 70, intfont2, 0)
		    Font.Draw ("Freezes the enemy, and deals damage to scale with Int.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_WhiteTundra, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 182 and rangeX <= 217) and (rangeY >= 234 and rangeY <= 269) then
		Draw.Box (182, 234, 217, 269, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 90) Unleashes the fury of the Taggerung.", 16, 70, intfont2, 0)
		    Font.Draw ("More Speed allows more ferocious attacks.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_Taggerung, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 95 and rangeX <= 130) and (rangeY >= 122 and rangeY <= 157) then
		Draw.Box (95, 122, 130, 157, 11)
		if Turok = 0 then
		    Font.Draw ("(Cost 110) Zeno's Sword. A chrome plated sword once wielded by the mighty Zeno.", 16, 70, intfont2, 0)
		    Font.Draw ("Cuts at the throat, stealing their life and soul.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_ZenosSword, 2)
		    Font.Draw (DisplayLevel + " / 7", 16, 30, intfont2, 54)
		    Turok := 1
		    Boole := true
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 216 and rangeX <= 251) and (rangeY >= 139 and rangeY <= 174) then
		Draw.Box (216, 139, 251, 174, 11)
		if Turok = 0 then
		    Font.Draw ("(160) Summons a Mighty Polar wind to sweep the Earth with gusts.", 16, 70, intfont2, 0)
		    Font.Draw ("Deals almost none to massive damage. Can kill almost any foe.", 16, 50, intfont2, 0)
		    DisplayLevel := realstr (Skill_Level_JetStream, 2)
		    Font.Draw (DisplayLevel + " / 5", 16, 30, intfont2, 54)
		    Turok := 1
		else
		end if
		Boole := true
		Hoole := false
	    elsif (rangeX >= 705 and rangeX <= 723) and (rangeY >= 83 and rangeY <= 93) then
		Draw.Box (705, 83, 723, 93, 11)
		% Speed attr
		Boole := true
		Hoole := false
		if button = 1 then
		    Exiting := false
		    Added -= 1
		    if Added >= 0 then
			AddedSpeed += 1
		    else
			Added := 0
		    end if
		    delay (100)
		end if
	    elsif (rangeX >= 705 and rangeX <= 723) and (rangeY >= 62 and rangeY <= 72) then
		Draw.Box (705, 62, 723, 72, 11)
		% Damage attr
		Boole := true
		Hoole := false
		if button = 1 then
		    Exiting := false
		    Added -= 1
		    if Added >= 0 then
			AddedDamage += 1
		    else
			Added := 0
		    end if
		    delay (100)
		end if
	    elsif (rangeX >= 705 and rangeX <= 723) and (rangeY >= 39 and rangeY <= 49) then
		Draw.Box (705, 39, 723, 49, 11)
		% Int attr
		Boole := true
		Hoole := false
		if button = 1 then
		    Exiting := false
		    Added -= 1
		    if Added >= 0 then
			AddedIntelligence += 1
		    else
			Added := 0
		    end if
		    delay (100)
		end if
	    elsif (rangeX >= 705 and rangeX <= 723) and (rangeY >= 17 and rangeY <= 28) then
		Draw.Box (705, 17, 723, 28, 11)
		% Res attr
		Boole := true
		Hoole := false
		if button = 1 then
		    Exiting := false
		    Added -= 1
		    if Added >= 0 then
			AddedHp += 1
		    else
			Added := 0
		    end if
		    delay (100)
		end if
	    elsif (rangeX >= 701 and rangeX <= 730) and (rangeY >= 448 and rangeY <= 478) then
		Draw.Box (701, 448, 730, 478, 11)
		% Exit
		Boole := true
		Hoole := false
	    else
	    end if
	    % Clicking
	    Mouse.Where (rangeX, rangeY, button)
	    if (rangeX >= 526 and rangeX <= 608) and (rangeY >= 68 and rangeY <= 94) and button = 1 then
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
		Skill_Level_SideCut += 1
		Money -= 9
		if Skill_Level_SideCut >= 10 then
		    Skill_Level_SideCut -= 1
		    Money += 9
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_SideCut -= 1
		    Money += 9
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 107, 432, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 59 and rangeX <= 94) and (rangeY >= 372 and rangeY <= 407) and button = 1 then
		Skill_Level_DoubleSlash += 1
		Money -= 16
		if Skill_Level_DoubleSlash > 6 then
		    Skill_Level_DoubleSlash := 6
		    Money += 16
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_DoubleSlash -= 1
		    Money += 16
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 59, 372, picXor)
		    delay (500)
		    exit
		end if
	    elsif (rangeX >= 129 and rangeX <= 164) and (rangeY >= 372 and rangeY <= 407) and button = 1 then
		Skill_Level_BloodShot := Skill_Level_BloodShot + 1
		Money -= 13
		if Skill_Level_BloodShot >= 6 then
		    Skill_Level_BloodShot -= 1
		    Money += 13
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_BloodShot -= 1
		    Money += 13
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 129, 372, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 333 and rangeX <= 368) and (rangeY >= 434 and rangeY <= 469) and button = 1 then
		Skill_Level_Mana_Shot := Skill_Level_Mana_Shot + 1
		Money -= 10
		if Skill_Level_Mana_Shot >= 7 then
		    Skill_Level_Mana_Shot -= 1
		    Money += 10
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Mana_Shot -= 1
		    Money += 10
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 333, 434, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 214 and rangeX <= 249) and (rangeY >= 349 and rangeY <= 384) and button = 1 then
		Skill_Level_SpeedSlice := Skill_Level_SpeedSlice + 1
		Money -= 23
		if Skill_Level_SpeedSlice >= 6 then
		    Skill_Level_SpeedSlice -= 1
		    Money += 23
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_SpeedSlice -= 1
		    Money += 23
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 214, 349, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 418 and rangeX <= 452) and (rangeY >= 282 and rangeY <= 317) and button = 1 then
		Skill_Level_StarShot += 1
		Money -= 40
		if Skill_Level_StarShot >= 6 then
		    Skill_Level_StarShot -= 1
		    Money += 40
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_StarShot -= 1
		    Money += 40
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 418, 282, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 217 and rangeX <= 252) and (rangeY >= 432 and rangeY <= 468) and button = 1 then
		Skill_Level_Shot_s += 1
		Money -= 11
		if Skill_Level_Shot_s >= 8 then
		    Skill_Level_Shot_s -= 1
		    Money += 11
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Shot_s -= 1
		    Money += 11
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 217, 434, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 56 and rangeX <= 91) and (rangeY >= 273 and rangeY <= 308) and button = 1 then
		Skill_Level_RaisedCurve += 1
		Money -= 50
		if Skill_Level_RaisedCurve >= 6 then
		    Skill_Level_RaisedCurve -= 1
		    Money += 50
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_RaisedCurve -= 1
		    Money += 50
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 57, 273, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 280 and rangeX <= 314) and (rangeY >= 431 and rangeY <= 466) and button = 1 then
		Skill_Level_AimedArrow += 1
		Money -= 50
		if Skill_Level_AimedArrow >= 6 then
		    Skill_Level_AimedArrow -= 1
		    Money += 50
		    Font.Draw ("Skill maxxed at [5]", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_AimedArrow -= 1
		    Money += 50
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 360, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 340 and rangeX <= 375) and (rangeY >= 264 and rangeY <= 299) and button = 1 then
		Skill_Level_WindLash += 1
		Money -= 65
		if Skill_Level_WindLash >= 10 then
		    Skill_Level_WindLash -= 1
		    Money += 65
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_WindLash -= 1
		    Money += 65
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 340, 264, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 362 and rangeX <= 397) and (rangeY >= 371 and rangeY <= 406) and button = 1 then
		Skill_Level_Regen += 1
		Money -= 29
		if Skill_Level_Regen > 9 then
		    Skill_Level_Regen := 9
		    Money += 29
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Regen -= 1
		    Money += 29
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 362, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 370 and rangeY <= 405) and button = 1 then
		Skill_Level_BurningMetal += 1
		Money -= 35
		if Skill_Level_BurningMetal >= 6 then
		    Skill_Level_BurningMetal -= 1
		    Money += 35
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_BurningMetal -= 1
		    Money += 35
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 417, 370, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 266 and rangeX <= 301) and (rangeY >= 264 and rangeY <= 299) and button = 1 then
		Skill_Level_QuadShot += 1
		Money -= 82
		if Skill_Level_QuadShot > 7 then
		    Skill_Level_QuadShot -= 1
		    Money += 100
		    Font.Draw ("Skill at maximum shots. [6]", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_QuadShot -= 1
		    Money += 100
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 266, 371, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 182 and rangeX <= 217) and (rangeY >= 234 and rangeY <= 269) and button = 1 then
		Skill_Level_Taggerung += 1
		Money -= 90
		if Skill_Level_Taggerung >= 6 then
		    Skill_Level_Taggerung -= 1
		    Money += 90
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Taggerung -= 1
		    Money += 90
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 182, 234, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 418 and rangeX <= 453) and (rangeY >= 206 and rangeY <= 241) and button = 1 then
		Skill_Level_WhiteTundra += 1
		Money -= 75
		if Skill_Level_WhiteTundra >= 6 then
		    Skill_Level_WhiteTundra -= 1
		    Money += 75
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_WhiteTundra -= 1
		    Money += 75
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 418, 206, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 95 and rangeX <= 130) and (rangeY >= 122 and rangeY <= 157) and button = 1 then
		Skill_Level_ZenosSword += 1
		Money -= 110
		if Skill_Level_ZenosSword > 8 then
		    Skill_Level_ZenosSword -= 1
		    Money += 110
		    Font.Draw ("Skill maxxed.", 25, 20, intfont1, 54)
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_ZenosSword -= 1
		    Money += 110
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
		else
		    Pic.Draw (Flash, 75, 179, picXor)
		    delay (500)
		end if
		exit
	    elsif (rangeX >= 216 and rangeX <= 251) and (rangeY >= 139 and rangeY <= 174) and button = 1 then
		Skill_Level_JetStream += 1
		Money -= 160
		if Skill_Level_RaisedCurve >= 4 then
		    Skill_Level_JetStream -= 1
		    Money += 160
		    put "Skill maxxed out, at 3."
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_JetStream -= 1
		    Money += 160
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Shadow -= 1
		    Money += 94
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_OppedShield -= 1
		    Money += 134
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Sniper -= 1
		    Money += 118
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_HeartEndo -= 1
		    Money += 82
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_SuperScription -= 1
		    Money += 145
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_TunshShot -= 1
		    Money += 126
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    Money += 126
		    put "Skill maxxed, 7"
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_Eve -= 1
		    Money += 126
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		    delay (500)
		elsif Money < 0 then
		    Skill_Level_StingingBow -= 1
		    Money += 78
		    Font.Draw ("Not enough money.", 25, 20, intfont1, 54)
		    delay (500)
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
		Draw.Box (95, 122, 130, 157, 0)
		Draw.FillBox (16, 15, 514, 79, 16)
		Draw.FillBox (25, 20, 200, 40, 16)
		Draw.FillBox (584, 157, 674, 173, 16)
		Draw.FillBox (614, 140, 674, 185, 16)
		Draw.FillBox (546, 118, 674, 136, 16)
		Draw.FillBox (575, 174, 674, 188, 16)
		Draw.FillBox (528, 19, 606, 41, 0)
		Draw.Box (280, 431, 314, 466, 0)
		DisplayPoints := realstr (Added, 4)
		Font.Draw (DisplayPoints + "", 530, 22, intfont2, 16)
		DisplaySpeed := realstr ((Speed - PreviousSpeed) + AddedSpeed, 4)
		Font.Draw (DisplaySpeed + "", 576, 178, intfont2, 0)
		DisplayDamage := realstr ((Damage - PreviousDamage * 3) + AddedDamage * 3, 4)
		Font.Draw (DisplayDamage + "", 591, 161, intfont2, 0)
		DisplayIntelligence := realstr ((Intelligence - PreviousIntelligence * 5) + AddedIntelligence * 5, 4)
		Font.Draw (DisplayIntelligence + "", 620, 144, intfont2, 0)
		DisplayHp := realstr ((Hp - PreviousHp * 50) + AddedHp * 50, 4)
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
	StackHp := (StackHp - PreviousHp * 50) + (AddedHp * 50)
	StackDamage := (StackDamage - PreviousDamage * 3) + (AddedDamage * 3)
	StackIntelligence := (StackIntelligence - PreviousIntelligence * 5) + (AddedIntelligence * 5)
	cls
	if Exiting = true then
	    exit
	else
	end if
    end loop
end Buy

% Pet

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

% Procedures..

% Fighting Procedures [FIGHTS1]

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

% [PLACES1]
proc KligeSharp
    loop
	cls
	colourback (151)
	Font.Draw ("Klige Sharp", 100, 500, intfont, 54)
	Font.Draw ("(1-34g)Hp Potion (+ 30% Hp)", 10, 200, intfont1, 54)
	Font.Draw ("(2-27g)Mana Potion (+ 40% mana)", 10, 180, intfont1, 54)
	Font.Draw ("(3-14g)Horn of Fury (+ 10 Attack)", 10, 160, intfont1, 54)
	Font.Draw ("(4-10g)Dead Elephant's Ivory(+ 10 Int)", 10, 140, intfont1, 54)
	Font.Draw ("(5-80g)Gobalani Velvet trinket (+ Random Attack)", 10, 120, intfont1, 54)
	Font.Draw ("(6-5g)Durable (+ 135 Hp and 60 Mana) ", 10, 100, intfont1, 54)
	Font.Draw ("(7)Exit ", 10, 80, intfont1, red)
	get KligeSharpanswer
	if KligeSharpanswer = 1 then
	    Hp += THp * 0.3
	    Money -= 34
	elsif KligeSharpanswer = 2 then
	    Mana += TMana * 0.4
	    Money -= 27
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
	    Money -= 5
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

proc MyunertStore
    loop
	cls
	colourback (0)
	locatexy (10, 520)
	put "Your money: ", Money, "g"
	put " Your Hp: ", Hp, " / ", THp
	put " Your mana: ", Mana, " / ", TMana
	Font.Draw ("Myunert's Store", 100, 540, intfont, 10)
	Font.Draw ("(1-9g) Cereal (+ 200 Hp and 45 Mana)", 10, 240, intfont1, 41)
	Font.Draw ("(2-1g) Rice (+ 12 Hp and 12 Mana )", 10, 220, intfont1, 41)
	Font.Draw ("(3-40g) Jellyfish (Random effect)", 10, 200, intfont1, 41)
	Font.Draw ("(4-21g) Chocolate (+ 500 mana)", 10, 180, intfont1, 41)
	Font.Draw ("(5-45g) Salad (+ 50% Hp and 16 mana)", 10, 160, intfont1, 41)
	Font.Draw ("(6-5g) Chips (+ 35 Hp, Mana and unknown effect) ", 10, 140, intfont1, 41)
	Font.Draw ("(7) Exit", 10, 120, intfont1, 39)
	Font.Draw ("(8) Talk to Myunert", 10, 100, intfont1, 49)
	get MyunertStoreanswer
	if Money < 0 then
	    Font.Draw ("You can't buy that.", 10, 50, intfont1, red)
	    delay (2000)
	elsif MyunertStoreanswer = 1 then
	    Money -= 9
	    Hp += 200
	    Mana += 45
	elsif MyunertStoreanswer = 2 then
	    Money -= 1
	    Hp += 12
	    Mana += 12
	elsif MyunertStoreanswer = 3 then
	    Money -= 40
	    Jelly := Rand.Int (1, 5)
	    if Jelly = 1 then
		Hp += THp * 0.23
	    elsif Jelly = 2 then
		Mana += TMana * 0.29
	    elsif Jelly = 3 then
		Hp -= 50
	    elsif Jelly = 4 then
		Damage += Rand.Int (4, 5)
	    elsif Jelly = 5 then
		Intelligence += Rand.Int (3, 10)
	    else
		Font.Draw (" Your weapon looks ready.. ", 10, 500, intfont1, 54)
		cls
	    end if
	elsif MyunertStoreanswer = 4 then
	    Money -= 21
	    Mana += 500
	elsif MyunertStoreanswer = 5 then
	    Money -= 45
	    Hp += (THp div 2)
	    Mana += 16
	elsif MyunertStoreanswer = 6 then
	    Money -= 5
	    THp += 1
	    TMana += 1
	    Hp += 35
	    Mana += 35
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
    end loop
end MyunertStore

proc Hills
    Exiting := false
    put "The hills.."
    if Track = "Sequoyah" then
    else
	Music.PlayFileStop
	for m : 1 .. 8
	    MusicControl (m) := false
	end for
	MusicControl (4) := true
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

proc Training2
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
	if Mission = 1 then
	    MissionCost := 5
	elsif Mission = 2 then
	    MissionCost := 7
	elsif Mission = 3 then
	    MissionCost := 12
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
	mousewhere (rangeX, rangeY, button)
	if (rangeX >= 335 and rangeX <= 415) and (rangeY >= 170 and rangeY <= 200) then
	    Draw.Box (335, 170, 415, 200, 11)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		MArray (Mission) := 1
		Money -= MissionCost
		Font.Draw ("Tab accepted.", 15, 135, intfont2, 54)
		exit
	    end if
	    Draw.FillBox (2, 2, maxx - 2, 56, 16)
	elsif (rangeX >= 425 and rangeX <= 504) and (rangeY >= 170 and rangeY <= 200) then
	    Draw.Box (425, 170, 504, 200, 11)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		exit
	    end if
	elsif Hoole = false and Boole = false then
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
    Draw.FillBox (19, 166, 503, 490, 16)
    if Mission = 1 then
	Font.Draw ("A missing cat", 35, 447, intfont, 55)
    elsif Mission = 2 then
	Font.Draw ("The Billejun Bandits", 35, 447, intfont, 55)
    elsif Mission = 3 then
	Font.Draw ("The way to Black Gull", 35, 447, intfont, 55)
    elsif Mission = 4 then
	Font.Draw ("How far?", 35, 447, intfont, 55)
    elsif Mission = 5 then
	Font.Draw ("Dire straits", 35, 447, intfont, 55)
    elsif Mission = 6 then
	Font.Draw ("A thousand fires", 35, 447, intfont, 55)
    elsif Mission = 7 then
	Font.Draw ("Unknown gem?", 35, 447, intfont, 55)
    elsif Mission = 8 then
	Font.Draw ("Assassinate Toigre!", 35, 447, intfont, 55)
    elsif Mission = 9 then
	Font.Draw ("Help! Armorsmith dead", 35, 447, intfont, 55)
    elsif Mission = 10 then
	Font.Draw ("Cave of ice", 35, 447, intfont, 55)
    elsif Mission = 11 then
	Font.Draw ("A maze to Hezlow", 35, 447, intfont, 55)
    else
	MissionCost := 0
    end if
    loop
	Mouse.Where (rangeX, rangeY, button)
	if rangeX >= 30 and rangeX <= 320 and rangeY >= 440 and rangeY <= 474 then
	    Draw.Box (30, 440, 320, 474, 54)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		if Mission = 0 then
		    Font.Draw ("I lost my cat Fhesh last night.. and I can't find her! I'm getting really worried now.", 15, 135, intfont2, 13)
		    Font.Draw ("If anyone could find her for me, I'd be willing to part with my ringlet. I lost her near Tima. ", 15, 115, intfont2, 13)
		    Font.Draw ("She's a grey tabby, and responds to 'Fhesh.' Any help is appreciated! ", 15, 95, intfont2, 13)
		    delay (500)
		    Hoole := false
		    Boole := false
		elsif Mission = 1 then
		elsif Mission = 2 then
		    Font.Draw ("Somebody, please help! We're the village of Rretulok. We're quite far up North, so we need to trade", 15, 135, intfont2, 13)
		    Font.Draw ("for many of our items. Usually, we have a surplus of goods as our Mammoth fur and Fetrin metal are ", 15, 115, intfont2, 13)
		    Font.Draw ("rare to other regions. However, a group of Billejun Bandits have started to raid our traders. Route them! ", 15, 95, intfont2, 13)
		    delay (500)
		    Hoole := false
		    Boole := false
		elsif Mission = 3 then
		    Font.Draw ("Near Creile Castle is the Coast of Black Gull.", 15, 135, intfont2, 13)
		    Font.Draw ("My town, Hessin, is being destroyed by a seaquake. ", 15, 115, intfont2, 13)
		    Font.Draw ("Some hooligans are plundering the shops, something, anything will help!", 15, 95, intfont2, 13)
		    Hoole := false
		    Boole := false
		elsif Mission = 4 then
		elsif Mission = 5 then
		elsif Mission = 6 then
		elsif Mission = 7 then
		elsif Mission = 8 then
		elsif Mission = 9 then
		elsif Mission = 10 then
		else
		end if
	    end if
	elsif rangeX >= 20 and rangeX <= 176 and rangeY >= 496 and rangeY <= 545 then % Tabs button
	    Draw.Box (20, 496, 176, 545, 0)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		TabMissionsSwitching := true
		exit
	    end if
	elsif rangeX >= 341 and rangeX <= 498 and rangeY >= 496 and rangeY <= 545 then % Recent button
	    Draw.Box (341, 496, 498, 545, 0)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		TabCompleteSwitching := true
		exit
	    end if
	elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then % Exit button
	    Draw.Line (605, 508, 605, 546, 11)
	    Draw.Line (706, 508, 706, 546, 11)
	    Hoole := false
	    Boole := true
	    if button = 1 then
		Exiting := true
		exit
	    end if
	else
	end if
	if Hoole = false and Boole = false then
	    Draw.Box (30, 440, 320, 474, 24)
	    Draw.Box (180, 496, 337, 545, 2)
	    Draw.Box (341, 496, 498, 545, 12)
	    Draw.Line (605, 508, 605, 546, 12)
	    Draw.Line (706, 508, 706, 546, 12)
	    Hoole := true
	else
	end if
	Boole := false
    end loop
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
	    Font.Draw (" [3] Leave", 40, 30, intfont1, 38)
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
		    Font.Draw ("A Tab is coloured according to the main type of objective it has. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Frizul labels them accordingly: ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("A 'Find' tab. Find a certain item - White ", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("A 'Kill' tab. You'll probably kill someone - Red", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("A 'Search' tab. You must look for clues, the request is vague - Blue", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("An 'Item' tab. Probably an artefact.. this type is highly worth it but rare. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Most likely Frizul has put them out himself, as he's too lazy to leave the base.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("Those are Green.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("Finally, there's the 'Assassinate' tab. Any of us can request these.. - Purple", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("A 'Search' tab. You must look for clues, the request is vague - Blue", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("When there is an 'Assassinate' tab, finish it quickly. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("The target may be killed by someone else. Also, they are a high priority target.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("The tab requestor may retract the tab if the target is killed.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("Well.. that's all you need to know, anyways.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("What else is there?", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		elsif LoungeGongsunSheng = 2 then
		    Font.Draw ("Experience, eh? Levelling up you mean. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Levels are badges of experience. The more you taste, the smarter you are in everything. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("I'm Level 5, with 556 exp. You'll pass that soon, right?", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("If you want to get stronger, try training against foes you've fought before.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Ah. We have a training room in our base, against dummies. They have dummy classes too.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("If you want to test your skills, go there. If you die you won't spawn in the transtelon- ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("The dummy won't actually kill you. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("And, you can leave when you want.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("Of course, if you beat the dummy, you'd finish anyways.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("You have to pay to practice there though, Frizul buys the dummies.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		elsif LoungeGongsunSheng = 3 then
		    Font.Draw ("Gobalan? I don't know much about that country, I don't visit much. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("What I do know.. they had the most population, both military and civillian.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("They've also suffered the most casualties- their agriculture is poor.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("They have the most Airbirds, a notable feat. Especially in their trading companies.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("However, I'm sure the Secret Library knows.. about the leader, Gurlensaiyer Swutyz.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    getch (waitkey)
		elsif LoungeGongsunSheng = 4 then
		    Font.Draw ("I'm sad to say, I've only been to the Library once. If you do find it.. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("you are sworn to secrecy to never reveal its position.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("And that's why Seyla and Frizul don't speak about it.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("Not like the librarians could do anything, eh? It's promises.. silly promises.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Bah. All I know is that it's somewhere in the Plaza.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		elsif LoungeGongsunSheng = 5 then
		    Font.Draw ("So, you want to understand the Transtelon? ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Ah. According to the Theory of Everything, it isn't possible. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("But it is. I don't know the science behind it, but I've read a book about it.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("Basically, 4 doctors and 2 nurses operate a facility that holds the Transtelon.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("There's 10 buttons on it, but here are the basic ones. ", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("The Red button allows people to spawn. You need a Conducting Extrain Chip installed ", 20, 125, intfont1, 103)
		    delay (100)
		    Font.Draw ("you to connect to the Transtelon. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("The green button allows recovery. You'll start out at 1 Hp, and you can pay the Doctor, they'll get you to max Hp. ", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("If you can't pay, they might leave you at 1 Hp. Then it'll be more costly to heal back.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Seriously though, the Transtelon detects if your Hp is below 1. It's like a Revival potion.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		elsif LoungeGongsunSheng = 6 then
		    Font.Draw ("The base? Just walk around, and you'll know.  ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Okay. The Zeno Alliance created the Head Quarters 15 years ago.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("A suspected terrorist ring was operating in the mountains, and Frizul was assigned as Captain.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("When the war started, leaders realized the advantage of the proximity of Gobalan to the base.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Since it's hidden in the forest, no one has discovered since. We trade at an outpot nearby.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("If anything, it's just a tiny cottage far away from civilization. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Heh.. we also have a multi-layered basement.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("The base is strong enough to survive the JetStream.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("The password to the door is on a subway in Billejun. ", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("You know, in case someone forgot. ", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		elsif LoungeGongsunSheng = 7 then
		    Font.Draw ("Foes? Enemies? Opponents, you mean! The people you see sweating as you fight them. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("In this world, those who break universal laws and rules are those who are hunted.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("We hunt the Gobalan. They hunt us.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("They have classes they learn when they're children.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Knowing what each class does is a great way to understand what you can expect.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("The Melee class is usually seen as a wielder of swords and spears. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("Most people can't wield heavy weapons, but those that do have high attack. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("Small weapons usually indicate high speed. Watch out for their crits. ", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("A long weapon can mean controlling debuffs.. those are dangerous.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Now about mages, magi, photonic and benders.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("They all have one thing in common: Wielding the elements. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("This gives them great advantage in open fields and high damage.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("After all, a flying boulder should hurt, and ice can pierce. ", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("However, they're usually weak as they practice studying rather then building strength.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Hah.. the gunner is the like the opposite.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("The gunner uses a wide variety of man-made items to attack opponents from afar. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("This gives them fast attack speed and high damage. Their Hp is pretty good, too.", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("They're usually dangerous, as they're not bad at anything they do.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("However, their magic is horrendous, keep that in mind.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("As for the last class, it includes Archers, Flingers, Bolas and Javelins.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
		    Font.Draw ("The Ranged class does not count into Gunners. They are similar, though. ", 20, 125, intfont1, 103)
		    delay (700)
		    Font.Draw ("They have moderate speed, high magic and sufficient damage. ", 20, 100, intfont1, 103)
		    delay (700)
		    Font.Draw ("Find their weakness in targetting. They usually can only have 1 target attacks.", 20, 75, intfont1, 103)
		    delay (700)
		    Font.Draw ("They're also pretty easy to kill.. as long as you dodge them.", 20, 50, intfont1, 103)
		    delay (700)
		    Font.Draw ("Yeah, that's about it. I'm Melee and Ranged.", 20, 25, intfont1, 103)
		    getch (waitkey)
		    Pic.Draw (Speech, 1, 1, picCopy)
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
		exit
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
    % Tabs = Missions
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
			    getch (waitkey)
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
			    if button = 1 then
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
			    end if
			elsif (rangeX >= 180 and rangeX <= 337) and (rangeY >= 496 and rangeY <= 556) then
			    Draw.Box (180, 497, 337, 546, 0)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				StoryStuff := true
				TabCurrentSwitching := true
				exit
			    end if
			elsif (rangeX >= 341 and rangeX <= 498) and (rangeY >= 496 and rangeY <= 556) then
			    Draw.Box (341, 497, 498, 546, 0)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				StoryStuff := true
				TabCurrentSwitching := true
				exit
			    end if
			elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then
			    Draw.Line (605, 508, 605, 546, 11)
			    Draw.Line (706, 508, 706, 546, 11)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				Exiting := true
				exit
			    end if
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
		elsif Storyline >= 3 then % Missions list
		    Draw.FillBox (19, 166, 503, 490, 16)
		    Draw.FillBox (0, 0, maxx, maxy, 0)
		    Pic.Draw (ZenoHQTabs, 0, 0, picCopy)
		    if MArray (2) = 2 then
			Font.Draw ("Frizul: The Bandits? Ahh.. I knew the Leader. Wron, his name?", 15, 135, intfont2, 12)
			delay (500)
			Font.Draw ("Gained: 46g", 10, 45, intfont2, 0)
			Font.Draw ("Reward: A note from Rretulok", 10, 25, intfont2, 0)
			Font.Draw ("Exp: + 27", 10, 5, intfont2, 0)
			Money += 46
			TMana += 40
			Experience += 27
			getch (waitkey)
			MArray (2) := 3
			exit
		    elsif MArray (3) = 2 then
			Font.Draw ("Frizul: The Black Gull was once a bustling village in Gobalan.. until Karhen visited it.", 15, 135, intfont2, 12)
			delay (500)
			Font.Draw ("Gained: 21g", 10, 45, intfont2, 0)
			Font.Draw ("Reward: The Black Gull's feather", 10, 25, intfont2, 0)
			Font.Draw ("Exp: + 25", 10, 5, intfont2, 0)
			Money += 21
			TMana += 40
			Experience += 25
			exit
		    elsif MArray (4) = 2 then
			Font.Draw ("Frizul: Joseph? Hah, you're funny. He died 10 years ago!.", 15, 135, intfont2, 12)
			delay (500)
			Font.Draw ("Gained: 25g", 10, 45, intfont2, 0)
			Font.Draw ("Reward: A memorial ticket", 10, 25, intfont2, 0)
			Font.Draw ("Exp: + 31", 10, 5, intfont2, 0)
			Money += 25
			TMana += 40
			Experience += 31
			exit
		    end if
		    loop
			% Finishing results (All missions)
			% Clears main box
			Font.Draw ("The Billejun Bandits", 35, 447, intfont, 13)         % Mission 2
			Font.Draw ("The way to Black Gull", 35, 383, intfont, 13)         % Mission 3
			Font.Draw ("How far?", 35, 319, intfont, 13)         % Mission 4
			mousewhere (rangeX, rangeY, button)
			if rangeX >= 30 and rangeX <= 320 and rangeY <= 474 then
			    if rangeY >= 440 and rangeY <= 474 then
				Draw.Box (30, 440, 320, 474, 11)
				Hoole := false
				Boole := true
				if button = 1 then
				    Mission := 2
				    Font.Draw ("Somebody, please help! We're the village of Rretulok. We're quite far up North, so we need to trade", 15, 135, intfont2, 13)
				    Font.Draw ("for many of our items. Usually, we have a surplus of goods as our Mammoth fur and Fetrin metal are ", 15, 115, intfont2, 13)
				    Font.Draw ("rare to other regions. However, a group of Billejun Bandits have started to raid our traders. Route them! ", 15, 95, intfont2, 13)
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
				end if
			    elsif rangeY >= 376 and rangeY <= 410 then
				Draw.Box (30, 376, 320, 410, 11)
				Hoole := false
				Boole := true
				if button = 1 then
				    Mission := 3
				    Font.Draw ("Near Creile Castle is the Coast of Black Gull.", 15, 135, intfont2, 13)
				    Font.Draw ("My town, Hessin, is being destroyed by a seaquake. ", 15, 115, intfont2, 13)
				    Font.Draw ("Some hooligans are plundering the shops, something, anything will help!", 15, 95, intfont2, 13)
				    Font.Draw ("Cost: 12g to Frizul.", 10, 45, intfont2, 0)
				    Font.Draw ("Reward: 60g, 54 Exp ", 10, 25, intfont2, 0)
				    Font.Draw ("Requirement: Lv4+ ", 10, 5, intfont2, 0)
				    Hoole := false
				    Boole := false
				    Font.Draw ("[Accept Tab]    [Decline]", 340, 175, intfont2, 0)
				    AcceptDeclineFuttons
				    Hoole := false
				    Boole := false
				    Draw.FillBox (10, 65, 738, 151, 0)
				    exit
				end if
			    elsif rangeY >= 312 and rangeY <= 346 then
				Draw.Box (30, 312, 320, 346, 11)
				Hoole := false
				Boole := true
			    end if
			elsif (rangeY >= 496 and rangeY <= 546) and rangeX >= 180 and rangeX <= 337 then
			    Draw.Box (180, 496, 337, 545, 0)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				StoryStuff := true
				TabCurrentSwitching := true
				exit
			    end if
			elsif (rangeY >= 496 and rangeY <= 546) and rangeX >= 341 and rangeX <= 498 then
			    Draw.Box (341, 496, 498, 545, 0)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				StoryStuff := true
				TabCompleteSwitching := true
				exit
			    end if
			elsif (rangeX >= 594 and rangeX <= 726) and (rangeY >= 499 and rangeY <= 554) then
			    Draw.Line (605, 508, 605, 546, 11)
			    Draw.Line (706, 508, 706, 546, 11)
			    Hoole := false
			    Boole := true
			    if button = 1 then
				Exiting := true
				exit
			    end if
			end if
			%Displaying information for Missions [Description, rewards and accepting.]
			if Hoole = false and Boole = false then
			    Draw.Box (30, 440, 320, 474, 0)
			    Draw.Box (30, 376, 320, 410, 0)
			    Draw.Box (30, 312, 320, 346, 0)
			    Draw.Box (180, 496, 337, 545, 2)
			    Draw.Box (341, 496, 498, 545, 12)
			    Draw.Line (605, 508, 605, 546, 12)
			    Draw.Line (706, 508, 706, 546, 12)
			    Hoole := true
			end if
			Boole := false
			if Exiting = true then
			    exit
			end if
		    end loop
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
		Draw.FillBox (0, 0, maxx, maxy, 0)
		Pic.Draw (ZenoHQTabs, 0, 0, picCopy)
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

proc ZenoHQ         % [ZENOHQ1]
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
		if button = 1 then
		    Lounge
		    exit
		end if
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 115 and rangeY <= 156) then
		Draw.Box (442, 115, 578, 155, 54)
		Draw.Line (449, 124, 449, 147, 41)
		Draw.Line (572, 124, 572, 147, 41)
		Hoole := false
		Boole := true
		if button = 1 then
		    Tabs
		    exit
		end if
	    elsif (rangeX >= 442 and rangeX <= 578) and (rangeY >= 70 and rangeY <= 111) then
		Draw.Box (442, 70, 578, 111, 54)
		Draw.Line (449, 79, 449, 102, 24)
		Draw.Line (572, 79, 572, 102, 24)
		Hoole := false
		Boole := true
		if button = 1 then
		    SpecialTraining
		    exit
		end if
	    elsif (rangeX >= 619 and rangeX <= 746) and (rangeY >= 3 and rangeY <= 66) then
		Draw.Box (619, 3, 746, 66, 0)
		Draw.Line (629, 53, 735, 53, 11)
		Draw.Line (629, 16, 736, 16, 11)
		Hoole := false
		Boole := true
		if button = 1 or Teleport = true then
		    Exiting := true
		    exit
		end if
	    elsif Teleport = true then
		Exiting := true
		exit
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
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Screens
    for i : 1 .. 10
	Draw.Box (i, i, maxx + 1 - i, maxy + 1 - i, 25 - i)
    end for
    FirstKey := 0
    Transcision := 0
    if Teleport = true then
	Teleport := false
	Screens
	Pic.Draw (TranstelonPic, 0, 0, picCopy)
	put " Mix the 3 chemicals in order. The 2nd input is given."
	put " The correct order will ensure a free revival."
	Draw.FillBox (280, 450, 310, 480, 0)
	Draw.FillBox (360, 450, 390, 480, 0)
	RandomChoose := Rand.Int (1, 3)
	if RandomChoose = 1 then
	    RJuice (2) := "G"
	    Draw.FillBox (320, 450, 350, 480, 48)
	elsif RandomChoose = 2 then
	    RJuice (2) := "R"
	    Draw.FillBox (320, 450, 350, 480, 38)
	elsif RandomChoose = 3 then
	    RJuice (2) := "B"
	    Draw.FillBox (320, 450, 350, 480, 54)
	end if
	RandomChoose := Rand.Int (1, 9)
	if RandomChoose = 1 then
	    RJuice (1) := "G"
	    RJuice (3) := "B"
	elsif RandomChoose = 2 then
	    RJuice (1) := "G"
	    RJuice (3) := "G"
	elsif RandomChoose = 3 then
	    RJuice (1) := "B"
	    RJuice (3) := "G"
	elsif RandomChoose = 4 then
	    RJuice (1) := "B"
	    RJuice (3) := "B"
	elsif RandomChoose = 5 then
	    RJuice (1) := "R"
	    RJuice (3) := "G"
	elsif RandomChoose = 6 then
	    RJuice (1) := "R"
	    RJuice (3) := "B"
	elsif RandomChoose = 7 then
	    RJuice (1) := "B"
	    RJuice (3) := "R"
	elsif RandomChoose = 8 then
	    RJuice (1) := "G"
	    RJuice (3) := "R"
	elsif RandomChoose = 9 then
	    RJuice (1) := "R"
	    RJuice (3) := "R"
	end if
	Draw.Box (319, 449, 351, 481, 54)
	Draw.Box (359, 449, 391, 481, 54)
	Draw.Box (279, 449, 311, 481, 54)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if rangeX <= 200 and rangeX >= 50 then
		if rangeY <= 190 and rangeY >= 150 then
		    Draw.FillBox (50, 150, 200, 190, green)
		    CC := true
		    if button = 1 then
			Juice := "G"
			if FirstKey = 2 then
			    FirstKey := 3
			elsif FirstKey = 4 then
			    FirstKey := 5
			else
			    FirstKey := 1
			end if
			for l : 1 .. 64
			    if l < 26 then
				Draw.FillBox (100, 380, 100 + (l * 10), 400, SCL (2))
				delay (100)
			    elsif l > 43 then
				Draw.FillBox (330, 200, 330 + ((l - 42) * 10), 220, SCL (2))
				delay (100)
			    else
				Draw.FillBox (330, 380, 350, 380 - ((l - 25) * 10), SCL (2))
				delay (100)
			    end if
			end for
			delay (500)
			Draw.FillBox (100, 380, 350, 400, 0)
			Draw.FillBox (330, 380, 350, 200, 0)
			Draw.FillBox (350, 200, 550, 220, 0)
		    end if
		elsif rangeY <= 140 and rangeY >= 100 then
		    Draw.FillBox (50, 100, 200, 140, red)
		    CC := true
		    if button = 1 then
			Juice := "R"
			if FirstKey = 2 then
			    FirstKey := 3
			elsif FirstKey = 4 then
			    FirstKey := 5
			else
			    FirstKey := 1
			end if
			for l : 1 .. 64
			    if l < 26 then
				Draw.FillBox (100, 380, 100 + (l * 10), 400, SCL (1))
				delay (100)
			    elsif l > 43 then
				Draw.FillBox (330, 200, 330 + ((l - 42) * 10), 220, SCL (1))
				delay (100)
			    else
				Draw.FillBox (330, 380, 350, 380 - ((l - 25) * 10), SCL (1))
				delay (100)
			    end if
			end for
			delay (500)
			Draw.FillBox (100, 380, 350, 400, 0)
			Draw.FillBox (330, 380, 350, 200, 0)
			Draw.FillBox (350, 200, 550, 220, 0)
		    end if
		elsif rangeY <= 90 and rangeY >= 50 then
		    Draw.FillBox (50, 50, 200, 90, 55)
		    CC := true
		    if button = 1 then
			Juice := "B"
			if FirstKey = 2 then
			    FirstKey := 3
			elsif FirstKey = 4 then
			    FirstKey := 5
			else
			    FirstKey := 1
			end if
			for l : 1 .. 64
			    if l < 26 then
				Draw.FillBox (100, 380, 100 + (l * 10), 400, SCL (3))
				delay (100)
			    elsif l > 43 then
				Draw.FillBox (330, 200, 330 + ((l - 42) * 10), 220, SCL (3))
				delay (100)
			    else
				Draw.FillBox (330, 380, 350, 380 - ((l - 25) * 10), SCL (3))
				delay (100)
			    end if
			end for
			delay (500)
			Draw.FillBox (100, 380, 350, 400, 0)
			Draw.FillBox (330, 380, 350, 200, 0)
			Draw.FillBox (350, 200, 550, 220, 0)
		    end if
		else
		end if
	    end if
	    if CC = false then
		Draw.FillBox (50, 150, 200, 190, 48)
		Draw.FillBox (50, 100, 200, 140, 39)
		Draw.FillBox (50, 50, 200, 90, 54)
		CC := true
	    else
		CC := false
	    end if
	    if FirstKey < 0 or FirstKey = 1 then
		if FirstKey = 1 then
		    FirstKey := 2
		    if RJuice (1) = Juice then
			Transcision := 1
		    else
			Transcision := -1
		    end if
		else
		end if
	    end if
	    if FirstKey = 3 then
		if RJuice (2) = Juice then
		    Transcision += 1
		else
		    Transcision -= 1
		end if
		FirstKey := 4
	    end if
	    if FirstKey = 5 then
		if RJuice (3) = Juice then
		    Transcision += 1
		else
		    Transcision -= 1
		end if
		if Transcision = 3 then
		    Money -= 5
		    Hp := THp
		    put "All correct!"
		    delay (1000)
		elsif Transcision = 1 then
		    Money -= 15
		    Hp := THp
		    put "2 correct"
		    delay (1000)
		elsif Transcision = -1 then
		    Money -= 40
		    Hp := THp
		    put "2 wrong"
		    delay (1000)
		else
		    Money -= 50
		    Hp := THp
		    put "Wrong"
		    delay (1000)
		end if
		if Money < 0 then
		    Debt := (Money * -1)
		    if Debt > 99 then
			Debt := 99
		    end if
		    Hp := THp * (100 - Debt) / 100
		    Money := 1
		end if
		Mana := TMana
		exit
	    end if
	end loop
    else
	Draw.FillBox (0, 0, maxx, maxy, 53)
	Pic.Draw (TranstelonPic, 0, 0, picCopy)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	RandomChoose := Rand.Int (1, 3)
	if RandomChoose = 1 then
	    Font.Draw ("Doctor: Hello visitor, come this way.", 10, 120, intfont2, 58)
	    delay (2400)
	    Font.Draw ("Doctor: Why are you here? Someone died you want to revive? ", 10, 90, intfont2, 58)
	    delay (1400)
	    Font.Draw (" [1] When I die, what are the costs? [2] What happens when someone dies?", 10, 60, intfont2, 58)
	    delay (300)
	    get GenericInt
	    delay (500)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw ("Doctor:  . . .    ", 10, 120, intfont2, 58)
	    delay (2400)
	    if GenericInt = 1 then
		Font.Draw ("Doctor: The costs are in gold. Do you think we accept fur coats? ", 10, 90, intfont2, 58)
		delay (1400)
		Font.Draw ("Doctor: Heah? Oh. You pay us 50g.", 10, 60, intfont2, 58)
		delay (300)
		Font.Draw ("Doctor: Once you die you have a moment before revival where you use our 3 materials. ", 10, 30, intfont2, 58)
		delay (1400)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: During this time you can mix our materials to help revive you. ", 10, 120, intfont2, 58)
		delay (1400)
		Font.Draw ("Doctor: They come in the colours Green[Giacho], Red[Hasbin] and Blue[Wruclag].", 10, 90, intfont2, 58)
		delay (1900)
		Font.Draw ("Doctor: Don't understand? You don't need to. Ahead of you should be 3 colours. ", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: The colours to the left and right are white. The middle is one of the three. ", 10, 30, intfont2, 58)
		delay (1200)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: So, you gotta input the materials in the order.", 10, 120, intfont2, 58)
		delay (900)
		Font.Draw (" How do I know which colour to put if two spaces are white? ", 10, 90, intfont2, 54)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: Ain't my problem. Har har! ", 10, 120, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: If you get all correct you only pay a minimum fee.", 10, 90, intfont2, 58)
		delay (900)
		Font.Draw ("Doctor: Get them all wrong and it's 50g.", 10, 60, intfont2, 58)
		delay (1400)
		getch (waitkey)
	    elsif GenericInt = 2 then
		Font.Draw ("Doctor: Their body disentagrates and the chip in them sends information to us.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: Here, we allocate the information to the Transtelon server.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: We can determine which materials to use in what order to heal them.", 10, 30, intfont2, 58)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: If they die a pointless death, however, such as falling into a toilet, ", 10, 120, intfont2, 58)
		delay (100)
		Font.Draw ("Doctor: we probably won't revive them. We'll look into who they are and why.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: Also, a natural death cannot be cured. An example is disease.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: There are exceptions, though.. but you don't need to know that.", 10, 30, intfont2, 58)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: We determine the cost they have to pay after their revival moment. ", 10, 120, intfont2, 58)
		delay (1000)
		Font.Draw ("Doctor: In this case, they have been revived. And we get money.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: If they can't pay, we'll reduce their life into a percentage of the amount they owe.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: Either way, pay 50g for full Hp or over 1000 for full. It's their choice.", 10, 30, intfont2, 58)
		getch (waitkey)
	    else
		Font.Draw ("Doctor: .. ?", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor:  Bye. ", 10, 60, intfont2, 58)
		getch (waitkey)
	    end if
	elsif RandomChoose = 2 then
	    Font.Draw ("Doctor: Why are you here?", 10, 120, intfont2, 58)
	    delay (1100)
	    Font.Draw ("Doctor: I don't like you. ", 10, 90, intfont2, 58)
	    delay (1100)
	    Font.Draw (" [1] What materials are used in reviving? [2] How often do you use the Transtelon?", 10, 60, intfont2, 58)
	    delay (300)
	    get GenericInt
	    delay (500)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw ("Doctor:  Hm ..     ", 10, 120, intfont2, 58)
	    delay (2400)
	    if GenericInt = 1 then
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: There are 3 materials we use. Each are colour coded for ease of use. ", 10, 120, intfont2, 58)
		delay (100)
		Font.Draw ("Doctor: The Green coloured item is Giacho. This material revives the Hp.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: The Red coloured liquid is Hasbin. Found only near coastlines, this material removes wounds.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: The final, Blue liquid is Wruclag. It is designed for healing mana and memories.", 10, 30, intfont2, 58)
		getch (waitkey)
		Pic.Draw (Speech, 1, 1, picCopy)
		Font.Draw ("Doctor: Other then those, there is the Transtelon itself. It's a small glass cylinder room. ", 10, 120, intfont2, 58)
		delay (100)
		Font.Draw ("Doctor: The glass is red, and it has 3 metal pillars around the outside.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: You can walk through the glass after you've died.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: Otherwise, you can't get in or out of it.", 10, 30, intfont2, 58)
		getch (waitkey)
	    elsif GenericInt = 2 then
		Font.Draw ("Doctor: We use it quite often, about 2-3 times a day.", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: The machine is high maintenance, most of the time we are cleaning it out.", 10, 60, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: Other then that it's attending to the traumatized people who just died in combat.", 10, 30, intfont2, 58)
		getch (waitkey)
	    else
		Font.Draw ("Doctor: I didn't hear you, what did you say? ", 10, 90, intfont2, 58)
		delay (1000)
		Font.Draw ("Doctor: Pardon me?", 10, 60, intfont2, 58)
		delay (1000)
		Font.Draw ("Doctor: Excusez-moi?", 10, 30, intfont2, 58)
		getch (waitkey)
	    end if
	else
	    Font.Draw ("Doctor: These is a restricted building. Out! Out!", 10, 120, intfont2, 58)
	    delay (1230)
	    Font.Draw ("Doctor: ?_? I said out! What? You want what?", 10, 90, intfont2, 58)
	    delay (1230)
	    Font.Draw (" [1] I don't want anything. [2] Are there any penalties to dying?", 10, 60, intfont2, 58)
	    delay (300)
	    get GenericInt
	    delay (500)
	    Pic.Draw (Speech, 1, 1, picCopy)
	    Font.Draw ("Doctor:  . . .    ", 10, 120, intfont2, 58)
	    delay (2400)
	    if GenericInt = 1 then
		Font.Draw ("Doctor: You came here for what, looking at me?", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: Restricted I say, out! Out! ", 10, 60, intfont2, 58)
		getch (waitkey)
	    elsif GenericInt = 2 then
		Font.Draw ("Doctor: Yes. Your Conducting Extrain Chip wears out over multiple deaths.", 10, 120, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor: Ya' know what they say, die a day, no doctor this way! ", 10, 90, intfont2, 58)
		delay (1300)
		Font.Draw ("Doctor: Ba ha ha ha!", 10, 30, intfont2, 58)
		getch (waitkey)
	    else
		Font.Draw ("Doctor: Ola, fala portugues?", 10, 90, intfont2, 58)
		delay (1200)
		Font.Draw ("Doctor:  Nao? nao. ", 10, 60, intfont2, 58)
		getch (waitkey)
	    end if
	end if
    end if
end Transtelon

proc Zeno
    Exiting := false
    Hoole := false
    Boole := false
    loop
	if Track = "Nostalgia" or Track = "Days of Dash" then
	else
	    Music.PlayFileStop
	    for m : 1 .. 8
		MusicControl (m) := false
	    end for
	    MusicControl (5) := true
	    fork playstuffNostalgia
	    Track := "Nostalgia"
	end if
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (ZenoMap, 0, 0, picCopy)
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 491 and rangeX <= 589) and (rangeY >= 273 and rangeY <= 307) then
		Draw.Box (491, 273, 589, 307, 0)
		Hoole := false
		Boole := true
		if button = 1 then
		    ZenoHQ
		    exit
		end if
	    elsif (rangeX >= 491 and rangeX <= 589) and (rangeY >= 235 and rangeY <= 268) or Teleport = true then
		Draw.Box (491, 235, 589, 268, 0)
		Hoole := false
		Boole := true
		if button = 1 or Teleport = true then
		    Transtelon
		    exit
		end if
	    elsif (rangeX >= 491 and rangeX <= 589) and (rangeY >= 196 and rangeY <= 229) then
		Draw.Box (491, 196, 589, 229, 0)
		Hoole := false
		Boole := true
		if button = 1 then
		    Exiting := true
		    exit
		end if
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
		put "Money: ", Money
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
			    Money -= 10
			    if Money < 0 then
				Money += 10
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
			    Money -= 100
			    if Money < 0 then
				Money += 100
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
			    Money -= 110
			    if Money < 0 then
				Money += 110
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
			    Money -= 185
			    if Money < 0 then
				Money += 185
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
			    Money -= 213
			    if Money < 0 then
				Money += 213
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
			    Money -= 250
			    if Money < 0 then
				Money += 250
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
			    Money -= 400
			    if Money < 0 then
				Money += 400
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
			    Money -= 450
			    if Money < 0 then
				Money += 450
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

proc Library         % Unfinished
    put "Not done, but a secret place"
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
	put "Joe is a fake name for the unknown man who works at Zeno Secret Base. Rumoured he is Mongorn."
    end if
    getch (waitkey)
end Library

proc Plaza_
    cls
    Boole := false
    Hoole := false
    colorback (0)
    Pic.Draw (Plaza, 0, 0, picXor)
    Font.Draw (" The GHF Plaza ", 100, 550, intfont, 41)
    Font.Draw (" Where to?: ", 40, 120, intfont, 0)
    Font.Draw ("  :[The Pet Store]   :[Jiri's Upgrades]   : [Exit]", 40, 70, intfont1, 11)
    loop
	/*get Plazaanswer
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
	 end if */
	Mouse.Where (rangeX, rangeY, button)
	if rangeY >= 65 and rangeY <= 86 then
	    if rangeX >= 38 and rangeX <= 173 then
		Draw.Line (38, 62, 173, 62, 16)
		Boole := false
		Hoole := false
		if button = 1 then
		    PetStore
		    exit
		end if
	    elsif rangeX >= 183 and rangeX <= 318 then
		Draw.Line (183, 62, 318, 62, 16)
		Boole := false
		Hoole := false
		if button = 1 then
		    JiriUpgrades
		    exit
		end if
	    elsif rangeX >= 328 and rangeX <= 383 then
		Draw.Line (328, 62, 383, 62, red)
		Boole := false
		Hoole := false
		if button = 1 then
		    exit
		end if
	    end if
	elsif rangeY >= 430 and rangeY <= 588 and rangeX >= 447 and rangeX <= 723 and button = 1 then
	    Library
	end if
	if Boole = false and Hoole = true then
	    Draw.Line (38, 62, 173, 62, 31)
	    Draw.Line (183, 62, 318, 62, 31)
	    Draw.Line (328, 62, 383, 62, 31)
	    Boole := true
	end if
	Hoole := true
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

proc Arclen_
    Hoole := false
    if Track = "Nostalgia" or Track = "Days of Dash" then
    else
	Music.PlayFileStop
	for m : 1 .. 8
	    MusicControl (m) := false
	end for
	MusicControl (5) := true
	fork playstuffNostalgia
	Track := "Nostalgia"
    end if
    loop
	if Storyline = 1.1 then
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    Pic.Draw (Arclen, 0, 0, picXor)
	    Draw.FillBox (0, 0, maxx, 130, 0)
	    Font.Draw ("Lukvel: ...and then we will kill the Grand Duke of Varmiosa.", 50, 100, intfont1, 43)
	    delay (3000)
	    Font.Draw ("Ravness: Ah, our new recruit just arrived.", 50, 80, intfont1, 40)
	    delay (2000)
	    Font.Draw ("Lukvel: Anyways, we first must pass Creile's Western Gate. ", 50, 60, intfont1, 43)
	    delay (2000)
	    Font.Draw ("Ravness: You. Follow us. ", 50, 40, intfont1, 40)
	    getch (waitkey)
	    Storyline := 1.2
	else
	    if Track = "Nostalgia" or Track = "Days of Dash" then
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
		if (rangeX >= 40 and rangeX <= 240) and (rangeY >= 68 and rangeY <= 88) and button = 1 then
		    Hospital_
		    exit
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 48 and rangeY <= 68) and button = 1 then
		    Garden
		    exit
		elsif (rangeX >= 40 and rangeX <= 240) and (rangeY >= 28 and rangeY <= 48) and button = 1 or Teleport = true then
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

proc Creile          % [CREILE1]
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
			Money += EnemyMoney
			Experience += EnemyExperience
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
		if Track = "Nostalgia" or Track = "Days of Dash" then
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
			if button = 1 then
			    Training2
			    Exiting := false
			    exit
			end if
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 324 and rangeY <= 343) then
			Draw.Box (88, 333, 91, 336, 12)
			Boole := true
			if button = 1 then
			    Barracks
			    Exiting := false
			    exit
			end if
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 302 and rangeY <= 321) then
			Draw.Box (88, 311, 91, 314, 12)
			Boole := true
			if button = 1 then
			    MessHall
			    Exiting := false
			    exit
			end if
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 280 and rangeY <= 299) then
			Draw.Box (88, 289, 91, 292, 12)
			Boole := true
			if button = 1 then
			    TownSquare_
			    Exiting := false
			    exit
			end if
		    elsif (rangeX >= 90 and rangeX <= 330) and (rangeY >= 258 and rangeY <= 277) or Teleport = true then
			Draw.Box (88, 267, 91, 270, 12)
			Boole := true
			if button = 1 or Teleport = true then
			    Exiting := true
			    exit
			end if
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
    var TimaCutsceney : int := 560
    var TimaCutsceney2 : int := 10
    var ColourChange : int := 16
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
		    if button = 1 then
			Creile
			Exiting := false
			exit
		    end if
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 140 and rangeY <= 170) then
		    Draw.Box (50, 140, 150, 170, 11)
		    Boole := true
		    if button = 1 then
			Hringe
			Exiting := false
			exit
		    end if
		elsif (rangeX >= 50 and rangeX <= 150) and (rangeY >= 90 and rangeY <= 120) or Teleport = true then
		    Draw.Box (50, 90, 150, 120, 11)
		    Boole := true
		    if button = 1 or Teleport = true then
			Exiting := true
			exit
		    end if
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
		Exiting := false
		exit
	    else
	    end if
	end if
    end loop
end Tima

proc Hezlow
    put "Contact admin."
    delay (5000)
end Hezlow

proc Story         %[Storyline Progression]
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    if Storyline = 1 then
	Font.Draw (" 'I told you to go to the Fields for training' ", 100, 550, intfont1, 14)
	Font.Draw (" Joe pulls you aside and slips you a piece of paper. Then he vanishes. ", 100, 535, intfont1, 14)
	delay (3000)
	Font.Draw (" Read the paper? (1) Yes (2) No ", 100, 515, intfont1, 0)
	get Paperanswer
	if Paperanswer = 1 then
	    Font.Draw (" As you unfold it, the stench of the farmer fans out.", 100, 500, intfont1, 54)
	elsif Paperanswer = 2 then
	    Font.Draw (" You drop it, to realize that the paper is open. You read it anyways.", 100, 500, intfont1, 54)
	else
	    Font.Draw (" No one knows what you type.. but you open the paper.", 100, 500, intfont1, 54)
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
	for k : 0 .. 10
	    Draw.Box (0 + k, 0 + k, maxx - k, maxy - k, 16 + k)
	end for
	Font.Draw (" Isn't Dhun the leader of Gobalan..? ", 100, 500, intfont1, 40)
	delay (2000)
	Font.Draw (" Who is Kl. Jarhen.. and how did Joe get the paper? ", 100, 450, intfont1, 40)
	delay (2000)
	Font.Draw (" Why is Joe's name so simple...? ", 100, 400, intfont1, 40)
	delay (2000)
	Font.Draw (" Hmmm... the note mentioned a mansion... maybe the [Arclen] Temple can help. ", 100, 350, intfont1, 40)
	Money += 11
	Storyline := 1.1
	getch (waitkey)
	Draw.FillBox (0, 0, maxx, maxy, 0)
    elsif Storyline = 1.1 then
	Font.Draw (" To the Temple .. Arclen, was it?", 100, 350, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 1.2 then
	Money += 12
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
	if Track = "Saya's Song" then
	else
	    Music.PlayFileStop
	    for m : 1 .. 8
		MusicControl (m) := false
	    end for
	    MusicControl (2) := true
	    fork playstuffSaya
	    Track := "Saya's Song"
	end if
	EnemyTurn := 0
	loop
	    loop
		cls
		Draw.FillBox (0, 0, maxx, maxy, 0)
		colorback (0)
		Pic.Draw (Lukvel, 20, 110, picXor)
		Pic.Draw (Jexclim, 500, 110, picXor)
		NPCCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
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
	Money += 20
	getch (waitkey)
    elsif Storyline = 2 then
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Pic.Draw (Ravness, 50, 70, picXor)
	Font.Draw (" Meet the girl at Arclen Temple", 30, 30, intfont1, 40)
	getch (waitkey)
	cls
    elsif Storyline = 2.1 then
	Money += 21
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
	Money += 30
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
	Font.Draw (" You can buy pets and enhancements at the Plaza. A subway, was it?", 50, 250, intfont1, 54)
	getch (waitkey)
    elsif Storyline = 4 then
	Money += 40
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
	Money += 50
	Font.Draw (" We're off to Tima.. once known as a Mansion. ", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 6 then
	Money += 60
	Font.Draw (" To Castle Creile", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 7 then
	Money += 70
	Font.Draw (" Help Joe at Creile ", 50, 260, intfont1, 40)
	getch (waitkey)
    elsif Storyline = 8 then
	Money += 80
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
	Money += 81
	getch (waitkey)
    elsif Storyline = 8.1 then
	Font.Draw (" Don't open Joe's Letter.. hand it to Frizul. ", 50, 170, intfont1, 0)
	getch (waitkey)
    elsif Storyline = 8.2 then
	Money += 82
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

proc Personalization
    loop
	Hoole := false
	Pic.Draw (PersonalizationPic, 0, 0, picCopy)
	Exiting := false
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 16 and rangeX <= 176) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement
		Boole := true
		if button = 1 then
		    delay (100)
		    SaveGame3
		    exit
		end if
	    elsif (rangeX >= 306 and rangeX <= 441) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement2
		Boole := true
	    elsif (rangeX >= 570 and rangeX <= 692) and (rangeY >= 511 and rangeY <= 540) then
		LightMovement3
		Boole := true
	    end if
	    % Click
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

proc Town          % [TOWN1]
    Boole := false
    Hoole := false
    Exiting := false
    var Evolution : int := 0
    MAX
    level
    if Track = "Winter Fireworks" or Track = "Days of Dash" then
    else
	Music.PlayFileStop
	for m : 1 .. 8
	    MusicControl (m) := false
	end for
	MusicControl (3) := true
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    if Mission = 2 then
	if MArray (2) = 0 then
	    MArray (2) := 1
	elsif MArray (2) = 1 then
	end if
    end if
    if MArray (2) = 1 then
	Font.Draw (" TOWN ", 300, 370, intfont, 11)
	loading3
	cls
	colorback (0)
	Draw.FillBox (0, 0, maxx, maxy, 0)
	level
	Font.Draw ("Billejun", 170, 480, intfont, 54)
	Pic.Draw (TownPic, 0, 0, picXor)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" 'ei eaya Cap'n, we got 'uns a liddel party o're dere!", 45, 120, intfont2, 16)
	delay (1500)
	Font.Draw (" a'ight Oreg. unlish der fancy tu-rope! ", 45, 100, intfont2, red)
	delay (2500)
	Font.Draw (" har har, der they'd a be wigglin'!", 45, 80, intfont2, 16)
	delay (900)
	Font.Draw (" ha ha, Roojit and Oreg, kill the survivers!", 45, 60, intfont2, red)
	delay (500)
	Font.Draw (" It appears the bandits are jumping a family in a carriage. The carriage is on fire.", 60, 30, intfont2, 54)
	delay (1800)
	Font.Draw (" The leader of the bandits is the man in the red armor.", 60, 10, intfont2, 54)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" Man: Help!! Somebody, --- ", 60, 120, intfont2, 42)
	delay (2000)
	Font.Draw (" Woman: Reggie! Nooo.. nooo!! REGGIE!! YOU KILLED HIM! ", 40, 100, intfont2, 61)
	delay (1500)
	Font.Draw (" Roojit: Whut a pefetic man. He dun haff any strength, deserve to die! ", 40, 80, intfont2, 111)
	delay (1100)
	Font.Draw (" Oreg: Yah! He's wusn a weak won, so he die! Yah! ", 40, 40, intfont2, 111)
	delay (400)
	Font.Draw (" (Leader) Wurbul: I want them dead! No talk, get ther gold! They useless tourism.", 40, 20, intfont2, red)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" Man: -- I wa.. -- I w.. -- I s... ... ... .... _____ ", 40, 120, intfont2, 42)
	delay (3500)
	Font.Draw (" Woman: *Sobbing* Don't kill our son, spare him at least! Please, spare him! He's so young! ", 40, 100, intfont2, 61)
	delay (900)
	Font.Draw (" Roojit: Das be a pitiful last sentence woomen. Now yu die. ", 40, 80, intfont2, 111)
	delay (2000)
	Font.Draw (" If you don't do anything quick.. both remaining survivors will die.", 60, 40, intfont2, 54)
	getch (waitkey)
	Pic.Draw (Speech, 1, 1, picCopy)
	Font.Draw (" How do you intervene? ", 60, 120, intfont2, 54)
	delay (500)
	Font.Draw (" [1] Throw a knife straight at Roojit ", 50, 100, intfont2, 54)
	Font.Draw (" [2] Throw a knife at Wurbul (Leader)", 50, 80, intfont2, 54)
	Font.Draw (" [3] Cast Mana Shot at Roojit and Oreg", 50, 40, intfont2, 54)
	Font.Draw (" [4] Use diplomacy", 50, 20, intfont2, 54)
	get Townanswer
	if Track = "Legend of the Few Miles" then
	else
	    Music.PlayFileStop
	    for m : 1 .. 8
		MusicControl (m) := false
	    end for
	    MusicControl (7) := true
	    fork playstuffLegend
	    Track := "Legend of the Few Miles"
	end if
	Pic.Draw (Speech, 1, 1, picCopy)
	if Townanswer = 1 then
	    Font.Draw (" Roojit brings his knife down towards the woman's face. ", 40, 120, intfont2, 54)
	    delay (1500)
	    Font.Draw (" Roojit falls the opposite direction. ", 40, 100, intfont2, 54)
	    delay (1000)
	    Font.Draw (" Everyone stares in shock at the metal protruding from his lung.", 40, 80, intfont2, 54)
	    delay (2000)
	    Font.Draw (" Wha--?? You! Oreg, kill the foreigner!", 40, 40, intfont2, red)
	    getch (waitkey)
	elsif Townanswer = 2 then
	    Font.Draw (" Wurbul bends over and dodges the knife. ", 40, 120, intfont2, 54)
	    delay (1500)
	    Font.Draw (" The knife continues forward and embeds itself into Roojit.", 40, 100, intfont2, 54)
	    delay (1000)
	    Font.Draw (" Oreg yelps in fear. Wurbul: WhheeeAaaa??? whoa? ", 40, 80, intfont2, red)
	    delay (1000)
	    Font.Draw (" Wurbul: Get 'im, Oreg! Slay 'is throat!", 40, 40, intfont2, red)
	    getch (waitkey)
	elsif Townanswer = 3 then
	    Font.Draw (" You launch a mana shot at the two bandits. ", 40, 120, intfont2, 54)
	    delay (1500)
	    Font.Draw (" It explodes behind them, mid-air. The force of the explosion causes Roojit to fall on his knife ", 40, 100, intfont2, 54)
	    delay (900)
	    Font.Draw (" and Oreg to pound Roojit farther into the knife. ", 40, 80, intfont2, 54)
	    delay (2000)
	    Font.Draw (" Wurbul turns around. Wha? Die! ", 40, 40, intfont2, red)
	    getch (waitkey)
	elsif Townanswer = 4 then
	    Font.Draw (" Wurbul! Your head is a price to me. Will you accept death?", 40, 120, intfont2, 54)
	    delay (3500)
	    Font.Draw (" Wurbul: Da faq, who are you? Liddle wimp, meet my blade! ", 40, 100, intfont2, red)
	    delay (900)
	    Font.Draw (" Take Roojit and Oreg away first. Or no duel! ", 40, 80, intfont2, 54)
	    delay (2000)
	    Font.Draw (" Wurbul: Root 'n' Leg shoo from thar! We'ls deal with em later.", 40, 40, intfont2, red)
	    getch (waitkey)
	else
	    Font.Draw (" You murmur some gibberish and shoot Roojit in the head. ", 40, 120, intfont2, 54)
	    delay (3500)
	    Font.Draw (" Roojit was about to stab the woman, and instead falls the opposite direction. Dead.", 40, 100, intfont2, 54)
	    delay (900)
	    Font.Draw (" Oreg: He wath killed by a co'ard! Raaa arrhh rhhh!! He runs towards you.", 40, 80, intfont2, 111)
	    delay (2000)
	    Font.Draw (" Wurbul: Huh .. ? ", 40, 40, intfont2, red)
	    getch (waitkey)
	end if
	BanditFight
	Draw.FillBox (0, 0, maxx, maxy, 0)
	Font.Draw ("Billejun", 170, 480, intfont, 54)
	Pic.Draw (TownPic, 0, 0, picXor)
	Pic.Draw (Speech, 1, 1, picCopy)
	if Townanswer = 1 or Townanswer = 2 or Townanswer not= 3 or Townanswer not= 4 then
	    Font.Draw (" Impossible! How did Oreg die to the likes of you?", 40, 120, intfont2, red)
	    delay (3500)
	    Font.Draw (" Yes, how did he die? I'm not quite sure. ", 40, 100, intfont2, 54)
	    delay (900)
	    Font.Draw (" Aiiyaa you bein funny to me? Die!", 40, 80, intfont2, red)
	    delay (2000)
	    Font.Draw (" Wurbul is rushing with hsi sword.", 40, 40, intfont2, 54)
	    Townanswer := 3
	    BanditFight
	else
	end if
	MArray (2) := 2
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
		MyunertStore
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
			    if button = 1 then
				Plaza_
				exit
			    end if
			elsif (rangeX >= 34 and rangeX <= 148) and (rangeY >= 273 and rangeY <= 307) then
			    Hoole := true
			    Draw.Oval (157, 287, 3, 3, 54)
			    if button = 1 then
				Hezlow
				exit
			    end if
			elsif (rangeX >= 43 and rangeX <= 157) and (rangeY >= 236 and rangeY <= 264) then
			    Hoole := true
			    Draw.Oval (157, 256, 3, 3, 54)
			    if button = 1 then
				Arclen_
				exit
			    end if
			elsif (rangeX >= 62 and rangeX <= 170) and (rangeY >= 169 and rangeY <= 213) then
			    Hoole := true
			    Draw.Oval (172, 190, 3, 3, 54)
			    if button = 1 then
				Tima
				Exiting := false
				exit
			    end if
			elsif (rangeX >= 66 and rangeX <= 188) and (rangeY >= 121 and rangeY <= 160) then
			    Hoole := true
			    Draw.Oval (186, 142, 3, 3, 54)
			    if button = 1 or Teleport = true then
				Exiting := true
				exit
			    end if
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
	    elsif (rangeX >= 191 and rangeX <= 275) and (rangeY >= 47 and rangeY <= 63) and button = 1 or Teleport = true then
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

% ********************** [Loading, must be at the bottom]
% ********************** [Version 1 of Loading - Basic]
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
% ********************** [Version 2 of Loading - Futton]
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
    Incry := -5
    Pic.Draw (LoadGamePic, 0, 0, picCopy)
    for i : 1 .. 2
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Incry += 100
    end for
    Incry += 50
    for i : 3 .. 4
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Incry += 107
    end for
    loop
	mousewhere (rangeX, rangeY, button)
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (4)
		if LSC (4) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 then
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (3)
		if LSC (3) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 then
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (2)
		if LSC (2) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 then
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (1)
		if LSC (1) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 23 then
	    Draw.Box (643, 6, 709, 33, 0)
	    Boole := true
	    if button = 1 then
		Exiting := true
		exit
	    end if
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
    elsif Call = 2 then
	if File.Exists (FileDir) then
	    open : stream, FileDir, read
	    read : stream, name
	    read : stream, Level
	    read : stream, Money
	    read : stream, Storyline
	    read : stream, Style
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
	    put "File name corrupt."
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

proc LoadGame3
    cls
    Exiting := false
    Hoole := false
    Boole := false
    Call := 0
    for i : 1 .. 4
	open : Lstream (i), LSN (i), get
	get : Lstream (i), name
	get : Lstream (i), LSL (i)
	get : Lstream (i), LSM (i)
	get : Lstream (i), LSS (i)
	get : Lstream (i), LSC (i)
	close : Lstream (i)
    end for
    Incry := -5
    Pic.Draw (LoadGamePic, 0, 0, picCopy)
    for i : 1 .. 2
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Matiehano (i)
	Incry += 100
    end for
    Incry += 50
    for i : 3 .. 4
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Matiehano (i)
	Incry += 107
    end for
    loop
	mousewhere (rangeX, rangeY, button)
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (4)
		if LSC (4) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 then
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (3)
		if LSC (3) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 then
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (2)
		if LSC (2) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 then
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 38)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (1)
		if LSC (1) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 33 then
	    Draw.Box (643, 6, 709, 33, 0)
	    Boole := true
	    if button = 1 then
		Exiting := true
		exit
	    end if
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
    elsif Call = 2 then
	if File.Exists (FileDir) then
	    open : stream, FileDir, get
	    get : stream, name
	    get : stream, Level
	    get : stream, Money
	    get : stream, Storyline
	    get : stream, Style
	    get : stream, Hp
	    get : stream, THp
	    get : stream, Mana
	    get : stream, TMana
	    get : stream, ManaRegen
	    get : stream, Damage
	    get : stream, Speed
	    get : stream, Character
	    get : stream, Skill_Level_SideCut
	    get : stream, Intelligence
	    get : stream, Skill_Level_AimedArrow
	    get : stream, Skill_Level_BloodShot
	    get : stream, Skill_Level_Mana_Shot
	    get : stream, Skill_Level_SpeedSlice
	    get : stream, Skill_Level_Shot_s
	    get : stream, Skill_Level_DoubleSlash
	    get : stream, Skill_Level_RaisedCurve
	    get : stream, Skill_Level_StarShot
	    get : stream, Skill_Level_WindLash
	    get : stream, Skill_Level_BurningMetal
	    get : stream, Skill_Level_Regen
	    get : stream, Skill_Level_ZenosSword
	    get : stream, Skill_Level_WhiteTundra
	    get : stream, Skill_Level_Taggerung
	    get : stream, Skill_Level_JetStream
	    get : stream, Experience
	    get : stream, Pet
	    get : stream, FightingPet
	    get : stream, Mission
	    for LA : 1 .. 15
		get : stream, LevelArray (LA)
	    end for
	    for PA : 1 .. 8
		get : stream, PetArray (PA)
	    end for
	    get : stream, CreileFight
	    get : stream, CSA1
	    get : stream, CSA2
	    get : stream, CSA3
	    get : stream, CSA4
	    get : stream, PreviousSpeed
	    get : stream, AddedSpeed
	    get : stream, PreviousDamage
	    get : stream, AddedDamage
	    get : stream, PreviousIntelligence
	    get : stream, AddedIntelligence
	    get : stream, PreviousHp
	    get : stream, AddedHp
	    get : stream, Added
	    get : stream, Skill_Level_Eve
	    get : stream, Skill_Level_HeartEndo
	    get : stream, Skill_Level_OppedShield
	    get : stream, Skill_Level_Shadow
	    get : stream, Skill_Level_Sniper
	    get : stream, Skill_Level_StingingBow
	    get : stream, Skill_Level_SuperScription
	    get : stream, Skill_Level_TunshShot
	    get : stream, StackHp
	    get : stream, StackDamage
	    get : stream, StackIntelligence
	    for MA : 1 .. 10
		get : stream, MArray (MA)
	    end for
	    close : stream
	else
	    put "File name corrupt."
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
end LoadGame3

% Game Begins [THEDUST1]
% fork playstuffMemory // Cancelled
for m : 1 .. 7
    MusicControl (m) := false
end for
MusicControl (8) := true
fork playstuffDays
Track := "Days of Dash"
DustIntro

FightingPet := Slab         % // Removes Nice Stats
% ***************************************  [Startup Screen]
loop
    Pic.DrawSpecial (IntroMap, 0, 0, picCopy, picFadeIn, 3000)
    Boole := true
    fork IntroWind
    loop
	mousewhere (rangeX, rangeY, button)
	if DemoMode = true then
	    DemoMode := false
	    GenericInt := 2
	    answer := Rand.Int (1, 2)
	    if answer = 1 then
		DemoAnimation1
	    elsif answer = 2 then
		DemoAnimation2
	    end if
	    GenericInt := 3
	    exit
	elsif (rangeX >= 553 and rangeX <= 738) and (rangeY >= 251 and rangeY <= 306) then
	    if Boole = true then
		Pic.Draw (IntroGUISG, 566, 258, picXor)
		IntroFut1 := 1
		Boole := false
	    end if
	    if button = 1 then
		Exiting := true
		exit
	    end if
	elsif (rangeX >= 553 and rangeX <= 738) and (rangeY >= 176 and rangeY <= 231) then
	    if Boole = true then
		Pic.Draw (IntroGUIGUIDE, 559, 183, picXor)
		IntroFut2 := 1
		Boole := false
	    end if
	    if button = 1 then
		GenericInt := 2
		Guide
		GenericInt := 3
		cls
		exit
	    end if
	elsif (rangeX >= 553 and rangeX <= 738) and (rangeY >= 101 and rangeY <= 156) then
	    if Boole = true then
		Pic.Draw (IntroGUILG, 568, 106, picXor)
		IntroFut3 := 1
		Boole := false
	    end if
	    if button = 1 then
		cls
		Exiting := true
		GenericInt := 2
		LoadGame3
		Exiting := false
		GenericInt := 3
		exit
	    end if
	elsif (rangeX >= 553 and rangeX <= 738) and (rangeY >= 24 and rangeY <= 79) then
	    if Boole = true then
		Pic.Draw (IntroGUIEXIT, 569, 25, picXor)
		IntroFut4 := 1
		Boole := false
	    end if
	    if button = 1 then
		quit
	    end if
	elsif (rangeX >= 622 and rangeX <= 721) and (rangeY >= 530 and rangeY <= 560) then
	    if Boole = true then
		Draw.Line (622, 533, 720, 533, 55)
		IntroFut5 := 1
		Boole := false
	    end if
	    if button = 1 then
		GenericInt := 2
		Credits
		GenericInt := 3
		exit
	    end if
	elsif Boole = false then
	    if IntroFut1 = 1 then
		Pic.Draw (IntroGUISG, 566, 258, picXor)
		IntroFut1 := 0
	    elsif IntroFut2 = 1 then
		Pic.Draw (IntroGUIGUIDE, 559, 183, picXor)
		IntroFut2 := 0
	    elsif IntroFut3 = 1 then
		Pic.Draw (IntroGUILG, 568, 106, picXor)
		IntroFut3 := 0
	    elsif IntroFut4 = 1 then
		Pic.Draw (IntroGUIEXIT, 569, 25, picXor)
		IntroFut4 := 0
	    elsif IntroFut5 = 1 then
		Draw.Line (622, 533, 720, 533, 30)
		IntroFut5 := 0
	    end if
	    Boole := true
	end if
    end loop
    if Exiting = true then
	exit
    else
    end if
end loop
GenericInt := 1

% ***************************************  [Introduction]
Introduction

% **************** [Cheats]
/*
 Storyline := 8.3
 Money := 9999
 Experience := 80
 Pet := 8
 PetArray (8) := 1
 FightingPet := DrigoPic
 ManaRegen := TMana * 0.5
 */

% ***************************************   [Main Loop]
loop
    Town
end loop
% *********** E N D     O F    P R O G R A M  ************
% Note: No notes.







