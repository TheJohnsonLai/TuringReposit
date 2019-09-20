%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title: Powerless            %%%%%%
%Coder: Johnson Lai %% (J-son/Json)
%Program: Turing 4.1.1 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Project starts: April 15, 2018 %%%
%Notes: Design a lightly drawn  %%%
%RPG Turn based game with blocks %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Powerless.t is main %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Notes --
% Week. 1 - Lobby creation in Paint.net, 5 main buttons working
% Week. 2 - Battle procedure, command bar, and sprites
% Week. 3 - BattleSkills working, adjusted Command Bar & Outline, Turn Pointer Added, Skills working, healthbar added, Plains.bmp added
% Description WIP, Exit button,
% Week. 4 - Healthbars & Armor, overlay display

include "Module\\ImportStart.t"
setscreen ("graphics:1280,720,title:Powerless by Johnson Lai,offscreenonly,nobuttonbar")

proc Lobby
    % Local Variables
    var lobbySubText : string := ""
    % Challenge list
    var ChallengeSelected : int := 0
    var ChallengeOnScreen : int := 0
    MovedY := 0
    StoredY := 0
    % Character
    var CharacterSelected : int := 0
    % System
    var SystemSaveB : boolean := false % SAVE CLICKED?
    var SystemLoadB : boolean := false
    var SystemConfirmSaveB : boolean := false % CONFIRM ON?
    var SystemConfirmLoadB : boolean := false
    var SystemProfileSelected : int := 0
    var LobbyDisplayOn : array 0 .. 4 of boolean % Lobby Main Options (5)
    for b : 0 .. 4
	LobbyDisplayOn (b) := false
    end for
    % Set to default // Handling
    MovedX := 0
    StoredX := 0
    loop
	% reset local variable
	lobbySubText := ""
	% Background
	cls
	Pic.Draw (lobbyMap, MovedX, 0, picCopy)
	Pic.Draw (lobbyInterface, 0, 0, picMerge)
	Pic.Draw (outline, 0, 0, picMerge)
	%Input
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)
	Debug
	% Handling
	MouseRestriction
	%%%%%%%%%%%%%%%%% EXIT %%%%%%%%%%%%%%%%
	if LobbyDisplayOn (2)| LobbyDisplayOn (3)| LobbyDisplayOn (4) then
	    if DetectCircle (29, 688, 13) then % Diamond is Old "Exit", Circle is new ESC
		Pic.Draw (ExitTrue, 15, 675, picMerge)
		if Mb = 1 & MouseReady then
		    if CharacterSelected > 0 then
			CharacterSelected := 0
		    elsif SystemConfirmSaveB| SystemConfirmLoadB then % Stack removal
			SystemConfirmSaveB := false
			SystemConfirmLoadB := false
		    elsif SystemSaveB| SystemLoadB then
			SystemSaveB := false
			SystemLoadB := false
		    elsif LobbyDisplayOn (2) then
			MovedY := 0
			StoredY := 0
			LobbyDisplayOn (2) := false
		    elsif LobbyDisplayOn (3) then
			LobbyDisplayOn (3) := false
		    elsif LobbyDisplayOn (4) then
			LobbyDisplayOn (4) := false
			SystemSaveB := false % SAVE CLICKED?
			SystemLoadB := false
			SystemConfirmSaveB := false % CONFIRM ON?
			SystemConfirmLoadB := false
		    end if
		    StoredX := Mx % Ensure StoredX does not "skip" (Last known = button, New known = exit location)
		    MouseReady := false
		end if
	    else
		Pic.Draw (ExitFalse, 15, 675, picMerge)
	    end if
	else
	    SlideMapHorizontal
	end if
	% Calculation - Main Lobby Selection
	for a : 0 .. 4
	    if (Mx > 100 + a * 225 & Mx < 280 + a * 225) & (My >= 23 & My <= 63) then
		Pic.Draw (lobbyHover, 100 + a * 225, 23, picMerge)
		if Mb = 1 & MouseReady then
		    if LobbyDisplayOn (a) = false then % If click while in lobby
			for cancelScreen : 0 .. 4
			    LobbyDisplayOn (cancelScreen) := false
			end for
			LobbyDisplayOn (a) := true
		    else % else if cancel window
			if a = 3 then
			    CharacterSelected := 0
			elsif a = 4 then
			    SystemSaveB := false % SAVE CLICKED?
			    SystemLoadB := false
			    SystemConfirmSaveB := false % CONFIRM ON?
			    SystemConfirmLoadB := false
			end if
			LobbyDisplayOn (a) := false
		    end if
		    MouseReady := false     %% Swap to NON ready until mouse is off
		end if
	    end if
	end for
	% Escape Key
	if Pressed (KEY_ESC) then % Exit - Lobby
	    for k : 0 .. 4
		if LobbyDisplayOn (k) then
		    LobbyDisplayOn (k) := false
		    delay (50) %% Prevent click spam on button
		else
		end if
	    end for
	end if
	%% Display Lobby Options - In Depth
	if LobbyDisplayOn (0) = true then  %%%%%%%%%%%%% Lobby - Story %%%%%%%%%%%%%%%%%%% !!!
	    Pic.Draw (lobbyHoverRed, 103, 13, picMerge)
	    PrintCoordinates
	    for i : 0 .. storyNum %%%%%%%%%%%%% Lobby - Story Diamond Detection
		if (storyC (i, 0) + MovedX) > 0 & (storyC (i, 0) + MovedX) < 1280 then
		    if DetectDiamond (storyC (i, 0) + MovedX, storyC (i, 1), 50) then
			DrawSBorder (storyC (i, 0) + MovedX, storyC (i, 1), 47, FoeRed)
			lobbySubText := storyN (i) + ": " + storyD (i)
			if Mb = 1 then
			    %determineBattle ("Story", 1000)
			end if
		    else
			DrawSBorder (storyC (i, 0) + MovedX, storyC (i, 1), 44, PSOBlue)
		    end if
		end if
	    end for
	    % subSNum = Substory Number. Number increases through story progression. Found in Missions.t
	    for i : 0 .. subSNum %%%%%%%%%%%%%% Lobby - subStory Diamond Detection
		if DetectCircle (subStoryC (i, 0) + MovedX, subStoryC (i, 1), 30) then
		    DrawSBorder (subStoryC (i, 0) + MovedX, subStoryC (i, 1), 30, Orange)
		    lobbySubText := (subStoryN (i) + ": " + subStoryD (i))
		    if Mb = 1 then
			% determineBattle ("Story", i)
		    end if
		else
		    DrawSBorder (subStoryC (i, 0) + MovedX, subStoryC (i, 1), 28, 27)
		end if
	    end for
	elsif LobbyDisplayOn (1) = true then %%%%%%%%%%%% Lobby - Excursion %%%%%%%%%%%%%%R
	    Pic.Draw (lobbyHoverRed, 328, 13, picMerge)
	    % PrintCoordinates
	    if excNum < 0 then
		lobbySubText := "< No excursions available >"
	    end if
	    for i : 0 .. excNum %%%%%%%%%%%%%%% EXCURSIONS %%%%%%%%%%%%% !!!
		if DetectCircle (excursionC (i, 0) + MovedX, excursionC (i, 1), 30) then
		    % If mouse position is within an Excursion diamond (circle detection)
		    DrawSBorder (excursionC (i, 0) + MovedX, excursionC (i, 1), 30, Orange)
		    lobbySubText := (excursionN (i) + ": " + excursionD (i))
		    % Call the "Subtitle" fcn with string parameter (excursionNumber(array) + :: + excursionDescription(arr))
		    if Mb = 1 then
			determineBattle ("Excursion", 1000)
		    end if
		else
		    DrawSBorder (excursionC (i, 0) + MovedX, excursionC (i, 1), 28, PSOBlue)
		end if
	    end for
	elsif LobbyDisplayOn (2) = true then %%%% Lobby - CHALLENGE %%%%%% [ 2 ] %%%%%%%%%%%%%
	    Pic.Draw (lobbyChallenge, 0, 0, picMerge)
	    SlideChallengeVertical
	    if Mx > 41 & Mx < 638 & My > 197 & My < 609 & Mb = 1 then %% Match Slide Chall Vertical
		for e : 0 .. 13 + 2 %% Number of Challenges = 13 + 7 (?) (15 Derived from 13+2 to cover SCROLL DOWN)
		    if MovedY > (e * 60) then
			ChallengeOnScreen := e
		    end if
		end for
	    end if
	    var ListSevenChoices : int := 0
	    if ChallengeOnScreen > 13 then
		ListSevenChoices := (ChallengeOnScreen - 13)
	    end if
	    for d : ChallengeOnScreen .. ChallengeOnScreen + 7 - ListSevenChoices
		Draw.FillBox (250, MovedY + 560 - (d * 60), 441, MovedY + 560 + 45 - (d * 60), 29)
		Font.Draw ("Challenge # " + intstr (d), 270, MovedY + 565 - (d * 60), FontM14, 16) % Debug
		if Mx > 200 & Mx < 441 & My > MovedY + 560 - (d * 60) & My < MovedY + 560 + 45 - (d * 60) then
		    if My > 197 & My < 609 then %% Within red screen
			Draw.Box (250, MovedY + 560 - (d * 60), 441, MovedY + 560 + 45 - (d * 60), HealthPink)
			% Font.Draw ("IsHover " + intstr (d), 42, 444, FontM14, 31) % Debug
			lobbySubText := "Selected challenge: " + intstr (d)
		    end if
		end if
	    end for
	    Pic.Draw (lobbyChallengeOverlay, 11, 138, picMerge) % Cover challenge boxes that scroll up/down
	    %%% Arrows (Triangle, scroll Up or Down)
	    var ScrollUpB, ScrollDownB : boolean := false
	    ScrollUpB := ScrollTriangle (318, 615, 346, 640, 373, 615)
	    ScrollDownB := ScrollTriangle (318, 192, 373, 192, 346, 164)
	    if ScrollUpB then
		Pic.Draw (ScrollUpHover, 317, 614, picMerge)
		if Mb = 1 then
		    MovedY -= 5
		    for e : 0 .. 13 + 2            %% Number of Challenges = 13 + 7 (?) (15 Derived from 13+2 to cover SCROLL DOWN)
			if MovedY > (e * 60) then
			    ChallengeOnScreen := e
			end if
		    end for
		end if
	    elsif ScrollDownB then
		Pic.Draw (ScrollDownHover, 317, 164, picMerge)
		if Mb = 1 then
		    MovedY += 5
		    for e : 0 .. 13 + 2            %% Number of Challenges = 13 + 7 (?) (15 Derived from 13+2 to cover SCROLL DOWN)
			if MovedY > (e * 60) then
			    ChallengeOnScreen := e
			end if
		    end for
		end if
	    end if
	elsif LobbyDisplayOn (3) = true then % Lobby - Character <selected> %
	    Pic.Draw (lobbyCharacter, 0, 0, picMerge)
	    if My >= 139 & My <= 589 then
		if Mx >= 117 & Mx <= 412 & CharacterSelected <= 0 then
		    Pic.Draw (CharacterHoverDragon, 117, 139, picMerge)
		    if Mb = 1 & MouseReady then
			CharacterSelected := 1
		    end if
		    lobbySubText := "Customize Dragon"
		elsif Mx >= 490 & Mx <= 785 & CharacterSelected <= 0 then
		    Pic.Draw (CharacterHoverBlue, 490, 139, picMerge)
		    if Mb = 1 & MouseReady then
			CharacterSelected := 2
		    end if
		    lobbySubText := "Customize Blue"
		elsif Mx >= 866 & Mx <= 1161 & CharacterSelected <= 0 then
		    Pic.Draw (CharacterHoverJuly, 866, 139, picMerge)
		    if Mb = 1 & MouseReady then
			CharacterSelected := 3
		    end if
		    lobbySubText := "Customize July"
		end if
	    end if
	    if My > 590 & My < 669 then
		if Mx > 117 & Mx < 412 then
		    Pic.Draw (CharacterHoverDragon, 117, 139, picMerge)
		    if Mb = 1 & MouseReady then
			if CharacterSelected = 1 then
			    CharacterSelected := 0
			else
			    CharacterSelected := 1
			end if
			MouseReady := false
		    end if
		elsif Mx > 490 & Mx < 785 then
		    Pic.Draw (CharacterHoverBlue, 490, 139, picMerge)
		    if Mb = 1 & MouseReady then
			if CharacterSelected = 2 then
			    CharacterSelected := 0
			else
			    CharacterSelected := 2
			end if
			MouseReady := false
		    end if
		elsif Mx > 866 & Mx < 1161 then
		    Pic.Draw (CharacterHoverJuly, 866, 139, picMerge)
		    if Mb = 1 & MouseReady then
			if CharacterSelected = 3 then
			    CharacterSelected := 0
			else
			    CharacterSelected := 3
			end if
			MouseReady := false
		    end if
		end if
	    end if
	    if CharacterSelected >= 1 & CharacterSelected <= 3 then     % If Character Chosen
		if CharacterSelected = 1 then
		    Pic.Draw (CharacterHoverDragon, 117, 139, picMerge)
		elsif CharacterSelected = 2 then
		    Pic.Draw (CharacterHoverBlue, 490, 139, picMerge)
		elsif CharacterSelected = 3 then
		    Pic.Draw (CharacterHoverJuly, 866, 139, picMerge)
		end if
		Pic.Draw (lobbyCharacterCustomize, 0, 0, picMerge)
		var dspLevel : string := "1"
		var dspRank : string := "C"
		var dspWeapon : string := "1"
		var dspGarb : string := "C"
		if CharacterSelected = 1 then     % Change to for loop, character record
		    dspLevel := intstr (cDragon.level)
		    dspRank := RankConversion (cDragon.rank)
		    dspWeapon := cDragon.weapon.wName
		    dspGarb := cDragon.garb.gName
		elsif CharacterSelected = 2 then
		    dspLevel := intstr (cBlue.level)
		    dspRank := RankConversion (cBlue.rank)
		    dspWeapon := cBlue.weapon.wName
		    dspGarb := cBlue.garb.gName
		elsif CharacterSelected = 3 then
		    dspLevel := intstr (cJuly.level)
		    dspRank := RankConversion (cJuly.rank)
		    dspWeapon := cJuly.weapon.wName
		    dspGarb := cJuly.garb.gName
		end if
		Font.Draw (dspLevel, 1280 div 2 - Font.Width (dspLevel, FontM14) div 2, 375, FontM14, 23)
		Font.Draw (dspRank, 1280 div 2 - Font.Width (dspRank, FontM14) div 2, 297, FontM14, 23)
		% Display gear, stats, skills
		Font.Draw (dspWeapon, 92, 453, FontM14, 24)
		Font.Draw (dspGarb, 92, 300, FontM14, 24)
		Draw.FillBox (171, 406, 300, 406 + 12, 24)         % Power
		Draw.FillBox (171, 371, 300, 371 + 12, 24)         % Speed
		Draw.FillBox (171, 252, 300, 252 + 12, 24)         % Health
		Draw.FillBox (171, 217, 300, 217 + 12, 24)         % Armor
	    end if
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% System %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	elsif LobbyDisplayOn (4) = true then     % System is active
	    Pic.Draw (lobbySystem, 0, 0, picMerge)
	    if SystemSaveB then     %% Left Side. Lobby - System - Save
		Pic.Draw (lobbySystemSave, 0, 0, picMerge)
		for c : 0 .. 4
		    if Mx > 800 - 1 & Mx < 800 + 310 & My > 516 - (c * 60) & My < 557 - (c * 60) then
			if SystemConfirmSaveB = false then
			    Pic.Draw (SystemProfileHover, 800, 517 - (c * 60), picMerge)
			    if Mb = 1 & MouseReady then
				SystemProfileSelected := c
				SystemConfirmSaveB := true
				MouseReady := false
			    end if
			end if
		    end if
		end for
		if SystemConfirmSaveB then     %% Top of Confirm (Text - write data?)
		    Pic.Draw (SystemProfileHover, 800, 517 - (SystemProfileSelected * 60), picMerge)
		    Pic.Draw (SystemConfirmSave, 435, 365 + 51, picMerge)
		end if
	    elsif SystemLoadB then     %% Right Side. Lobby - System - Load
		Pic.Draw (lobbySystemLoad, 0, 0, picMerge)
		for c : 0 .. 4
		    if Mx > 169 & Mx < 480 & My > 516 - (c * 60) & My < 557 - (c * 60) then
			if SystemConfirmLoadB = false then
			    Pic.Draw (SystemProfileHover, 170, 517 - (c * 60), picMerge)
			    if Mb = 1 & MouseReady then
				SystemProfileSelected := c
				SystemConfirmLoadB := true
				MouseReady := false
			    end if
			end if
		    end if
		end for
		if SystemConfirmLoadB then
		    Pic.Draw (SystemProfileHover, 170, 517 - (SystemProfileSelected * 60), picMerge)
		    Pic.Draw (SystemConfirmLoad, 435, 365 + 51, picMerge)
		end if
	    end if
	    if (SystemSaveB| SystemLoadB) & (SystemConfirmSaveB| SystemConfirmLoadB) then
		Pic.Draw (SystemConfirmYesNo, 435, 311, picMerge)
		if Mx > 437 & Mx < 640 & My > 300 + 51 & My < 360 + 51 then
		    Pic.Draw (SystemHoverYes, 437, 287 + 51, picMerge)
		    if Mb = 1 then
		    end if
		elsif Mx > 640 & Mx < 842 & My > 300 + 51 & My < 360 + 51 then
		    Pic.Draw (SystemHoverNo, 640, 287 + 51, picMerge)
		    if Mb = 1 then
			SystemConfirmLoadB := false
			SystemConfirmSaveB := false
		    end if
		end if
	    elsif My > 136 & My < 669 then
		if Mx > 11 & Mx < 639 & SystemLoadB = false then % Highlight Lobby-System-"Save" Option
		    Pic.Draw (SystemSaveHover, 589 + (50 - 420), 385, picMerge)
		    if Mb = 1 & MouseReady then
			if SystemSaveB then
			    SystemSaveB := false
			else
			    SystemSaveB := true
			end if
			MouseReady := false
		    end if
		elsif Mx > 641 & Mx < 1269 & SystemSaveB = false then % Highlight Lobby-System-"Load" Option
		    Pic.Draw (SystemLoadHover, 641, 385, picMerge)
		    if Mb = 1 & MouseReady then
			if SystemLoadB then
			    SystemLoadB := false
			else
			    SystemLoadB := true
			end if
			MouseReady := false
		    end if
		end if
	    end if
	end if
	% Draw subtitle
	Subtitle (lobbySubText)
	% Draw
	View.Update
    end loop
end Lobby

proc Introduction
    var introLoadSpeed : int := 1     %% 1500 DEFAULT, Change for debugging
    var introPause : int := 1     %% 2200 DEFAULT, Change for debugging
    var introLoadMenu : int := 1     %% 700 DEFAULT
    View.Set ("nooffscreenonly")
    Pic.DrawSpecial (introBMP, 0, 0, picCopy, picFadeIn, introLoadSpeed)
    delay (introPause)
    Pic.DrawSpecial (introMenuBMP, 0, 0, picCopy, picFadeIn, introLoadMenu)
    View.Set ("offscreenonly")
    View.Update
    delay (200)
end Introduction

proc main
    Introduction
    loop
	Pic.Draw (introMenuBMP, 0, 0, picCopy)
	%Font.Draw ("Version 1.0.0 - J-son", 12, 16, Font1, 25)
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)
	Debug

	if (Mx > 548 & Mx < 730) then
	    if (My >= 109 & My < 109 + 60) then                     % Quit
		Pic.Draw (iM3Hover, 550, 109, picMerge)
		if (Mb = 1) then
		end if
	    elsif (My >= 198 & My < 198 + 60) then                     % Load
		Pic.Draw (iM2Hover, 550, 198, picMerge)
		if Mb = 1 then
		end if
	    elsif (My >= 287 & My < 287 + 60) then                     % New
		Pic.Draw (iM1Hover, 550, 287, picMerge)
		if Mb = 1 then
		    Lobby
		end if
	    else
	    end if
	end if

	View.Update
	cls
    end loop
end main

%determineBattle ("Story", 1000)
Lobby
View.Set ("nooffscreenonly")
Pic.DrawSpecial (introBMP, 0, 0, picCopy, picFadeIn, 5000)
