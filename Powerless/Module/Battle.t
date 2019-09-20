% Battle.t - Pre menu, battle, win calculation

proc Battle (xAllyIn : array 0 .. 2 of characterInfo, xFoeIn : array 0 .. 2, 0 .. 4 of characterInfo, waves : int, background : int)
    % Diamond Array
    var drawBlock : array 0 .. 1, 0 .. 7 of int
    %% Allow variables to be assigned
    var xAlly : array 0 .. 2 of characterInfo
    xAlly := xAllyIn
    var xFoe : array 0 .. 2, 0 .. 4 of characterInfo
    xFoe := xFoeIn
    % Condition
    var isVictory : boolean := true
    var isLose : boolean := true
    var isExit : boolean := false
    var isTurn : boolean := true
    % Commands handling
    var activateDiamond : boolean := false % Precursor to ActivateSkill - Diamonds used? If so, animate command
    var activateSkill : boolean := false % Is a skill activated? If so, cast
    var beginSelect : boolean := false %% Indicates first diamond
    var startDiamond : int := 0 %% ID of first diamond
    var endDiamond : int := 0 %% ID of current diamond
    var directionSelect : string := "" %% Shows direction of diagonal selection
    var diamondHovered : int  %% Current diamond colour (0 = Purple,1,2)
    var diamondCount : int := 0 %% Count whether 1d, 2d, 4d used

    % Determine Whose Speed = 0
    var currentTurn : int := 0
    % Left & Right - Targets (ID)
    var currentTargAlly : int := 0
    var currentTargFoe : int := 0
    % Ally assign in parameter
    var currentWave : int := 0
    % 14 Diamonds, Random Shuffle
    var diamondOwner : array 0 .. 1, 0 .. 6 of int
    var diamondSelect : array 0 .. 1, 0 .. 6 of boolean %% Is the diamond selected? true if so
    for a : 0 .. 1 % Shuffle diamonds, start of battle (random)
	for b : 0 .. 6
	    diamondOwner (a, b) := Rand.Int (0, 2) % 0 = Purple, 1 = Blue, 2 = Bronze
	    diamondSelect (a, b) := false
	end for
    end for
    % Passives, Initiate type
    if xAlly (1).passive.pName = "Preemptive" then % 2 = Blue position (DPS)
	diamondOwner (0, 0) := 1
	diamondOwner (1, 0) := 1
	if xAlly (1).passive.pRank >= 3 then %% S+
	    diamondOwner (0, 1) := 1
	    diamondOwner (1, 1) := 1
	end if
    end if

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Waves / Main %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for cycleWave : 0 .. waves
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Battle Loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	loop
	    isLose := true %% Check ally status
	    for cycleLose : 0 .. 2
		if (xAlly (cycleLose).tempHealth >= 0) then
		    isLose := false
		end if
	    end for
	    %var nextWave : boolean := true
	    %for n : 0 .. 4
	    %    if (xFoe (cycleWave, n).health >= 0) then
	    %        nextWave := false
	    %    end if
	    %end for
	    if isLose then
		exit
		%elsif nextWave then
		%exit
	    end if
	    if isTurn then % Ally Turn
		isTurn := false
		%%%%%%%%%%%%%%%%%%%%% Screen, action, wait turn Loop %%%%%% !!!
		loop
		    diamondCount := 0
		    %%%%%%%%%%% Correction after kill
		    if (xFoe (cycleWave, currentTargFoe).tempHealth <= 0) then
			for b : 0 .. 4
			    if xFoe (cycleWave, b).tempHealth > 0 then
				currentTargFoe := b
			    end if
			end for
		    end if
		    if (xAlly (currentTargAlly).tempHealth <= 0) then
			for b : 0 .. 2
			    if xAlly (currentTargAlly).tempHealth > 0 then
				currentTargAlly := b
			    end if
			end for
		    end if
		    cls
		    % [Content1] Input
		    Mouse.Where (Mx, My, Mb)
		    Input.KeyDown (Pressed)
		    MouseRestriction
		    % [Content2] Images
		    % Pic.Draw (background, 0, 207, picCopy)
		    Pic.Draw (BattleDesign, 0, 0, picMerge)
		    %Pic.Draw (outlineBattle, 0, 0, picMerge)
		    % [Content3] Exit/Angel Detection
		    if DetectCircle (29, 688, 13) then
			Pic.Draw (ExitTrue, 16, 678, picMerge)
			if Mb = 1 then
			    isExit := true
			    exit
			end if
		    else
			Pic.Draw (ExitFalse, 16, 678, picMerge)
		    end if
		    if Mx > 54 and Mx < 134 and My > 682 and My < 700 then
			Pic.Draw (AngelFalseHover, 52, 678, picMerge)
			if Mb = 1 then
			end if
		    else
			Pic.Draw (AngelFalse, 52, 678, picMerge)
		    end if
		    % Avatar - Target
		    if (xAlly (currentTargAlly).health >= 0) then
			Pic.Draw (xAlly (currentTargAlly).avatar, 38, 37, picMerge)
		    end if
		    if (xFoe (cycleWave, currentTargFoe).tempHealth > 0) then
			Pic.Draw (xFoe (cycleWave, currentTargFoe).avatar, 1082, 37, picMerge)
		    end if
		    % Draw - Sprite
		    Pic.Draw (xAlly (1).sprite, 30 + (130 * 1), 240, picMerge) % Overlap remove
		    DrawHPA (xAlly (1).tempHealth, xAlly (1).health,
			xAlly (1).tempArmor, xAlly (1).armor, 30 + (130 * 1), 240, true, 0, xAlly (1).name)
		    % Above is Lower Row, Under is Higher Row
		    for drawAllySprite : 0 .. 2 by 2
			Pic.Draw (xAlly (drawAllySprite).sprite, 290 - (130 * drawAllySprite), 330, picMerge)
			DrawHPA (xAlly (drawAllySprite).tempHealth, xAlly (drawAllySprite).health,
			    xAlly (drawAllySprite).tempArmor, xAlly (drawAllySprite).armor, 290 - (130 * drawAllySprite), 330,
			    true, 0, xAlly (drawAllySprite).name)
		    end for
		    %% For Array, odd number. Lower row
		    for b : 1 .. 3 by 2
			if xFoe (cycleWave, b).tempHealth > 0 then
			    % Drawing Foe Sprite
			    Pic.Draw (xFoe (cycleWave, b).sprite, 680 + (b * 130), 240, picMerge)
			end if
		    end for
		    for b : 1 .. 3 by 2
			if xFoe (cycleWave, b).tempHealth > 0 then
			    % Drawing Foe HP/MP bar
			    DrawHPA (xFoe (cycleWave, b).tempHealth, xFoe (cycleWave, b).health,
				xFoe (cycleWave, b).tempArmor, xFoe (cycleWave, b).armor, 680 + (b * 130), 240,
				false, xFoe (cycleWave, b).tempSpeed, xFoe (cycleWave, b).name)
			end if
		    end for
		    %% Foe Array, even number. Higher row
		    for b : 0 .. 4 by 2
			if xFoe (cycleWave, b).tempHealth > 0 then
			    % Drawing Foe Sprite
			    Pic.Draw (xFoe (cycleWave, b).sprite, 680 + (b * 130), 330, picMerge)
			end if
		    end for
		    for b : 0 .. 4 by 2
			if xFoe (cycleWave, b).tempHealth > 0 then
			    % Drawing Foe HP/MP bar
			    DrawHPA (xFoe (cycleWave, b).tempHealth, xFoe (cycleWave, b).health,
				xFoe (cycleWave, b).tempArmor, xFoe (cycleWave, b).armor, 680 + (b * 130), 330,
				false, xFoe (cycleWave, b).tempSpeed, xFoe (cycleWave, b).name)
			end if
		    end for
		    % Reset command handling variables when out of Command Zone or in Command Zone with RESET/NONE on direction change
		    if Mx > 301 & Mx < 970 & My > 25 & My < 212 then % If cursor leaves area, reset block selection
			if directionSelect = "None"| directionSelect = "Reset" then
			    startDiamond := 0
			    endDiamond := 0
			    beginSelect := true
			    directionSelect := ""
			    for a : 0 .. 1
				for b : 0 .. 6
				    diamondSelect (a, b) := false
				end for
			    end for
			end if
		    else %% Outside Command Zone
			startDiamond := 0
			endDiamond := 0
			beginSelect := true
			directionSelect := ""
			for a : 0 .. 1
			    for b : 0 .. 6
				diamondSelect (a, b) := false
			    end for
			end for
		    end if
		    %% Command (14 Diamonds, 0-13) cycle & activation
		    for a : 0 .. 1
			for b : 0 .. 6
			    if Mx > 305 + (b * 96) & Mx < 305 + 86 + (b * 96) & My > 123 - (a * 95) & My < 123 + 86 - (a * 95) then
				endDiamond := a * 7 + b % Update latest position
				if Mb = 1 & diamondSelect (a, b) = false & beginSelect then % First press
				    startDiamond := a * 7 + b % Set start position
				    diamondSelect (a, b) := true
				    beginSelect := false
				    diamondHovered := diamondOwner (a, b)
				elsif Mb = 1 & beginSelect = false then % Connecting press
				    if (startDiamond - 1) = endDiamond| % Left
					    (startDiamond + 1) = endDiamond| % Right
					    (startDiamond + 7) = endDiamond| % Down
					    (startDiamond - 7) = endDiamond then % Up
					if diamondOwner (a, b) = diamondHovered then
					    diamondSelect (a, b) := true
					    directionSelect := ""
					else
					    directionSelect := "Reset"
					end if
				    elsif (startDiamond + 8) = endDiamond then % Diag DR
					if diamondOwner (a - 1, b) = diamondHovered &
						diamondOwner (a, b - 1) = diamondHovered &
						diamondOwner (a, b) = diamondHovered then
					    diamondSelect (a - 1, b) := true % Top
					    diamondSelect (a, b - 1) := true % Left
					    diamondSelect (a, b) := true
					    directionSelect := "DR"
					else
					    directionSelect := "Reset"
					end if
				    elsif (startDiamond + 6) = endDiamond & endDiamond >= 7 then % Diag DL
					if diamondOwner (a - 1, b) = diamondHovered &
						diamondOwner (a, b + 1) = diamondHovered &
						diamondOwner (a, b) = diamondHovered then
					    diamondSelect (a - 1, b) := true % Top
					    diamondSelect (a, b + 1) := true % Left
					    diamondSelect (a, b) := true
					    directionSelect := "DL"
					else
					    directionSelect := "Reset"
					end if
				    elsif (startDiamond - 6) = endDiamond & endDiamond <= 6 then % Diag UR
					if diamondOwner (a, b - 1) = diamondHovered &
						diamondOwner (a + 1, b) = diamondHovered &
						diamondOwner (a, b) = diamondHovered then
					    diamondSelect (a, b - 1) := true % left
					    diamondSelect (a + 1, b) := true % Down
					    diamondSelect (a, b) := true
					    directionSelect := "UR"
					else
					    directionSelect := "Reset"
					end if
				    elsif (startDiamond - 8) = endDiamond then % Diag UL
					if diamondOwner (a, b + 1) = diamondHovered &
						diamondOwner (a + 1, b) = diamondHovered &
						diamondOwner (a, b) = diamondHovered then
					    diamondSelect (a, b + 1) := true % left
					    diamondSelect (a + 1, b) := true % Down
					    diamondSelect (a, b) := true
					    directionSelect := "UL"
					else
					    directionSelect := "Reset"
					end if
				    elsif diamondSelect (a, b) = false then
					directionSelect := "Reset"
				    end if
				elsif Mb = 0 then
				    if diamondSelect (a, b) then % Reset diamonds
					activateDiamond := true
				    else
					directionSelect := "None"
				    end if
				end if
			    end if
			    %% Diamond clear - reset on switch position
			    if diamondSelect (a, b) & Mb = 1 then
				% a * 7 + b = ID of mouse position diamond
				if (startDiamond + 8) = a * 7 + b & directionSelect not= "DR" then % Diag DR
				    diamondSelect (a - 1, b) := false % Top
				    diamondSelect (a, b - 1) := false % Left
				    diamondSelect (a, b) := false
				elsif (startDiamond + 6) = (a * 7 + b) & (a * 7 + b) >= 7 & directionSelect not= "DL" then % Diag DL
				    diamondSelect (a - 1, b) := false % Top
				    diamondSelect (a, b + 1) := false % Left
				    diamondSelect (a, b) := false
				elsif (startDiamond - 6) = (a * 7 + b) & (a * 7 + b) <= 6 & directionSelect not= "UR" then % Diag UR
				    diamondSelect (a + 1, b) := false % Down
				    diamondSelect (a + 1, b) := false % Down
				    diamondSelect (a, b) := false
				elsif (startDiamond - 8) = a * 7 + b & directionSelect not= "UL" then % Diag UL
				    diamondSelect (a + 1, b) := false % Down
				    diamondSelect (a + 1, b) := false % Down
				    diamondSelect (a, b) := false
				elsif startDiamond = endDiamond & startDiamond not= a * 7 + b then
				    diamondSelect (a, b) := false
				end if
			    end if
			    %% Draw diamonds, hover
			    if diamondSelect (a, b) then
				diamondCount += 1
				if diamondOwner (a, b) = 0 then
				    Pic.Draw (dDragonHover, 305 + (b * 96), 123 - (a * 95), picMerge)
				elsif diamondOwner (a, b) = 1 then
				    Pic.Draw (dBlueHover, 305 + (b * 96), 123 - (a * 95), picMerge)
				else
				    Pic.Draw (dJulyHover, 305 + (b * 96), 123 - (a * 95), picMerge)
				end if
			    else
				if diamondOwner (a, b) = 0 then
				    if Mx > 305 + (b * 96) & Mx < 305 + 86 + (b * 96) & My > 123 - (a * 95) & My < 123 + 86 - (a * 95) then
					Pic.Draw (dDragonGlance, 305 + (b * 96), 123 - (a * 95), picMerge)
				    else
					Pic.Draw (dDragon, 305 + (b * 96), 123 - (a * 95), picMerge)
				    end if
				elsif diamondOwner (a, b) = 1 then
				    if Mx > 305 + (b * 96) & Mx < 305 + 86 + (b * 96) & My > 123 - (a * 95) & My < 123 + 86 - (a * 95) then
					Pic.Draw (dBlueGlance, 305 + (b * 96), 123 - (a * 95), picMerge)
				    else
					Pic.Draw (dBlue, 305 + (b * 96), 123 - (a * 95), picMerge)
				    end if
				else
				    if Mx > 305 + (b * 96) & Mx < 305 + 86 + (b * 96) & My > 123 - (a * 95) & My < 123 + 86 - (a * 95) then
					Pic.Draw (dJulyGlance, 305 + (b * 96), 123 - (a * 95), picMerge)
				    else
					Pic.Draw (dJuly, 305 + (b * 96), 123 - (a * 95), picMerge)
				    end if
				end if
			    end if
			    % Highlight (305 = x, 123 = 7), [86,86] Diamond, [96,95] Distance between (Include)
			    %if Mx > 305 + (b * 96) & Mx < 305 + 86 + (b * 96) & My > 123 - (a * 95) & My < 123 + 86 - (a * 95) then
			    %Draw.Box (305 + b * 96, 123 - a * 95, 305 + 86 + b * 96 - 1, 123 + 86 - a * 95 - 1, 20)
			    %if Mb = 0 then
			    %    DrawSBorder (Mx, My, -15, 31)
			    %elsif Mb = 1 then
			    %    DrawSBorder (Mx, My, -15, SearingRed)
			    %end if
			    %end if
			    %if diamondSelect (a, b) then
			    %    Draw.Box (305 + b * 96, 123 - a * 95, 305 + 86 + b * 96 - 1, 123 + 86 - a * 95 - 1, 28)
			    %end if
			end for
		    end for
		    % Draw - Sprite %%%%%%%%%%%%% HIGHLIGHT
		    for decreasing drawAllySprite : 2 .. 0
			if drawAllySprite = 1 then
			    if currentTargAlly = drawAllySprite then
				Pic.Draw (TurnPointer, 290 - (130 * drawAllySprite) + 85 - 7, 240 + 250, picMerge)
			    end if
			    if DetectCircle (290 - (130 * drawAllySprite) + 85, 240 + 100, 80) then
				DrawSBorder (290 - (130 * drawAllySprite) + 85, 240 + 100, 60, PSOBlue)
				DisplayTempStats (xAlly (drawAllySprite), true)
				if Mb = 1 & xAlly (drawAllySprite).tempHealth > 0 then
				    currentTargAlly := drawAllySprite
				end if
			    end if
			else
			    if currentTargAlly = drawAllySprite then
				Pic.Draw (TurnPointer, 290 - (130 * drawAllySprite) + 85 - 7, 330 + 250, picMerge)
			    end if
			    if DetectCircle (290 - (130 * drawAllySprite) + 85, 330 + 100, 80) then
				DrawSBorder (290 - (130 * drawAllySprite) + 85, 330 + 100, 60, PSOBlue)
				DisplayTempStats (xAlly (drawAllySprite), true)
				if Mb = 1 & xAlly (drawAllySprite).tempHealth > 0 then
				    currentTargAlly := drawAllySprite
				end if
			    end if
			end if
		    end for
		    %% Foe Waves -- Highlight
		    for b : 0 .. 4
			if xFoe (cycleWave, b).tempHealth > 0 then
			    if b = 1| b = 3 then
				if currentTargFoe = b then
				    Pic.Draw (TurnPointer, 680 + (130 * b) + 60 - 7, 240 + 250, picMerge)
				end if
				if DetectCircle (680 + (130 * b) + 60, 240 + 100, 80) then
				    DrawSBorder (680 + (130 * b) + 60, 240 + 100, 60, PSOBlue)
				    DisplayTempStats (xFoe (cycleWave, b), false)
				    if Mb = 1 & xFoe (cycleWave, b).tempHealth > 0 then
					currentTargFoe := b
				    end if
				end if
			    else
				if currentTargFoe = b then
				    Pic.Draw (TurnPointer, 680 + (130 * b) + 60 - 7, 330 + 250, picMerge)
				end if
				if DetectCircle (680 + (130 * b) + 60, 330 + 100, 80) then
				    DrawSBorder (680 + (130 * b) + 60, 330 + 100, 60, PSOBlue)
				    DisplayTempStats (xFoe (cycleWave, b), false)
				    if Mb = 1 & xFoe (cycleWave, b).tempHealth > 0 then
					currentTargFoe := b
				    end if
				end if
			    end if
			end if
		    end for
		    %% Activation !
		    %% Animation of Command, reset command variables %%%%%%%%%%%%%%%%%%%
		    if activateDiamond then
			startDiamond := 0
			endDiamond := 0
			beginSelect := true
			directionSelect := ""
			for remFlashX : 0 .. 1         % reduces flash
			    for remFlashY : 0 .. 6
				if diamondOwner (remFlashX, remFlashY) = 0 then
				    Pic.Draw (dDragon, 305 + (remFlashY * 96), 123 - (remFlashX * 95), picMerge)
				elsif diamondOwner (remFlashX, remFlashY) = 1 then
				    Pic.Draw (dBlue, 305 + (remFlashY * 96), 123 - (remFlashX * 95), picMerge)
				else
				    Pic.Draw (dJuly, 305 + (remFlashY * 96), 123 - (remFlashX * 95), picMerge)
				end if
			    end for
			end for
			View.Update
			for row : 0 .. 1         % Reset board
			    for decreasing col : 6 .. 0
				if diamondSelect (row, col) then
				    diamondSelect (row, col) := false
				    if col < 6 then
					for chainMove : col .. 5
					    diamondOwner (row, chainMove) := diamondOwner (row, chainMove + 1)
					end for
				    else
				    end if
				    diamondOwner (row, 6) := Rand.Int (0, 2)
				    %% New Diamond Animation
				    for slideDiamond : col .. 6
					for decreasing slideX : 110 .. 0
					    if diamondOwner (row, slideDiamond) = 0 then
						Pic.Draw (dDragon, 305 + (slideDiamond * 96) + (slideX), 123 - (row * 95), picMerge)
					    elsif diamondOwner (row, slideDiamond) = 1 then
						Pic.Draw (dBlue, 305 + (slideDiamond * 96) + (slideX), 123 - (row * 95), picMerge)
					    else
						Pic.Draw (dJuly, 305 + (slideDiamond * 96) + (slideX), 123 - (row * 95), picMerge)
					    end if
					    View.Update
					end for
				    end for
				end if
			    end for
			end for
			activateDiamond := false
			activateSkill := true
		    end if
		    %%%%% After all diamonds have been checked, and skill has been chosen -> Commence cast skill
		    if diamondCount > 0 then %% SKILL HOVERED! Display skill information in middle
			CastSkill (xAlly (diamondHovered), diamondCount, activateSkill)
		    end if
		    if activateSkill then %% SKILL ACTIVATED! Next turn
			%castSkills (currentTargAlly, currentTargFoe, diamondHovered, diamondCount)
			%CastSkill (xAlly (diamondHovered).rank, diamondHovered, diamondCount, currentTargAlly, currentTargFoe, activateSkill)
			var tagFront : int := 0
			var closestFoe : int := -1
			var secondFoe : int := -1
			var farthestFoe : int := -1
			var closestAlly : int := -1
			var farthestAlly : int := -1
			for g : 0 .. 4 %%%%%%%% Determine Closest / Furthest Foe
			    if xFoe (cycleWave, g).tempHealth > 0 then
				if tagFront <= 0 then
				    tagFront += 1
				    closestFoe := g
				elsif tagFront = 1 then
				    tagFront += 1
				    secondFoe := g
				    farthestFoe := g
				else
				    farthestFoe := g
				end if
			    end if
			end for
			if secondFoe < 0 then
			    secondFoe := closestFoe
			end if
			if farthestFoe < 0 then
			    farthestFoe := closestFoe
			end if
			%%%%%%%%%%% Initial Cast
			for g : 0 .. 2 %% Result on Ally
			    % True = ally
			    xAlly (g) := CastResult (diamondHovered, diamondCount,
				currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe, g,
				true, xAlly (diamondHovered), xAlly (g))
			end for
			for g : 0 .. 4 %%%%%%%% Result on Foe
			    if xFoe (cycleWave, g).tempHealth > 0 then
				xFoe (cycleWave, g) := CastResult (diamondHovered, diamondCount,
				    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe, g,
				    false, xAlly (diamondHovered), xFoe (cycleWave, g))
			    end if
			end for
			%%%%%%%%%%%% Chain skills
			tagFront := 0
			closestFoe := -1
			secondFoe := -1
			farthestFoe := -1
			closestAlly := -1
			farthestAlly := -1
			for g : 0 .. 2 %%%%%%%% Determine Closest / Furthest Ally
			    if xAlly (g).tempHealth > 0 then
				if tagFront <= 0 then
				    tagFront += 1
				    closestAlly := g
				else
				    farthestAlly := g
				end if
			    end if
			end for
			if farthestAlly < 0 then
			    farthestAlly := closestAlly
			end if
			tagFront := 0 % Reset
			for g : 0 .. 4 %%%%%%%% Determine Closest / Furthest Foe
			    if xFoe (cycleWave, g).tempHealth > 0 then
				if tagFront <= 0 then
				    tagFront += 1
				    closestFoe := g
				elsif tagFront = 1 then
				    tagFront += 1
				    secondFoe := g
				    farthestFoe := g
				else
				    farthestFoe := g
				end if
			    end if
			end for
			if secondFoe < 0 then
			    secondFoe := closestFoe
			end if
			if farthestFoe < 0 then
			    farthestFoe := closestFoe
			end if
			%%%%%%%%%%% Chain Cast
			var chainTarget : int := 0
			if diamondCount = 1 then
			    if xAlly (diamondHovered).dOne.sName = "Command" then %% 1D - Target
				chainTarget := currentTargAlly
				xAlly (chainTarget) := CastResult (chainTarget, diamondCount,
				    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
				    chainTarget, true, xAlly (chainTarget), xAlly (chainTarget))
				for curID : 0 .. 4
				    if xFoe (cycleWave, curID).tempHealth > 0 then
					xFoe (cycleWave, curID) := CastResult (chainTarget, diamondCount,
					    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
					    curID, false, xAlly (chainTarget), xFoe (cycleWave, curID))
				    end if
				end for
			    elsif xAlly (diamondHovered).dOne.sName = "Shield of Light" then %% 1D - Foremost
				chainTarget := closestAlly
				xAlly (chainTarget) := CastResult (chainTarget, diamondCount,
				    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
				    chainTarget, true, xAlly (chainTarget), xAlly (chainTarget))
				for curID : 0 .. 4
				    if xFoe (cycleWave, curID).tempHealth > 0 then
					xFoe (cycleWave, curID) := CastResult (chainTarget, diamondCount,
					    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
					    curID, false, xAlly (chainTarget), xFoe (cycleWave, curID))
				    end if
				end for
			    end if
			elsif diamondCount = 2 then
			    if xAlly (diamondHovered).dTwo.sName = "Inspire" then %% 2D - Foremost
				chainTarget := closestAlly
				xAlly (closestAlly) := CastResult (chainTarget, diamondCount,
				    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
				    chainTarget, true, xAlly (chainTarget), xAlly (chainTarget))
				for curID : 0 .. 4
				    if xFoe (cycleWave, curID).tempHealth > 0 then
					xFoe (cycleWave, curID) := CastResult (chainTarget, diamondCount,
					    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
					    curID, false, xAlly (chainTarget), xFoe (cycleWave, curID))
				    end if
				end for
			    end if
			elsif diamondCount = 4 then
			    if xAlly (diamondHovered).dFour.sName = "Catastrophe" then %% 4D - Target
				chainTarget := currentTargAlly
				%if currentTargAlly = 2 then %% Remove Loop cast
				%    currentTargAlly := 1
				%end if
				xAlly (currentTargAlly) := CastResult (chainTarget, diamondCount,
				    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
				    chainTarget, true, xAlly (chainTarget), xAlly (chainTarget))
				for curID : 0 .. 4
				    if xFoe (cycleWave, curID).tempHealth > 0 then
					xFoe (cycleWave, curID) := CastResult (chainTarget, diamondCount,
					    currentTargAlly, currentTargFoe, closestFoe, secondFoe, farthestFoe,
					    curID, false, xAlly (chainTarget), xFoe (cycleWave, curID))
				    end if
				end for
			    end if
			end if
			%%%%%%%%%%%%% Chain skill - Reset and check
			%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			activateSkill := false
			exit
		    end if
		    % Debug %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		    %Font.Draw ("SD: " + intstr (startDiamond) + " | ED: " + intstr (endDiamond) +
		    %    " | DIRECTION: " + directionSelect, 200, 700, FontM12, 16)
		    %for debuga : 0 .. 1
		    %    for debugb : 0 .. 6
		    %        var debugString : string := "false"
		    %%        if diamondSelect (debuga, debugb) then
		    % %           debugString := "true"
		    % %       end if
		    %        Font.Draw ("{x" + intstr (debuga) + "y" + intstr (debugb) +
		    %            "= " + debugString + "}", 100 + (100 * debugb), 600 - (25 * debuga), FontM12, 16)
		    %    end for
		    %end for
		    % Debug end %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		    View.Update
		end loop
		%%%% CHECK ALL HP HERE + Decrease buff/debuff timers
		%%%%%%%%%%%%%%%%%%%%%% ELSE = FOE TURN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    else
		isTurn := true
		isVictory := true     %% Auto Victory, until all Foe HP = 0
		var foeCurTarget := 0
		var foeRightTar := 0
		for cycleSpeed : 0 .. 4     % Cycle Foes of this wave (5)
		    if xFoe (cycleWave, cycleSpeed).tempHealth > 0 then     %% Decrease time to next turn (-1)
			isVictory := false
			xFoe (cycleWave, cycleSpeed).tempSpeed -= 1
			if xFoe (cycleWave, cycleSpeed).tempSpeed <= 0 then %% If TURN has arrived
			    xFoe (cycleWave, cycleSpeed).tempSpeed += xFoe (cycleWave, cycleSpeed).speed %% + adds on debuffs
			    for detTarget : 0 .. 2 %%
				if (xAlly (detTarget).tempHealth >= 0) then
				    foeCurTarget := detTarget
				    exit
				end if
			    end for
			    foeRightTar := cycleSpeed
			    xAlly (foeCurTarget).tempArmor -= 100
			    if xAlly (foeCurTarget).tempArmor <= 0 then
				xAlly (foeCurTarget).tempHealth += xAlly (foeCurTarget).tempArmor
			    end if
			    for detTarget : 0 .. 2     %%
				if (xAlly (detTarget).tempHealth <= 0) then
				    xAlly (detTarget).tempHealth := 0
				end if
				if (xAlly (detTarget).tempArmor <= 0) then
				    xAlly (detTarget).tempArmor := 0
				end if
			    end for
			end if
		    end if
		end for
		if isVictory| isExit then     %% EXIT WAVE on VICTORY
		    exit
		end if     %% Exit on quit
	    end if     %% End isTurn
	end loop     %% End Conditional loop
	%% FOR exits on all WAVES CLEAR
    end for
end Battle

proc prepareStoryBattle (bNumber : int)
    % Up to 36 story scenarios (Chapter 1 = 1000), up to 36000
    var storyWaves : int := 2     %  1 to 5
    var storyAlly : array 0 .. 2 of characterInfo
    var storyFoe : array 0 .. 2, 0 .. 4 of characterInfo
    % Default team
    storyAlly (0) := cDragon
    storyAlly (1) := cBlue
    storyAlly (2) := cJuly
    for reco : 0 .. 2
	storyAlly (reco).tempHealth := storyAlly (reco).health
	storyAlly (reco).tempArmor := 0
	storyAlly (reco).tempSpeed := storyAlly (reco).speed
	for zero : 0 .. stackNum
	    storyAlly (reco).stunTime (zero) := 0
	    storyAlly (reco).poisonTime (zero) := 0
	    storyAlly (reco).enhanceTime (zero) := 0
	    storyAlly (reco).resistTime (zero) := 0
	    storyAlly (reco).vulnTime (zero) := 0
	    storyAlly (reco).exhaustTime (zero) := 0
	end for
	storyAlly (reco).taunt := 0
    end for
    % Empty
    for a : 0 .. 2
	for b : 0 .. 4
	    storyFoe (a, b) := cEmpty
	end for
    end for

    if bNumber = 1000 then
	storyWaves := 1
	storyFoe (0, 0) := createChar ("Cleo", 1, 0, "")
	storyFoe (0, 1) := createChar ("Seira", 1, 0, "")
	storyFoe (0, 3) := createChar ("Sillness", 1, 0, "")
	storyFoe (1, 0) := createChar ("Cube", 1, 0, "Counter")
	storyFoe (1, 1) := createChar ("Cube", 1, 0, "")
	storyFoe (1, 2) := createChar ("Cube", 1, 0, "Turtle")
	storyFoe (2, 0) := createChar ("Cube", 1, 0, "Counter")
	storyFoe (2, 1) := createChar ("Cube", 1, 0, "")
	storyFoe (2, 2) := createChar ("Cube", 1, 0, "Turtle")
	storyFoe (2, 3) := createChar ("Cube", 1, 0, "")
	storyFoe (2, 4) := createChar ("Cube", 1, 0, "Turtle")
	Battle (storyAlly, storyFoe, 2, bgPlains)
    elsif bNumber = 2000 then
    elsif bNumber = 3000 then
    elsif bNumber = 4000 then
    elsif bNumber = 5000 then
    elsif bNumber = 6000 then
    elsif bNumber = 7000 then
    elsif bNumber = 8000 then
    elsif bNumber = 9000 then
    elsif bNumber = 10000 then
    elsif bNumber = 11000 then
    elsif bNumber = 12000 then
    elsif bNumber = 13000 then
    elsif bNumber = 14000 then
    elsif bNumber = 15000 then
    elsif bNumber = 16000 then
    elsif bNumber = 17000 then
    elsif bNumber = 18000 then
    elsif bNumber = 19000 then
    elsif bNumber = 20000 then
    elsif bNumber = 21000 then
    elsif bNumber = 22000 then
    elsif bNumber = 23000 then
    elsif bNumber = 24000 then
    elsif bNumber = 25000 then
    elsif bNumber = 26000 then
    elsif bNumber = 27000 then
    end if
end prepareStoryBattle

proc prepareExBattle (bNumber : int)
    % Up to
    var excursionWaves : int := 2     %  1 to 5
    var excursionAlly : array 0 .. 2 of characterInfo
    var excursionFoe : array 0 .. 2, 0 .. 4 of characterInfo
    % Default team
    excursionAlly (0) := cDragon
    excursionAlly (1) := cBlue
    excursionAlly (2) := cJuly
    for reco : 0 .. 2
	excursionAlly (reco).tempHealth := excursionAlly (reco).health
	excursionAlly (reco).tempArmor := 0
	excursionAlly (reco).tempSpeed := excursionAlly (reco).speed
	for zero : 0 .. stackNum
	    excursionAlly (reco).stunTime (zero) := 0
	    excursionAlly (reco).poisonTime (zero) := 0
	    excursionAlly (reco).enhanceTime (zero) := 0
	    excursionAlly (reco).resistTime (zero) := 0
	    excursionAlly (reco).vulnTime (zero) := 0
	    excursionAlly (reco).exhaustTime (zero) := 0
	end for
	excursionAlly (reco).taunt := 0
    end for
    % Empty
    for a : 0 .. 2
	for b : 0 .. 4
	    excursionFoe (a, b) := cEmpty
	end for
    end for

    if bNumber = 1000 then
	excursionWaves := 1
	excursionFoe (0, 0) := createChar ("Cleo", 1, 0, "")
	excursionFoe (0, 1) := createChar ("Seira", 1, 0, "")
	excursionFoe (0, 3) := createChar ("Sillness", 1, 0, "")
	excursionFoe (1, 0) := createChar ("Cube", 1, 0, "Counter")
	excursionFoe (1, 1) := createChar ("Cube", 1, 0, "")
	excursionFoe (1, 2) := createChar ("Cube", 1, 0, "Turtle")
	excursionFoe (2, 0) := createChar ("Cube", 1, 0, "Counter")
	excursionFoe (2, 1) := createChar ("Cube", 1, 0, "")
	excursionFoe (2, 2) := createChar ("Cube", 1, 0, "Turtle")
	excursionFoe (2, 3) := createChar ("Cube", 1, 0, "")
	excursionFoe (2, 4) := createChar ("Cube", 1, 0, "Turtle")
	Battle (excursionAlly, excursionFoe, 2, bgPlains)
    elsif bNumber = 2000 then
    elsif bNumber = 3000 then
    elsif bNumber = 4000 then
    elsif bNumber = 5000 then
    elsif bNumber = 6000 then
    elsif bNumber = 7000 then
    elsif bNumber = 8000 then
    elsif bNumber = 9000 then
    elsif bNumber = 10000 then
    elsif bNumber = 11000 then
    elsif bNumber = 12000 then
    elsif bNumber = 13000 then
    elsif bNumber = 14000 then
    elsif bNumber = 15000 then
    elsif bNumber = 16000 then
    elsif bNumber = 17000 then
    elsif bNumber = 18000 then
    elsif bNumber = 19000 then
    elsif bNumber = 20000 then
    elsif bNumber = 21000 then
    elsif bNumber = 22000 then
    elsif bNumber = 23000 then
    elsif bNumber = 24000 then
    elsif bNumber = 25000 then
    elsif bNumber = 26000 then
    elsif bNumber = 27000 then
    end if
end prepareExBattle

proc determineBattle (bType : string, bNumber : int)
    if bType = "Story" then
	prepareStoryBattle (bNumber)
    elsif bType = "Excursion" then
	prepareExBattle (bNumber)
    end if
end determineBattle
