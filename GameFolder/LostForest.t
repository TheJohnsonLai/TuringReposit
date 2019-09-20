% Hire De Lune + J-Son
% [[4.5 months experience with Turing]]
% "Lost Forest" // Tactical turn based RPG // Single player
%
% Start: Oct 8, 2016
% Update: Oct 29, 2016
% Influenced by:
% Final Fantasy
% Black Desert Online
% Sonny 2
% Fantasy War Tactics
% Phantasy Star Portable 2
%

include "Code\\ImportStart.t"
setscreen ("graphics:1280,720,title:Lost Forest,offscreenonly")
%View.Set ("offscreenonly")

% Procedures main menu

proc Battle
    MoveCT := 0
    ProgressToFight := false
    BattleMenuboolean := false
    BattleHelpboolean := false
    WonBattleOutcome := false
    Animating := false
    AnimateCounter := 1
    AnimateDelay := 0
    var Movementboolean := false
    var SixOverTwelve : boolean := true
    var CurrentActive : int := 1 %% Active X format, detecting 1,2 3,4 boxes movement
    var SkillsBoxDrawX : int := 130
    SkillSelected := 1

    %%%%%%% Determine members of this battle %%%%%
    for CycleSpeed : 1 .. 12
	if Character (CycleSpeed).Identity not= 0 then
	    if Character (CycleSpeed).Health > 0 then
		Character (CycleSpeed).ChangeLevel := 0
		Character (CycleSpeed).ChangeAttack := 0
		Character (CycleSpeed).ChangeDefense := 0
		Character (CycleSpeed).ChangeCritChance := 0
		Character (CycleSpeed).ChangeCritDamage := 0
		Character (CycleSpeed).ChangeSpeed := 0
		Character (CycleSpeed).Power := 0
	    end if
	end if
    end for

    %%%%%%%%%%%%%%%Pic Find Discover%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    loop             % Main battle loop, continue until forfeit / win        %%%%%%%%%%%%%%%%Determine Turns, decrease speed to turn%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if ProgressToFight = false then
	    loop
		for CycleSpeed : 1 .. 12
		    if Character (CycleSpeed).Identity not= 0 then
			if Character (CycleSpeed).Health > 0 then
			    Character (CycleSpeed).Speed -= 1
			    if Character (CycleSpeed).Speed <= 0 then
				CurrentTurn := (CycleSpeed)
				ActiveUser := CycleSpeed
				ProgressToFight := true
				exit
			    end if
			end if
		    end if
		end for
		exit when ProgressToFight = true
	    end loop
	end if
	ProgressToFight := false
	FinishedTurn := false
	Character (ActiveUser).Power += 10 %%%% Power regen
	if Character (ActiveUser).Power > Character (ActiveUser).TotalPower then
	    Character (ActiveUser).Power := Character (ActiveUser).TotalPower
	end if
	%%%%%%%%%%%%%%%%%%% Return Speed %%%%%%%%%%%%%%%
	CurrentOrderDisplay
	if Character (ActiveUser).ChangeSpeed >= 1 then %%%% SPEED
	    Character (ActiveUser).ChangeSpeed -= 1
	    Character (ActiveUser).Speed := Character (ActiveUser).TotalSpeed - (Character (ActiveUser).Level + 10)
	elsif Character (ActiveUser).ChangeSpeed <= -1 then
	    Character (ActiveUser).ChangeSpeed += 1
	    Character (ActiveUser).Speed := Character (ActiveUser).TotalSpeed + (Character (ActiveUser).Level + 7)
	elsif Character (ActiveUser).ChangeSpeed = 0 then
	    Character (ActiveUser).Speed := Character (ActiveUser).TotalSpeed
	end if
	%Movementboolean := false
	%%%% Proceed
	loop %%% BAttling loop, of someone's turn

	    Pic.Draw (BattleBackground, 0, 0, picCopy)
	    Mouse.Where (Mx, My, Mb)
	    MouseRestriction
	    Input.KeyDown (Pressed)
	    %%%%%%%%%%%%%%%% Button Activation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    if Pressed ('m') then
		if BattleMenuboolean = false then
		    BattleHelpboolean := false
		    BattleMenuboolean := true
		    delay (150)
		else
		    BattleMenuboolean := false
		    delay (150)
		end if
	    elsif Pressed ('h') then
		if BattleHelpboolean = false then
		    BattleMenuboolean := false
		    BattleHelpboolean := true
		    delay (150)
		else
		    BattleHelpboolean := false
		    delay (150)
		end if
	    end if
	    %%%%%%%%%%%%%%%%%%%%%%% GUI HP AND STATS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    for Bars : 1 .. 3 %%%% BackLine (Party)
		if Character (Bars).Identity = 1 or Character (Bars).Identity = 4 or Character (Bars).Identity = 5 then
		    Draw.FillBox (75, 36 + 65 * (Bars - 1), 75 + Character (Bars).Health * 236 div Character (Bars).TotalHealth, 54 + 65 * (Bars - 1), HealthBlue)
		    Draw.FillBox (75, 21 + 65 * (Bars - 1), 75 + Character (Bars).Power * 236 div Character (Bars).TotalPower, 29 + 65 * (Bars - 1), PowerWhite)
		end if
	    end for
	    for Bars : 4 .. 6 %%%% FrontLine ()
		if Character (Bars).Identity = 1 or Character (Bars).Identity = 4 or Character (Bars).Identity = 5 then
		    Draw.FillBox (307 + 75, 36 + 65 * (Bars - 4), 307 + 75 + Character (Bars).Health * 236 div Character (Bars).TotalHealth, 54 + 65 * (Bars - 4), HealthBlue)
		    Draw.FillBox (307 + 75, 21 + 65 * (Bars - 4), 307 + 75 + Character (Bars).Power * 236 div Character (Bars).TotalPower, 29 + 65 * (Bars - 4), PowerWhite)
		end if
	    end for
	    for Bars : 7 .. 9 %%%%%BackLine (Enemy)
		if Character (Bars).Identity not= 0 & Character (Bars).Identity not= 3 then
		    Draw.FillBox (1203, 36 + 65 * (Bars - 7), 1203 - Character (Bars).Health * 236 div Character (Bars).TotalHealth, 54 + 65 * (Bars - 7), HealthBlue)
		    Draw.FillBox (1203, 21 + 65 * (Bars - 7), 1203 - Character (Bars).Power * 236 div Character (Bars).TotalPower, 29 + 65 * (Bars - 7), PowerWhite)
		end if
	    end for
	    for Bars : 10 .. 12
		if Character (Bars).Identity not= 0 & Character (Bars).Identity not= 3 then
		    Draw.FillBox (876, 36 + 65 * (Bars - 10), 876 - Character (Bars).Health * 236 div Character (Bars).TotalHealth, 54 + 65 * (Bars - 10), HealthBlue)
		    Draw.FillBox (876, 21 + 65 * (Bars - 10), 876 - Character (Bars).Power * 236 div Character (Bars).TotalPower, 29 + 65 * (Bars - 10), PowerWhite)
		end if
	    end for

	    for Bars : 7 .. 12 %%%%%%%%% Boss detection %%%%%%%%%%%%%%%
		if Character (Bars).Identity = 3 then
		    Draw.FillBox (410, 565 - 5, 410 + Character (Bars).Health * 488 div Character (Bars).TotalHealth, 583 - 5, HealthPink) % Pink
		    Draw.FillBox (410, 550 - 3, 410 + Character (Bars).Power * 488 div Character (Bars).TotalPower, 558 - 3, PowerWhite)
		end if
	    end for
	    %%%%%%%%%%%%%%%%%% GUI FONT ON BARS


	    %%%%%%%%%%%%%%%% Draw GUIs and Characters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    for CGUICycle : 1 .. 3         %%%%%%% Your Team
		if Character (CGUICycle).Identity not= 0 then
		    Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 80, 41 - 1 + 65 * (CGUICycle - 1), Font10, 31) % Health number
		    Font.Draw (intstr (Character (CGUICycle).Power) + " / " + intstr (Character (CGUICycle).TotalPower), 80, 24 + 65 * (CGUICycle - 1), Font15, GlowAqua) % P{ower
		    Pic.Draw (GUIPartyInfo, 15, 15 + 65 * (CGUICycle - 1), picMerge)
		    Pic.Draw (Character (CGUICycle).Avatar, 19, 19 + 65 * (CGUICycle - 1), picMerge)
		    Font.Draw (Character (CGUICycle).Name, 66, 61 + 65 * (CGUICycle - 1), Font7, Gold)
		    %%%%%%%%%%%%%%% Numbers Raw text%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%70 = x, 40= base, -12 is shift
		    %  Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth) + " = " +
		    %      intstr (Character (CGUICycle).Health * 100 div Character (CGUICycle).TotalHealth) + "%", 70, 40 - 4 + 65 * (CGUICycle - 1), Font10, 31) %% D
		    %   Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 70, 42 - 4 + 65 * (CGUICycle - 1), Font10, BorderBlue) % U
		end if
	    end for
	    for CGUICycle : 4 .. 6         %%%%%%% Team FrontLine [ 1 = party, 4 = starter, 5 = NPC aid
		if Character (CGUICycle).Identity not= 0 then
		    Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 387, 41 - 1 + 65 * (CGUICycle - 4), Font10, 31) % Health number
		    Font.Draw (intstr (Character (CGUICycle).Power) + " / " + intstr (Character (CGUICycle).TotalPower), 387, 24 + 65 * (CGUICycle - 4), Font15, GlowAqua) % P{ower
		    Pic.Draw (GUIPartyInfo, 307 + 15, 15 + 65 * (CGUICycle - 4), picMerge) %% ?? Y is 1 point too high... adjusted to 15. Unsure.
		    Pic.Draw (Character (CGUICycle).Avatar, 19 + 307, 19 + 65 * (CGUICycle - 4), picMerge)
		    Font.Draw (Character (CGUICycle).Name, 66 + 307, 61 + 65 * (CGUICycle - 4), Font7, Gold)
		end if
	    end for
	    for CGUICycle : 7 .. 9     %%%%%%% Enemies
		if Character (CGUICycle).Identity not= 0 & Character (CGUICycle).Identity not= 3 then
		    Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 980, 41 - 1 + 65 * (CGUICycle - 7), Font10, 31) % Health number
		    Font.Draw (intstr (Character (CGUICycle).Power) + " / " + intstr (Character (CGUICycle).TotalPower), 980, 24 + 65 * (CGUICycle - 7), Font15, GlowAqua) % P{ower
		    Pic.Draw (GUIFoeInfo, 1280 - 307 - 15, 16 + 65 * (CGUICycle - 7), picMerge)
		    Pic.Draw (Character (CGUICycle).Avatar, 1280 - 307 - 15 + 263, 19 + 65 * (CGUICycle - 7), picMerge)
		    Font.Draw (Character (CGUICycle).Name, 1280 - 307 - 15 + 125, 61 + 65 * (CGUICycle - 7), Font7, Gold)
		end if
	    end for
	    for CGUICycle : 10 .. 12         %%%%%%% Enemies
		if Character (CGUICycle).Identity not= 0 & Character (CGUICycle).Identity not= 3 then
		    Pic.Draw (GUIFoeInfo, 1280 - 307 - 307 - 15 - 20, 16 + 65 * (CGUICycle - 10), picMerge)
		    Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 653, 41 - 1 + 65 * (CGUICycle - 10), Font10, 31) % Health number
		    Font.Draw (intstr (Character (CGUICycle).Power) + " / " + intstr (Character (CGUICycle).TotalPower), 653, 24 + 65 * (CGUICycle - 10), Font15, GlowAqua) % P{ower
		    Pic.Draw (Character (CGUICycle).Avatar, 1280 - 307 - 307 - 15 - 20 + 263, 19 + 65 * (CGUICycle - 10), picMerge)
		    Font.Draw (Character (CGUICycle).Name, 1280 - 307 - 307 - 20 - 15 + 125, 61 + 65 * (CGUICycle - 10), Font7, Gold)
		end if
	    end for
	    for CGUICycle : 7 .. 12 %%%%%%%%% Boss detection %%%%%%%%%%%%%%%
		if Character (CGUICycle).Identity = 3 then %% 3 = boss, 2 = mob
		    Font.Draw (intstr (Character (CGUICycle).Health) + " / " + intstr (Character (CGUICycle).TotalHealth), 420 + 4, 563, Font10, 31) % Health number
		    Font.Draw (intstr (Character (CGUICycle).Power) + " / " + intstr (Character (CGUICycle).TotalPower), 420 + 4, 549, Font15, HealthPink) % P{ower
		    Pic.Draw (GUIBossInfo, 350, 720 - 180, picMerge)
		    Pic.Draw (Character (CGUICycle).Avatar, 350 + 4, 720 - 180 + 4, picMerge)
		    Font.Draw (Character (CGUICycle).Name, 350 + 4 + 50, 720 - 180 + 43, Font7, Gold)
		end if
	    end for
	    %%%%%%%%%%%%%% Draw GUI names

	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    %%%%%%%%%%%%%% Draw CurrentTurn order %%%%%%%%%%%%%%%%%%%%
	    %%%%%%%%%%%%%%%%%
	    %MoveCT := Mx - MoveCTX
	    Draw.Box (639 + (MoveCT * 49), 657, 639, 657, BasicBlue)
	    Draw.Box (639 + (MoveCT * 49), 604, 639, 604, BasicBlue)
	    Draw.Box (639 + (MoveCT * 49), 657, 639 + (MoveCT * 49), 604, BasicBlue)
	    Draw.Box (618 + (MoveCT * 49), 610, 659 + (MoveCT * 49), 651, BasicBlue)
	    for Five : 1 .. (CurrentTID - MoveCT - 2)
		Pic.Draw (Character (CT (Five).ID).Avatar, (MoveCT * 49) + 619 + (Five - 1) * 49, 611, picMerge)
		%Font.Draw (intstr (CT (Five).ID), 683, 200 - (20 * Five), FontBattle, Gold)
	    end for
	    if Mx >= 619 and Mx <= 660 & My >= (720 - 109) and My <= (720 - 68) then %% Middle
		if Mb = 1 then
		    MoveCT := 0
		end if
	    elsif Mx >= 521 and Mx <= 562 & My >= (720 - 109) and My <= (720 - 68) then %% 2nd
		if Mb = 1 then
		    MoveCT := -2
		end if
	    elsif Mx >= 570 and Mx <= 611 & My >= (720 - 109) and My <= (720 - 68) then %% 1 first
		if Mb = 1 then
		    MoveCT := -1
		end if
	    end if
	    if CurrentTID < 3 & MoveCT <= -2 then
		MoveCT := -1
	    end if

	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Shortcut windows

	    if BattleMenuboolean = true then
		BattleMenu
	    elsif BattleHelpboolean = true then
		BattleHelp
		Font.Draw ("Lv. " + intstr (Character (ActiveUser).Level) + ": " + Character (ActiveUser).Name + "  >>", 847, 720 - 35, FontInfo, Gold)
		Font.Draw ("Attack: " + intstr (Character (ActiveUser).Attack), 852, 720 - 55, FontInfo, Gold)
		Font.Draw ("Defense: " + intstr (Character (ActiveUser).Defense), 852, 720 - 70, FontInfo, Gold)
		Font.Draw ("Speed: " + intstr (Character (ActiveUser).Speed) + "/" + intstr (Character (ActiveUser).TotalSpeed), 852, 720 - 85, FontInfo, Gold)
		Font.Draw ("C.Chance: " + intstr (Character (ActiveUser).CritChance) + "%", 852, 720 - 100, FontInfo, Gold)
		Font.Draw ("C.Damage: " + intstr (Character (ActiveUser).CritDamage) + "%", 852, 720 - 115, FontInfo, Gold)
		%Font.Draw ("Damage:" + intstr (Damage), 325, 43, FontBattle, Gold)
		%Font.Draw ("Sk. ID:" + intstr (Character (ActiveUser).Skill (SkillSelected).SkillID), 530, 43, FontBattle, Gold)
		Font.Draw ("Lv. " + intstr (Character (ActiveTarget).Level) + ": " + Character (ActiveTarget).Name, 977, 720 - 35, FontInfo, Gold)
		Font.Draw ("Attack: " + intstr (Character (ActiveTarget).Attack), 982, 720 - 55, FontInfo, Gold)
		Font.Draw ("Defense: " + intstr (Character (ActiveTarget).Defense), 982, 720 - 70, FontInfo, Gold)
		Font.Draw ("Speed: " + intstr (Character (ActiveTarget).Speed) + "/" + intstr (Character (ActiveTarget).TotalSpeed), 982, 720 - 85, FontInfo, Gold)
		Font.Draw ("ActiveUser: " + intstr (ActiveUser), 83, 637, FontInfo, Gold)
		if Movementboolean = true then
		    Font.Draw ("Movement: TRUE", 83, 660, FontInfo, PSOWhite)
		else
		    Font.Draw ("Movement: FALSE", 83, 660, FontInfo, PSOWhite)
		end if
		Font.Draw (intstr (Character (3).Identity), 280, 670, FontInfo, PSOWhite)
		Font.Draw (intstr (Character (2).Identity), 280, 650, FontInfo, PSOWhite)
		Font.Draw (intstr (Character (1).Identity), 280, 630, FontInfo, PSOWhite)
		Font.Draw (intstr (Character (6).Identity), 320, 670, FontInfo, PSOWhite)
		Font.Draw (intstr (Character (5).Identity), 320, 650, FontInfo, PSOWhite)
		Font.Draw (intstr (Character (4).Identity), 320, 630, FontInfo, PSOWhite)
	    end if
	    %%%%%%%%%%%%%%%%%%%%%%%%%%% Drawing Bodies %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    for CBCycle : 1 .. 3         %%%%%%% Your Team
		if Character (CBCycle).Identity = 1 or Character (CBCycle).Identity = 4 or Character (CBCycle).Identity = 5 then
		    if Animating = true & ActiveUser = CBCycle then
		    elsif Character (CBCycle).Health > 0 then
			Pic.Draw (bodyshadow, 20 + 110 * (CBCycle - 1), 212 + 100 * (CBCycle - 1), picMerge)
			Pic.Draw (Character (CBCycle).Body, 20 + 110 * (CBCycle - 1), 220 + 100 * (CBCycle - 1), picMerge) %
		    end if
		end if
	    end for
	    for CBCycle : 4 .. 6         %%%%%%% Your Team
		if Character (CBCycle).Identity not= 0 then
		    if Animating = true & ActiveUser = CBCycle then
		    elsif Character (CBCycle).Health > 0 then
			Pic.Draw (bodyshadow, 270 + 110 * (CBCycle - 4), 212 + 100 * (CBCycle - 4), picMerge)
			Pic.Draw (Character (CBCycle).Body, 270 + 110 * (CBCycle - 4), 220 + 100 * (CBCycle - 4), picMerge) %
		    end if
		end if
	    end for
	    for CBCycle : 7 .. 9                     %%%%%%% Your Team
		if Character (CBCycle).Identity > 0 then
		    if Character (CBCycle).Health > 0 then
			Pic.Draw (bodyshadow, 1260 - 120 - 110 * (CBCycle - 7), 212 + 100 * (CBCycle - 7), picMerge)
			Pic.Draw (Character (CBCycle).Body, 1260 - 120 - 110 * (CBCycle - 7), 220 + 100 * (CBCycle - 7), picMerge) %
		    end if
		end if
	    end for
	    for CBCycle : 10 .. 12                     %%%%%%% Your Team
		if Character (CBCycle).Identity > 0 then
		    if Character (CBCycle).Health > 0 then
			Pic.Draw (bodyshadow, 1260 - 120 - 250 - 110 * (CBCycle - 10), 212 + 100 * (CBCycle - 10), picMerge)
			Pic.Draw (Character (CBCycle).Body, 1260 - 120 - 250 - 110 * (CBCycle - 10), 220 + 100 * (CBCycle - 10), picMerge) %
		    end if
		end if
	    end for
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Turn POinter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    %%% User's Turn
	    for CBCycle : 1 .. 3                     %%%%%%% Your Team B
		if ActiveUser = CBCycle then
		    if TPY <= 0 then
			Draw.Oval (82 + 110 * (CBCycle - 1), 380 - 9 + 100 * (CBCycle - 1), (3 * TPY), (TPY div 2), PowerWhite) %% Circle
		    end if
		    Pic.Draw (TurnPointer, 63 + 110 * (CBCycle - 1), TPY + 380 + 100 * (CBCycle - 1), picMerge) %
		end if
	    end for
	    for CBCycle : 4 .. 6                    %%%%%%% Your Team F
		if ActiveUser = CBCycle then
		    if TPY <= 0 then
			Draw.Oval (250 + 82 + 110 * (CBCycle - 4), 380 - 9 + 100 * (CBCycle - 4), (3 * TPY), (TPY div 2), PowerWhite) %% Circle
		    end if
		    Pic.Draw (TurnPointer, 250 + 63 + 110 * (CBCycle - 4), TPY + 380 + 100 * (CBCycle - 4), picMerge) %
		end if
	    end for
	    for CBCycle : 7 .. 9                     %%%%%%% Enemy Team B
		if ActiveUser = CBCycle then
		    if TPY <= 0 then
			Draw.Oval (1280 - 140 + 43 - 110 * (CBCycle - 7), 380 - 9 + 100 * (CBCycle - 7), (3 * TPY), (TPY div 2), PowerWhite) %% Circle
		    end if
		    Pic.Draw (TurnPointer, 1280 - 140 + 24 - 110 * (CBCycle - 7), TPY + 380 + 100 * (CBCycle - 7), picMerge) %
		end if
	    end for
	    for CBCycle : 10 .. 12                    %%%%%%% Enemy Team F
		if ActiveUser = CBCycle then
		    if TPY <= 0 then
			Draw.Oval (1280 - 250 - 140 + 43 - 110 * (CBCycle - 10), 380 - 9 + 100 * (CBCycle - 10), (3 * TPY), (TPY div 2), PowerWhite) %% Circle
		    end if
		    Pic.Draw (TurnPointer, 1280 - 250 - 140 + 24 - 110 * (CBCycle - 10), TPY + 380 + 100 * (CBCycle - 10), picMerge) %
		end if
	    end for
	    %%%%%%%%%%%%%%%%%%%%%%%%%%% Drawing Animated %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    if Animating = true then
		Mb := 0
		var TestIfAnimated : int := AnimateDelay
		if Character (ActiveUser).Name = "Sillness" then
		    if SkillSelected <= 110 then
			%SkillName := "" + intstr (AnimateStrike)
			if AnimateCounter < 1 then
			    exit %% This is for future- movement animation
			else
			    var FontDX : int := AnimateCounter
			    var FontDY : int := 60 + AnimateCounter * 5
			    if ActiveTarget <= 3 then
				Pic.Draw (AnimationSillness (AnimateCounter), -70 + 15 + 110 * (ActiveUser - 1), 220 + 100 * (ActiveUser - 1), picMerge)
			    elsif ActiveTarget <= 6 then
				Pic.Draw (AnimationSillness (AnimateCounter), -70 + 15 + 110 * (ActiveUser - 4), 220 + 100 * (ActiveUser - 4), picMerge)
			    elsif ActiveTarget <= 9 then
				Pic.Draw (AnimationSillness (AnimateCounter), 1260 + 15 - 320 - 120 - 110 * (ActiveTarget - 7), 220 + 100 * (ActiveTarget - 7), picMerge)
			    else
				Pic.Draw (AnimationSillness (AnimateCounter), 1260 + 45 - 320 - 120 - 110 * (ActiveTarget - 7), 220 + 100 * (ActiveTarget - 10), picMerge)
			    end if
			    FontDX := 58
			    FontDY := 120 + AnimateCounter * 3
			    if ActiveTarget <= 3 then
				Font.Draw (intstr (Damage), FontDX + 20 + 110 * (ActiveTarget - 1) - Font.Width (intstr (Damage), FontDamage) div 2 - 2, FontDY + 220 + 100 * (ActiveTarget - 1) -
				    2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 20 + 110 * (ActiveTarget - 1) - Font.Width (intstr (Damage), FontDamage) div 2 + 2, FontDY + 220 + 100 * (ActiveTarget - 1) +
				    2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 20 + 110 * (ActiveTarget - 1) - Font.Width (intstr (Damage), FontDamage) div 2, FontDY + 220 + 100 * (ActiveTarget - 1),
				    FontDamage, PSOWhite)
			    elsif ActiveTarget <= 6 then
				Font.Draw (intstr (Damage), FontDX + 270 + 110 * (ActiveTarget - 4) - Font.Width (intstr (Damage), FontDamage) div 2 - 2, FontDY + 220 + 100 * (ActiveTarget - 4) -
				    2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 270 + 110 * (ActiveTarget - 4) - Font.Width (intstr (Damage), FontDamage) div 2 + 2, FontDY + 220 + 100 * (ActiveTarget - 4) +
				    2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 270 + 110 * (ActiveTarget - 4) - Font.Width (intstr (Damage), FontDamage) div 2, FontDY + 220 + 100 * (ActiveTarget - 4),
				    FontDamage, PSOWhite)
			    elsif ActiveTarget <= 9 then
				Font.Draw (intstr (Damage), FontDX + 1140 - 110 * (ActiveTarget - 7) - Font.Width (intstr (Damage), FontDamage) div 2 - 2, FontDY + 220 + 100 * (ActiveTarget - 7)
				    - 2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 1140 - 110 * (ActiveTarget - 7) - Font.Width (intstr (Damage), FontDamage) div 2 + 2, FontDY + 220 + 100 * (ActiveTarget - 7)
				    + 2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 1140 - 110 * (ActiveTarget - 7) - Font.Width (intstr (Damage), FontDamage) div 2, FontDY + 220 + 100 * (ActiveTarget - 7),
				    FontDamage, PSOWhite)
			    else
				Font.Draw (intstr (Damage), FontDX + 1140 - 250 - 110 * (ActiveTarget - 10) - Font.Width (intstr (Damage), FontDamage) div 2 - 2, FontDY + 220 + 100
				    * (ActiveTarget - 10) - 2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 1140 - 250 - 110 * (ActiveTarget - 10) - Font.Width (intstr (Damage), FontDamage) div 2 + 2, FontDY + 220 + 100
				    * (ActiveTarget - 10) + 2, FontDamage, PSODarkBlue)
				Font.Draw (intstr (Damage), FontDX + 1140 - 250 - 110 * (ActiveTarget - 10) - Font.Width (intstr (Damage), FontDamage) div 2, FontDY + 220 + 100 * (ActiveTarget -
				    10), FontDamage, PSOWhite)
			    end if

			    if AnimateCounter >= 10 then
				Animating := false
				FinishedTurn := true
				exit
			    end if
			end if
		    end if
		    AnimateDelay += 8
		    if AnimateDelay >= 560 then
			AnimateCounter := 10
		    elsif AnimateDelay >= 470 then
			AnimateCounter := 9
		    elsif AnimateDelay >= 400 then
			AnimateCounter := 8
		    elsif AnimateDelay >= 340 then
			AnimateCounter := 7
		    elsif AnimateDelay >= 285 then
			AnimateCounter := 6
		    elsif AnimateDelay >= 225 then
			AnimateCounter := 5
		    elsif AnimateDelay >= 180 then
			AnimateCounter := 4
		    elsif AnimateDelay >= 130 then
			AnimateCounter := 3
		    elsif AnimateDelay >= 70 then
			AnimateCounter := 2
		    elsif AnimateDelay >= 40 then
			AnimateCounter := 1
		    end if
		else
		    Animating := false
		    FinishedTurn := true
		    exit                    
		end if
		if TestIfAnimated = AnimateDelay then
		    Animating := false
		    FinishedTurn := true
		    exit
		end if
	    end if
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Animation Turn POinter
	    TPAnimation += 4
	    if TPY >= 11 then
		TPup := false
	    elsif TPY <= -11 then
		TPup := true
	    elsif TPY >= 10 or TPY <= -10 then
		TPMax := 17
	    elsif TPY >= 7 or TPY <= -7 then
		TPMax := 12
	    elsif TPY <= 4 or TPY <= -4 then
		TPMax := 8
	    end if
	    if TPAnimation >= TPMax then
		TPAnimation := 0
		if TPup = false then
		    TPY -= 1
		else
		    TPY += 1
		end if
	    end if
	    %%%%%%%%%Skill Targetting, your turn%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    HighlightBody := 0
	    HighlightSkill := 0
	    if SixOverTwelve = false then
		if Mx >= 540 and Mx <= 720 and My >= 448 and My <= 532 then
		else
		    SixOverTwelve := true
		end if
	    else
		SixOverTwelve := true
	    end if
	    %%%%%%%%% Body Targeting, highlight body %%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    if ActiveUser <= 6 & Character (ActiveUser).Identity = 5 then     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Teammate NPC Turn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Teammate AI %%%%%%%%%%%%%%%%%%%%%%%%%%
		for CycleMaxSkill : 6 .. 1
		    if Character (ActiveUser).Power >= CalculatePower (Character (ActiveUser).Skill (CycleMaxSkill).SkillID) then
			SkillSelected := CycleMaxSkill
			exit
		    end if
		end for
		if Character (7).Health > Character (8).Health then
		    if Character (7).Health > Character (9).Health then
			ActiveTarget := 7
		    else
			ActiveTarget := 9
		    end if
		else
		    if Character (8).Health > Character (9).Health then
			ActiveTarget := 8
		    else
			ActiveTarget := 9
		    end if
		end if
		Animating := true
		SkillCast
		FinishedTurn := true
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Party Turn %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    elsif ActiveUser <= 6 & Character (ActiveUser).Identity > 0 & Character (ActiveUser).Identity < 5 then
		for Highlight : 1 .. 3                     %%%%%%% Highlight Your Team Backline
		    Mouse.Where (Mx, My, Mb)
		    MouseRestriction
		    if Character (Highlight).Identity not= 0 then
			if Character (Highlight).Health > 0 then     %%%%%%%%%%%%%%%% Circular detection of body by mouse
			    %%%%%% Detect Body Circle
			    if (Mx - (20 + 55 + 110 * (Highlight - 1))) ** 2 + (My - (220 + 72 + 100 * (Highlight - 1))) ** 2 <= 50 ** 2 then
				HighlightBody += 1
				Draw.Oval (20 + 55 + 110 * (Highlight - 1), 220 + 72 + 100 * (Highlight - 1), 35, 35, 31)     %
				Draw.Oval (20 + 55 + 110 * (Highlight - 1), 220 + 72 + 100 * (Highlight - 1), 50, 50, BorderBlue)     %
				Draw.Oval (20 + 55 + 110 * (Highlight - 1), 220 + 72 + 100 * (Highlight - 1), 44, 44, BorderBlue)     %
				ActiveTarget := Highlight
				if ActiveUser = ActiveTarget then
				    %%%%%%%%%%%% Pass Move Draw
				    if Movementboolean = true then
					Draw.FillBox (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1),
					    Bronze)
					Draw.Box (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1), Gold)
				    else
					Draw.FillBox (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1),
					    PSODarkBlue)
					Draw.Box (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1), PSOWhite)
				    end if
				    Draw.FillBox (25 + 110 * (ActiveTarget - 1), 292 - 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 - 50 + 100 * (ActiveTarget - 1),
					PSODarkBlue)
				    Draw.Box (25 + 110 * (ActiveTarget - 1), 292 - 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 - 50 + 100 * (ActiveTarget - 1), PSOWhite)

				    Font.Draw ("Move", 30 + 110 * (ActiveTarget - 1), 292 + 35 + 100 * (ActiveTarget - 1), FontInfo, PSOWhite)
				    Font.Draw ("Pass", 30 + 110 * (ActiveTarget - 1), 292 - 45 + 100 * (ActiveTarget - 1), FontInfo, PSOWhite)
				end if
			    end if
			    %%%%%%%%% Detect Skills Box x 6
			    if Mx >= 75 + 110 * (ActiveTarget - 1) and Mx <= 75 + 190 + 110 * (ActiveTarget - 1) and My >= 243 + 100 * (ActiveTarget - 1)     %% Underlaying box for detection
				    and My <= 253 + 86 + 100 * (ActiveTarget - 1) then
				HighlightSkill += 1
			    end if
			    %%%%% Detect Move
			    if Mx >= 25 + 110 * (ActiveTarget - 1) and Mx <= 75 + 110 * (ActiveTarget - 1) & ActiveUser = ActiveTarget
				    and My >= 292 + 30 + 100 * (ActiveTarget - 1)     %% Underlaying box for detection
				    and My <= 292 + 50 + 100 * (ActiveTarget - 1) then
				HighlightBody += 1
				Draw.FillBox (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1), PSOWhite)
				Draw.Box (25 + 110 * (ActiveTarget - 1), 292 + 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 + 50 + 100 * (ActiveTarget - 1), PSODarkBlue)
				Font.Draw ("Move", 30 + 110 * (ActiveTarget - 1), 292 + 35 + 100 * (ActiveTarget - 1), FontInfo, PSODarkBlue)
				if Mb = 1 & Movementboolean = false then
				    Movementboolean := true
				    delay (120)
				elsif Mb = 1 & Movementboolean = true then
				    Movementboolean := false
				    delay (120)
				end if
			    end if
			    %%% Detect Pass  highlight
			    if Mx >= 25 + 110 * (ActiveTarget - 1) and Mx <= 75 + 110 * (ActiveTarget - 1) & ActiveUser = ActiveTarget
				    and My <= 292 - 30 + 100 * (ActiveTarget - 1)     %% Underlaying box for detection
				    and My >= 292 - 50 + 100 * (ActiveTarget - 1) then
				HighlightBody += 1
				Draw.FillBox (25 + 110 * (ActiveTarget - 1), 292 - 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 - 50 + 100 * (ActiveTarget - 1), PSOWhite)
				Draw.Box (25 + 110 * (ActiveTarget - 1), 292 - 30 + 100 * (ActiveTarget - 1), 75 + 110 * (ActiveTarget - 1), 292 - 50 + 100 * (ActiveTarget - 1), PSODarkBlue)
				Font.Draw ("Pass", 30 + 110 * (ActiveTarget - 1), 292 - 45 + 100 * (ActiveTarget - 1), FontInfo, PSODarkBlue)
				if Mb = 1 then
				    FinishedTurn := true
				    Character (ActiveUser).Speed -= 10
				    exit
				end if
			    end if
			    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			end if
		    end if
		end for
		for Highlight : 4 .. 6                     %%%%%%% Highlight Your Team
		    Mouse.Where (Mx, My, Mb)
		    MouseRestriction
		    if Character (Highlight).Identity not= 0 then
			if Character (Highlight).Health > 0 then     %%%%%%%%%%%%%%%% Circular detection of body by mouse
			    if SixOverTwelve = false then
			    else
				if (Mx - (270 + 55 + 110 * (Highlight - 4))) ** 2 + (My - (220 + 72 + 100 * (Highlight - 4))) ** 2 <= 50 ** 2 then
				    HighlightBody += 1
				    Draw.Oval (270 + 55 + 110 * (Highlight - 4), 220 + 72 + 100 * (Highlight - 4), 35, 35, 31)     %
				    Draw.Oval (270 + 55 + 110 * (Highlight - 4), 220 + 72 + 100 * (Highlight - 4), 50, 50, BorderBlue)     %
				    Draw.Oval (270 + 55 + 110 * (Highlight - 4), 220 + 72 + 100 * (Highlight - 4), 44, 44, BorderBlue)     %
				    ActiveTarget := Highlight
				    %%%%%%%%%%%% Pass Move Draw
				    if ActiveUser = ActiveTarget then
					Draw.FillBox (250 + 25 + 110 * (ActiveTarget - 4), 292 - 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 - 50 + 100 * (ActiveTarget
					    -
					    4),
					    PSODarkBlue)
					Draw.Box (250 + 25 + 110 * (ActiveTarget - 4), 292 - 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 - 50 + 100 * (ActiveTarget -
					    4),
					    PSOWhite)
					if Movementboolean = true then
					    Draw.FillBox (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100
						* (ActiveTarget
						- 4), Bronze)
					    Draw.Box (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100 * (ActiveTarget
						-
						4), Gold)
					else
					    Draw.FillBox (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100
						* (ActiveTarget
						- 4), PSODarkBlue)
					    Draw.Box (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100 * (ActiveTarget
						-
						4), PSOWhite)
					end if
					Font.Draw ("Move", 250 + 30 + 110 * (ActiveTarget - 4), 292 + 35 + 100 * (ActiveTarget - 4), FontInfo, PSOWhite)
					Font.Draw ("Pass", 250 + 30 + 110 * (ActiveTarget - 4), 292 - 45 + 100 * (ActiveTarget - 4), FontInfo, PSOWhite)
				    end if
				end if
				if Mx >= 250 + 75 + 110 * (ActiveTarget - 4) and Mx <= 250 + 75 + 190 + 110 * (ActiveTarget - 4) and My >= 243 + 100 * (ActiveTarget - 4)
				    %% Underlaying box for detection
					and My <= 253 + 86 + 100 * (ActiveTarget - 4) then
				    HighlightSkill += 1
				end if
				%%%%% Detect Move
				if Mx >= 250 + 25 + 110 * (ActiveTarget - 4) and Mx <= 250 + 75 + 110 * (ActiveTarget - 4) & ActiveUser = ActiveTarget
					and My >= 292 + 30 + 100 * (ActiveTarget - 4)     %% Underlaying box for detection
					and My <= 292 + 50 + 100 * (ActiveTarget - 4) then
				    HighlightBody += 1
				    Draw.FillBox (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100 * (ActiveTarget -
					4),
					PSOWhite)
				    Draw.Box (250 + 25 + 110 * (ActiveTarget - 4), 292 + 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 + 50 + 100 * (ActiveTarget - 4),
					PSODarkBlue)
				    Font.Draw ("Move", 250 + 30 + 110 * (ActiveTarget - 4), 292 + 35 + 100 * (ActiveTarget - 4), FontInfo, PSODarkBlue)
				    if Mb = 1 & Movementboolean = false then
					Movementboolean := true
					delay (120)
				    elsif Mb = 1 & Movementboolean = true then
					Movementboolean := false
					delay (120)
				    end if
				end if
				%%% Detect Pass  highlight
				if Mx >= 250 + 25 + 110 * (ActiveTarget - 4) and Mx <= 250 + 75 + 110 * (ActiveTarget - 4) & ActiveUser = ActiveTarget
					and My <= 292 - 30 + 100 * (ActiveTarget - 4)     %% Underlaying box for detection
					and My >= 292 - 50 + 100 * (ActiveTarget - 4) then
				    HighlightBody += 1
				    Draw.FillBox (250 + 25 + 110 * (ActiveTarget - 4), 292 - 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 - 50 + 100 * (ActiveTarget -
					4),
					PSOWhite)
				    Draw.Box (250 + 25 + 110 * (ActiveTarget - 4), 292 - 30 + 100 * (ActiveTarget - 4), 250 + 75 + 110 * (ActiveTarget - 4), 292 - 50 + 100 * (ActiveTarget - 4),
					PSODarkBlue)
				    Font.Draw ("Pass", 250 + 30 + 110 * (ActiveTarget - 4), 292 - 45 + 100 * (ActiveTarget - 4), FontInfo, PSODarkBlue)
				    if Mb = 1 then
					FinishedTurn := true
					Character (ActiveUser).Speed -= 10
					exit
				    end if
				end if
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			    end if
			end if
		    end if
		end for
		for Highlight : 7 .. 9                 %%%%%%%Enemy Highlight Body BackLine
		    Mouse.Where (Mx, My, Mb)
		    if Character (Highlight).Identity > 0 then
			if Character (Highlight).Health > 0 then
			    if (Mx - (1260 + 55 - 120 - 110 * (Highlight - 7))) ** 2 + (My - (220 + 72 + 100 * (Highlight - 7))) ** 2 <= 50 ** 2 then
				HighlightBody += 1
				Draw.Oval (1260 + 55 - 120 - 110 * (Highlight - 7), 220 + 72 + 100 * (Highlight - 7), 35, 35, 31)     %
				Draw.Oval (1260 + 55 - 120 - 110 * (Highlight - 7), 220 + 72 + 100 * (Highlight - 7), 50, 50, FoeRed)     %
				Draw.Oval (1260 + 55 - 120 - 110 * (Highlight - 7), 220 + 72 + 100 * (Highlight - 7), 44, 44, FoeRed)     %
				ActiveTarget := Highlight
			    end if
			    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAxsize Skill total Sizes (Circle to last box)
			    if Mx <= 1280 - (75 + 110 * (ActiveTarget - 7)) and Mx >= 1280 - (75 + 190 + 110 * (ActiveTarget - 7)) and My >= 243 + 100 * (ActiveTarget - 7)
				%%%% Max skill total size
				    and My <= 253 + 86 + 100 * (ActiveTarget - 7) then
				HighlightSkill += 1
			    end if
			end if
		    end if
		end for
		for Highlight : 10 .. 12                 %%%%%%%Enemy Highlight Body FrontLine
		    Mouse.Where (Mx, My, Mb)
		    if Character (Highlight).Identity > 0 then
			if Character (Highlight).Health > 0 then
			    if ActiveTarget = 6 and HighlightBody > 0 then
			    elsif ActiveTarget = 6 and HighlightSkill > 0 then
			    else
				if (Mx - (1260 + 55 - 120 - 250 - 110 * (Highlight - 10))) ** 2 + (My - (220 + 72 + 100 * (Highlight - 10))) ** 2 <= 50 ** 2 then
				    HighlightBody += 1
				    Draw.Oval (1260 + 55 - 250 - 120 - 110 * (Highlight - 10), 220 + 72 + 100 * (Highlight - 10), 35, 35, 31)     %
				    Draw.Oval (1260 + 55 - 250 - 120 - 110 * (Highlight - 10), 220 + 72 + 100 * (Highlight - 10), 50, 50, FoeRed)     %
				    Draw.Oval (1260 + 55 - 250 - 120 - 110 * (Highlight - 10), 220 + 72 + 100 * (Highlight - 10), 44, 44, FoeRed)     %
				    ActiveTarget := Highlight
				end if
				%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAxsize Skill total Sizes (Circle to last box)
				if Mx <= 1280 - 250 - (75 + 110 * (ActiveTarget - 10)) and Mx >= 1280 - 250 - (75 + 190 + 110 * (ActiveTarget - 10)) and My >= 243 + 100 * (ActiveTarget - 10)
				    %%%% Max skill total size
					and My <= 253 + 86 + 100 * (ActiveTarget - 10) then
				    HighlightSkill += 1
				    if ActiveTarget = 12 then
					SixOverTwelve := false
				    end if
				end if
			    end if
			end if
		    end if
		end for
		% elsif ActiveUser <= 3 & Character (ActiveUser).Identity = 5 then
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Enemy AI %%%%******************%%%%%%%%WDDSAFFASFFAFAFSAF\\\\\\\\
	    elsif ActiveUser >= 7 & Character (ActiveUser).Identity not= 0 then     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ENEMY TURN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		SkillSelected := Rand.Int (1, 6)
		ActiveTarget := 0
		loop
		    ActiveTarget := Rand.Int (1, 6)
		    if Character (ActiveTarget).Identity not= 0 then
			if Character (ActiveTarget).Health > 0 then
			    exit
			end if
		    end if
		end loop
		SkillCast
	    end if
	    %%%%%%%%%%%%%%%%%%% Skills box %%%%%%%%%%%%%%
	    if Mx > 0 and Mx < maxx and My > 213 and My < 604 then
	    else     %%% Make sure highlight is inside fighting scene(for ovals)
		HighlightBody := 0
		HighlightSkill := 0
	    end if
	    %%%%%%%%% If is highlighted. %% Is enemy is targetted
	    if ActiveTarget >= 7 or ActiveUser >= 7 then
		Movementboolean := false
	    end if
	    if Movementboolean = true then     %% If movement has been clicked, activate movement. BACKLINE
		for DetectEmptySpot : 1 .. 3     %%%%%%%%% MOVEMENT
		    % Mouse.Where (Mx, My, Mb)
		    if Character (DetectEmptySpot).Identity = 0 then     % or Character (DetectEmptySpot).Health <= 0
			Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 50, 50, PSOWhite)
			Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 43, 43, PSOWhite)
			Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 35, 35, PSOBlue)
			if (Mx - (75 + 110 * (DetectEmptySpot - 1))) ** 2 + (My - (292 + 100 * (DetectEmptySpot - 1))) ** 2 <= 50 ** 2 then
			    Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 50, 50, PSOBlue)
			    Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 43, 43, PSOBlue)
			    Draw.Oval (75 + 110 * (DetectEmptySpot - 1), 292 + 100 * (DetectEmptySpot - 1), 35, 35, PowerWhite)
			    if ActiveUser <= 3 then
				Draw.Oval (75 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 1), 5, 5, PSOWhite)
				Draw.Line (82 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 1), Mx, My, PSOWhite)
			    else
				Draw.Oval (-5 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 4), 5, 5, PSOWhite)
				Draw.Line (-12 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 4), Mx, My, PSOWhite)
			    end if
			    Draw.FillOval (Mx, My, 2, 2, PSOWhite)
			    if Mb = 1 then
				Character (DetectEmptySpot) := Character (ActiveUser)
				Character (ActiveUser) := EmptyNPC
				ActiveUser := DetectEmptySpot
				Movement_CurrentOrderDisplay
				%CT (1).ID := ActiveUser
				%CT (1).Speed := 0
				Movementboolean := false
				Draw.FillOval (Mx, My, 2, 2, FoeRed)
				View.Update
				delay (100)
				exit
			    end if
			end if
		    end if
		end for
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detect spots for movement, frontlines %%%%%%%%%%%%%%%%%%%%%%%%%%%
		for DetectEmptySpot : 4 .. 6     %%%%% MOVEMENT
		    %Mouse.Where (Mx, My, Mb) %% Front line of party, Display possible movement positions. If highlight, show inverted colours
		    if Character (DetectEmptySpot).Identity = 0 then     % or Character (DetectEmptySpot).Health <= 0
			Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 50, 50, PSOWhite)
			Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 43, 43, PSOWhite)
			Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 35, 35, PSOBlue)
			if (Mx - (250 + 50 + 110 * (DetectEmptySpot - 4))) ** 2 + (My - (292 + 100 * (DetectEmptySpot - 4))) ** 2 <= 50 ** 2 then
			    Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 50, 50, PSOBlue)
			    Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 43, 43, PSOBlue)
			    Draw.Oval (250 + 50 + 110 * (DetectEmptySpot - 4), 292 + (100 * (DetectEmptySpot - 4)), 35, 35, PSOWhite)
			    if ActiveUser <= 3 then
				Draw.Oval (75 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 1), 5, 5, PSOWhite)
				Draw.Line (82 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 1), Mx, My, PSOWhite)
			    else
				Draw.Oval (-5 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 4), 5, 5, PSOWhite)
				Draw.Line (-12 + 110 * (ActiveUser - 1), 292 + 100 * (ActiveUser - 4), Mx, My, PSOWhite)
			    end if
			    Draw.FillOval (Mx, My, 2, 2, PSOWhite)
			    if Mb = 1 then
				Character (DetectEmptySpot) := Character (ActiveUser)
				Character (ActiveUser) := EmptyNPC
				ActiveUser := DetectEmptySpot
				Movement_CurrentOrderDisplay
				%CT (1).ID := ActiveUser
				%CT (1).Speed := 0
				Movementboolean := false
				Draw.FillOval (Mx, My, 2, 2, FoeRed)
				View.Update
				delay (100)
				exit
			    end if
			end if
		    end if
		end for
	    elsif ActiveTarget <= 6 & HighlightSkill > 0| ActiveTarget <= 6 & HighlightBody > 0 then
		if ActiveTarget <= 3 then
		    CurrentActive := ActiveTarget - 1
		    SkillsBoxDrawX := 130
		else
		    CurrentActive := ActiveTarget - 4
		    SkillsBoxDrawX := 130 + 250
		end if
		Draw.Box (SkillsBoxDrawX - 20 + 110 * (CurrentActive), 292 + 100 * (CurrentActive), SkillsBoxDrawX - 10 + 110 * (CurrentActive), 292 + 100 * (CurrentActive), 31)     % Lines
		Draw.Box (SkillsBoxDrawX - 10 + 110 * (CurrentActive), 265 + 100 * (CurrentActive), SkillsBoxDrawX - 10 + 110 * (CurrentActive), 317 + 100 * (CurrentActive), 31)
		Draw.Box (SkillsBoxDrawX - 10 + 110 * (CurrentActive), 265 + 100 * (CurrentActive), SkillsBoxDrawX - 10 + 140 + 110 * (CurrentActive), 265 + 100 * (CurrentActive), 31)
		Draw.Box (SkillsBoxDrawX - 10 + 110 * (CurrentActive), 317 + 100 * (CurrentActive), SkillsBoxDrawX - 10 + 140 + 110 * (CurrentActive), 317 + 100 * (CurrentActive), 31)
		HighlightSkill := 0
		for XBox : 0 .. 2
		    for YBox : 0 .. 1
			Mouse.Where (Mx, My, Mb)
			Draw.Box (SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox, 248 + 100 * (CurrentActive) + 45 * YBox,
			    SkillsBoxDrawX + 39 + 110 * (CurrentActive) + 45 * XBox, 287 + 100 * (CurrentActive) + 45 * YBox, 31)
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Display Boxes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\
			if YBox = 0 then     %%%%%%%%%%%%%%%%%%%%%% Calculating Skill to which box based on for 1..3, 1..2 >> (XBox + 1) * 2 - 1) = Bottom >>
			    Pic.Draw (SkillPic (Character (ActiveUser).Skill ((XBox + 1) * 2 - 1).SkillID),
				SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox, 248 + 100 * (CurrentActive) + 45 * YBox, picMerge)
			else
			    Pic.Draw (SkillPic (Character (ActiveUser).Skill ((XBox + 1) * (YBox + 1)).SkillID),     %%%%%% (XBox + 1) * (YBox + 1) = Top >>>
				SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox, 248 + 100 * (CurrentActive) + 45 * YBox, picMerge)
			end if
			%%%%%%%%%%%%%%%% Selecting Boxer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if Mx >= SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox and Mx <= SkillsBoxDrawX + 40 + 110 * (CurrentActive) + 45 * XBox     % Detect Skill Hover
				and My >= 248 + 100 * (CurrentActive) + 45 * YBox and My <= 288 + 100 * (CurrentActive) + 45 * YBox then
			    Draw.Box (SkillsBoxDrawX - 1 + 110 * (CurrentActive) + 45 * XBox, 247 + 100 * (CurrentActive) + 45 * YBox,
				SkillsBoxDrawX + 40 + 110 * (CurrentActive) + 45 * XBox, 288 + 100 * (CurrentActive) + 45 * YBox, Gold)
			    Draw.Box (SkillsBoxDrawX - 2 + 110 * (CurrentActive) + 45 * XBox, 246 + 100 * (CurrentActive) + 45 * YBox,
				SkillsBoxDrawX + 41 + 110 * (CurrentActive) + 45 * XBox, 289 + 100 * (CurrentActive) + 45 * YBox, Bronze)
			    HighlightSkill += 1
			    %%% Determine skill id
			    if YBox = 0 then
				SkillSelected := ((XBox + 1) * 2 - 1)
			    else
				SkillSelected := ((XBox + 1) * (YBox + 1))
			    end if
			    DisplayDescription := true
			    %%%%%%%% Skill Click
			    if Mb = 1 then
				Cast := true
			    end if
			    %%%%%%%%%%%%%%%%%%%
			end if
		    end for
		end for
	    elsif ActiveTarget <= 12 & ActiveTarget > 6 & HighlightSkill > 0| ActiveTarget <= 12 & ActiveTarget > 6 & HighlightBody > 0 then     %%% Enemyvar SkillsBoxDrawX : int := 130
		if ActiveTarget <= 9 then
		    CurrentActive := ActiveTarget - 7
		    SkillsBoxDrawX := 130
		else
		    CurrentActive := ActiveTarget - 10
		    SkillsBoxDrawX := 130 + 250
		end if
		Draw.Box (1280 - 10 - (SkillsBoxDrawX - 20 + 110 * (CurrentActive)), 292 + 100 * (CurrentActive), 1280 - 10 - (SkillsBoxDrawX - 10 + 110 * (CurrentActive)), 292 + 100
		    * (CurrentActive), 31)
		Draw.Box (1280 - 10 - (SkillsBoxDrawX - 10 + 110 * (CurrentActive)), 265 + 100 * (CurrentActive), 1280 - 10 - (SkillsBoxDrawX - 10 + 110 * (CurrentActive)), 317 + 100
		    * (CurrentActive), 31)
		Draw.Box (1280 - 10 - (SkillsBoxDrawX - 10 + 110 * (CurrentActive)), 265 + 100 * (CurrentActive), 1280 - 10 - (SkillsBoxDrawX + 130 + 110 * (CurrentActive)), 265 + 100
		    * (CurrentActive), 31)
		Draw.Box (1280 - 10 - (SkillsBoxDrawX - 10 + 110 * (CurrentActive)), 317 + 100 * (CurrentActive), 1280 - 10 - (SkillsBoxDrawX + 130 + 110 * (CurrentActive)), 317 + 100
		    * (CurrentActive), 31)
		HighlightSkill := 0
		for XBox : 0 .. 2
		    for YBox : 0 .. 1
			Mouse.Where (Mx, My, Mb)
			Draw.Box (1280 - 10 - (SkillsBoxDrawX + 1 + 110 * (CurrentActive) + 45 * XBox), 248 + 100 * (CurrentActive) + 45 * YBox,
			    1280 - 10 - (SkillsBoxDrawX + 40 + 110 * (CurrentActive) + 45 * XBox), 287 + 100 * (CurrentActive) + 45 * YBox, 31)
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Display Boxes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\
			if YBox = 0 then     %%%%%%%%%%%%%%%%%%%%%% Calculating Skill to which box based on for 1..3, 1..2 >> (XBox + 1) * 2 - 1) = Bottom >>
			    Pic.Draw (SkillPic (Character (ActiveUser).Skill ((XBox + 1) * 2 - 1).SkillID),
				1280 - 10 - 40 - (SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox), 248 + 100 * (CurrentActive) + 45 * YBox, picMerge)
			else
			    Pic.Draw (SkillPic (Character (ActiveUser).Skill ((XBox + 1) * (YBox + 1)).SkillID),     %%%%%% (XBox + 1) * (YBox + 1) = Top >>>
				1280 - 10 - 40 - (SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox), 248 + 100 * (CurrentActive) + 45 * YBox, picMerge)
			    %% Even
			end if
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detect %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if Mx <= 1280 - 10 - (SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox) and Mx >= 1280 - 10 - (SkillsBoxDrawX + 40 + 110 * (CurrentActive) + 45 * XBox)
			    % Detect Skill Hover
				and My >= 248 + 100 * (CurrentActive) + 45 * YBox and My <= 288 + 100 * (CurrentActive) + 45 * YBox then
			    Draw.Box (1280 - 10 - (SkillsBoxDrawX + 110 * (CurrentActive) + 45 * XBox), 247 + 100 * (CurrentActive) + 45 * YBox,
				1280 - 10 - (SkillsBoxDrawX + 41 + 110 * (CurrentActive) + 45 * XBox), 288 + 100 * (CurrentActive) + 45 * YBox, Gold)
			    Draw.Box (1280 - 10 - (SkillsBoxDrawX - 1 + 110 * (CurrentActive) + 45 * XBox), 246 + 100 * (CurrentActive) + 45 * YBox,
				1280 - 10 - (SkillsBoxDrawX + 42 + 110 * (CurrentActive) + 45 * XBox), 289 + 100 * (CurrentActive) + 45 * YBox, Bronze)
			    HighlightSkill += 1
			    if YBox = 0 then
				SkillSelected := ((XBox + 1) * 2 - 1)
			    else
				SkillSelected := ((XBox + 1) * (YBox + 1))
			    end if
			    DisplayDescription := true
			    %%%%%%%% Skill Click
			    if Mb = 1 then
				Cast := true
			    end if
			    %%%%%%%%%%%%%%%%%%%
			end if
		    end for
		end for
	    end if

	    if Cast = true then
		SkillCast
	    end if
	    if DisplayDescription = true then
		SkillDescriptionDisplay ((Character (ActiveUser).Skill (SkillSelected).SkillID))
	    end if
	    DisplayDescription := false
	    %%% Enemy's turn
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	    %%%%%%%%%%%%%%%Update Draw%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    % delay (20)
	    %%%%%%%%%%%%%%%% BATTLE FONT: DISPLAYS STATS ON CHARACTERS AND SKILLS
	    % Damage := SkillDisplay (Character (ActiveUser).Skill (SkillSelected).SkillID)
	    % Font.Draw ("User:" + intstr (ActiveUser), 512, 166, FontBattle, Gold)
	    % Font.Draw ("Target:" + intstr (ActiveTarget), 325, 95, Font13, Gold)
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    delay (8)     % Rough FPS = 125
	    View.Update
	    if FinishedTurn = true & Animating = false then
		exit
	    end if
	end loop
	% Reset Stats to normal
	if Character (ActiveUser).ChangeLevel >= 1 then     %%% LEVEL
	    Character (ActiveUser).ChangeLevel -= 1
	elsif Character (ActiveUser).ChangeLevel = 0 then
	    Character (ActiveUser).Level := Character (ActiveUser).TotalLevel
	end if
	if Character (ActiveUser).ChangeAttack >= 1 then     %%% Attack
	    Character (ActiveUser).ChangeAttack -= 1
	elsif Character (ActiveUser).ChangeAttack = 0 then
	    Character (ActiveUser).Attack := Character (ActiveUser).TotalAttack
	end if
	if Character (ActiveUser).ChangeDefense >= 1 then     %%%% Defense
	    Character (ActiveUser).ChangeDefense -= 1
	elsif Character (ActiveUser).ChangeDefense = 0 then
	    Character (ActiveUser).Defense := Character (ActiveUser).Defense
	end if
	if Character (ActiveUser).ChangeCritChance >= 1 then     %%%% CC
	    Character (ActiveUser).ChangeCritChance -= 1
	elsif Character (ActiveUser).ChangeCritChance = 0 then
	    Character (ActiveUser).CritChance := Character (ActiveUser).CritChance
	end if
	if Character (ActiveUser).ChangeCritDamage >= 1 then     %%%% CD
	    Character (ActiveUser).ChangeCritDamage -= 1
	elsif Character (ActiveUser).ChangeCritDamage = 0 then
	    Character (ActiveUser).CritDamage := Character (ActiveUser).CritDamage
	end if
	if Character (ActiveUser).Power > Character (ActiveUser).TotalPower then     %% Power
	    Character (ActiveUser).Power := Character (ActiveUser).TotalPower
	end if
	if Character (ActiveUser).Health > Character (ActiveUser).TotalHealth then     %% Health
	    Character (ActiveUser).Health := Character (ActiveUser).TotalHealth
	end if
	%%%% Determine who wins, if one team is dead.
	FoeOverallHealth := 0
	PartyOverallHealth := 0
	for CycleSpeed : 1 .. 12
	    if Character (CycleSpeed).Identity not= 0 then
		if Character (CycleSpeed).Health < 0 then
		    Character (CycleSpeed).Health := 0
		end if
		if CycleSpeed <= 6 then
		    PartyOverallHealth += Character (CycleSpeed).Health
		else
		    FoeOverallHealth += Character (CycleSpeed).Health
		end if
	    end if
	end for
	if FoeOverallHealth <= 0 then
	    WonBattleOutcome := true
	    exit
	elsif PartyOverallHealth <= 0 then
	    WonBattleOutcome := false
	    exit
	else
	end if
    end loop

end Battle

proc PreBattleMenu (LocationID : int)     %% ID 1 - 45
    var StoredX : int := 0
    var Ready : boolean := false
    var CurrentClick : int := 0             %%% Who is being dragged
    var Drag : boolean := false             %%% Is dragging on
    var DragFromBottom : boolean := true             %% Detect if avatar dragged from top or bottom
    var CurrentSelected : boolean := false             %% Is a picture selected? if so, cancel mb
    var FPS : int := 0
    var FPStick : int := 0
    var FPScount : int := 0
    MovedX := 0

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Progression of unlocking maps
    for UpdateMap : 1 .. (LocationSize - 1)
	if Location (UpdateMap).U = true then
	    Location (UpdateMap + 1).U := true           %% Velia >> Cron Castle
	end if
    end for
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for Cycle : 1 .. 12
	Character (Cycle) := EmptyNPC
    end for
    %%%%%%%%%%%%% DECLARE ENEMIES %%%%%%%%%%%%%%%%%%
    if LocationID = 1 then     %% Balenos
	Character (7) := PowderMonkey      %%%%%%%%%%%%%%%%%%%% Experimental %%%%%%%%%%%%%%%%%%%%
	Character (8) := PowderMonkey             %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
	Character (9) := PowderMonkey        %%%%%%%%%%%%%%%%%%%%%%%% Oct. 15 2016
	Character (11) := PowderMonkey            %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
    elsif LocationID = 2 then     %% Balenos
	Character (7) := PracticeDummy     %%%%%%%%%%%%%%%%%%%% Experimental %%%%%%%%%%%%%%%%%%%%
	Character (8) := PracticeDummy             %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
	Character (9) := PracticeDummy       %%%%%%%%%%%%%%%%%%%%%%%% Oct. 15 2016
    elsif LocationID = 3 then     %% Cron Castle
	Character (7) := PowderMonkey      %%%%%%%%%%%%%%%%%%%% Experimental %%%%%%%%%%%%%%%%%%%%
	Character (8) := DerissMashete            %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
    elsif LocationID = 4 then     %% Mausoleum Tomb
    elsif LocationID = 5 then     %% Elric Shrine
    elsif LocationID = 6 then     %% Sausans Garrison
    elsif LocationID = 7 then     %% Mediah Water Stronghold
    elsif LocationID = 8 then     %% Owen's Fire Cave
    elsif LocationID = 10 then     %% Marni's Laboratory
    else     %%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Character (7) := MediahKnight        %%%%%%%%%%%%%%%%%%%% Experimental %%%%%%%%%%%%%%%%%%%%
	Character (8) := MediahKnight           %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
	Character (9) := MediahKnight      %%%%%%%%%%%%%%%%%%%%%%%% Oct. 15 2016
	Character (10) := MediahKnight        %%%%%%%%%%%%%%%%%%%% Experimental %%%%%%%%%%%%%%%%%%%%
	Character (11) := MediahKnight           %%%%%%%%%%%%%%%%%%%%%%%% Test subjects
	Character (12) := MediahKnight      %%%%%%%%%%%%%%%%%%%%%%%% Oct. 15 2016
	%  Character (4).Identity := 3           %%%%%%%%%%%%%%%%%%%%%%%% Oct. 15 2016
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end if


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BEGIN %%%%%%%%%%%%%%%%
    var CCC_UpPerson : int := 1
    for Cycle : 1 .. 10
	if CCC_UpPerson >= 4 then
	    Party (Cycle).Identity := 1
	elsif Party (Cycle).Identity = 4 then
	    Character (CCC_UpPerson) := Party (Cycle)
	    CCC_UpPerson += 1
	end if
    end for
    delay (50)

    loop             %%%%%%%%%%%%%%%%%%%%%%%%   Main Loop %%%%%%%%%%%%%%%%%%%
	Mouse.Where (Mx, My, Mb)
	if MovedX > 200 then
	    MovedX := 200
	elsif MovedX < (-600) then
	    MovedX := -600
	end if

	%%%%%%%%%%%%%%%%%%%% List Movement horizontal
	if Mb = 1 & Drag = false & My > (720 - 491) & My < (720 - 111) & Mx > 0 & Mx < maxx then
	    MovedX += Mx - StoredX
	end if
	if Ready = true then             %%%%%%%%%%%%%%%%%% Drawing ready background
	    Pic.Draw (PreBattleBackgroundReady, 0, 0, picCopy)
	else
	    Pic.Draw (PreBattleBackground, 0, 0, picCopy)
	end if
	Font.Draw (Location (LocationID).N + " " + Location (LocationID).D, maxx div 2 - Font.Width (Location (LocationID).N + " " + Location (LocationID).D, FontInfo) div 2 - 15, 618, FontInfo,
	    Bronze)
	Font.Draw (intstr (Mx) + " " + intstr (My), 14, 14, Font1, 31)

	for CycleCharacters : 1 .. 10             %%%%%%% Display party members, cycle party
	    if Party (CycleCharacters).Identity = 1 or Party (CycleCharacters).Identity = 4 then              %% If real.
		Draw.FillBox (MovedX - 50 + (160 * CycleCharacters), 233, MovedX + 90 + (160 * CycleCharacters), 605, 16)             %%% Stats of Characters in list
		Draw.Box (MovedX - 50 + (160 * CycleCharacters), 233, MovedX - 50 + (160 * CycleCharacters), 605, BorderBlue)
		Draw.Box (MovedX + 90 + (160 * CycleCharacters), 233, MovedX + 90 + (160 * CycleCharacters), 605, BorderBlue)
		Pic.Draw (Party (CycleCharacters).Avatar, MovedX + 0 + (160 * CycleCharacters), 555, picMerge)
		if Mx > (MovedX + 0 + (160 * CycleCharacters)) & Mx < (MovedX + 40 + (160 * CycleCharacters)) & My > 555 & My < (555 + 40) then
		    Draw.FillBox (MovedX - 50 + (160 * CycleCharacters), 233, MovedX + 90 + (160 * CycleCharacters), 605, BorderBlue)             %%% Stats of Characters in list
		    Draw.Box (MovedX - 50 + (160 * CycleCharacters), 233, MovedX - 50 + (160 * CycleCharacters), 605, Gold)             %% Vertical
		    Draw.Box (MovedX + 90 + (160 * CycleCharacters), 233, MovedX + 90 + (160 * CycleCharacters), 605, Gold)             %%%%%% LIST CHARACTER INFO %%%%%%%%%
		    Draw.Box (MovedX + 0 + (160 * CycleCharacters), 555, MovedX + 40 + (160 * CycleCharacters), 595, Gold)             %%%%%%% Avatar highlight
		    Draw.Box (MovedX - 2 + (160 * CycleCharacters), 553, MovedX + 42 + (160 * CycleCharacters), 597, Gold)             %%%%%%% Avatar highlight Larger
		    Draw.Box (MovedX - 45 + (160 * CycleCharacters), 575, MovedX - 5 + (160 * CycleCharacters), 575, Gold)             %%%%%%% Line Highlight sides horizontal
		    Draw.Box (MovedX + 45 + (160 * CycleCharacters), 575, MovedX + 85 + (160 * CycleCharacters), 575, Gold)             %%%%%%% Line Highlight sides right
		    Pic.Draw (Party (CycleCharacters).Avatar, MovedX + 0 + (160 * CycleCharacters), 555, picMerge)
		    if Mb = 1 then
			CurrentClick := CycleCharacters
			DragFromBottom := false
			Drag := true
		    else
		    end if
		end if
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%**** Character info ****%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		Font.Draw (Party (CycleCharacters).Name, MovedX - 2 + (160 * CycleCharacters), 530, Font3, Gold)             %%%%%%%% Name
		Font.Draw ("Lv. " + intstr (Party (CycleCharacters).TotalLevel), MovedX - 45 + (160 * CycleCharacters), 530, Font3, Gold)             %%%%%%%% Level
		Font.Draw ("Health: " + intstr (Party (CycleCharacters).TotalHealth), MovedX - 45 + (160 * CycleCharacters), 500, Font3, BasicText)             %%%%%%%% Health
		Font.Draw ("Power: " + intstr (Party (CycleCharacters).TotalPower), MovedX - 45 + (160 * CycleCharacters), 470, Font3, BasicText)             %%%%%%%% Name
		Font.Draw ("Attack: " + intstr (Party (CycleCharacters).Attack), MovedX - 45 + (160 * CycleCharacters), 440, Font3, BasicText)             %%%%%%%% ATT
		Font.Draw ("Defense: " + intstr (Party (CycleCharacters).Defense), MovedX - 45 + (160 * CycleCharacters), 410, Font3, BasicText)             %%%%%%%% DEF
		Font.Draw ("Critical: " + intstr (Party (CycleCharacters).CritChance) + "%", MovedX - 45 + (160 * CycleCharacters), 380, Font3, BasicText)             %%%%%%%% CC
		Font.Draw ("Crit Damage: " + intstr (Party (CycleCharacters).CritDamage) + "%", MovedX - 45 + (160 * CycleCharacters), 350, Font3, BasicText)             %%%%%%%% CD
		Font.Draw ("Speed: " + intstr (Party (CycleCharacters).Speed), MovedX - 45 + (160 * CycleCharacters), 320, Font3, BasicText)             %%%%%%%% Speed
		var CharScore : int := ((Party (CycleCharacters).TotalHealth * Party (CycleCharacters).TotalDefense) div 10) + (Party (CycleCharacters).TotalPower * 10) +
		    ((Party (CycleCharacters).TotalAttack * (100 - Party (CycleCharacters).CritChance) div 100)
		    + (Party (CycleCharacters).TotalAttack * Party (CycleCharacters).TotalCritChance div 100) *
		    Party (CycleCharacters).TotalCritDamage div 100) * 1000 div Party (CycleCharacters).TotalSpeed
		Font.Draw ("Score: " + intstr (CharScore), MovedX - 45 + 160 * CycleCharacters, 260, Font3, PSOWhite)          %%%%%%%% Speed
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%**** Info ****%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    end if
	end for

	for CycleCharacters : 1 .. 3             %%%%%%%%%%%%%%%%%%%% Selected Party of 3
	    if Character (CycleCharacters + 6).Identity not= 0 then             %%%%%%%%% Enemies
		Pic.Draw (Character (CycleCharacters + 6).Avatar, 960, 67 * (CycleCharacters - 1) + 31, picMerge)
		Font.Draw ("«Lv. " + intstr (Character (CycleCharacters + 6).Level) + "»  " + Character (CycleCharacters + 6).Name, 1016, 67 * (CycleCharacters - 1) + 41, Font14, FoeRed)
	    end if
	    if Character (CycleCharacters + 9).Identity not= 0 then             %%%%%%%%% Enemies
		Pic.Draw (Character (CycleCharacters + 9).Avatar, 650, 67 * (CycleCharacters - 1) + 31, picMerge)
		Font.Draw ("«Lv. " + intstr (Character (CycleCharacters + 9).Level) + "»  " + Character (CycleCharacters + 9).Name, 700, 67 * (CycleCharacters - 1) + 41, Font14, FoeRed)
	    end if
	    if Character (CycleCharacters).Identity = 1 or Character (CycleCharacters).Identity = 4 then             %%%%%%%%%%%%%%%%%%%%% PAR TY  &%&^%$%$%
		%%%%%%%%%%%%%%%%  Selected CHaracters DRAW     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		Pic.Draw (Character (CycleCharacters).Avatar, 161, 67 * (CycleCharacters - 1) + 30, picMerge)             %%%%%%%%%%%%%%%%%%%%%%%
		Font.Draw ("«Lv. " + intstr (Character (CycleCharacters).Level) + "»  " + Character (CycleCharacters).Name, 211, 67 * (CycleCharacters - 1) + 40, Font14, PSOWhite)
		%%%%%%%% Speed


		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		if Mx > 160 & Mx < 200 & My > 67 * (CycleCharacters - 1) + 30 & My < 67 * (CycleCharacters - 1) + 70 & DragFromBottom = true then
		    Draw.Box (159, 67 * (CycleCharacters - 1) + 28, 202, 67 * (CycleCharacters - 1) + 72, Gold)
		    Draw.Box (158, 67 * (CycleCharacters - 1) + 27, 203, 67 * (CycleCharacters - 1) + 73, 31)
		    if Mb = 1 & CurrentSelected = false & DragFromBottom = true then
			Drag := true
			CurrentClick := CycleCharacters
			CurrentSelected := true
		    end if
		end if
	    end if
	end for

	if Drag = true then             %%%%%DRagging
	    if Mb = 0 then
		if Mx > 160 & Mx < 200 & My > 30 and My < 70 then
		    if Party (CurrentClick).Name not= Character (2).Name & Party (CurrentClick).Name not= Character (3).Name & DragFromBottom = false then
			Character (1) := Party (CurrentClick)
			DragFromBottom := true
		    elsif DragFromBottom = true then
			TempID := Character (1)
			Character (1) := Character (CurrentClick)
			Character (CurrentClick) := TempID
			CurrentSelected := false
		    else
			DragFromBottom := true
		    end if
		elsif Mx > 160 & Mx < 200 & My > 720 - 623 and My < (720 - 623 + 40) then
		    if Party (CurrentClick).Name not= Character (1).Name & Party (CurrentClick).Name not= Character (3).Name & DragFromBottom = false then
			Character (2) := Party (CurrentClick)
			DragFromBottom := true
		    elsif DragFromBottom = true then
			TempID := Character (2)
			Character (2) := Character (CurrentClick)
			Character (CurrentClick) := TempID
			CurrentSelected := false
		    else
			DragFromBottom := true
		    end if
		elsif Mx > 160 & Mx < 200 & My > 720 - 555 and My < 720 + 555 + 40 then
		    if Party (CurrentClick).Name not= Character (2).Name & Party (CurrentClick).Name not= Character (1).Name & DragFromBottom = false then
			Character (3) := Party (CurrentClick)
			DragFromBottom := true
		    elsif DragFromBottom = true then
			TempID := Character (3)
			Character (3) := Character (CurrentClick)
			Character (CurrentClick) := TempID
			CurrentSelected := false
		    else
			DragFromBottom := true
		    end if
		elsif DragFromBottom = true then
		    Character (CurrentClick) := EmptyNPC
		    CurrentSelected := false
		else
		    DragFromBottom := true
		end if
		Drag := false
		CurrentClick := 0
	    elsif DragFromBottom = true then
		if Character (CurrentClick).Identity = 1 or Character (CurrentClick).Identity = 4 then
		    Pic.Draw (Character (CurrentClick).Avatar, Mx - 20, My - 20, picMerge)
		end if
	    else
		if Party (CurrentClick).Identity = 1 or Party (CurrentClick).Identity = 4 then
		    Pic.Draw (Party (CurrentClick).Avatar, Mx - 20, My - 20, picMerge)
		end if
	    end if
	end if

	var DeterminePartyGreaterThanOne : int := 0
	if Mx > 853 & Mx < 1093 & My > 632 & My < 681 then             %%%%%%% Determine battle or exit
	    Ready := true
	    if Mb = 1 then
		for CycleSpeed : 1 .. 6
		    if Character (CycleSpeed).Identity not= 0 then
			if Character (CycleSpeed).Health < 0 then
			    Character (CycleSpeed).Health := 0
			end if
			if CycleSpeed <= 6 then
			    DeterminePartyGreaterThanOne += Character (CycleSpeed).Health
			end if
		    end if
		end for
		if DeterminePartyGreaterThanOne > 0 then
		    Forfeit := false
		    exit
		end if
	    end if
	elsif Mx > 1227 & Mx < 1261 & My > 668 & My < 702 then
	    Pic.Draw (ExitButton, 0, 0, picMerge)
	    Ready := false
	    if Mb = 1 then
		Forfeit := true
		exit
	    end if
	else
	    Ready := false
	end if

	%%%%%% Border DRAW remove cutoff picmerge %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Left side
	Draw.FillBox (0, 217, 10, 616, BGBlue)
	Draw.Box (10, 217, 10, 616, BorderBlue)
	Draw.FillBox (maxx, 217, maxx - 10, 616, BGBlue)             %%% Rightside
	Draw.Box (maxx - 10, 217, maxx - 10, 616, BorderBlue)
	if MovedX <= -100 then
	    Draw.Box (12, 395, 12, 405, BorderBlue)
	    Draw.Box (13, 398, 13, 402, BorderBlue)
	    Draw.Box (14, 400, 14, 400, BorderBlue)
	elsif Party (7).Identity > 0 & MovedX >= 100 then
	    Draw.Box (maxx - 12, 395, maxx - 12, 405, BorderBlue)
	    Draw.Box (maxx - 13, 398, maxx - 13, 402, BorderBlue)
	    Draw.Box (maxx - 14, 400, maxx - 14, 400, BorderBlue)
	elsif Party (5).Identity > 0 & MovedX >= 260 then
	    Draw.Box (maxx - 12, 395, maxx - 12, 405, BorderBlue)
	    Draw.Box (maxx - 13, 398, maxx - 13, 402, BorderBlue)
	    Draw.Box (maxx - 14, 400, maxx - 14, 400, BorderBlue)
	elsif Party (3).Identity > 0 & MovedX >= 420 then
	    Draw.Box (maxx - 12, 395, maxx - 12, 405, BorderBlue)
	    Draw.Box (maxx - 13, 398, maxx - 13, 402, BorderBlue)
	    Draw.Box (maxx - 14, 400, maxx - 14, 400, BorderBlue)
	end if
	%   Pic.Draw (Border, 0, 0, picMerge) ********* Does not merge well, white line

	%%%%%%%%%% Experimental FPS display %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	/*FPScount += 8                                           %FPS
	 FPStick += 1                                               %COUNTER
	 if FPScount >= 1000 then                                   %TICK
	 FPS := FPStick                                         %To 1000
	 FPStick := 0                                           %Reset 2
	 FPScount := 0                                          %Calc FPS
	 end if                        */                            %Display
	%Font.Draw ("FPS " + intstr (FPS), 100, 14, Font2, BorderBlue)              %Draw
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%delay (8)
	StoredX := Mx
	View.Update

    end loop
    %Determine characters
    if LocationID = 2 then
	if Forfeit = false then
	    Battle
	end if
    else
	var FindPartyMembers : array 1 .. 3 of int
	var FPMCounter : int := 1
	if Forfeit = false then
	    Battle
	    % Determine Finish result
	    for EXPGet : 1 .. 6
		if Character (EXPGet).Identity > 0 then
		    for CycleParty : 1 .. 10     %%% MAtch char to party, add exp
			if Character (EXPGet).Name = Party (CycleParty).Name then
			    FindPartyMembers (FPMCounter) := CycleParty
			    FPMCounter += 1
			    Party (CycleParty).Experience += 10000     % EXP end if
			end if
		    end for
		end if
	    end for
	    FPMCounter -= 1
	    if FPMCounter > 3 then
		FPMCounter := 3
	    end if
	    for EXPGet : 1 .. 10     %%%%%%% Party distributed
		if Party (EXPGet).Identity > 0 then
		    Party (EXPGet).Experience += 150000     % EXP * 0.1
		end if
	    end for
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    for Reset : 1 .. 10
		if Party (Reset).Identity > 0 then
		    Party (Reset).Health := Party (Reset).TotalHealth
		    Party (Reset).Power := Party (Reset).TotalPower
		    Party (Reset).Attack := Party (Reset).TotalAttack
		    Party (Reset).Defense := Party (Reset).TotalDefense
		    Party (Reset).CritChance := Party (Reset).TotalCritChance
		    Party (Reset).CritDamage := Party (Reset).TotalCritDamage
		    Party (Reset).Speed := Party (Reset).TotalSpeed
		    Party (Reset).Level := Party (Reset).TotalLevel
		end if
	    end for
	    %%%%%%%%%%%%%%%%%%% Reset Stats %%%%%%%%%%%%%%%%%%%%%%%%

	    delay (200)
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    LevelUpdate
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    for Reset : 1 .. 10
		if Party (Reset).Identity > 0 then
		    Party (Reset).Health := Party (Reset).TotalHealth
		    Party (Reset).Power := Party (Reset).TotalPower
		    Party (Reset).Attack := Party (Reset).TotalAttack
		    Party (Reset).Defense := Party (Reset).TotalDefense
		    Party (Reset).CritChance := Party (Reset).TotalCritChance
		    Party (Reset).CritDamage := Party (Reset).TotalCritDamage
		    Party (Reset).Speed := Party (Reset).TotalSpeed
		    Party (Reset).Level := Party (Reset).TotalLevel
		end if
	    end for
	    %%%%%%%%%%%%%%%%%%% Reset Stats %%%%%%%%%%%%%%%%%%%%%%%%

	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    loop     %%%% Draw 3, calc exp + party + loot
		Mouse.Where (Mx, My, Mb)
		Input.KeyDown (Pressed)
		if Pressed (' ') then
		    exit
		end if
		if WonBattleOutcome = true then
		    Pic.Draw (VictoryScene, 0, 0, picCopy)
		    Font.Draw ("+24", 300, 270, FontVictoryScene, Gold)
		    Font.Draw ("+24", 592, 270, FontVictoryScene, Gold)
		    Font.Draw ("+24", 880, 270, FontVictoryScene, Gold)
		    Font.Draw ("+3", 688, 22, FontVictoryScene, Gold)
		else
		    Pic.Draw (FailureScene, 0, 0, picCopy)
		end if
		for FPMC : 1 .. FPMCounter
		    if FPMC = 1 then
			Pic.Draw (Party (FindPartyMembers (FPMC)).Avatar, 332, 420, picMerge)
			Font.Draw (Party (FindPartyMembers (FPMC)).Name, 312, 391, Font14, PSOWhite)
		    elsif FPMC = 2 then
			Pic.Draw (Party (FindPartyMembers (FPMC)).Avatar, 620, 420, picMerge)
			Font.Draw (Party (FindPartyMembers (FPMC)).Name, 600, 391, Font14, PSOWhite)
		    elsif FPMC = 3 then
			Pic.Draw (Party (FindPartyMembers (FPMC)).Avatar, 907, 420, picMerge)
			Font.Draw (Party (FindPartyMembers (FPMC)).Name, 887, 391, Font14, PSOWhite)
		    end if
		end for
		delay (15)
		View.Update
	    end loop
	end if
	%%%%% Practice
    end if
    Forfeit := false     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end PreBattleMenu     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Storyline. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Story procedure in LoadStory.t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc MapStory     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    loop     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Mouse.Where (Mx, My, Mb)     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	Input.KeyDown (Pressed)     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if Chapter = -101 or Chapter < -101 then     %%%%%%%%%%%%%%% CHAPTER 0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    Draw.FillBox (0, 0, maxx, maxy, 16)     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    fork PlayMusic (3)     %(Behr) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    View.Set ("nooffscreenonly")
	    Pic.DrawSpecial (BG_Herain, 0, 0, picCopy, picFadeIn, 3500)
	    delay (2500)
	    View.Set ("offscreenonly")
	    Pic.Draw (MidscreenMessage, 0, 0, picMerge)
	    MidscreenInput ("-. Chapter 0: I am who I am .-")
	    % Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
	    View.Update
	    loop
		Input.KeyDown (Pressed)
		if Pressed (' ') then
		    Chapter := -100
		    delay (150)
		    exit
		end if
	    end loop
	    Chapter := -100
	elsif Chapter < -80 then
	    Pic.Draw (BG_Herain, 0, 0, picCopy)
	    if Chapter = -100 then     %%% Intro to the story.
		InputChat := "The city of Herain."
		StoryProgress (Sillness, true)     %% Name, true = rightside bar
	    elsif Chapter = -99 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -98 then
		InputChat := "That's where I was born."
		StoryProgress (Sillness, true)
	    elsif Chapter = -97 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -96 then
		InputChat := "I came into this world in a machine. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -95 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -94 then
		InputChat := "My world was advanced, technologically sound, futuristic."
		StoryProgress (Sillness, true)
	    elsif Chapter = -93 then
		InputChat := "I was created as a human, one of the lower-ranked species in the universe."
		StoryProgress (Sillness, true)
	    elsif Chapter = -92 then
		InputChat := "My mother had abandoned me at the age of 15. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -91 then
		InputChat := " .. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -90 then
		InputChat := "I couldn't blame her, she had more important things to do."
		StoryProgress (Sillness, true)
	    elsif Chapter = -89 then
		InputChat := "The upper echelon of species had invented the tech to handle issues of birth."
		StoryProgress (Sillness, true)
	    elsif Chapter = -88 then
		InputChat := "I still don't know who they were."
		StoryProgress (Sillness, true)
	    elsif Chapter = -87 then
		InputChat := "'They' as in my mother and father."
		StoryProgress (Sillness, true)
	    elsif Chapter = -86 then
		InputChat := "It's not something I think about anymore."
		StoryProgress (Sillness, true)
	    elsif Chapter = -85 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -84 then
		InputChat := "The name's Sillness."
		StoryProgress (Sillness, true)
	    elsif Chapter = -83 then
		InputChat := "Sillness Furlenstorn."
		StoryProgress (Sillness, true)
	    elsif Chapter = -82 then
		InputChat := "I don't know how I got my surname. I grew up in an orphanage here. In Herain."
		StoryProgress (Sillness, true)
	    elsif Chapter = -81 then
		InputChat := "Herain is truly a massive metropolis. "
		StoryProgress (Sillness, true)
		View.Update
		delay (250)
		loop
		    Input.KeyDown (Pressed)
		    exit when Pressed (' ')
		end loop
		View.Set ("nooffscreenonly")
		Pic.DrawSpecial (BG_SansTsuko, 0, 0, picCopy, picFadeIn, 2000)
		View.Set ("offscreenonly")
		Chapter := -80
	    end if
	elsif Chapter < -61 then
	    Pic.Draw (BG_SansTsuko, 0, 0, picCopy)
	    if Chapter = -80 then
		InputChat := "The particular area I lived was called Sans Tsuko."
		StoryProgress (Sillness, true)
	    elsif Chapter = -79 then
		InputChat :=
		    "Retro-styled machinery filled my streets, oil and gas permeated my neighbourhood's air. Though we were part of the intergalactic intelligence union, we humans lived lives akin to third class citizens."
		StoryProgress (Sillness, true)
	    elsif Chapter = -78 then
		InputChat := "But I loved the city's personality. Whenever I could, I took to explore the lights and scents of my home, climbing over bridges and weaving past traffic."
		StoryProgress (Sillness, true)
	    elsif Chapter = -77 then
		Chapter := -60
		View.Set ("nooffscreenonly")
		Pic.DrawSpecial (BG_SansTsukoCorner, 0, 0, picCopy, picFadeIn, 2000)
		View.Set ("offscreenonly")
	    end if
	elsif Chapter < -44 then
	    Pic.Draw (BG_SansTsukoCorner, 0, 0, picCopy)
	    if Chapter = -60 then
		InputChat := "I found some quiet places, tucked between buildings, that muffled the noise of the city."
		StoryProgress (Sillness, true)
	    elsif Chapter = -59 then
		InputChat := "It was in these places I could read my favourite books and watch my favourite movies."
		StoryProgress (Sillness, true)
	    elsif Chapter = -58 then
		InputChat := "I took to reading at a young age. Socially awkward, I made no friends at my orphanage."
		StoryProgress (Sillness, true)
	    elsif Chapter = -57 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -56 then
		InputChat := "Surprising, isn't it? "
		StoryProgress (Sillness, true)
	    elsif Chapter = -55 then
		InputChat := "Most kids my age didn't read at all. The 'holonet' was the popular item of the time. And everyone used that."
		StoryProgress (Sillness, true)
	    elsif Chapter = -54 then
		InputChat := "The holonet was an inter-species device that could do whatever you wanted. Displaying books was a feature, but no one used that."
		StoryProgress (Sillness, true)
	    elsif Chapter = -53 then
		InputChat := "Only old academics and the like. Boring people. And me. Maybe I was boring?"
		StoryProgress (Sillness, true)
	    elsif Chapter = -52 then
		InputChat := "My 'brothers and sisters' at the orphanage would play all kinds of games on their holonets."
		StoryProgress (Sillness, true)
	    elsif Chapter = -51 then
		InputChat := "I didn't fit in as I had different tastes. My interests in ancient fantasy and the downfall of the humans was not popular. At all."
		StoryProgress (Sillness, true)
	    elsif Chapter = -50 then
		InputChat := "I remember asking one of the superiors: "
		StoryProgress (Sillness, true)
	    elsif Chapter = -49 then
		InputChat := "Why aren't we as important as the other species?"
		StoryProgress (Sillness, true)
	    elsif Chapter = -48 then
		InputChat := "The superior said: 'What a dangerous question! We were discovered a few hundred years ago.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -47 then
		InputChat := "'We must thank the Fantasies and the Cybens for their sharing of technology.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -46 then
		InputChat := "'Otherwise, we wouldn't be living in this magnificent city, with the wonders we own today.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -45 then
		InputChat := "The superior didn't really give me the answer I was looking for. The question stuck with me these past years."
		StoryProgress (Sillness, true)
		View.Update
		delay (150)
		loop
		    Input.KeyDown (Pressed)
		    exit when Pressed (' ')
		end loop
		Chapter := -44
		View.Set ("nooffscreenonly")
		Pic.DrawSpecial (BG_SansTsukoLibrary, 0, 0, picCopy, picFadeIn, 2000)
		View.Set ("offscreenonly")
	    end if
	elsif Chapter < -20 then
	    Pic.Draw (BG_SansTsukoLibrary, 0, 0, picCopy)
	    if Chapter = -44 then
		InputChat := "So I took to the libraries in Sans Tsuko. There were many books, thousands of books, old and smelly but still legible."
		StoryProgress (Sillness, true)
	    elsif Chapter = -43 then
		InputChat := "I read about the human race. How they used to be the top predator in their world, 'Earth'."
		StoryProgress (Sillness, true)
	    elsif Chapter = -42 then
		InputChat := "The humans had just begun space travel, landing on a neighbouring planet, when they were discovered by the famous starcharter Kristoffer Coelombus."
		StoryProgress (Sillness, true)
	    elsif Chapter = -41 then
		InputChat := "Kristoffer Coelombus then declared 'Earth' and its natives as his property."
		StoryProgress (Sillness, true)
	    elsif Chapter = -40 then
		InputChat := "Of course, the humans didn't take lightly to that. So they fought a war with Coelombus before he destroyed 60% of humans with a     giant photon beam."
		StoryProgress (Sillness, true)
	    elsif Chapter = -39 then
		InputChat := "The intergalactic government discovered of Coelombus's savage         behaviour and took over the operation of what was known as 'Project Earth'."
		StoryProgress (Sillness, true)
	    elsif Chapter = -38 then
		InputChat :=
		    "The humans, it seemed, were an intelligent species a few thousand years from intergalactic travel. Their destructive history deemed them    dangerous to all other intergalactic species."
		StoryProgress (Sillness, true)
	    elsif Chapter = -37 then
		InputChat := "The government ruled them fit to serve as low-class citizens, with basic rights and technology, but with no say in laws or governance. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -36 then
		InputChat := "Space travel for low-class citizens was off-limits. Attempting to surpass laws such as these resulted in immediate death."
		StoryProgress (Sillness, true)
	    elsif Chapter = -35 then
		InputChat := "The other species worried that the humans would cause suffering to them. And such was the fate of the humans, sealed in their history and instincts."
		StoryProgress (Sillness, true)
	    elsif Chapter = -34 then
		InputChat := "At least, that's what I know from the books. But hey, they were written by human scholars from that time."
		StoryProgress (Sillness, true)
	    elsif Chapter = -33 then
		InputChat :=
		    "It might sound harsh, but there is a silver lining. There are always exemptions to the rule, and once every few years a human is taken away to the government's home planet."
		StoryProgress (Sillness, true)
	    elsif Chapter = -32 then
		InputChat := "Those taken are usually the extreme elite of the human race, those with magnificent brains, those who have demonstrated proven capacity and usefulness."
		StoryProgress (Sillness, true)
	    elsif Chapter = -31 then
		InputChat := "I don't know if I ever wanted to be one of them."
		StoryProgress (Sillness, true)
	    elsif Chapter = -30 then
		InputChat := "It sounds exciting, but at the same time, we've never heard of those humans again."
		StoryProgress (Sillness, true)
	    elsif Chapter = -29 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -28 then
		InputChat := " (ouch) "
		StoryProgress (Sillness, true)
	    elsif Chapter = -27 then
		Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		InputChat := "Something is very wrong.. ?"
		Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
		View.Update
		loop
		    Input.KeyDown (Pressed)
		    if Pressed (' ') then
			delay (150)
			exit
		    end if
		end loop
		setscreen ("nooffscreenonly")
		Pic.DrawSpecial (BG_Balenos, 0, 0, picCopy, picFadeIn, 3500)
		fork PlayMusic (25)
		delay (1000)
		setscreen ("offscreenonly")
		Chapter := 0
	    end if
	elsif Chapter < 10 then
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    if Chapter = 0 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
	    elsif Chapter = 1 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
		InputChat := ".... -pause-                                                          (where am I?)"
		StoryProgress (Sillness, false)
	    elsif Chapter = 2 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
		InputChat := "Yes."
		StoryProgress (Sillness, false)
	    elsif Chapter = 3 then     %%%
		InputChat := "My, you don't look like one of our people. Our ship is under attack from the port bow, get to it!"
		StoryProgress (Ravness, true)
		InputChat := "Yes."
		StoryProgress (Sillness, false)
	    elsif Chapter = 4 then     %%%
		InputChat := "My, you don't look like one of our people. Our ship is under attack from the port bow, get to it!"
		StoryProgress (Ravness, true)
		InputChat := "(I'll go along for now).. Alright."
		StoryProgress (Sillness, false)
	    elsif Chapter = 5 then         %%%
		Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		InputChat := "What's happening? Am I me?"
		Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
		Pic.Draw (Border, 0, 0, picMerge)
		View.Update
		loop
		    Input.KeyDown (Pressed)
		    if Mb = 1 or Pressed (' ') or Pressed (KEY_ENTER) then
			exit
		    end if
		end loop
		delay (150)
		BattleBackground := BattleScene_Balenos
		Character (1) := Sillness
		Character (3) := EmptyNPC
		Character (2) := Ravness
		Character (2).Identity := 5
		Character (4) := EmptyNPC
		Character (5) := EmptyNPC
		Character (6) := EmptyNPC
		Character (7) := PowderMonkey
		Character (8) := EmptyNPC
		Character (9) := PowderMonkey
		Character (10) := EmptyNPC
		Character (11) := EmptyNPC
		Character (12) := EmptyNPC
		Battle
		delay (150)
		Chapter := 6
		%%%% New character unlocked
		Party (2) := Ravness
		Party (2).Identity := 4
		%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    elsif Chapter = 6 then     %%%    %%%
		InputChat := "I'm surprised, you aren't bad at killing. I honestly didn't expect you to jump into action."
		StoryProgress (Ravness, true)
	    elsif Chapter = 7 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "I'm surprised, you aren't bad at killing. I honestly didn't expect you to jump into action."
		StoryProgress (Ravness, true)
		InputChat := "I guess that's just me."
		StoryProgress (Sillness, false)
	    elsif Chapter = 8 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "Were you sent by the Human government? Earth colony, Mars colony, the like?"
		StoryProgress (Ravness, true)
		InputChat := "I guess that's just me."
		StoryProgress (Sillness, false)
	    elsif Chapter = 9 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "Were you sent by the Human government? Earth colony, Mars colony, the like?"
		StoryProgress (Ravness, true)
		InputChat := "I've heard of 'Earth', but I have no clue what you're referring to."
		StoryProgress (Sillness, false)

	    end if
	elsif Chapter = 10 then         %%%    %%%
	    % InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    InputChat := "Hm.. why don't we introduce ourselves."
	    StoryProgress (Ravness, true)
	    InputChat := "I've heard of 'Earth', but I have no clue what you're referring to."
	    StoryProgress (Sillness, false)
	elsif Chapter = 11 then     %%%%%%% Cutscene
	    fork PlayMusic (23)
	    View.Set ("nooffscreenonly")
	    Pic.DrawSpecial (IntroBMP, 0, 0, picCopy, picFadeIn, 2500)
	    delay (2000)
	    View.Set ("offscreenonly")
	    Chapter := 12
	elsif Chapter = 12 then     %% Chapter
	    Draw.FillBox (0, 0, maxx, maxy, BGBlue)
	    Pic.Draw (MidscreenMessage, 0, 0, picMerge)
	    InputChat := "-. Chapter 1: Where am I? .-"
	    Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
	    Pic.Draw (Border, 0, 0, picMerge)
	    if Mb = 1 or Pressed (' ') then
		delay (150)
		Chapter := 13
		exit
	    end if
	elsif Chapter < 100 then     %% INtro to the game, move towards velia, map, talk about the games
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    if CurrentMusic not= 25 then
		fork PlayMusic (25)
	    end if

	    if Chapter = 13 then
		InputChat := "I'm called Ravness Loxaerion, representative of the Humans in the 'Survival Games'. It's nice to meet you."
		StoryProgress (Ravness, true)
	    elsif Chapter = 14 then
		InputChat := "I'm called Ravness Loxaerion, representative of the Humans in the 'Survival Games'. It's nice to meet you."
		StoryProgress (Ravness, true)
		InputChat := "My name .. "
		StoryProgress (Sillness, false)
	    elsif Chapter = 15 then
		InputChat := "I'm called Ravness Loxaerion, representative of the Humans in the 'Survival Games'. It's nice to meet you."
		StoryProgress (Ravness, true)
		InputChat := "My name is Sillness Furlenstorn."
		StoryProgress (Sillness, false)
	    elsif Chapter = 16 then
		InputChat := "Nice to meet you too."
		StoryProgress (Sillness, false)
	    elsif Chapter = 17 then
		InputChat := " .. "
		StoryProgress (Sillness, false)
	    elsif Chapter = 18 then
		InputChat := "Pardon my ignorance, what do you mean by Humans and Survival Games?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 19 then
		InputChat := "Ah, I gathered you weren't a human."
		StoryProgress (Ravness, true)
		InputChat := "Pardon my ignorance, what do you mean by Humans and Survival Games?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 20 then
		InputChat := "Ah, I gathered you weren't a human."
		StoryProgress (Ravness, true)
		InputChat := ".. I am."
		StoryProgress (Sillness, false)
	    elsif Chapter = 21 then
		InputChat := "Hmm?  -Raises eyebrow-"
		StoryProgress (Ravness, true)
		InputChat := ".. I am."
		StoryProgress (Sillness, false)
	    elsif Chapter = 22 then
		InputChat := "Hmm?  -Raises eyebrow-"
		StoryProgress (Ravness, true)
		InputChat := "I'm from another ti- .. I lost my memory."
		StoryProgress (Sillness, false)
	    elsif Chapter = 23 then
		InputChat := "If that's the case, I gladly welcome another human on my side."
		StoryProgress (Ravness, true)
		InputChat := "I'm from another ti- .. I lost my memory."
		StoryProgress (Sillness, false)
	    elsif Chapter = 24 then
		InputChat := "You see, we're 'representatives' in the Survival Games, the once a thousand year games for all intellectual species."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 25 then
		InputChat := "Each species has mastered space travel, but upon our colonization of another planet we were met by a Type IV Kardashev species."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 26 then
		InputChat := "This group of beings have already mastered faster than light travel, universal control of physics, and moniter other life forms in different galaxies."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
	    elsif Chapter = 27 then
		InputChat := "This group of beings have already mastered faster than light travel, universal control of physics, and moniter other life forms in different galaxies."
		StoryProgress (Ravness, true)
		InputChat := "Sounds like a master species."
		StoryProgress (Sillness, false)
	    elsif Chapter = 28 then
		InputChat := "We humans have been the latest addition to the roster as we managed to get to Mars a few years ago."
		StoryProgress (Ravness, true)
		InputChat := "Sounds like a master species."
		StoryProgress (Sillness, false)
	    elsif Chapter = 29 then
		InputChat := "And yes, they are kind of superior to us. They have strict rules considering how freely the other species can act in space matters."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 30 then
		InputChat := "They gave us some nice technology to help us explore our surroundings. It was nice at first."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 31 then
		InputChat := "Then we met with other species. They had been under control of the Demonics for thousands of years, and had gruesome tales to tell us."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 32 then
		InputChat := "Yes. They're called 'Demonics', the superior beings. I guess their reputation gave way to that name."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 33 then
		InputChat := "Yes. They're called 'Demonics', the superior beings. I guess their reputation gave way to that name."
		StoryProgress (Ravness, true)
		InputChat := "What did the 'Demonics' to earn that name? Weren't they sharing technology?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 34 then
		InputChat := "You see, they shared technology that we would've learned in a few thousand years given time."
		StoryProgress (Ravness, true)
		InputChat := "What did the 'Demonics' do that is so bad? Weren't they sharing technology?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 35 then
		InputChat := "And then they stopped the other species from growing their knowledge. Progress was halted and restricted according to the Demonic's universal law."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 36 then
		InputChat := "And then they stopped the other species from growing their knowledge. Progress was halted and restricted according to the Demonic's universal law."
		StoryProgress (Ravness, true)
		InputChat := "Who told you this?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 37 then
		InputChat := "We mingled with species from other galaxies. There are quite a few, and I expect to meet some in our Survival Games."
		StoryProgress (Ravness, true)
		InputChat := "Who told you this?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 38 then
		InputChat := "There are the Cybens, a cyborg type species. They're all biologically 'male' and are pretty big. "
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 39 then
		InputChat := "Then there are the Fantasies, a species with extremely smooth skin and smoother looks. Like fantasy."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 40 then
		InputChat := "I also met with a few Anujhes. I couldn't pin why their names translated to this, but they're 'animal'-like people."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 41 then
		InputChat := "The Anujhes are pretty variable, some looked like wolves, others like cats."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 42 then
		InputChat := "We had a few chance meetings with the Mations. These people were pretty rare to see for some reason."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 43 then
		InputChat := "The Mations looked like the Fantasies, except their hair didn't shine."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 44 then
		InputChat := "The Mations looked like the Fantasies, except their hair didn't shine."
		StoryProgress (Ravness, true)
		InputChat := "Mation pronounced as 'cat-ion' or as in 'nation'?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 45 then
		InputChat := "Nation."
		StoryProgress (Ravness, true)
		InputChat := "Mation pronounced as 'cat-ion' or as in 'nation'?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 46 then
		InputChat := "Nation."
		StoryProgress (Ravness, true)
		InputChat := "So there are the Cybens, Fantasies, Anujhes, and Mations. And the 'Demonics' control them? And us?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 47 then
		InputChat := "Yeah. Common knowledge."
		StoryProgress (Ravness, true)
		InputChat := "So there are the Cybens, Fantasies, Anujhes, and Mations. And the 'Demonics' control them? And us?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 48 then
		InputChat := "They all had the same story about the Demonics."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 49 then
		InputChat := "Hear me out though.. "
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 50 then
		InputChat := "These millenial games are watched by trillions. And every species has to participate."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 51 then
		InputChat := "This game is an odd one- broadcast on all media, invisible capture devices all around us. New tech, you see."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 52 then
		InputChat := "There's probably at least one channel dedicated to our current conversation. I guess they're just as confused as me, huh?"
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 53 then
		InputChat := "As I was supposed to be the only human representative."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 54 then
		InputChat := "As I was supposed to be the only human representative."
		StoryProgress (Ravness, true)
		InputChat := "Oh."
		StoryProgress (Sillness, false)
	    elsif Chapter = 55 then
		InputChat := "The Demonics might've decided I needed help. After all, the game is high profile - high intensity - high entertainment to them."
		StoryProgress (Ravness, true)
		InputChat := "Oh."
		StoryProgress (Sillness, false)
	    elsif Chapter = 56 then
		InputChat := "And serious. Serious as in your life and your species' life relies on you for the next few hundred years. "
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 57 then
		InputChat := "So the games. Once every 1000 years, representatives from each species are sent to participate."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 58 then
		InputChat := "Selection from the group is randomly done by the Demonics. Then the game rules are released for viewing."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 59 then
		InputChat := "The game is supposedly different each time around, and this year we pulled the 'Break the Barrier' game."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 60 then
		InputChat := "As you can see, above the sky is an electronics barrier that prohibits powerful magicks and tech."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 61 then
		InputChat := "Representatives have to gather crystals in the 3 'cores' around the world to disable the barrier and win the game."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 62 then
		InputChat := "From the map and the rules, I gather we're on one massive continent, and have to travel East to West to obtain each crystal."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 63 then
		InputChat := "From the map and the rules, I gather we're on one massive continent, and have to travel East to West to obtain each crystal."
		StoryProgress (Ravness, true)
		InputChat := "Only 3 crystals? What happens if another representative takes one?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 64 then
		InputChat := "That won't be a problem. There's an unlimited supply of the crystals, we just need to have all 3 types."
		StoryProgress (Ravness, true)
		InputChat := "Only 3 crystals? What happens if another representative takes one?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 65 then
		InputChat := "The 3 crystals are blue, green, and red coloured. Primary colours."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 66 then
		InputChat := "And this is why we need to get them."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 67 then
		InputChat := "The first species to gather all 3 crystals will have the option to choose which species to sacrifice."
		StoryProgress (Ravness, true)
		InputChat := "-Listening intently-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 68 then
		InputChat := "The first species to gather all 3 crystals will have the option to choose which species to sacrifice."
		StoryProgress (Ravness, true)
		InputChat := ".. sacrifice?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 69 then
		InputChat := "Yes. One species will be doomed and their population will be purged."
		StoryProgress (Ravness, true)
		InputChat := ".. sacrifice?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 70 then
		InputChat := "Any species not within the top 10 to finish will also be reduced to planet-bound sanctions."
		StoryProgress (Ravness, true)
		InputChat := "-Listening intently-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 71 then
		InputChat := "That means most species cannot leave a planet, where their entire population lives in ghettos."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 72 then
		InputChat := "From what I hear, the species we met were the best species at the games. The 4 I mentioned had endured at least 10 games."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 73 then
		InputChat := "From what I hear, the species we met were the best species at the games. The 4 I mentioned had endured at least 10 games."
		StoryProgress (Ravness, true)
		InputChat := "About those ghettos.. "
		StoryProgress (Sillness, false)
	    elsif Chapter = 74 then
		InputChat := "Yes?"
		StoryProgress (Ravness, true)
		InputChat := "About those ghettos.. "
		StoryProgress (Sillness, false)
	    elsif Chapter = 75 then
		InputChat := "Yes?"
		StoryProgress (Ravness, true)
		InputChat := "Will those species realize they lost? Like, they're watching the games, see the loss, and boom- into the ghettos?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 76 then
		InputChat := "Ahh. From what I've heard, no, they lose memory the instant the week after they've lost."
		StoryProgress (Ravness, true)
		InputChat := "Will those species realize they lost? Like, they're watching the games, see the loss, and boom- into the ghettos?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 77 then
		InputChat := "They're basically memory-wiped and given new memories from the Demonics. And then they live their mundane lives, being watched by Demonics."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 78 then
		InputChat := "They're basically memory-wiped and given new memories from the Demonics. And then they live their mundane lives, being watched by Demonics."
		StoryProgress (Ravness, true)
		InputChat := "That sounds like a sad existence."
		StoryProgress (Sillness, false)
	    elsif Chapter = 79 then
		InputChat := "It is, I agree. We can't let that happen to us."
		StoryProgress (Ravness, true)
		InputChat := "That sounds like a sad existence."
		StoryProgress (Sillness, false)
	    elsif Chapter = 80 then
		InputChat := "It is, I agree. We can't let that happen to us."
		StoryProgress (Ravness, true)
		InputChat := "By the way.."
		StoryProgress (Sillness, false)
	    elsif Chapter = 81 then
		InputChat := "Hm?"
		StoryProgress (Ravness, true)
		InputChat := "By the way.."
		StoryProgress (Sillness, false)
	    elsif Chapter = 82 then
		InputChat := "Hm?"
		StoryProgress (Ravness, true)
		InputChat := "Why do you have medieval armor?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 83 then
		InputChat := "I could ask the same for you. Magicks and technology are extremely weak in the barrier, so hand to hand combat is the most effective for me."
		StoryProgress (Ravness, true)
		InputChat := "Why do you have medieval armor?"
		StoryProgress (Sillness, false)
	    elsif Chapter = 84 then
		InputChat := "I don't have strong enough latent powers to summon stuff that would be potent here. Nor do I have the tech to use a projectile that would kill."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 85 then
		InputChat := "But my halberd is something I can wield with no downfall. It isn't affected as much in here."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 86 then
		InputChat := "Anyways, we should stick together. The other species on this boat are wary of each other too."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 87 then
		InputChat := "Those enemies from earlier- they're the Simulons."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 88 then
		InputChat := "Beings created by code, generated to fight us. Out for our blood- they'll try to kill you in your sleep."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 89 then
		InputChat := "I guess it's good there's two of us, neh? One can keep watch."
		StoryProgress (Ravness, true)
		InputChat := "-Listening-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 90 then
		InputChat := "I guess it's good there's two of us, neh? One can keep watch."
		StoryProgress (Ravness, true)
		InputChat := "Sounds chilling."
		StoryProgress (Sillness, false)
	    elsif Chapter = 91 then
		InputChat := "These games are a matter of life and death."
		StoryProgress (Ravness, true)
		InputChat := "Sounds chilling."
		StoryProgress (Sillness, false)
	    elsif Chapter = 92 then
		InputChat := "It is, but it's our reality."
		StoryProgress (Ravness, true)
	    elsif Chapter = 93 then
		InputChat := "Land ho, we're approaching the shore!"
		StoryProgress (Ravness, true)
	    elsif Chapter = 94 then
		Chapter := 100
		Draw.FillBox (0, 0, maxx, maxy, BGBlue)
		Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		InputChat := "-. Chapter 2: I'm in the past. .-"
		Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
		Pic.Draw (Border, 0, 0, picMerge)
		View.Update
		Location (2).U := true     %% Velia
		loop
		    Input.KeyDown (Pressed)
		    Mouse.Where (Mx, My, Mb)
		    if Mb = 1 or Pressed (' ') then
			delay (150)
			exit
		    end if
		end loop
	    else
		exit
	    end if
	elsif Chapter = 100 then
	    Chapter := 10000
	    exit
	    %%%%%%%%%%%%%%%%%%%%% Proceed to cutscene %
	elsif Chapter < 150 then     %% Intro to skills, city, members
	    Pic.Draw (City_Velia, 0, 0, picCopy)
	    if Chapter = 100 then
		InputChat := "So this is the city of Velia"
		StoryProgress (Sillness, true)
	    end if
	elsif Chapter < 200 then     %% Cron Castle disturbance
	    Pic.Draw (BattleScene_CronCastle, 0, 0, picCopy)
	    if Chapter = 150 then
		InputChat := "I hear this is the castle?"
		StoryProgress (Sillness, true)
	    end if
	elsif Chapter < 400 then
	elsif Chapter < 500 then
	else
	    exit
	end if
	delay (15)
	View.Update
    end loop
end MapStory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc MapParty
    Mouse.Where (Mx, My, Mb)
    var FindStarters : int := 1
    if UnlockedMap = false then
	Pic.Draw (MainMenuParty, 0, 0, picMerge)
    else
	Pic.Draw (MainMenuPartyUnlocked, 0, 0, picMerge)
    end if
    if ActiveUser < 1 then
	ActiveUser := 1
    elsif ActiveUser > 10 then
	ActiveUser := 10
    end if
    if Pressed (KEY_ESC) then
	MapPartyboolean := false
    end if
    %Font.Draw ("MX: " + intstr (Mx) + " - MY: " + intstr (My), 1050, 20, Font1, 25)
    if (Mx > 1227 & Mx < 1260) & (My > 668 & My < 700) then
	Pic.Draw (ExitButton, 0, 0, picMerge)
	if Mb = 1 then
	    MapPartyboolean := false
	end if
    end if
    %%%% Inventory Draw
    %%%% Inventory Draw
    TrackInvenX := 0
    TrackInvenY := 0
    for IVert : 1 .. 6         % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
	for IHori : 1 .. 7
	    if Inventory (IHori, IVert).Type = 1 then
		Pic.Draw (Shard_Health, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 2 then
		Pic.Draw (Shard_Power, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 3 then
		Pic.Draw (Shard_Attack, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 4 then
		Pic.Draw (Shard_Defense, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 5 then
		Pic.Draw (Shard_Critical, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 6 then
		Pic.Draw (Shard_Critical, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 7 then
		Pic.Draw (Shard_Speed, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    end if
	    if Inventory (IHori, IVert).Type > 0 then
		if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		    Draw.Box (-3 + (IHori * 48), 370 - (IVert * 48), 37 + (IHori * 48), 370 + 40 - (IVert * 48), PSOWhite)
		    DisplayInventory (IHori, IVert, Inventory (IHori, IVert).Type, Inventory (IHori, IVert).Stat)
		    TrackInvenX := IHori
		    TrackInvenY := IVert
		end if
	    end if
	end for
    end for
    if TrackInvenX > 0 and TrackInvenY > 0 then
	DisplayInventory (TrackInvenX, TrackInvenY, Inventory (TrackInvenX, TrackInvenY).Type, Inventory (TrackInvenX, TrackInvenY).Stat)
    end if
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for StarterCheck : 1 .. 2     %%%%%%%%% Check duplicates .. ?
	if Character (StarterCheck).Name = Character (StarterCheck + 1).Name & Character (StarterCheck).Identity > 0 then
	    Character (StarterCheck + 1) := EmptyNPC
	end if
    end for
    if Character (1).Name = Character (3).Name & Character (1).Identity > 0 then
	Character (3) := EmptyNPC
    end if
    %%%%%%%%%%%%%%%%%%%%%%%%% Check .. duplicates??? Why?

    for CycleParty : 1 .. 10
	Pic.Draw (Party (CycleParty).Avatar, 485 + 75 * (CycleParty - 1), 389, picMerge)
	if Mx >= 485 + 75 * (CycleParty - 1) and Mx <= 485 + 40 + 75 * (CycleParty - 1) and My >= 389 and My <= 389 + 40 then
	    Draw.Box (485 + 75 * (CycleParty - 1), 389, 485 + 40 + 75 * (CycleParty - 1), 389 + 40, PowerWhite)
	    Draw.Box (485 + 19 + 75 * (CycleParty - 1), 389 + 42, 485 + 21 + 75 * (CycleParty - 1), 389 + 42, PowerWhite)
	    Draw.Box (485 + 18 + 75 * (CycleParty - 1), 389 + 43, 485 + 22 + 75 * (CycleParty - 1), 389 + 43, PowerWhite)
	    Draw.Box (485 + 16 + 75 * (CycleParty - 1), 389 + 44, 485 + 24 + 75 * (CycleParty - 1), 389 + 44, PowerWhite)
	    if Mb = 1 & DraggedBase = false & Dragged = false then
		ActiveUser := CycleParty
	    end if
	end if
	if Party (CycleParty).Identity = 0 then
	    Draw.FillBox (485 + 75 * (CycleParty - 1), 389 + 2, 485 + 40 + 75 * (CycleParty - 1), 389 + 37, 16)
	    Font.Draw ("Locked", 487 + 75 * (CycleParty - 1), 389 + 16, FontLocked, FoeRed)
	end if
    end for
    if Party (ActiveUser).Identity > 0 then
	Font.Draw ("AVAILABLE", 791, 434, Font7, MelGreen)
    else
	Font.Draw ("Not recruited yet", 785, 434, Font7, Bronze)
    end if
    %%%%%%%%%%%%%%%%%%%%%%%%%% Draw Loaded Skills, if ID exists. (or lvl > 0)
    for CycleSkillIdentity : 1 .. 6
	if Party (ActiveUser).Skill (CycleSkillIdentity).SkillID > 0 & Party (ActiveUser).Skill (CycleSkillIdentity).Level > 0 then
	    Pic.Draw (SkillPic (Party (ActiveUser).Skill (CycleSkillIdentity).SkillID), PartyLoadedSkillX (CycleSkillIdentity), PartyLoadedSkillY (CycleSkillIdentity), picMerge)
	end if
    end for
    %%%%%%%%%%%%%%%%%%%%%%%%% Skills of 10, restrictions  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for CycleBaseSkills : 1 .. 10
	Pic.Draw (SkillPic (Party (ActiveUser).BaseSkill (CycleBaseSkills).SkillID), PartyBaseSkillX (CycleBaseSkills), PartyBaseSkillY (CycleBaseSkills), picMerge)
    end for
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detect if Highlight/Click on Loaded SKills %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for CycleLoadedSkillDetection : 1 .. 6
	if Mx >= PartyLoadedSkillX (CycleLoadedSkillDetection) - 1 and Mx <= PartyLoadedSkillX (CycleLoadedSkillDetection) + 40 &
		My >= PartyLoadedSkillY (CycleLoadedSkillDetection) - 1 and My <= PartyLoadedSkillY (CycleLoadedSkillDetection) + 40 then     % 1
	    %%%% Highlight box hover
	    Draw.Box (PartyLoadedSkillX (CycleLoadedSkillDetection) - 1, PartyLoadedSkillY (CycleLoadedSkillDetection) - 1, 40 + PartyLoadedSkillX (CycleLoadedSkillDetection), 40 +
		PartyLoadedSkillY (CycleLoadedSkillDetection), PSODarkBlue)
	    Draw.Box (PartyLoadedSkillX (CycleLoadedSkillDetection) - 2, PartyLoadedSkillY (CycleLoadedSkillDetection) - 2, 41 + PartyLoadedSkillX (CycleLoadedSkillDetection), 41 +
		PartyLoadedSkillY (CycleLoadedSkillDetection), GlowPurple)
	    TargetSkill := CycleLoadedSkillDetection
	    if Mb = 1 & Dragged = false & DraggedBase = false then
		ActiveSkill := CycleLoadedSkillDetection
		Dragged := true
	    end if
	    exit
	end if
    end for
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Detect if highlight / click on base skills %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for CycleBaseSkillDetection : 1 .. 10
	if Mx >= PartyBaseSkillX (CycleBaseSkillDetection) - 1 and Mx <= PartyBaseSkillX (CycleBaseSkillDetection) + 40 &
		My >= PartyBaseSkillY (CycleBaseSkillDetection) - 1 and My <= PartyBaseSkillY (CycleBaseSkillDetection) + 40 then     % 1
	    %%%% Highlight box hover
	    Draw.Box (PartyBaseSkillX (CycleBaseSkillDetection) - 1, PartyBaseSkillY (CycleBaseSkillDetection) - 1, 40 + PartyBaseSkillX (CycleBaseSkillDetection), 40 +
		PartyBaseSkillY (CycleBaseSkillDetection), PSODarkBlue)
	    Draw.Box (PartyBaseSkillX (CycleBaseSkillDetection) - 2, PartyBaseSkillY (CycleBaseSkillDetection) - 2, 41 + PartyBaseSkillX (CycleBaseSkillDetection), 41 +
		PartyBaseSkillY (CycleBaseSkillDetection), GlowPurple)
	    TargetSkill := CycleBaseSkillDetection
	    if Mb = 1 & DraggedBase = false & Dragged = false then
		ActiveSkill := CycleBaseSkillDetection
		DraggedBase := true
	    end if
	    exit
	end if
    end for
    %%%%%%%%%%%%%%% Detect if OutofBounds, remove skill from mouse %%%%%%%%%%%%%%%%%
    if Mx > 11 and Mx < maxx - 11 and My > 70 and My < maxy - 11 then
    else
	Dragged := false
	DraggedBase := false
    end if
    if Mx > 440 and Mx < 1250 and My > 100 and My < 370 then
	DraggedBaseHighlight := true
    elsif DraggedBaseHighlight = true then
	DraggedBaseHighlight := false
    end if
    %%%%%%%%%%%%%%%%%%%%%%%% If Skill is being dragged, draw skill %%%%%%%%%%%%%%%%%%%
    if Dragged = true then
	Pic.Draw (SkillPic (Party (ActiveUser).Skill (ActiveSkill).SkillID), Mx - 20, My - 20, picMerge)
	Draw.Box (Mx - 21, My - 21, Mx + 20, My + 20, PSODarkBlue)
	Draw.Box (Mx - 22, My - 22, Mx + 21, My + 21, GlowPurple)
	if Mb = 0 then
	    for DetectSkillDrop : 1 .. 6
		if Mx >= PartyLoadedSkillX (DetectSkillDrop) - 1 and Mx <= PartyLoadedSkillX (DetectSkillDrop) + 40 &
			My >= PartyLoadedSkillY (DetectSkillDrop) - 1 and My <= PartyLoadedSkillY (DetectSkillDrop) + 40 then     % CycleSkill
		    TempID.Skill (1).SkillID := Party (ActiveUser).Skill (TargetSkill).SkillID     %% Swap
		    Party (ActiveUser).Skill (TargetSkill).SkillID := Party (ActiveUser).Skill (ActiveSkill).SkillID
		    Party (ActiveUser).Skill (ActiveSkill).SkillID := TempID.Skill (1).SkillID
		end if
	    end for
	    Dragged := false
	end if
    end if
    %%%%%%%%%%%%%%%%%%%%% If Base Skill is being dragged, draw skill %%%%%%%%%%%%%%%%%%%%%%%%%%%
    if DraggedBase = true then
	Pic.Draw (SkillPic (Party (ActiveUser).BaseSkill (ActiveSkill).SkillID), Mx - 20, My - 20, picMerge)
	Draw.Box (Mx - 21, My - 21, Mx + 20, My + 20, PSODarkBlue)
	Draw.Box (Mx - 22, My - 22, Mx + 21, My + 21, GlowPurple)
	if Mb = 0 then
	    for DetectSkillDrop : 1 .. 6
		if Mx >= PartyLoadedSkillX (DetectSkillDrop) - 1 and Mx <= PartyLoadedSkillX (DetectSkillDrop) + 40 &
			My >= PartyLoadedSkillY (DetectSkillDrop) - 1 and My <= PartyLoadedSkillY (DetectSkillDrop) + 40 then     % CycleSkill
		    % TempID.Skill (1).SkillID := Party (ActiveUser).Skill (TargetSkill).SkillID    %% Swap
		    Party (ActiveUser).Skill (TargetSkill).SkillID := Party (ActiveUser).BaseSkill (ActiveSkill).SkillID
		    % Party (ActiveUser).Skill (ActiveSkill).SkillID := TempID.Skill (1).SkillID
		end if
	    end for
	    DraggedBase := false
	end if
    end if
    %%%%%%%%%%%% Stats Info
    Pic.Draw (Party (ActiveUser).UB, 521, 450, picMerge)
    Pic.Draw (Party (ActiveUser).Avatar, 41, 633, picMerge)
    Font.Draw (Party (ActiveUser).Name, 90, 647, Font14, GlowAqua)
    Font.Draw ("Lv. " + intstr (Party (ActiveUser).Level), 90, 621, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalHealth), 123, 585, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalPower), 123, 558, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalAttack), 123, 531, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalDefense), 149, 502, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalCritChance) + "%", 140, 473, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalCritDamage) + "%", 140, 444, Font13, GlowAqua)
    Font.Draw (intstr (Party (ActiveUser).TotalSpeed), 123, 415, Font13, GlowAqua)
    Font.Draw ("EXP -. " + intstr (Party (ActiveUser).Experience) + " .-", 180, 624, FontInfo, GlowAqua)
    %%%%%%%%%%%%%%%%Locked%%%%%%%%%%%%%%
    if Party (ActiveUser).Identity = 0 then
	Draw.FillBox (522, 482 - 30, 1158, 665 + 21, 16)
	Font.Draw ("Locked", 770, 555, FontLockedIMAGE, FoeRed)
	Draw.FillBox (41, 633, 80, 672, 16)
	Font.Draw ("Locked", 43, 641 + 8, FontLocked, FoeRed)
    end if

    %%%%%%%%%%%%%%%%%%%Starters %%%%%%%%%%%%%%%
    %%%% Assign Main Party SLot
    Font.Draw ("STARTERS", 420, 648, FontInfo, GlowAqua)
    Draw.Line (460, 570, 460, 600, BasicBlue)
    Draw.Line (460, 500, 460, 530, BasicBlue)

    var StartCount : int := 0
    var Swapboolean : boolean := false
    var DetectExisting : int := 0
    var IsEmpty : boolean := false
    for CharacterDisplay : 1 .. 10
	if Party (CharacterDisplay).Identity = 4 then
	    % Pic.Draw (Party (CharacterDisplay).Avatar, 440, 600 - ((FindStarters - 1) * 70), picMerge)
	    for CheckIfExist : 1 .. 3
		if Character (CheckIfExist).Name = Party (CharacterDisplay).Name then
		    DetectExisting += 1
		end if
	    end for
	    if DetectExisting > 0 then
		FindStarters += 1
	    else
		if FindStarters > 4 then
		    Party (CharacterDisplay).Identity := 1
		    exit
		end if
		Character (FindStarters) := Party (CharacterDisplay)
		FindStarters += 1
	    end if
	end if
    end for
    for DisplayChar : 1 .. 3
	if Character (DisplayChar).Identity = 4 then
	    Pic.Draw (Character (DisplayChar).Avatar, 440, 600 - ((DisplayChar - 1) * 70), picMerge)
	end if
    end for

    %for Starters : 1 .. 10
    %   if Party (Starters).Identity = 4 then
    %        Character (StartCount + 1) := Party (Starters)
    %        Pic.Draw (Character (StartCount + 1).Avatar, 440, 600 - (StartCount * 70), picMerge)
    %        StartCount += 1
    %    end if
    %end for
    %%%%%%%%%%%%%%%%%%%%%%%%% Highlight and change Starters %%%%%%%%%%%%%%%%%%%%%%%%
    for BoxDraw : 0 .. 2
	Mouse.Where (Mx, My, Mb)
	Draw.Box (439, 599 - (BoxDraw * 70), 480, 640 - (BoxDraw * 70), GlowAqua)
	if Mx >= 440 and Mx <= 480 and My >= 600 - (BoxDraw * 70) and My <= 640 - (BoxDraw * 70) then
	    Draw.Box (438, 598 - (BoxDraw * 70), 481, 641 - (BoxDraw * 70), BasicBlue)
	    Draw.Line (430, 620 - (BoxDraw * 70), 415, 620 - (BoxDraw * 70), BasicBlue)
	    Draw.Line (490, 620 - (BoxDraw * 70), 505, 620 - (BoxDraw * 70), BasicBlue)
	    if Mb = 1 then
		if Character (BoxDraw + 1).Identity = 0 then
		    for three : 1 .. 3     %%%%%%%%%%%%%%%%%%%% If Empty Box
			% exit when three >= 4
			if three not= (BoxDraw + 1) then
			    if Character (three).Identity not= 0 then
				if Character (three).Name = Party (ActiveUser).Name then
				    Character (three).Identity := 0
				end if
			    else
			    end if
			end if
		    end for
		else     %% Swap
		    for three : 1 .. 3
			% exit when three >= 4
			if three not= (BoxDraw + 1) then
			    if Character (three).Name = Party (ActiveUser).Name then
				Character (three) := Character (BoxDraw + 1)
				Character (BoxDraw + 1) := Party (ActiveUser)
				Swapboolean := true
				exit
			    end if
			end if
		    end for
		    if Swapboolean = false then
			for Cycle : 1 .. 10         %%%%%%% Detect
			    if Character (BoxDraw + 1).Name = Party (Cycle).Name then
				Party (Cycle).Identity := 1
				exit
			    end if
			end for
		    end if
		end if
		if Party (ActiveUser).Identity = 0 then
		else
		    Party (ActiveUser).Identity := 4
		    Character (BoxDraw + 1) := Party (ActiveUser)
		end if
		delay (150)
	    end if
	end if
    end for

    var TempStoreID : ID     %% Store ID
    Character (0) := EmptyNPC
    ActiveTarget := 0
    TempStoreID := Character (ActiveUser)     %Cannot assign this.
    Character (ActiveUser) := Party (ActiveUser)     %Cannot assign this.
    for DisplaySkillCycle : 1 .. 6         %%% Display skills in loaded description #990099
	if Mx >= PartyLoadedSkillX (DisplaySkillCycle) - 1 & Mx <= PartyLoadedSkillX (DisplaySkillCycle) + 40 &
		My >= PartyLoadedSkillY (DisplaySkillCycle) - 1 and My <= PartyLoadedSkillY (DisplaySkillCycle) + 40 then
	    SkillSelected := DisplaySkillCycle
	    SkillDescriptionDisplay ((Party (ActiveUser).Skill (DisplaySkillCycle).SkillID))
	end if
    end for
    Character (12) := EmptyNPC
    ActiveTarget := 12
    for DisplaySkillCycle : 1 .. 10         %%% Display Base skills description
	if Mx >= PartyBaseSkillX (DisplaySkillCycle) - 1 & Mx <= PartyBaseSkillX (DisplaySkillCycle) + 40 &
		My >= PartyBaseSkillY (DisplaySkillCycle) - 1 and My <= PartyBaseSkillY (DisplaySkillCycle) + 40 then
	    SkillSelected := DisplaySkillCycle
	    SkillDescriptionDisplay ((Party (ActiveUser).BaseSkill (DisplaySkillCycle).SkillID))
	end if
    end for
    Character (ActiveUser) := TempStoreID

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end MapParty

proc MapInventory
    if UnlockedMap = false then
	Pic.Draw (MainMenuInventory, 0, 0, picMerge)
    else
	Pic.Draw (MainMenuInventoryUnlocked, 0, 0, picMerge)
    end if

    if ActiveUser < 1 then
	ActiveUser := 1
    elsif ActiveUser > 10 then
	ActiveUser := 10
    end if
    if Pressed (KEY_ESC) then
	MapInventoryboolean := false
    end if
    %Font.Draw ("MX: " + intstr (Mx) + " - MY: " + intstr (My), 1050, 20, Font1, 25)
    if (Mx > 1227 & Mx < 1260) & (My > 668 & My < 700) then
	Pic.Draw (ExitButton, 0, 0, picMerge)
	if Mb = 1 then
	    MapInventoryboolean := false
	end if
    end if

    %%%%%%%%%%%%%%%%%%%%%%%%% Check .. duplicates??? Why?

    for CycleParty : 1 .. 10
	Pic.Draw (Party (CycleParty).Avatar, 485 + 75 * (CycleParty - 1), 389, picMerge)
	if Mx >= 485 + 75 * (CycleParty - 1) and Mx <= 485 + 40 + 75 * (CycleParty - 1) and My >= 389 and My <= 389 + 40 then
	    Draw.Box (485 + 75 * (CycleParty - 1), 389, 485 + 40 + 75 * (CycleParty - 1), 389 + 40, PowerWhite)
	    Draw.Box (485 + 19 + 75 * (CycleParty - 1), 389 + 42, 485 + 21 + 75 * (CycleParty - 1), 389 + 42, PowerWhite)
	    Draw.Box (485 + 18 + 75 * (CycleParty - 1), 389 + 43, 485 + 22 + 75 * (CycleParty - 1), 389 + 43, PowerWhite)
	    Draw.Box (485 + 16 + 75 * (CycleParty - 1), 389 + 44, 485 + 24 + 75 * (CycleParty - 1), 389 + 44, PowerWhite)
	    if Mb = 1 then
		ActiveUser := CycleParty
	    end if
	end if
	if Party (CycleParty).Identity = 0 then
	    Draw.FillBox (485 + 75 * (CycleParty - 1), 389 + 2, 485 + 40 + 75 * (CycleParty - 1), 389 + 37, 16)
	    Font.Draw ("Locked", 487 + 75 * (CycleParty - 1), 389 + 16, FontLocked, FoeRed)
	end if
    end for
    if Party (ActiveUser).Identity > 0 then
	Font.Draw ("AVAILABLE", 791, 434, Font7, MelGreen)
    else
	Font.Draw ("Not recruited yet", 785, 434, Font7, Bronze)
    end if
    %%%%%%%%%%%% Stats Info
    Pic.Draw (Party (ActiveUser).UB, 521, 450, picMerge)
    Pic.Draw (Party (ActiveUser).Avatar, 41, 633, picMerge)
    Font.Draw (Party (ActiveUser).Name, 90, 647, Font14, GlowAqua)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if Party (ActiveUser).Identity = 0 then
	Draw.FillBox (522, 482 - 30, 1158, 665 + 21, 16)
	Font.Draw ("Locked", 770, 555, FontLockedIMAGE, FoeRed)
	Draw.FillBox (41, 633, 80, 672, 16)
	Font.Draw ("Locked", 43, 641 + 8, FontLocked, FoeRed)
    end if

    %%%%%%%%%%%%%%%% Inventory Dragging  %%%%%%%%%%%%%%%%%%
    if Mx > 11 and Mx < maxx - 11 and My > 70 and My < maxy - 11 then
    else
	DragInventory := false
	DragCharacterShards := false
	Combinationboolean := false
	Identificationboolean := false
    end if
    %%%% Inventory Draw
    TrackInvenX := 0
    TrackInvenY := 0
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Display Shards, detect
    for ShardShow : 1 .. 3
	if Mx >= 34 and Mx <= 34 + 40 then
	    if My >= 720 - 217 + 50 - (ShardShow * 50) and My <= 720 - 217 + 50 - (ShardShow * 50) + 40 then
		Draw.Box (34 - 1, 720 - 217 + 48 - (ShardShow * 50), 34 + 42, 720 - 217 + 51 - (ShardShow * 50) + 40, PSOBlue)
		Draw.Box (34 - 2, 720 - 217 + 47 - (ShardShow * 50), 34 + 43, 720 - 217 + 52 - (ShardShow * 50) + 40, PSOWhite)
		TargetShard := ShardShow
		if Mb = 1 & DragCharacterShards = false & DragInventory = false & Combinationboolean = false & Identificationboolean = false then
		    DragCharacterShards := true
		    ActiveShard := ShardShow
		    exit
		end if
	    end if
	end if
	if Party (ActiveUser).GearType (ShardShow) = 1 then
	    Pic.Draw (Shard_Health, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Vitality: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 2 then
	    Pic.Draw (Shard_Power, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Stamina: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 3 then
	    Pic.Draw (Shard_Attack, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Strength: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 4 then
	    Pic.Draw (Shard_Defense, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Invulnerability: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 5 then
	    Pic.Draw (Shard_Critical, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Chance: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 6 then
	    Pic.Draw (Shard_Critical, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Burst: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	elsif Party (ActiveUser).GearType (ShardShow) = 7 then
	    Pic.Draw (Shard_Speed, 35, 720 - 217 + 50 - (ShardShow * 50), picMerge)
	    Font.Draw ("Shard of Haste: " + intstr (Party (ActiveUser).GearStat (ShardShow)), 100, 720 - 217 + 60 - (ShardShow * 50), FontInfo, PSOWhite)
	end if
    end for
    %%%%%%%%%%%% Display Inventory, Detect
    for IVert : 1 .. 6         % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
	for IHori : 1 .. 7
	    Mouse.Where (Mx, My, Mb)
	    if Inventory (IHori, IVert).Type = 1 then
		Pic.Draw (Shard_Health, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 2 then
		Pic.Draw (Shard_Power, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 3 then
		Pic.Draw (Shard_Attack, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 4 then
		Pic.Draw (Shard_Defense, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 5 then
		Pic.Draw (Shard_Critical, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 6 then
		Pic.Draw (Shard_Critical, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    elsif Inventory (IHori, IVert).Type = 7 then
		Pic.Draw (Shard_Speed, -3 + (IHori * 48), 370 - (IVert * 48), picMerge)
	    end if
	    if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		Draw.Box (-3 + (IHori * 48), 370 - (IVert * 48), 37 + (IHori * 48), 370 + 40 - (IVert * 48), PSOBlue)
		Draw.Box (-4 + (IHori * 48), 369 - (IVert * 48), 38 + (IHori * 48), 370 + 41 - (IVert * 48), PSOWhite)
		if (Inventory (IHori, IVert).Type > 0) then
		    DisplayInventory (IHori, IVert, Inventory (IHori, IVert).Type, Inventory (IHori, IVert).Stat)
		    TrackInvenX := IHori
		    TrackInvenY := IVert
		end if
		if Mb = 1 & DragCharacterShards = false & DragInventory = false & Combinationboolean = false & Identificationboolean = false then
		    DragInventory := true
		    ActiveInventoryH := IHori
		    ActiveInventoryV := IVert
		    exit
		end if
	    end if
	end for
    end for
    %%%% Combination
    if Mx >= 458 and Mx <= 501 then
	if My >= 260 and My <= 300 then     %% Top ID
	    Draw.Box (457, 257, 502, 302, PSOWhite)
	    DisplayCombination (Combination (1).Type, Combination (1).Stat)
	    if Combination (1).Type > 0 then
		if Mb = 1 & DragCharacterShards = false & DragInventory = false & Identificationboolean = false then
		    Combinationboolean := true
		    ActiveShard := 1
		end if
	    end if
	elsif My >= 138 and My <= 178 then     %% Bottom ID
	    Draw.Box (457, 134, 502, 179, PSOWhite)
	    DisplayCombination (Combination (2).Type, Combination (2).Stat)
	    if Combination (2).Type > 0 then
		if Mb = 1 & DragCharacterShards = false & DragInventory = false & Identificationboolean = false then
		    Combinationboolean := true
		    ActiveShard := 2
		end if
	    end if
	end if
    end if
    for CycleCom : 1 .. 2     %% Draw in Combination
	if Combination (CycleCom).Type = 1 then
	    Pic.Draw (Shard_Health, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 2 then
	    Pic.Draw (Shard_Power, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 3 then
	    Pic.Draw (Shard_Attack, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 4 then
	    Pic.Draw (Shard_Defense, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 5 then
	    Pic.Draw (Shard_Critical, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 6 then
	    Pic.Draw (Shard_Critical, 460, 260 - 123 * (CycleCom - 1), picMerge)
	elsif Combination (CycleCom).Type = 7 then
	    Pic.Draw (Shard_Speed, 460, 260 - 123 * (CycleCom - 1), picMerge)
	end if
    end for
    if Combination (3).Type = 1 then     % Draw combination result shard
	Pic.Draw (Shard_Health, 630, 200, picMerge)
    elsif Combination (3).Type = 2 then
	Pic.Draw (Shard_Power, 630, 200, picMerge)
    elsif Combination (3).Type = 3 then
	Pic.Draw (Shard_Attack, 630, 200, picMerge)
    elsif Combination (3).Type = 4 then
	Pic.Draw (Shard_Defense, 630, 200, picMerge)
    elsif Combination (3).Type = 5 then
	Pic.Draw (Shard_Critical, 630, 200, picMerge)
    elsif Combination (3).Type = 6 then
	Pic.Draw (Shard_Critical, 630, 200, picMerge)
    elsif Combination (3).Type = 7 then
	Pic.Draw (Shard_Speed, 630, 200, picMerge)
    end if
    if Mx >= 628 and Mx <= 671 and My >= 198 and My <= 241 then     %%% Combination result
	Draw.Box (627, 197, 672, 242, PSOWhite)
	DisplayCombination (Combination (3).Type, Combination (3).Stat)
	if Mb = 1 & DragCharacterShards = false & DragInventory = false then
	    if Combination (3).Type > 0 then     %% If shard exists
		Combinationboolean := true
		ActiveShard := 3
	    end if
	end if
    end if
    %%%%%%%%%%%% COMBINATION %%%%%%%%%%%%%%%%%
    if Combination (1).Type > 0 and Combination (2).Type > 0 then     %% Combine button
	% ANimation?
	Draw.FillBox (534, 195, 586, 207, PSODarkBlue)
	Font.Draw ("=--(+)--=", 536, 197, FontDescription, GlowAqua)
	Draw.Box (534, 195, 586, 207, PSOWhite)
	if Mx >= 534 and Mx <= 586 and My >= 195 and My <= 207 then
	    Draw.Oval (Mx, My, 25, 25, PSOWhite)
	    Draw.FillBox (534, 195, 586, 207, PSOWhite)
	    Font.Draw ("=--(+)--='", 536, 197, FontDescription, PSODarkBlue)
	    Draw.Box (534, 195, 586, 207, BorderBlue)
	    if Mb = 1 then
		if Combination (2).Type not= Combination (1).Type then
		    Combination (3).Type := Rand.Int (1, 7)
		else
		    Combination (3).Type := Combination (2).Type
		end if
		Combination (3).Stat := (Combination (2).Stat + Combination (1).Stat)     %% Form new
		Combination (2).Type := 0
		Combination (2).Stat := 0     %% Wipe
		Combination (1).Type := 0     %% Wipe
		Combination (1).Stat := 0     %% Wipe
		delay (150)
	    end if
	end if
    end if

    %%%%%%%% Seperation from Highlight to Result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Dragging shards
    %%%% Identification
    if Identification.Type = 1 then     % Draw combination result shard
	Pic.Draw (Shard_Health, 942, 308, picMerge)
    elsif Identification.Type = 2 then
	Pic.Draw (Shard_Power, 942, 308, picMerge)
    elsif Identification.Type = 3 then
	Pic.Draw (Shard_Attack, 942, 308, picMerge)
    elsif Identification.Type = 4 then
	Pic.Draw (Shard_Defense, 942, 308, picMerge)
    elsif Identification.Type = 5 then
	Pic.Draw (Shard_Critical, 942, 308, picMerge)
    elsif Identification.Type = 6 then
	Pic.Draw (Shard_Critical, 942, 308, picMerge)
    elsif Identification.Type = 7 then
	Pic.Draw (Shard_Speed, 942, 308, picMerge)
    end if
    if Mx >= 942 and Mx <= 942 + 40 and My >= 307 and My <= 349 then
	Draw.Box (939, 305, 942 + 42, 349 + 01, PSOWhite)
	DisplayCombination (Identification.Type, Identification.Stat)
	if Mb = 1 & DragCharacterShards = false & DragInventory = false & Combinationboolean = false then
	    Identificationboolean := true
	end if
	if Mb = 2 then
	end if
    end if
    %%%%%%%%%%%%%% IDENTIFY %%%%%%%%%%%%%%%
    if Identificationboolean = true then
	if Identification.Type = 1 then
	    Pic.Draw (Shard_Health, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 2 then
	    Pic.Draw (Shard_Power, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 3 then
	    Pic.Draw (Shard_Attack, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 4 then
	    Pic.Draw (Shard_Defense, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 5 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 6 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Identification.Type = 7 then
	    Pic.Draw (Shard_Speed, Mx - 20, My - 20, picMerge)
	end if
	for IVert : 1 .. 6     %%% Dumping back to inventory
	    for IHori : 1 .. 7
		if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		    Draw.Box (-4 + (IHori * 48), 369 - (IVert * 48), 38 + (IHori * 48), 371 + 40 - (IVert * 48), PSOWhite)
		    if Mb = 0 & Inventory (IHori, IVert).Type = 0 then     %% Dumping into Inventory
			Inventory (IHori, IVert).Type := Identification.Type
			Inventory (IHori, IVert).Stat := Identification.Stat
			Identification.Type := 0
			Identification.Stat := 0
			Identificationboolean := false
			Combinationboolean := false
			DragInventory := false
			DragCharacterShards := false
			exit
		    end if
		end if
	    end for
	end for
	%%%%%%%%%%%%%%%%%%%%% Dumping into character (??) %%%%%%%%%%%%%
	for ShardShow : 1 .. 3     %% If Swap with char shard
	    if Mx >= 34 and Mx <= 34 + 40 then
		if My >= 720 - 217 + 50 - (ShardShow * 50) and My <= 720 - 217 + 50 - (ShardShow * 50) + 40 then
		    if Mb = 0 & Party (ActiveUser).GearType (ShardShow) = 0 then
			Party (ActiveUser).GearType (ShardShow) := Identification.Type
			Party (ActiveUser).GearStat (ShardShow) := Identification.Stat
			Identification.Type := 0
			Identification.Stat := 0
			Identificationboolean := false
			Combinationboolean := false
			DragInventory := false
			DragCharacterShards := false
			exit
		    end if
		end if
	    end if
	end for
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if Mb = 0 then
	    Combinationboolean := false
	end if
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMBINATION ^%
    elsif Combinationboolean = true then     %% If dragging a shard from the combination back to inven or char
	if Combination (ActiveShard).Type = 1 then
	    Pic.Draw (Shard_Health, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 2 then
	    Pic.Draw (Shard_Power, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 3 then
	    Pic.Draw (Shard_Attack, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 4 then
	    Pic.Draw (Shard_Defense, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 5 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 6 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Combination (ActiveShard).Type = 7 then
	    Pic.Draw (Shard_Speed, Mx - 20, My - 20, picMerge)
	end if
	for IVert : 1 .. 6     %%% Dumping back to inventory
	    for IHori : 1 .. 7
		if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		    Draw.Box (-4 + (IHori * 48), 369 - (IVert * 48), 38 + (IHori * 48), 371 + 40 - (IVert * 48), PSOWhite)
		    if Mb = 0 & Inventory (IHori, IVert).Type = 0 then     %% Dumping into Inventory
			Inventory (IHori, IVert).Type := Combination (ActiveShard).Type
			Inventory (IHori, IVert).Stat := Combination (ActiveShard).Stat
			Combination (ActiveShard).Type := 0
			Combination (ActiveShard).Stat := 0
			Combinationboolean := false
			DragInventory := false
			DragCharacterShards := false
			exit
		    end if
		end if
	    end for
	end for
	%%%%%%%%%%%%%%%%%%%%% Dumping into character (??) %%%%%%%%%%%%%
	for ShardShow : 1 .. 3     %% If Swap with char shard
	    if Mx >= 34 and Mx <= 34 + 40 then
		if My >= 720 - 217 + 50 - (ShardShow * 50) and My <= 720 - 217 + 50 - (ShardShow * 50) + 40 then
		    if Mb = 0 & Party (ActiveUser).GearType (ShardShow) = 0 then
			Party (ActiveUser).GearType (ShardShow) := Combination (ActiveShard).Type
			Party (ActiveUser).GearStat (ShardShow) := Combination (ActiveShard).Stat
			Combination (ActiveShard).Type := 0
			Combination (ActiveShard).Stat := 0
			Combinationboolean := false
			DragInventory := false
			DragCharacterShards := false
			exit
		    end if
		end if
	    end if
	end for
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if Mb = 0 then
	    Combinationboolean := false
	end if
    elsif DragCharacterShards = true then     %% If dragging someone's shards
	if Party (ActiveUser).GearType (ActiveShard) = 1 then
	    Pic.Draw (Shard_Health, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 2 then
	    Pic.Draw (Shard_Power, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 3 then
	    Pic.Draw (Shard_Attack, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 4 then
	    Pic.Draw (Shard_Defense, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 5 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 6 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Party (ActiveUser).GearType (ActiveShard) = 7 then
	    Pic.Draw (Shard_Speed, Mx - 20, My - 20, picMerge)
	end if
	%%%% Identification
	if Mx >= 942 and Mx <= 942 + 40 and My >= 307 and My <= 349 then
	    Draw.Box (939, 305, 942 + 42, 349 + 01, GlowPurple)
	    if Mb = 0 & Identification.Type = 0 then
		Identification.Type := Party (ActiveUser).GearType (ActiveShard)
		Identification.Stat := Party (ActiveUser).GearStat (ActiveShard)
		Party (ActiveUser).GearType (ActiveShard) := 0
		Party (ActiveUser).GearStat (ActiveShard) := 0
	    end if
	end if
	%%%% Character to Combination
	if Mx >= 458 and Mx <= 501 then
	    if My >= 260 and My <= 300 then     %% Top ID
		Draw.Box (457, 257, 502, 302, GlowPurple)
		if Combination (1).Type = 0 then
		    if Mb = 0 then
			Combination (1).Type := Party (ActiveUser).GearType (ActiveShard)
			Combination (1).Stat := Party (ActiveUser).GearStat (ActiveShard)
			Party (ActiveUser).GearType (ActiveShard) := 0
			Party (ActiveUser).GearStat (ActiveShard) := 0
		    end if
		end if
	    elsif My >= 138 and My <= 178 then     %% Bottom ID
		%Draw.Box (457, 134, 502, 179, PSOWhite)
		Draw.Box (457, 134, 502, 179, GlowPurple)
		if Combination (2).Type = 0 then
		    if Mb = 0 then
			Combination (2).Type := Party (ActiveUser).GearType (ActiveShard)
			Combination (2).Stat := Party (ActiveUser).GearStat (ActiveShard)
			Party (ActiveUser).GearType (ActiveShard) := 0
			Party (ActiveUser).GearStat (ActiveShard) := 0
		    end if
		end if
	    end if
	end if
	%% SHards to inven.
	for IVert : 1 .. 6     % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
	    for IHori : 1 .. 7
		if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		    Draw.Box (-4 + (IHori * 48), 369 - (IVert * 48), 38 + (IHori * 48), 371 + 40 - (IVert * 48), GlowPurple)
		    if Mb = 0 then
			if Party (ActiveUser).GearType (ActiveShard) = 1 then
			    Party (ActiveUser).TotalHealth -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 2 then
			    Party (ActiveUser).TotalPower -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 3 then
			    Party (ActiveUser).TotalAttack -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 4 then
			    Party (ActiveUser).TotalDefense -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 5 then
			    Party (ActiveUser).TotalCritChance -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 6 then
			    Party (ActiveUser).TotalCritDamage -= Party (ActiveUser).GearStat (ActiveShard)
			elsif Party (ActiveUser).GearType (ActiveShard) = 7 then
			    Party (ActiveUser).TotalSpeed += Party (ActiveUser).GearStat (ActiveShard)
			end if
			if Inventory (IHori, IVert).Type = 1 then
			    Party (ActiveUser).TotalHealth += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 2 then
			    Party (ActiveUser).TotalPower += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 3 then
			    Party (ActiveUser).TotalAttack += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 4 then
			    Party (ActiveUser).TotalDefense += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 5 then
			    Party (ActiveUser).TotalCritChance += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 6 then
			    Party (ActiveUser).TotalCritDamage += Inventory (IHori, IVert).Stat
			elsif Inventory (IHori, IVert).Type = 7 then
			    Party (ActiveUser).TotalSpeed -= Inventory (IHori, IVert).Stat
			end if
			DragInventory := false
			DragCharacterShards := false
			AITempType := Party (ActiveUser).GearType (ActiveShard)     %% Temp = Party.
			AITempStat := Party (ActiveUser).GearStat (ActiveShard)
			Party (ActiveUser).GearType (ActiveShard) := Inventory (IHori, IVert).Type     %% Party = Inven
			Party (ActiveUser).GearStat (ActiveShard) := Inventory (IHori, IVert).Stat
			Inventory (IHori, IVert).Type := AITempType     %% Inventory = Party (Temp)
			Inventory (IHori, IVert).Stat := AITempStat
			%%% If new party (Inven) = 1 then Party.Hp subtract old party (new Inven)
			%%% Party.hp += old inven (new party)
			exit
		    end if
		end if
	    end for
	end for
	for ShardShow : 1 .. 3     %% If Swap with char shard
	    if Mx >= 34 and Mx <= 34 + 40 then
		if My >= 720 - 217 + 50 - (ShardShow * 50) and My <= 720 - 217 + 50 - (ShardShow * 50) + 40 then
		    if Mb = 0 then
			AITempType := Party (ActiveUser).GearType (ActiveShard)
			AITempStat := Party (ActiveUser).GearStat (ActiveShard)
			Party (ActiveUser).GearType (ActiveShard) := Party (ActiveUser).GearType (TargetShard)
			Party (ActiveUser).GearStat (ActiveShard) := Party (ActiveUser).GearStat (TargetShard)
			Party (ActiveUser).GearType (TargetShard) := AITempType
			Party (ActiveUser).GearStat (TargetShard) := AITempStat
		    end if
		end if
	    end if
	end for
	if Mb = 0 then
	    DragInventory := false
	    DragCharacterShards := false
	end if
	%%%%% Dragging From Inventory
    elsif DragInventory = true then
	if Inventory (ActiveInventoryH, ActiveInventoryV).Type = 1 then
	    Pic.Draw (Shard_Health, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 2 then
	    Pic.Draw (Shard_Power, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 3 then
	    Pic.Draw (Shard_Attack, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 4 then
	    Pic.Draw (Shard_Defense, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 5 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 6 then
	    Pic.Draw (Shard_Critical, Mx - 20, My - 20, picMerge)
	elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 7 then
	    Pic.Draw (Shard_Speed, Mx - 20, My - 20, picMerge)
	end if
	%%%% Identification
	if Mx >= 942 and Mx <= 942 + 40 and My >= 307 and My <= 349 then
	    Draw.Box (939, 305, 942 + 42, 349 + 01, GlowPurple)
	    if Mb = 0 & Identification.Type = 0 then
		AITempType := Inventory (ActiveInventoryH, ActiveInventoryV).Type
		AITempStat := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		Inventory (ActiveInventoryH, ActiveInventoryV).Type := Identification.Type
		Inventory (ActiveInventoryH, ActiveInventoryV).Stat := Identification.Stat
		Identification.Type := AITempType
		Identification.Stat := AITempStat
	    end if
	end if
	%%%% Inventory to Combination
	if Mx >= 458 and Mx <= 501 then
	    if My >= 260 and My <= 300 then     %% Top ID
		if Combination (1).Type = 0 then
		    if Mb = 0 then
			AITempType := Inventory (ActiveInventoryH, ActiveInventoryV).Type
			AITempStat := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
			Inventory (ActiveInventoryH, ActiveInventoryV).Type := Combination (1).Type
			Inventory (ActiveInventoryH, ActiveInventoryV).Stat := Combination (1).Stat
			Combination (1).Type := AITempType
			Combination (1).Stat := AITempStat
		    end if
		end if
	    elsif My >= 138 and My <= 178 then     %% Bottom ID
		%Draw.Box (457, 134, 502, 179, PSOWhite)
		if Combination (2).Type = 0 then
		    if Mb = 0 then
			AITempType := Inventory (ActiveInventoryH, ActiveInventoryV).Type
			AITempStat := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
			Inventory (ActiveInventoryH, ActiveInventoryV).Type := Combination (2).Type
			Inventory (ActiveInventoryH, ActiveInventoryV).Stat := Combination (2).Stat
			Combination (2).Type := AITempType
			Combination (2).Stat := AITempStat
		    end if
		end if
	    end if
	end if
	%%%%%%%%%%%%%%%%%%% Inven to Inven
	for IVert : 1 .. 6     % 1 = HP / 2 Power / 3 Att / 4 Def / 5 CC / 6 CD / 7 Speed
	    for IHori : 1 .. 7
		if Mx >= -3 + (IHori * 48) and Mx <= 37 + (IHori * 48) and My >= 370 - (IVert * 48) and My <= 370 + 40 - (IVert * 48) then
		    Draw.Box (-4 + (IHori * 48), 370 - 1 - (IVert * 48), 37 + 1 + (IHori * 48), 371 + 40 - (IVert * 48), PSOWhite)
		    if Mb = 0 then
			DragInventory := false
			DragCharacterShards := false
			AITempType := Inventory (ActiveInventoryH, ActiveInventoryV).Type
			AITempStat := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
			Inventory (ActiveInventoryH, ActiveInventoryV).Type := Inventory (IHori, IVert).Type
			Inventory (ActiveInventoryH, ActiveInventoryV).Stat := Inventory (IHori, IVert).Stat
			Inventory (IHori, IVert).Type := AITempType
			Inventory (IHori, IVert).Stat := AITempStat
			exit
		    end if
		end if
	    end for
	end for
	%%%%%%%%%% Inven to Char
	if Mx >= 34 and Mx <= 75 then
	    if My >= 720 - 317 and My <= 720 - 276 then
		if Mb = 0 then     % 3rd Slot
		    if Party (ActiveUser).GearType (3) = 1 then
			Party (ActiveUser).TotalHealth -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 2 then
			Party (ActiveUser).TotalPower -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 3 then
			Party (ActiveUser).TotalAttack -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 4 then
			Party (ActiveUser).TotalDefense -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 5 then
			Party (ActiveUser).TotalCritChance -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 6 then
			Party (ActiveUser).TotalCritDamage -= Party (ActiveUser).GearStat (3)
		    elsif Party (ActiveUser).GearType (3) = 7 then
			Party (ActiveUser).TotalSpeed += Party (ActiveUser).GearStat (3)
		    end if
		    if Inventory (ActiveInventoryH, ActiveInventoryV).Type = 1 then
			Party (ActiveUser).TotalHealth += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 2 then
			Party (ActiveUser).TotalPower += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 3 then
			Party (ActiveUser).TotalAttack += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 4 then
			Party (ActiveUser).TotalDefense += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 5 then
			Party (ActiveUser).TotalCritChance += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 6 then
			Party (ActiveUser).TotalCritDamage += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 7 then
			Party (ActiveUser).TotalSpeed -= Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    end if
		    AITempType := Party (ActiveUser).GearType (3)                         %% Att
		    AITempStat := Party (ActiveUser).GearStat (3)
		    Party (ActiveUser).GearType (3) := Inventory (ActiveInventoryH, ActiveInventoryV).Type                         %% HE
		    Party (ActiveUser).GearStat (3) := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    Inventory (ActiveInventoryH, ActiveInventoryV).Type := AITempType                         %%% Att
		    Inventory (ActiveInventoryH, ActiveInventoryV).Stat := AITempStat
		    DragInventory := false
		end if
	    elsif My >= 720 - 267 and My <= 720 - 226 then     %% 2nd Slot
		if Mb = 0 then
		    if Party (ActiveUser).GearType (2) = 1 then
			Party (ActiveUser).TotalHealth -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 2 then
			Party (ActiveUser).TotalPower -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 3 then
			Party (ActiveUser).TotalAttack -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 4 then
			Party (ActiveUser).TotalDefense -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 5 then
			Party (ActiveUser).TotalCritChance -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 6 then
			Party (ActiveUser).TotalCritDamage -= Party (ActiveUser).GearStat (2)
		    elsif Party (ActiveUser).GearType (2) = 7 then
			Party (ActiveUser).TotalSpeed += Party (ActiveUser).GearStat (2)
		    end if
		    if Inventory (ActiveInventoryH, ActiveInventoryV).Type = 1 then
			Party (ActiveUser).TotalHealth += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 2 then
			Party (ActiveUser).TotalPower += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 3 then
			Party (ActiveUser).TotalAttack += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 4 then
			Party (ActiveUser).TotalDefense += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 5 then
			Party (ActiveUser).TotalCritChance += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 6 then
			Party (ActiveUser).TotalCritDamage += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 7 then
			Party (ActiveUser).TotalSpeed -= Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    end if
		    AITempType := Party (ActiveUser).GearType (2)
		    AITempStat := Party (ActiveUser).GearStat (2)
		    Party (ActiveUser).GearType (2) := Inventory (ActiveInventoryH, ActiveInventoryV).Type
		    Party (ActiveUser).GearStat (2) := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    Inventory (ActiveInventoryH, ActiveInventoryV).Type := AITempType
		    Inventory (ActiveInventoryH, ActiveInventoryV).Stat := AITempStat
		    DragInventory := false
		end if
	    elsif My >= 720 - 217 and My <= 720 - 176 then     %% 1st Slot
		if Mb = 0 then
		    if Party (ActiveUser).GearType (1) = 1 then
			Party (ActiveUser).TotalHealth -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 2 then
			Party (ActiveUser).TotalPower -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 3 then
			Party (ActiveUser).TotalAttack -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 4 then
			Party (ActiveUser).TotalDefense -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 5 then
			Party (ActiveUser).TotalCritChance -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 6 then
			Party (ActiveUser).TotalCritDamage -= Party (ActiveUser).GearStat (1)
		    elsif Party (ActiveUser).GearType (1) = 7 then
			Party (ActiveUser).TotalSpeed += Party (ActiveUser).GearStat (1)
		    end if
		    if Inventory (ActiveInventoryH, ActiveInventoryV).Type = 1 then
			Party (ActiveUser).TotalHealth += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 2 then
			Party (ActiveUser).TotalPower += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 3 then
			Party (ActiveUser).TotalAttack += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 4 then
			Party (ActiveUser).TotalDefense += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 5 then
			Party (ActiveUser).TotalCritChance += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 6 then
			Party (ActiveUser).TotalCritDamage += Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    elsif Inventory (ActiveInventoryH, ActiveInventoryV).Type = 7 then
			Party (ActiveUser).TotalSpeed -= Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    end if               % First  slot (Inventory armor)
		    AITempType := Party (ActiveUser).GearType (1)
		    AITempStat := Party (ActiveUser).GearStat (1)
		    Party (ActiveUser).GearType (1) := Inventory (ActiveInventoryH, ActiveInventoryV).Type
		    Party (ActiveUser).GearStat (1) := Inventory (ActiveInventoryH, ActiveInventoryV).Stat
		    Inventory (ActiveInventoryH, ActiveInventoryV).Type := AITempType
		    Inventory (ActiveInventoryH, ActiveInventoryV).Stat := AITempStat
		    DragInventory := false
		end if
	    end if
	end if
	if Mb = 0 then
	    DragInventory := false
	    DragCharacterShards := false
	    Combinationboolean := false
	end if
    end if

    % Update Stats
    for CycleUpdate : 1 .. 10
	if Party (CycleUpdate).Identity > 0 then
	    Party (CycleUpdate).Health := Party (CycleUpdate).TotalHealth
	    Party (CycleUpdate).Power := Party (CycleUpdate).TotalPower
	    Party (CycleUpdate).Attack := Party (CycleUpdate).TotalAttack
	    Party (CycleUpdate).Defense := Party (CycleUpdate).TotalDefense
	    Party (CycleUpdate).CritChance := Party (CycleUpdate).TotalCritChance
	    Party (CycleUpdate).CritDamage := Party (CycleUpdate).TotalCritDamage
	    Party (CycleUpdate).Speed := Party (CycleUpdate).TotalSpeed
	end if
    end for

    if TrackInvenX > 0 and TrackInvenY > 0 then
	DisplayInventory (TrackInvenX, TrackInvenY, Inventory (TrackInvenX, TrackInvenY).Type, Inventory (TrackInvenX, TrackInvenY).Stat)
    end if
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end MapInventory

proc MapFileIO
    var LoadSelected : boolean := false
    var SaveSelected : boolean := false
    var SaveNumber : int := 1
    var LoadXFormat, LoadYFormat : int := 0
    var SaveNameAs : string := ""

    Pic.Draw (MainMenuFileIO, 0, 0, picMerge)

    if Pressed (KEY_ESC) then
	MapFileIOboolean := false
    end if
    if (Mx > 1227 & Mx < 1260) & (My > 668 & My < 700) then
	Pic.Draw (ExitButton, 0, 0, picMerge)
	if Mb = 1 then
	    MapFileIOboolean := false
	end if
    end if

    if Mb = 1 & Mx >= 380 & Mx <= 800 & My >= 100 and My <= 600 then
	MovedY += My - StoredY
    end if
    if MovedY <= -250 then
	MovedY := -250
    elsif MovedY >= 1050 then
	MovedY := 1050
    end if
    if MovedY >= 45 then
	Draw.Line (134, 597, 143, 597, GlowAqua)
	Draw.Line (136, 596, 141, 596, GlowAqua)
	Draw.Line (138, 595, 139, 595, GlowAqua)
    end if
    if MovedY <= 800 then
	Draw.Line (134, 102, 143, 102, GlowAqua)
	Draw.Line (136, 103, 141, 103, GlowAqua)
	Draw.Line (138, 104, 139, 104, GlowAqua)
    end if

    StoredY := My
    if FileSaveboolean = true then                         %%%%%%%%%%%%%%%%%%%%%% If Clicked on File And Save/Load, YES/NO OPTION
	if (MovedY + 650 - 150 * ActiveUser) <= 660 & (MovedY + 650 - 150 * ActiveUser) >= 80 then
	    Draw.Line (371, MovedY + 651 - 150 * ActiveUser, 400, MovedY + 651 - 150 * ActiveUser, BorderBlue)
	    Draw.Line (400, MovedY + 651 - 150 * ActiveUser, 400, 720 - 160, BorderBlue)
	    Draw.Line (400, 560, 900, 560, BorderBlue)
	end if
	Pic.Draw (MainMenuFileIOSave, 0, 0, picMerge)
    elsif FileLoadboolean = true then
	if (MovedY + 650 - 150 * ActiveUser) <= 660 & (MovedY + 650 - 150 * ActiveUser) >= 80 then
	    Draw.Line (371, MovedY + 651 - 150 * ActiveUser, 400, MovedY + 651 - 150 * ActiveUser, BorderBlue)
	    Draw.Line (400, MovedY + 651 - 150 * ActiveUser, 400, 320, BorderBlue)
	    Draw.Line (400, 320, 900, 320, BorderBlue)
	end if
	Pic.Draw (MainMenuFileIOLoad, 0, 0, picMerge)
    end if
    if Mx >= 392 & Mx <= 891 & My >= 235 & My <= 486 & FileSaveboolean = true then
	if My <= 395 and My >= 335 then
	    Draw.Box (402, 365, 552, 365, 31)
	    Draw.Box (881, 365, 731, 365, 31)
	    if Mb = 1 then
		SaveSelected := true
		FileSaveboolean := false
	    end if
	elsif My >= 265 & My <= 325 then
	    Draw.Box (402, 295, 552, 295, Bronze)
	    Draw.Box (881, 295, 731, 295, Bronze)
	    if Mb = 1 then
		FileSaveboolean := false
	    end if
	end if
    elsif Mx >= 392 & Mx <= 891 & My >= 720 - 483 & My <= 720 - 234 & FileLoadboolean = true then
	if My <= 395 and My >= 335 then
	    Draw.Box (402, 365, 552, 365, 31)
	    Draw.Box (881, 365, 731, 365, 31)
	    if Mb = 1 then
		LoadSelected := true
		FileLoadboolean := false
	    end if
	elsif My >= 265 & My <= 325 then
	    Draw.Box (402, 295, 552, 295, Bronze)
	    Draw.Box (881, 295, 731, 295, Bronze)
	    if Mb = 1 then
		FileLoadboolean := false
	    end if
	end if
    elsif Mx >= 900 and Mx <= 1197 then
	if My >= 720 - 197 and My <= 600 then                         %% Save
	    if (MovedY + 650 - 150 * ActiveUser) <= 660 & (MovedY + 650 - 150 * ActiveUser) >= 80 then
		Draw.Line (371, MovedY + 651 - 150 * ActiveUser, 400, MovedY + 651 - 150 * ActiveUser, BorderBlue)
		Draw.Line (400, MovedY + 651 - 150 * ActiveUser, 400, 720 - 160, BorderBlue)
		Draw.Line (400, 560, 900, 560, BorderBlue)
	    end if
	    Pic.Draw (MainMenuFileIOSaveHighlight, 0, 0, picMerge)
	    if Mb = 1 & FileSelectedboolean = true then
		FileSaveboolean := true
		FileLoadboolean := false
		delay (90)
	    end if
	elsif My >= 720 - 436 and My <= 720 - 359 then                         %% Load
	    if (MovedY + 650 - 150 * ActiveUser) <= 660 & (MovedY + 650 - 150 * ActiveUser) >= 80 then
		Draw.Line (371, MovedY + 651 - 150 * ActiveUser, 400, MovedY + 651 - 150 * ActiveUser, BorderBlue)
		Draw.Line (400, MovedY + 651 - 150 * ActiveUser, 400, 320, BorderBlue)
		Draw.Line (400, 320, 900, 320, BorderBlue)
	    end if
	    Pic.Draw (MainMenuFileIOLoadHighlight, 0, 0, picMerge)
	    if Mb = 1 & FileSelectedboolean = true then
		FileLoadboolean := true
		FileSaveboolean := false
		delay (90)
	    end if
	end if
    end if

    LoadXFormat := 100
    for CycleLoad : 1 .. 9
	LoadYFormat := (MovedY + 700 - 150 * CycleLoad)
	SaveName := "Data\\Save" + intstr (CycleLoad) + ".txt"
	if File.Exists (SaveName) then
	    open : stream, SaveName, get
	    get : stream, SaveNumber
	    get : stream, FileName
	    close : stream
	end if

	if ActiveUser = CycleLoad & LoadYFormat <= 580 & LoadYFormat >= 190 & FileSelectedboolean = true then
	    Draw.Box (69, LoadYFormat - 121, 371, LoadYFormat + 16, Gold)
	end if
	if Mx >= 70 and Mx <= 370 & LoadYFormat >= 100 and My >= LoadYFormat - 120 and My <= LoadYFormat + 15 & LoadYFormat <= 650 then
	    if LoadYFormat >= 190 then
		Draw.Box (70, LoadYFormat - 120, 370, LoadYFormat + 15, BorderBlue)
	    end if
	    if Mb = 1 & FileSelectedboolean = false then
		FileSelectedboolean := true
		ActiveUser := CycleLoad
		ActiveName := FileName
		%CurrentOperatingFileName := FileName
		delay (90)
	    elsif Mb = 1 & FileSelectedboolean = true & ActiveUser not= CycleLoad then
		FileSelectedboolean := true
		%CurrentOperatingFileName := FileName
		ActiveUser := CycleLoad
		ActiveName := FileName
		delay (90)
	    elsif Mb = 1 & FileSelectedboolean = true then
		FileSelectedboolean := false
		delay (90)
	    end if
	end if

	if LoadYFormat >= 92 & LoadYFormat <= 600 then
	    Font.Draw (intstr (SaveNumber) + ": " + FileName, LoadXFormat, LoadYFormat, FontInfo, Gold)
	end if

    end for

    Draw.FillBox (40, 600, 480, 690, 16)
    Draw.FillBox (40, 98, 480, 69, 16)
    %%%%%%%%%%%%%%%%%%%% Current Operating File %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Font.Draw ("Current file in use  [ " + intstr (CurrentOperatingFileNumber) + ": " + CurrentOperatingFileName + " ]", 60, 620, FontInfo, ChatGrey)
    if FileSelectedboolean = true then
	Font.Draw ("Selected file  [ " + intstr (ActiveUser) + ": " + ActiveName + " ]", 60, 75, FontInfo, GlowAqua)
    end if

    if SaveSelected = true then
	%Draw.FillBox (393, 720 - 236, 890, 720 - 484, 16)
	% var NewName : string %( Max 17 Letters)
	var ShiftKeyDownboolean : boolean := false
	var DetectRepetition : array 45 .. 122 of int
	var TimePassed : int := 0
	var CountNameSize : int := 0
	var DetectTime : array 45 .. 122 of int
	var NewNameCount : int := 11
	for CycleTime : 45 .. 122
	    DetectTime (CycleTime) := 0
	    DetectRepetition (CycleTime) := 0
	end for
	if CurrentOperatingFileName not= "Name" then
	    SaveNameAs := CurrentOperatingFileName
	    for TestLengthOfFileName : 1 .. 20
		if length (CurrentOperatingFileName) = TestLengthOfFileName then
		    NewNameCount := TestLengthOfFileName
		    exit
		end if
	    end for
	else
	    SaveNameAs := "Name (1-17)"
	    NewNameCount := 11
	end if
	loop
	    % Draw.FillBox (393, 720 - 236, 890, 720 - 484, 16)
	    Draw.FillBox (0, 0, maxx, maxy, 16)
	    Pic.Draw (Border, 0, 0, picMerge)
	    var NewLetter : string
	    Input.KeyDown (Pressed)
	    if Pressed (chr (180)) then
		ShiftKeyDownboolean := true
	    else
		ShiftKeyDownboolean := false
	    end if
	    for CycleTime : 45 .. 122
		if TimePassed - DetectTime (CycleTime) >= 10 then
		    DetectTime (CycleTime) := 0
		    DetectRepetition (CycleTime) := 0
		end if
	    end for

	    for CycleLetter : 45 .. 122
		if CycleLetter > 90 and CycleLetter < 95 then
		elsif CycleLetter > 57 and CycleLetter < 65 then
		elsif CycleLetter > 95 and CycleLetter < 97 then
		else
		    if Pressed (chr (CycleLetter)) & CycleLetter not= DetectRepetition (CycleLetter) then
			if CycleLetter >= 97 & CycleLetter <= 122 & ShiftKeyDownboolean = true then
			    SaveNameAs += chr (CycleLetter - 32)
			    DetectRepetition (CycleLetter) := CycleLetter
			elsif CycleLetter = 49 & ShiftKeyDownboolean = true then                         %%%% Exclaimation Mark
			    SaveNameAs += chr (33)
			    DetectRepetition (CycleLetter) := CycleLetter
			elsif CycleLetter = 45 & ShiftKeyDownboolean = true then                         %%%% Exclaimation Mark
			    SaveNameAs += chr (95)
			    DetectRepetition (CycleLetter) := CycleLetter
			else
			    SaveNameAs += chr (CycleLetter)
			    DetectRepetition (CycleLetter) := CycleLetter
			end if
			DetectTime (CycleLetter) := TimePassed
			NewNameCount += 1
			%%%%%%%%%%%%%%%%%%%%%%%%%%% Draw
			% Font.Draw ("Enter name to save as: [1-17 characters]", 460, 480, FontChat, ChatGrey)
			% Pic.Draw (MidscreenMessage, 0, 0, picMerge)
			% Draw.Box (maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 1, maxy div 2 - 20, maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 3, maxy div 2 + 20, Gold)
			%% Draw.FillBox (0, 0, maxx, maxy, 16)
			%Pic.Draw (Border, 0, 0, picMerge)
			%Draw.FillBox (100, 100, maxx - 100, maxy div 2 - 30, 16)
			%MidscreenInput (SaveNameAs)
			%%%%%%%%%%%%%%%%%%%%%%%%%% Draw
			% View.Update
			exit
		    end if
		end if
	    end for
	    if Pressed (KEY_ENTER) then
		if NewNameCount = 0 then
		else
		    delay (150)
		    exit
		end if
	    end if
	    if NewNameCount > 17 then
		NewNameCount := 17
		SaveNameAs := SaveNameAs (1 .. NewNameCount)
	    end if
	    if Pressed (KEY_BACKSPACE) & DetectRepetition (95) not= 95 then
		if NewNameCount = 1 then
		    DetectRepetition (95) := 95
		    DetectTime (95) := TimePassed - 6
		    NewNameCount := 0
		    SaveNameAs := ""
		    %%%%%%%%%%%%%%%%%%%%%%%%%%% Draw
		    %  Font.Draw ("Enter name to save as: [1-17 characters]", 460, 480, FontChat, ChatGrey)
		    %  Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		    %  Draw.Box (maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 1, maxy div 2 - 20, maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 3, maxy div 2 + 20, Gold)
		    %  Draw.FillBox (0, 0, maxx, maxy, 16)
		    %  Pic.Draw (Border, 0, 0, picMerge)
		    % Draw.FillBox (100, 100, maxx - 100, maxy div 2 - 30, 16)
		    % MidscreenInput (SaveNameAs)
		    %%%%%%%%%%%%%%%%%%%%%%%%%% Draw
		    %View.Update
		    %delay (100)
		    %delay (55)
		elsif NewNameCount > 1 then
		    DetectRepetition (95) := 95
		    DetectTime (95) := TimePassed - 6
		    SaveNameAs := SaveNameAs (1 .. * -1)
		    NewNameCount -= 1
		    %%%%%%%%%%%%%%%%%%%%%%%%%%% Draw
		    %  Font.Draw ("Enter name to save as: [1-17 characters]", 460, 480, FontChat, ChatGrey)
		    %  Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		    %  Draw.Box (maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 1, maxy div 2 - 20, maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 3, maxy div 2 + 20, Gold)
		    %  Draw.FillBox (0, 0, maxx, maxy, 16)
		    %  Pic.Draw (Border, 0, 0, picMerge)
		    %  Draw.FillBox (100, 100, maxx - 100, maxy div 2 - 30, 16)
		    %  MidscreenInput (SaveNameAs)
		    %%%%%%%%%%%%%%%%%%%%%%%%%% Draw
		    %View.Update
		    %delay (100)
		    %delay (55)
		end if
	    end if
	    Font.Draw ("Enter name to save as: [1-17 numbers & letters, no special characters]", 350, 480, FontChat, ChatGrey)
	    Pic.Draw (MidscreenMessage, 0, 0, picMerge)

	    Draw.Box (maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 1, maxy div 2 - 20, maxx div 2 + Font.Width (SaveNameAs, FontChat) div 2 + 3, maxy div 2 + 20,
		Gold)

	    Draw.FillBox (100, 100, maxx - 100, maxy div 2 - 30, 16)
	    MidscreenInput (SaveNameAs)
	    View.Update
	    TimePassed += 1
	    delay (15)
	end loop
	%if CurrentOperatingFileNumber = ActiveUser then
	%else
	%end if

	SaveName := "Data\\Save" + intstr (ActiveUser) + ".txt"
	open : stream, SaveName, put
	put : stream, ActiveUser
	put : stream, SaveNameAs
	put : stream, UnlockedMap
	put : stream, Chapter
	put : stream, Silver
	for CycleMembers : 1 .. 10
	    put : stream, Party (CycleMembers).Body
	    put : stream, Party (CycleMembers).Identity
	    put : stream, Party (CycleMembers).UB
	    put : stream, Party (CycleMembers).Avatar
	    put : stream, Party (CycleMembers).Experience
	    put : stream, Party (CycleMembers).Name
	    put : stream, Party (CycleMembers).Level
	    put : stream, Party (CycleMembers).TotalLevel
	    put : stream, Party (CycleMembers).ChangeLevel
	    put : stream, Party (CycleMembers).Party
	    put : stream, Party (CycleMembers).Health
	    put : stream, Party (CycleMembers).TotalHealth
	    put : stream, Party (CycleMembers).Attack
	    put : stream, Party (CycleMembers).TotalAttack
	    put : stream, Party (CycleMembers).ChangeAttack
	    put : stream, Party (CycleMembers).Defense
	    put : stream, Party (CycleMembers).ChangeDefense
	    put : stream, Party (CycleMembers).Weapon
	    put : stream, Party (CycleMembers).TotalDefense
	    put : stream, Party (CycleMembers).CritChance
	    put : stream, Party (CycleMembers).TotalCritChance
	    put : stream, Party (CycleMembers).ChangeCritChance
	    put : stream, Party (CycleMembers).CritDamage
	    put : stream, Party (CycleMembers).TotalCritDamage
	    put : stream, Party (CycleMembers).ChangeCritDamage
	    put : stream, Party (CycleMembers).Power
	    put : stream, Party (CycleMembers).TotalPower
	    put : stream, Party (CycleMembers).Speed
	    put : stream, Party (CycleMembers).ChangeSpeed
	    put : stream, Party (CycleMembers).TotalSpeed
	    put : stream, Party (CycleMembers).PositionX
	    put : stream, Party (CycleMembers).PositionY
	    for CShard : 1 .. 3
		put : stream, Party (CycleMembers).GearType (CShard)
		put : stream, Party (CycleMembers).GearStat (CShard)
	    end for
	    for CSkill : 1 .. 6
		put : stream, Party (CycleMembers).Skill (CSkill).SkillID
		put : stream, Party (CycleMembers).Skill (CSkill).Level
	    end for
	    for CBSkill : 1 .. 10
		put : stream, Party (CycleMembers).BaseSkill (CBSkill).SkillID
		put : stream, Party (CycleMembers).BaseSkill (CBSkill).Level
	    end for
	end for
	for Cycle : 1 .. LocationSize
	    put : stream, Location (Cycle).U
	end for
	for IVert : 1 .. 6
	    for IHori : 1 .. 7
		put : stream, Inventory (IHori, IVert).Type
		put : stream, Inventory (IHori, IVert).Stat
	    end for
	end for
	close : stream
	SaveSelected := false
	Pic.Draw (MidscreenMessage, 0, 0, picMerge)
	MidscreenInput ("File [" + intstr (CurrentOperatingFileNumber) + "] Saved to File[" + intstr (ActiveUser) + "] successful.")
	CurrentOperatingFileNumber := ActiveUser
	CurrentOperatingFileName := SaveNameAs
	View.Update
	loop
	    Input.KeyDown (Pressed)
	    if Pressed (' ') or Pressed (KEY_ENTER) then
		delay (50)
		exit
	    end if
	end loop
    elsif LoadSelected = true then
	SaveName := "Data\\Save" + intstr (ActiveUser) + ".txt"
	if File.Exists (SaveName) then
	    open : stream, SaveName, get
	    get : stream, CurrentOperatingFileNumber
	    get : stream, CurrentOperatingFileName
	    get : stream, UnlockedMap
	    get : stream, Chapter
	    get : stream, Silver
	    for CycleMembers : 1 .. 10
		get : stream, Party (CycleMembers).Body
		get : stream, Party (CycleMembers).Identity
		get : stream, Party (CycleMembers).UB
		get : stream, Party (CycleMembers).Avatar
		get : stream, Party (CycleMembers).Experience
		get : stream, Party (CycleMembers).Name
		get : stream, Party (CycleMembers).Level
		get : stream, Party (CycleMembers).TotalLevel
		get : stream, Party (CycleMembers).ChangeLevel
		get : stream, Party (CycleMembers).Party
		get : stream, Party (CycleMembers).Health
		get : stream, Party (CycleMembers).TotalHealth
		get : stream, Party (CycleMembers).Attack
		get : stream, Party (CycleMembers).TotalAttack
		get : stream, Party (CycleMembers).ChangeAttack
		get : stream, Party (CycleMembers).Defense
		get : stream, Party (CycleMembers).ChangeDefense
		get : stream, Party (CycleMembers).Weapon
		get : stream, Party (CycleMembers).TotalDefense
		get : stream, Party (CycleMembers).CritChance
		get : stream, Party (CycleMembers).TotalCritChance
		get : stream, Party (CycleMembers).ChangeCritChance
		get : stream, Party (CycleMembers).CritDamage
		get : stream, Party (CycleMembers).TotalCritDamage
		get : stream, Party (CycleMembers).ChangeCritDamage
		get : stream, Party (CycleMembers).Power
		get : stream, Party (CycleMembers).TotalPower
		get : stream, Party (CycleMembers).Speed
		get : stream, Party (CycleMembers).ChangeSpeed
		get : stream, Party (CycleMembers).TotalSpeed
		get : stream, Party (CycleMembers).PositionX
		get : stream, Party (CycleMembers).PositionY
		for CShard : 1 .. 3
		    get : stream, Party (CycleMembers).GearType (CShard)
		    get : stream, Party (CycleMembers).GearStat (CShard)
		end for
		for CSkill : 1 .. 6
		    get : stream, Party (CycleMembers).Skill (CSkill).SkillID
		    get : stream, Party (CycleMembers).Skill (CSkill).Level
		end for
		for CBSkill : 1 .. 10
		    get : stream, Party (CycleMembers).BaseSkill (CBSkill).SkillID
		    get : stream, Party (CycleMembers).BaseSkill (CBSkill).Level
		end for
	    end for
	    for Cycle : 1 .. LocationSize
		get : stream, Location (Cycle).U
	    end for
	    for IVert : 1 .. 6
		for IHori : 1 .. 7
		    get : stream, Inventory (IHori, IVert).Type
		    get : stream, Inventory (IHori, IVert).Stat
		end for
	    end for
	    close : stream
	    LoadSelected := false
	    ActiveUser := 1
	    for ClearCharacterCache : 1 .. 12
		Character (ClearCharacterCache) := EmptyNPC
	    end for
	    for InstallCycle : 1 .. 10
		ReinstallImages (Party (InstallCycle).Name, InstallCycle)
	    end for
	    Pic.Draw (MidscreenMessage, 0, 0, picMerge)
	    MidscreenInput ("File [" + intstr (CurrentOperatingFileNumber) + "] Load successful.")
	    View.Update
	    loop
		Input.KeyDown (Pressed)
		if Pressed (' ') then
		    delay (50)
		    exit
		end if
	    end loop
	end if
    end if
end MapFileIO

proc MapSettings                         %%%% Maintain in world loop, just draw
    if UnlockedMap = false then
	Pic.Draw (MainMenuSettings, 0, 0, picMerge)
    else
	Pic.Draw (MainMenuSettingsUnlocked, 0, 0, picMerge)
    end if
    if Pressed (KEY_ESC) then
	MapSettingsboolean := false
    end if
    %Font.Draw ("MX: " + intstr (Mx) + " - MY: " + intstr (My), 1050, 20, Font1, 25)
    if (Mx > 1227 & Mx < 1260) & (My > 668 & My < 700) then
	Pic.Draw (ExitButton, 0, 0, picMerge)
	if Mb = 1 then
	    MapSettingsboolean := false
	end if
    end if
    Draw.Box (40, 117, 41, 665, Gold)
    if (Mx > 58 & Mx < 388) then
	if (My > 600 & My < 665) then                         %%%%%%%%%%%%%%%%%%%%%%%%%%%Instr
	    Draw.Line (40, 632, 58, 632, Gold)
	    Draw.Line (396, 632, 414, 632, Gold)
	    % Draw.Box (58, 600, 388, 665, Gold)
	    Font.Draw ("INSTRUCTIONS", 64, 612, Font11, Gold)
	    if Mb = 1 & MapSettingsInstructionsboolean = false then
		MapSettingsSoundboolean := false
		MapSettingsInstructionsboolean := true
		delay (99)
	    elsif Mb = 1 & MapSettingsInstructionsboolean = true then
		MapSettingsInstructionsboolean := false
		delay (99)
	    end if
	elsif (My > 480 & My < 540) then                         %%%%%%%%%%%SOUNDS
	    Draw.Line (40, 510, 58, 510, Gold)
	    % Draw.Box (58, 480, 388, 540, Gold)
	    Draw.Line (396, 510, 414, 510, Gold)
	    Font.Draw ("SOUND", 139, 493, Font11, Gold)
	    if Mb = 1 & MapSettingsSoundboolean = false then
		MapSettingsInstructionsboolean := false
		MapSettingsSoundboolean := true
		delay (99)
	    elsif Mb = 1 & MapSettingsSoundboolean = true then
		MapSettingsSoundboolean := false
		delay (99)
	    end if
	elsif (My > 360 & My < 420) then                         %%%%%%%%%% NOTES / UB /  Story
	    Draw.Line (40, 390, 58, 390, Gold)
	    Draw.Line (396, 390, 414, 390, Gold)
	    % Draw.Box (58, 360, 388, 420, Gold)
	    Font.Draw ("NOTES", 147, 368, Font11, Gold)
	elsif (My > 237 & My < 297) then                         %%%%%%%%%%%%%%%%% scenes
	    Draw.Line (40, 267, 58, 267, Gold)
	    Draw.Line (396, 267, 414, 267, Gold)
	    %Draw.Box (58, 237, 388, 297, Gold)
	    Font.Draw ("CUTSCENES", 101, 247, Font11, Gold)
	end if
    end if
    % Pic.Draw (Border, 0, 0, picMerge)
    if MapSettingsInstructionsboolean = true then                         %%%%%%%%%%%%%%%%%% TEXT %%%%%%%%%%%%%%%%%%%%%
	Pic.Draw (MainMenuSettingsInstructions, 0, 0, picMerge)
    elsif MapSettingsSoundboolean = true then                         %%%%%%%%%%%%%% MUSIC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	AnimationTime += 1
	%    for DetectTrack : 1 .. 17
	%        if TrackPlaying (DetectTrack) = true then
	Pic.Draw (MusicID (CurrentMusic), 548, 87, picMerge)                         %%% Draw Music INfo
	Font.Draw (intstr (CurrentMusic) + ". " + MusicTrack (CurrentMusic), 624, 591, FontBattle, Bronze)
	%      end if
	%   end for
	Pic.Draw (MainMenuSettingsSounds, 0, 0, picMerge)
	if (Mx - 533) * (614 - 560) - (563 - 533) * (My - 560) > 0 and
		(Mx - 563) * (508 - 614) - (563 - 563) * (My - 614) > 0 and
		(Mx - 563) * (560 - 508) - (533 - 563) * (My - 508) > 0 then
	    % Draw.Line (533, 560, 563, 614, 79)             % Current Turn Left
	    %  Draw.Line (533, 560, 563, 508, 79)
	    % Draw.Line (563, 508, 563, 614, 79)
	    % Draw.Box (563, 508, 593, 614, 79)
	    Pic.Draw (LeftArrow, 525, 720 - 220, picMerge)
	    if Mb = 1 then
		CurrentMusic -= 1
		if CurrentMusic < 1 then
		    CurrentMusic := 1
		else
		    fork PlayMusic (CurrentMusic)
		end if
		delay (69)
	    end if
	elsif Mx >= 563 & Mx <= 593 & My >= 508 & My <= 614 then
	    % Draw.Box (563, 508, 593, 614, 79)
	    %  Draw.Line (533, 560, 563, 614, 79)             % Current Turn Left
	    % Draw.Line (533, 560, 563, 508, 79)
	    % Draw.Line (563, 508, 563, 614, 79)
	    Pic.Draw (LeftArrow, 525, 720 - 220, picMerge)                         %527,220
	    if Mb = 1 then
		CurrentMusic -= 1
		if CurrentMusic < 1 then
		    CurrentMusic := 1
		else
		    fork PlayMusic (CurrentMusic)
		end if
		delay (69)
	    end if
	elsif (Mx - 1192) * (614 - 560) - (1162 - 1192) * (My - 560) < 0 and
		(Mx - 1162) * (508 - 614) - (1162 - 1162) * (My - 614) < 0 and
		(Mx - 1162) * (560 - 508) - (1192 - 1162) * (My - 508) < 0 then
	    %  Draw.Line (1192, 560, 1162, 614, 79)         % Current Turn Right
	    % Draw.Line (1192, 560, 1162, 508, 79)
	    % Draw.Line (1162, 508, 1162, 614, 79)
	    % Draw.Box (1132, 508, 1162, 614, 79)
	    Pic.Draw (RightArrow, 1130, 720 - 217, picMerge)
	    if Mb = 1 then
		CurrentMusic += 1
		if CurrentMusic > MusicSize then
		    CurrentMusic := MusicSize
		else
		    fork PlayMusic (CurrentMusic)
		end if
		delay (69)
	    end if
	elsif Mx >= 1132 & Mx <= 1162 & My >= 508 & My <= 614 then
	    %  Draw.Box (1132, 508, 1162, 614, 79)
	    %  Draw.Line (1192, 560, 1162, 614, 79)         % Current Turn Right
	    % Draw.Line (1192, 560, 1162, 508, 79)
	    % Draw.Line (1162, 508, 1162, 614, 79)
	    Pic.Draw (RightArrow, 1130, 720 - 217, picMerge)
	    if Mb = 1 then
		CurrentMusic += 1
		if CurrentMusic > MusicSize then
		    CurrentMusic := MusicSize
		else
		    fork PlayMusic (CurrentMusic)
		end if
		delay (69)
	    end if
	end if
    end if
end MapSettings

proc PinkSpiritCall
    Draw.FillBox (790, 70, 1263, 702, 16)
    Draw.Box (791, 71, 1262, 701, BorderBlue)
end PinkSpiritCall

proc City (CityName : string, CityID : int)
    var CityBackground : int
    var CityMarketboolean : boolean := false
    var CityPracticeboolean : boolean := false
    var CityMissionsboolean : boolean := false
    if Location (2).U = true then
	Location (3).U := true                 %% Velia >> Cron Castle
    end if
    if CityName = "Velia" then
	CityBackground := City_Velia
    else
	CityBackground := City_Velia
    end if
    loop
	Pic.Draw (CityBackground, 0, 0, picCopy)
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)

	if Pressed (KEY_ESC) then
	    exit
	end if
	if (Mx > 1227 & Mx < 1260) & (My > 668 & My < 700) then
	    Pic.Draw (ExitButton, 0, 0, picMerge)
	    if Mb = 1 then
		exit
	    end if
	end if

	if CityMarketboolean = true then
	    Pic.Draw (City_Market, 0, 0, picMerge)
	elsif CityPracticeboolean = true then
	    PreBattleMenu (CityID)
	    CityPracticeboolean := false
	    delay (120)
	end if

	if Mx >= 20 and Mx <= 200 then
	    if My >= 20 and My <= 80 then
		Pic.Draw (City_Buttons_Missions, 20, 20, picMerge)
		if Mb = 1 & CityMissionsboolean = false then
		    CityMissionsboolean := true
		    CityPracticeboolean := false
		    CityMarketboolean := false
		    delay (120)
		elsif Mb = 1 & CityMissionsboolean = true then
		    CityMissionsboolean := false
		    delay (120)
		end if
	    elsif My >= 90 and My <= 150 then
		Pic.Draw (City_Buttons_Practice, 20, 90, picMerge)
		if Mb = 1 & CityPracticeboolean = false then
		    CityPracticeboolean := true
		    CityMissionsboolean := false
		    CityMarketboolean := false
		    delay (120)
		elsif Mb = 1 & CityPracticeboolean = true then
		    CityPracticeboolean := false
		    delay (120)
		end if
	    elsif My >= 160 and My <= 220 then
		Pic.Draw (City_Buttons_Market, 20, 160, picMerge)
		if Mb = 1 & CityMarketboolean = false then
		    CityMarketboolean := true
		    CityPracticeboolean := false
		    CityMissionsboolean := false
		    delay (120)
		elsif Mb = 1 & CityMarketboolean = true then
		    CityMarketboolean := false
		    delay (120)
		end if
	    end if
	end if

	View.Update
	delay (10)
    end loop
end City
% Code for Map Menu,

proc World
    %%%%%%%%%%%%%%%%%%%
    DetermineMapUnlocked
    ActiveUser := 1
    %%%%%%%%%%%%%%%%%%%%%%
    loop
	% basic detection principles
	Input.KeyDown (Pressed)
	Mouse.Where (Mx, My, Mb)
	if Mb = 0 then
	    MouseReady := true
	else
	end if
	% background
	Pic.Draw (MapBMP, 0, 0, picCopy)
	% Font.Draw ("PSX: " + intstr (PSX) + " - PSY: " + intstr (PSY) + " AT: " + intstr(AnimationTime), 1050, 20, Font1, 25)
	% Font.Draw ("MX: " + intstr (Mx) + " - MY: " + intstr (My), 1050, 20, Font1, 25)

	%%% Map overlay, hide locked
	for UnlockMap : 1 .. 15
	    if MapOverlayPosition (UnlockMap).U = false then
		Pic.Draw (MapOverlay, 12 - 251 + 251 * MapOverlayPosition (UnlockMap).X, 66 - 214 + 214 * MapOverlayPosition (UnlockMap).Y, picMerge)
	    else
	    end if
	end for
	% Selection
	if MapStoryboolean = true then
	    MapStory
	    MapStoryboolean := false
	elsif MapPartyboolean = true then
	    MapParty
	elsif MapInventoryboolean = true then
	    MapInventory
	elsif MapFileIOboolean = true then
	    MapFileIO
	elsif MapSettingsboolean = true then
	    MapSettings
	elsif PinkSpiritboolean = true then
	    PinkSpiritCall
	end if

	%%%%%%%%%%%%%%%%%%%%% Map city / training selections %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if PinkSpiritboolean = false & MapPartyboolean = false & MapInventoryboolean = false
		& MapFileIOboolean = false & MapSettingsboolean = false then
	    for LCycle : 1 .. LocationSize
		if (Mx - Location (LCycle).X) ** 2 + (My - Location (LCycle).Y) ** 2 <= 27 ** 2 then
		    if Location (LCycle).U = true then
			if Location (LCycle).T not= 3 then
			    Draw.Box (Location (LCycle).X - 21, Location (LCycle).Y - 21, Location (LCycle).X + 21, Location (LCycle).Y + 21, PSOWhite)
			    Draw.Box (Location (LCycle).X - 22, Location (LCycle).Y - 22, Location (LCycle).X + 22, Location (LCycle).Y + 22, PSOWhite)
			else
			    Draw.Oval (Location (LCycle).X, Location (LCycle).Y, 80, 80, PSOWhite)
			    Draw.Oval (Location (LCycle).X, Location (LCycle).Y, 75, 75, PSOWhite)
			end if
			if LCycle = 9 or LCycle = 10| LCycle = 11 then                     %%%%%%%%%%%%%%
			    Draw.Line (Mx - 95 + 13, My + 13, Mx - 95 + 23, My + 13, PSOBlue)
			    Draw.Line (Mx + 13, My - 13, Mx - 95 + 13, My - 13, PSOBlue)

			    Draw.Line (Mx - 95 + 13, My + 3, Mx - 95 + 13, My + 13, PSOBlue)
			    Draw.Line (Mx - 95 + 13, My - 3, Mx - 95 + 13, My - 13, PSOBlue)

			    Font.Draw (Location (LCycle).N, Mx - 95 + 14, My - 10, Font1, 16)                     %% Name L
			    Font.Draw (Location (LCycle).N, Mx - 95 + 18, My - 10, Font1, 16)                     %% Name R
			    Font.Draw (Location (LCycle).N, Mx - 95 + 16, My - 8, Font1, 16)                     % Top
			    Font.Draw (Location (LCycle).N, Mx - 95 + 16, My - 12, Font1, 16)
			    Font.Draw (Location (LCycle).N, Mx - 95 + 14, My - 8, Font1, 16) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Left Up
			    Font.Draw (Location (LCycle).N, Mx - 95 + 14, My - 12, Font1, 16)                     %% Left Down
			    Font.Draw (Location (LCycle).N, Mx - 95 + 18, My - 8, Font1, 16)                     % Right Up
			    Font.Draw (Location (LCycle).N, Mx - 95 + 18, My - 12, Font1, 16) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Right Down
			    Font.Draw (Location (LCycle).N, Mx - 95 + 16, My - 10, Font1, 31)
			    Font.Draw (Location (LCycle).D, Mx - 80, My - 30, Font1, 16)                     %% Type L
			    Font.Draw (Location (LCycle).D, Mx - 95 + 17, My - 30, Font1, 16)                     %% Type R
			    Font.Draw (Location (LCycle).D, Mx - 95 + 16, My - 29, Font1, 16)                     % Top
			    Font.Draw (Location (LCycle).D, Mx - 95 + 16, My - 31, Font1, 16)                     % Bot
			    Font.Draw (Location (LCycle).D, Mx - 95 + 16, My - 30, Font1, 31)
			else
			    Draw.Line (Mx + 13, My + 13, Mx + 23, My + 13, PSOBlue)
			    Draw.Line (Mx + 13, My - 13, Mx + 95 - 13, My - 13, PSOBlue)

			    Draw.Line (Mx + 13, My + 3, Mx + 13, My + 13, PSOBlue)
			    Draw.Line (Mx + 13, My - 3, Mx + 13, My - 13, PSOBlue)

			    %  Draw.FillBox (Mx + 16, My - 40, Mx + 190, My + 10, 16)
			    Font.Draw (Location (LCycle).N, Mx + 15, My - 10, Font1, 16)                     %% Name L
			    Font.Draw (Location (LCycle).N, Mx + 17, My - 10, Font1, 16)                     %% Name R
			    Font.Draw (Location (LCycle).N, Mx + 16, My - 9, Font1, 16)                     % Top
			    Font.Draw (Location (LCycle).N, Mx + 16, My - 11, Font1, 16)                     % Bot
			    Font.Draw (Location (LCycle).N, Mx + 16, My - 10, Font1, 31)
			    Font.Draw (Location (LCycle).D, Mx + 15, My - 30, Font1, 16)                     %% Type L
			    Font.Draw (Location (LCycle).D, Mx + 17, My - 30, Font1, 16)                     %% Type R
			    Font.Draw (Location (LCycle).D, Mx + 16, My - 29, Font1, 16)                     % Top
			    Font.Draw (Location (LCycle).D, Mx + 16, My - 31, Font1, 16)                     % Bot
			    Font.Draw (Location (LCycle).D, Mx + 16, My - 30, Font1, 31)
			end if
			if Mb = 1 then
			    if Location (LCycle).T = 0 then
				City (Location (LCycle).N, LCycle)
			    else
				PreBattleMenu (LCycle)
			    end if
			end if
		    end if
		end if
	    end for
	end if

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%% 5 main choices %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if (My > 18 & My < 57) then
	    if (Mx > 19 & Mx < 198) then                         % Story
		%Draw.Line (25, 38, 50, 38, Gold)             % Highlighting Middle
		%Draw.Line (167, 38, 192, 38, Gold)             % Highlighting Middle
		%  Draw.Line (50, 21, 50, 54, Gold) % Midbar
		% Draw.Line (167, 21, 167, 54, Gold) % Midbar
		Draw.Line (20, 19, 197, 19, PSODarkBlue)                         % Highlighting bottom
		Draw.Line (20, 21, 197, 21, PSOWhite)                         % Highlighting Bottom
		Draw.Line (20, 56, 197, 56, PSODarkBlue)                         % Highlighting Top
		Draw.Line (20, 54, 197, 54, PSOWhite)                         % Highlighting Top
		if Mb = 1 & MouseReady = true then
		    if MapStoryboolean = false then
			PinkSpiritboolean := false
			MapPartyboolean := false
			MapInventoryboolean := false
			MapFileIOboolean := false
			MapSettingsboolean := false
			MapStoryboolean := false
			MapStoryboolean := true
		    else
			MapStoryboolean := false
		    end if
		    MouseReady := false
		end if
	    elsif (Mx > 212 & Mx < 391) then                         % Party
		%Draw.Line (35 + 183, 38, 60 + 183, 38, Gold)             % Highlighting Middle
		%Draw.Line (157 + 203, 38, 182 + 203, 38, Gold)             % Highlighting Middle
		%  Draw.Line (60 + 203, 21, 60 + 203, 54, Gold) % Midbar
		% Draw.Line (157 + 183, 21, 157 + 183, 54, Gold) % Midbar
		Draw.Line (213, 19, 390, 19, PSODarkBlue)                         % Highlighting
		Draw.Line (213, 21, 390, 21, PSOWhite)                         % Highlighting
		Draw.Line (213, 56, 390, 56, PSODarkBlue)                         % Highlighting Top
		Draw.Line (213, 54, 390, 54, PSOWhite)                         % Highlighting Top
		if Mb = 1 & MouseReady = true then
		    if MapPartyboolean = false then
			PinkSpiritboolean := false
			MapPartyboolean := false
			MapInventoryboolean := false
			MapFileIOboolean := false
			MapSettingsboolean := false
			MapStoryboolean := false
			MapPartyboolean := true
		    else
			MapPartyboolean := false
		    end if
		    MouseReady := false
		end if
	    elsif (Mx > 407 & Mx < 586) then                         % Inventory
		%Draw.Line (35 + 378, 38, 60 + 378, 38, Gold)             % Highlighting Middle
		%Draw.Line (157 + 398, 38, 182 + 398, 38, Gold)             % Highlighting Middle
		%  Draw.Line (60 + 378, 21, 60 + 378, 54, Gold) % Midbar
		%  Draw.Line (157 + 398, 21, 157 + 398, 54, Gold) % Midbar
		Draw.Line (408, 19, 585, 19, PSODarkBlue)                         % Highlighting
		Draw.Line (408, 21, 585, 21, PSOWhite)                         % Highlighting
		Draw.Line (408, 56, 585, 56, PSODarkBlue)                         % Highlighting Top
		Draw.Line (408, 54, 585, 54, PSOWhite)                         % Highlighting Top
		if Mb = 1 & MouseReady = true then
		    if MapInventoryboolean = false then
			PinkSpiritboolean := false
			MapPartyboolean := false
			MapInventoryboolean := false
			MapFileIOboolean := false
			MapSettingsboolean := false
			MapStoryboolean := false
			MapInventoryboolean := true
		    else
			MapInventoryboolean := false
		    end if
		    MouseReady := false
		end if
	    elsif (Mx > 602 & Mx < 781) then                         % File I O
		%Draw.Line (35 + 573, 38, 60 + 573, 38, Gold)             % Highlighting Middle
		%Draw.Line (157 + 593, 38, 182 + 593, 38, Gold)             % Highlighting Middle
		% Draw.Line (60 + 573, 21, 60 + 573, 54, Gold) % Midbar
		% Draw.Line (157 + 593, 21, 157 + 593, 54, Gold) % Midbar
		Draw.Line (603, 19, 780, 19, PSODarkBlue)                         % Highlighting
		Draw.Line (603, 21, 780, 21, PSOWhite)                         % Highlighting
		Draw.Line (603, 56, 780, 56, PSODarkBlue)                         % Highlighting Top
		Draw.Line (603, 54, 780, 54, PSOWhite)                         % Highlighting Top
		if Mb = 1 & MouseReady = true then
		    if MapFileIOboolean = false then
			PinkSpiritboolean := false
			MapPartyboolean := false
			MapInventoryboolean := false
			MapFileIOboolean := false
			MapSettingsboolean := false
			MapStoryboolean := false
			MapFileIOboolean := true
		    else
			MapFileIOboolean := false
		    end if
		    MouseReady := false
		end if
	    elsif (Mx > 798 & Mx < 978) then                         % Settings
		%Draw.Line (35 + 769, 38, 60 + 769, 38, Gold)             % Highlighting Middle
		%Draw.Line (157 + 789, 38, 182 + 789, 38, Gold)             % Highlighting Middle
		%  Draw.Line (60 + 769, 21, 60 + 769, 54, Gold) % Midbar
		% Draw.Line (157 + 789, 21, 157 + 789, 54, Gold) % Midbar
		Draw.Line (799, 19, 977, 19, PSODarkBlue)                         % Highlighting
		Draw.Line (799, 21, 977, 21, PSOWhite)                         % Highlighting
		Draw.Line (799, 56, 977, 56, PSODarkBlue)                         % Highlighting Top
		Draw.Line (799, 54, 977, 54, PSOWhite)                         % Highlighting Top
		if Mb = 1 & MouseReady = true then
		    if MapSettingsboolean = false then
			PinkSpiritboolean := false
			MapPartyboolean := false
			MapInventoryboolean := false
			MapFileIOboolean := false
			MapSettingsboolean := false
			MapStoryboolean := false
			MapSettingsboolean := true
		    else
			MapSettingsboolean := false
		    end if
		    MouseReady := false
		end if
	    else
	    end if
	end if
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	if (Mx - 1239) ** 2 + (My - 40) ** 2 <= 14 ** 2 & Mx > 0 & Mx < maxx and My > 0 & My < maxy then
	    if PSX <= -6 then
		PSX := -5
		PSXvalue := (Rand.Int (1, 2))
	    elsif PSX >= 6 then
		PSX := 5
		PSXvalue := (Rand.Int (-2, -1))
	    end if
	    if PSY <= -4 then
		PSY := -3
		PSYvalue := (Rand.Int (1, 2))
	    elsif PSY >= 4 then
		PSY := 3
		PSYvalue := (Rand.Int (-2, -1))
	    end if
	    Pic.Draw (PinkSpirit, 1222 + PSX, 24 + PSY, picMerge)                         %%%%%%%%%%%%%%%%% Pink Spirit %%%%%%%%%%%%%%%%%%%%%%%%%
	    Font.Draw ("??", 1222, 55, Font2, 6)
	    if Mb = 1 & MouseReady = true then
		if PinkSpiritboolean = false then
		    MapPartyboolean := false
		    MapInventoryboolean := false
		    MapFileIOboolean := false
		    MapSettingsboolean := false
		    MapStoryboolean := false
		    MapSettingsboolean := false
		    PinkSpiritboolean := true
		else
		    PinkSpiritboolean := false
		end if
		MouseReady := false
	    end if
	else
	    Pic.Draw (PinkSpirit, 1222, 24, picMerge)                         %%%%%%%%%%%%%%%%% Pink Spirit %%%%%%%%%%%%%%%%%%%%%%%%%
	end if

	AnimationTime += 1
	if AnimationTime >= 6 then                         %%% Animate pink spirit
	    %   Draw.Oval (Rand.Int (1211, 1266), Rand.Int (16, 65), 1, 1, Gold) %%%%DUST
	    %   Draw.Oval (Rand.Int (1211, 1266), Rand.Int (16, 63), 1, 1, Orange)
	    PSX += PSXvalue
	    PSY += PSYvalue
	    AnimationTime := 0
	end if
	%%% Silver // WEalth
	Font.Draw (intstr (Silver), 1048, 30, FontChat, 25)
	delay (5)                         % FPS 60
	View.Update

    end loop
end World

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load Game.
%
%
proc LoadGame
    var LoadSelected : boolean := false
    var SaveNumber : int := 1
    var LoadXFormat, LoadYFormat : int := 0
    var SelectedChapter : int := -100
    var SelectedIsGameFinished : boolean := false
    var SelectedWealth : int := 0

    for LoadHighlight : 1 .. 9
	if Mx >= 1010 & Mx <= 1010 + 250 & My > (414 - (49 * (LoadHighlight - 1))) & My < (415 + 49) - (49 * (LoadHighlight - 1)) then
	    Pic.Draw (LF_LOAD_Selected, 1010 - 60, 414 - (49 * (LoadHighlight - 1)), picMerge)
	    if Mb = 1 then
		LoadSelected := true
		SaveNumber := LoadHighlight
		exit
	    end if
	    LoadXFormat := 1023 - 60
	else
	    LoadXFormat := 1023
	end if

	SaveName := "Data\\Save" + intstr (LoadHighlight) + ".txt"
	LoadYFormat := (419) - (49 * (LoadHighlight - 1))
	if File.Exists (SaveName) then
	    open : stream, SaveName, get
	    get : stream, SaveNumber
	    get : stream, FileName
	    get : stream, SelectedIsGameFinished
	    get : stream, SelectedChapter
	    get : stream, SelectedWealth
	    close : stream
	end if
	Font.Draw (intstr (SaveNumber) + ": " + FileName, LoadXFormat, LoadYFormat, FontInfo, Gold)
	if Mx >= 1010 & Mx <= 1010 + 250 & My > (414 - (49 * (LoadHighlight - 1))) & My < (415 + 49) - (49 * (LoadHighlight - 1)) then
	    Font.Draw ("Selected: " + FileName, 320, 280, FontVictoryScene, Gold)
	    Font.Draw ("Chapter: " + intstr (SelectedChapter), 350, 220, FontInfo, PSOWhite)
	    Font.Draw ("Silver: " + intstr (SelectedWealth), 350, 190, FontInfo, PSOWhite)
	end if
    end for

    if LoadSelected = true then
	SaveName := "Data\\Save" + intstr (SaveNumber) + ".txt"
	if File.Exists (SaveName) then
	    open : stream, SaveName, get
	    get : stream, CurrentOperatingFileNumber
	    get : stream, CurrentOperatingFileName
	    get : stream, UnlockedMap
	    get : stream, Chapter
	    get : stream, Silver
	    for CycleMembers : 1 .. 10
		get : stream, Party (CycleMembers).Body
		get : stream, Party (CycleMembers).Identity
		get : stream, Party (CycleMembers).UB
		get : stream, Party (CycleMembers).Avatar
		get : stream, Party (CycleMembers).Experience
		get : stream, Party (CycleMembers).Name
		get : stream, Party (CycleMembers).Level
		get : stream, Party (CycleMembers).TotalLevel
		get : stream, Party (CycleMembers).ChangeLevel
		get : stream, Party (CycleMembers).Party
		get : stream, Party (CycleMembers).Health
		get : stream, Party (CycleMembers).TotalHealth
		get : stream, Party (CycleMembers).Attack
		get : stream, Party (CycleMembers).TotalAttack
		get : stream, Party (CycleMembers).ChangeAttack
		get : stream, Party (CycleMembers).Defense
		get : stream, Party (CycleMembers).ChangeDefense
		get : stream, Party (CycleMembers).Weapon
		get : stream, Party (CycleMembers).TotalDefense
		get : stream, Party (CycleMembers).CritChance
		get : stream, Party (CycleMembers).TotalCritChance
		get : stream, Party (CycleMembers).ChangeCritChance
		get : stream, Party (CycleMembers).CritDamage
		get : stream, Party (CycleMembers).TotalCritDamage
		get : stream, Party (CycleMembers).ChangeCritDamage
		get : stream, Party (CycleMembers).Power
		get : stream, Party (CycleMembers).TotalPower
		get : stream, Party (CycleMembers).Speed
		get : stream, Party (CycleMembers).ChangeSpeed
		get : stream, Party (CycleMembers).TotalSpeed
		get : stream, Party (CycleMembers).PositionX
		get : stream, Party (CycleMembers).PositionY
		for CShard : 1 .. 3
		    get : stream, Party (CycleMembers).GearType (CShard)
		    get : stream, Party (CycleMembers).GearStat (CShard)
		end for
		for CSkill : 1 .. 6
		    get : stream, Party (CycleMembers).Skill (CSkill).SkillID
		    get : stream, Party (CycleMembers).Skill (CSkill).Level
		end for
		for CBSkill : 1 .. 10
		    get : stream, Party (CycleMembers).BaseSkill (CBSkill).SkillID
		    get : stream, Party (CycleMembers).BaseSkill (CBSkill).Level
		end for
	    end for
	    for Cycle : 1 .. LocationSize
		get : stream, Location (Cycle).U
	    end for
	    for IVert : 1 .. 6
		for IHori : 1 .. 7
		    get : stream, Inventory (IHori, IVert).Type
		    get : stream, Inventory (IHori, IVert).Stat
		end for
	    end for
	    close : stream
	    LoadSelected := false
	    ActiveName := CurrentOperatingFileName
	    ActiveUser := 1
	    for ClearCharacterCache : 4 .. 12
		Character (ClearCharacterCache) := EmptyNPC
	    end for
	    for InstallCycle : 1 .. 10
		ReinstallImages (Party (InstallCycle).Name, InstallCycle)
	    end for
	    delay (150)
	    World
	end if
    end if
    %Font.Draw ("x" + intstr (Mx) + " -y" + intstr (My), 20, 20, FontChat, Gold)
end LoadGame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Intro


View.Set ("nooffscreenonly")
Pic.DrawSpecial (IntroBMP, 0, 0, picCopy, picFadeIn, 1500)
delay (3000)
Pic.DrawSpecial (MainMenuBMP, 0, 0, picCopy, picFadeIn, 1500)
View.Set ("offscreenonly")

% Loop Vars to be moved
var MML : boolean := false
% Game Loop
loop

    Pic.Draw (MainMenuBMP, 0, 0, picCopy)
    Font.Draw ("Version 1.2.1", 12, 12, Font2, 31)

    Mouse.Where (Mx, My, Mb)
    Input.KeyDown (Pressed)
    %    var DisplayMousePos : string := "(Mx: " + intstr (Mx) + " My: " + intstr (My) + ")"
    %    Font.Draw ("MX: " + intstr (Mx) + " - MY: " + intstr (My), 20, 20, Font1, 25)
    %   New, Load, Quit Options
    if MML = true then
	Pic.Draw (LF_LOAD_Menu, 0, 0, picCopy)
	LoadGame
	if Pressed (KEY_ESC) then
	    MML := false
	end if
    elsif (Mx > 549 & Mx < 730) then
	if (My > 178 & My < 239) then                         % Quit
	    Pic.Draw (MainMenuQuit, 0, 0, picMerge)
	    if (Mb = 1) then
		Exit := true
		exit
	    end if
	elsif (My > 268 & My < 328) then                         % Load
	    Pic.Draw (MainMenuLoad, 0, 0, picMerge)
	    if Mb = 1 then
		MML := true
		delay (150)
	    end if
	elsif (My > 356 & My < 416) then                         % New
	    Pic.Draw (MainMenuNew, 0, 0, picMerge)
	    if Mb = 1 then
		delay (150)
		Chapter := -200
		MapStoryboolean := true
		World
		exit
	    end if
	else
	end if
    end if
    %  var SWidthTest : string := "ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz 1234567890"
    %  Font.Draw (SWidthTest,
    %      10, 300, FontChat, BorderBlue)
    %Draw.Text ("x:" + intstr (Mx) + " -y:" + intstr (My), 15, 100, FontChat, 31)
    delay (5)                         % FPS 60
    View.Update


end loop

View.Set ("nooffscreenonly")
Pic.DrawSpecial (IntroBMP, 0, 0, picCopy, picFadeIn, 5000)

/*if MML = true then
 Pic.Draw (BattleScene_Marsh, 0, 0, picCopy)
 Pic.Draw (BattleMenuBMP, 0, 0, picMerge)
 Pic.Draw (AV_Sillness, 100, 100, picMerge)
 Pic.Draw (AV_Zefan, 100, 150, picMerge)
 Pic.Draw (AV_Ravness, 100, 200, picMerge)
 Pic.Draw (AV_Drin, 100, 250, picMerge)
 Pic.Draw (AV_Cosseus, 100, 300, picMerge)
 Pic.Draw (CB_Zefan, 200, 100, picMerge)
 Pic.Draw (CB_Sillness, 200, 200, picMerge)
 Pic.Draw (CB_Ravness, 200, 300, picMerge)
 Pic.Draw (CB_Drin, 200, 400, picMerge)
 Pic.Draw (CB_Cosseus, 200, 500, picMerge)
 Pic.Draw (GUIPartyInfo, 350, 100, picMerge)
 Pic.Draw (GUIBossInfo, 450, 140, picMerge)
 Pic.Draw (GUIFoeInfo, 550, 70, picMerge)
 end if */
