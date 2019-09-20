%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title: The Royal Game of Ur %%%%%%
%Coder: Johnson Lai %% (J-son/Json)
%Program: Turing 4.1.1 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Project starts: Sept 17, 2017 %%%%
%Notes: Design a light version of %
%Ur with minimal graphics %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ur.t is main %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Music: Journey - Kronos Quartet
% Background: "Ancient City of Ur"-
% Author Unknown
%
% Notes -- Inefficient Coding performed
% Day. 1 - Begin Structure
% Day. 2 - Improv Piece Movement functions (Issues with resetting pieces), Need to "predict" moves / highlight next step - Change Die / Piece to fit Merge
% Day. 3 - Added avatars, fixed bugs (15), future prediction, added "Destroy" scene and 14 text lines, Vers. 1.0.0 Complete
%

include "Code\\ImportStart.t"
setscreen ("graphics:1280,720,title:The Royal Game of Ur,offscreenonly,nobuttonbar")


proc ur (p1 : teamComposition, p2 : teamComposition, matchCode : int) %% For later versions
    var Condition : boolean := false
    var winner : int := 1
    var p1Move, p2Move : int := 0
    var Current, hasRolled, highlightPiece, Potential : boolean := true
    var Animation : boolean := false
    var AnimationFrame : int := 0
    var AnimationTime : int := 0
    var AnimationType : string := ""
    var ProgressToFight : boolean := false
    var dragPiece, PotentialPosition : int
    var ct : int %% Positional L/R
    var player : array 1 .. 2 of teamComposition
    var StoreX, StoreY : int := 0
    player (1) := p1
    player (2) := p2
    var die : array 0 .. 3 of int
    for d : 0 .. 3
	die (d) := 1 + d + Rand.Int (0, 4)
    end for
    var dieX, dieY : int
    %var totalRoll : int
    %setPositions
    for i : 1 .. 2
	for pD : 1 .. 7
	    if (i = 1) then
		player (i).piece (pD).pX := 171 + 49 * (pD - 1)
		player (i).piece (pD).pP := 1 - pD
		player (i).piece (pD).pID := "grey"
	    else
		player (i).piece (pD).pX := 1064 - 49 * (pD - 1)
		player (i).piece (pD).pP := 1 - pD
		player (i).piece (pD).pID := "blue"
	    end if
	    player (i).piece (pD).pY := (297)
	    %player (i).pTotal += player (i).piece (pD).pP %% 108 vs 28
	end for
    end for
    %%%%%%%%% DEBUG - Modified Stats
    %for i : 1 .. 2
    %%    for pD : 1 .. 6
    %        player (i).piece (pD).pP := 23 - pD
    %        if i = 1 then
    %            player (i).piece (pD).pX := 171 + 49 * (pD - 1)
    %        else
    %            player (i).piece (pD).pX := 1064 - 49 * (pD - 1)
    %        end if
    %        player (i).piece (pD).pY := (220)
    %        player (i).piece (pD).pCondition := true
    %    end for
    %end for
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Initiate .mp3
    fork PlayMusic (0)
    %% RNG Turn
    if (Rand.Int (0, 1) = 0) then
	player (1).turn := 50
	ct := 1
    else
	player (2).turn := 50
	ct := 2
    end if
    %%
    loop
	Current := true
	highlightPiece := false
	player (ct).totalRoll := 0
	hasRolled := false
	Potential := false
	PotentialPosition := 0
	if ProgressToFight = false then
	    loop
		for CycleSpeed : 1 .. 2
		    player (CycleSpeed).turn -= 1
		    if player (CycleSpeed).turn <= 0 then
			ct := (CycleSpeed)
			ProgressToFight := true
			exit
		    end if
		end for
		exit when ProgressToFight = true
	    end loop
	end if
	ProgressToFight := false
	for CycleSpeed : 1 .. 2 %% Equalizer
	    if player (CycleSpeed).turn >= 25 & player (CycleSpeed).turn <= 75 then
		player (CycleSpeed).turn := 50
	    end if
	end for
	/*
	 if player (1).turn < 0 or player (2).turn < 0 then
	 player (ct).turn := 10
	 % ct remains
	 exit
	 else
	 for i : 1 .. 2
	 if player (i).turn <= 0 then
	 player (i).turn := 10
	 ct := i
	 exit
	 else
	 player (i).turn := 0
	 end if
	 end for
	 end if */
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	BP (ct) %% Create positions for player's side
	loop %% Main Turn Loop
	    AnimationTime += 15
	    Pic.Draw (urBMP, 0, 0, picCopy)
	    Mouse.Where (Mx, My, Mb)
	    Input.KeyDown (Pressed)
	    CheckMouse
	    % Debugging
	    %Message := ""
	    %DrawGUI
	    Pic.Draw (player (1).Avatar, 43, 543, picMerge)
	    Message := player (1).Name
	    Font.Draw (Message, 321 - 71 - (Font.Width (Message, FontName) div 2), 658, FontName, Sparkle)
	    Pic.Draw (player (2).Avatar, 1103, 543, picMerge)
	    Message := player (2).Name
	    Font.Draw (Message, 1097 - 71 - (Font.Width (Message, FontName) div 2), 658, FontName, Sparkle)
	    Message := "Currently " + player (ct).Name + "'s turn. "
	    %Message := "Currently player " + intstr (ct) + "'s turn"
	    %
	    % Help Menu
	    if Pressed ('h') then
		Font.Draw ("Current Player Turn: " + intstr (ct), 275, 175, Font1, 31)
		for p : 1 .. 2
		    for h : 1 .. 7
			Font.Draw ("P[" + intstr (h) + "]: " + intstr (player (p).piece (h).pP), 270 + (700 * (p - 1)), 160 - (15 * h), Font1, Sparkle)
		    end for
		    Font.Draw ("Team [" + intstr (player (p).turn) + "]", 270 + ((p - 1) * 700), 155 - (15 * 8), Font1, 31)
		end for
		%delay (50)
		Message := "X:[" + intstr (Mx) + "] || Y:[" + intstr (My) + "] || Mb:[" + intstr (Mb) + "] "
	    end if
	    % Roll Indication
	    if hasRolled = false then
		if ct = 1 then
		    Draw.Line (83, 413, 83, 171, Gold)
		elsif ct = 2 then
		    Draw.Line (1196, 413, 1196, 171, Gold)
		end if
		Message += "Waiting for your roll."
	    else
		if player (ct).totalRoll = 1 then
		    Message += "You rolled a " + intstr (player (ct).totalRoll) + ". This can be a strategic move."
		elsif player (ct).totalRoll = 2 then
		    Message += "A " + intstr (player (ct).totalRoll) + ". Not bad."
		elsif player (ct).totalRoll = 3 then
		    Message += "That is a " + intstr (player (ct).totalRoll) + ". You can do things with this."
		elsif player (ct).totalRoll = 4 then
		    Message += "Rare, to see " + intstr (player (ct).totalRoll) + " dice facing up. Make this your advantage."
		end if
	    end if
	    %
	    for i : 1 .. 2 %% Each Player
		for pD : 1 .. 7 %% Pieces
		    if player (i).piece (pD).pID = "red" then
			Pic.Draw (pRedBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
		    elsif player (i).piece (pD).pID = "blue" then
			Pic.Draw (pBlueBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
		    elsif player (i).piece (pD).pID = "grey" then
			Pic.Draw (pGreyBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
		    elsif player (i).piece (pD).pID = "black" then
			Pic.Draw (pBlackBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
		    end if
		end for
		dieY := 180
		if (ct = 1) then
		    dieX := 59
		else
		    dieX := 1172
		end if
		player (i).totalRoll := 0
		for d : 0 .. 3 %% Dies (4)
		    if die (d) = 1 then
			Pic.Draw (die1, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 2 then
			Pic.Draw (die2, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 3 then
			Pic.Draw (die3, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 4 then
			Pic.Draw (die4, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 5 then
			Pic.Draw (die5, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 6 then
			Pic.Draw (die6, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 7 then
			Pic.Draw (die7, dieX, dieY + (56 * d), picMerge)
		    elsif die (d) = 8 then
			Pic.Draw (die8, dieX, dieY + (56 * d), picMerge)
		    end if
		    if die (d) <= 4 then
			player (i).totalRoll += 1
		    end if
		end for
	    end for
	    Font.Draw (intstr (player (ct).totalRoll), dieX + 24 - Font.Width (intstr (player (ct).totalRoll), Font2) div 2, dieY - 24, Font2, 30)
	    %Battle (ct)
	    if Animation then %%%%%%%%% All Animations - More added in later versions
		Mx := 0
		My := 0
		Mb := 0
		if AnimationType = "Die" & AnimationFrame < 26 then
		    if ct = 1 then
			for k : 0 .. AnimationFrame
			    Draw.FillBox (43, 415 - (9 * k), 123, 407 - (9 * k), 16)
			    Draw.Box (43, 415 - (9 * k), 123, 407 - (9 * k), Bronze)
			end for
		    else
			for k : 0 .. AnimationFrame
			    Draw.FillBox (1156, 415 - (9 * k), 1236, 407 - (9 * k), 16)
			    Draw.Box (1156, 415 - (9 * k), 1236, 407 - (9 * k), Bronze)
			end for
		    end if
		    AnimationFrame += 2
		elsif AnimationType = "Die" then
		    AnimationType := "DieReceived"
		    AnimationFrame := 25
		end if
		AnimationFrame -= 1
		if AnimationType = "DieReceived" & AnimationFrame >= 0 then
		    if hasRolled = false then
			hasRolled := true
			var curRoll : int := 0
			for d : 0 .. 3
			    curRoll := Rand.Int (0, 1) % 1 = 1 pt
			    if curRoll >= 1 then
				die (d) := Rand.Int (1, 4) % 1-4 is UP
			    else
				die (d) := Rand.Int (5, 8) % 5-8 is DOWN
			    end if
			    player (ct).totalRoll += curRoll
			end for
		    end if
		    if ct = 1 then
			for k : 0 .. AnimationFrame
			    Draw.FillBox (43, 415 - (9 * k), 123, 407 - (9 * k), 16)
			    Draw.Box (43, 415 - (9 * k), 123, 407 - (9 * k), Bronze)
			end for
		    else
			for k : 0 .. AnimationFrame
			    Draw.FillBox (1156, 415 - (9 * k), 1236, 407 - (9 * k), 16)
			    Draw.Box (1156, 415 - (9 * k), 1236, 407 - (9 * k), Bronze)
			end for
		    end if
		end if
		if AnimationFrame <= 0 then
		    Animation := false
		    AnimationType := ""
		end if
	    end if

	    % Command to Roll %%% Animation
	    if (Mx >= 43 and Mx <= 122 and My >= 156 and My <= 415 and ct = 1) or (Mx >= 1156 and Mx <= 1236 and My >= 156 and My <= 415 and ct = 2) then
		if ct = 1 then %% Highlight Roll Box
		    % Draw.Box (40, 146, 126, 417, Bronze)
		    Draw.Line (40, 150, 40, 413, Gold)
		    Draw.Line (44, 146, 122, 146, Gold)
		    Draw.Line (126, 150, 126, 413, Gold)
		    Draw.Line (44, 417, 122, 417, Gold)
		    Draw.Box (42, 148, 124, 415, 31)
		    %Draw.Line (42, 413, 124, 413, Gold)
		    %Draw.Line (42, 411, 124, 411, Gold)
		    Draw.Line (50, 151, 71, 151, 16)
		    Draw.Line (73, 151, 93, 151, Sparkle)
		    Draw.Line (95, 151, 116, 151, 16)
		elsif ct = 2 then
		    %Draw.Box (1153, 146, 1239, 417, Gold)
		    Draw.Line (1153, 150, 1153, 413, Gold) % I
		    Draw.Line (1157, 146, 1235, 146, Gold) % _
		    Draw.Line (1157, 417, 1235, 417, Gold) % ^^
		    Draw.Line (1239, 150, 1239, 413, Gold) %   I
		    %Draw.Line (1155, 413, 1237, 413, 31)
		    %Draw.Line (1155, 411, 1237, 411, 31)
		    Draw.Box (1155, 148, 1237, 415, 31)
		    Draw.Line (50 + 1113, 151, 71 + 1113, 151, 16)
		    Draw.Line (73 + 1113, 151, 93 + 1113, 151, Sparkle)
		    Draw.Line (95 + 1113, 151, 116 + 1113, 151, 16)
		end if
		if (Mb = 1) & hasRolled = false then
		    Animation := true
		    AnimationType := "Die"
		    AnimationFrame := 0
		end if
	    end if
	    % Command to Move
	    for s : 1 .. 7     %% Highlighting 7 pieces
		if ((Mx - (player (ct).piece (s).pX + 23)) ** 2) + ((My - (player (ct).piece (s).pY + 23)) ** 2) <= (24 ** 2) then
		    Draw.Line (player (ct).piece (s).pX - 4, player (ct).piece (s).pY + 43, player (ct).piece (s).pX - 4, player (ct).piece (s).pY + 50, 31)
		    Draw.Line (player (ct).piece (s).pX - 4, player (ct).piece (s).pY + 50, player (ct).piece (s).pX + 3, player (ct).piece (s).pY + 50, 31)

		    Draw.Line (player (ct).piece (s).pX + 43, player (ct).piece (s).pY - 4, player (ct).piece (s).pX + 50, player (ct).piece (s).pY + -4, 31)
		    Draw.Line (player (ct).piece (s).pX + 50, player (ct).piece (s).pY - 4, player (ct).piece (s).pX + 50, player (ct).piece (s).pY + +3, 31)
		    if (Mb = 1) & hasRolled & highlightPiece = false then     %% If Click Piece
			highlightPiece := true
			dragPiece := s
			StoreX := player (ct).piece (dragPiece).pX
			StoreY := player (ct).piece (dragPiece).pY
		    end if
		end if
	    end for
	    if highlightPiece = true & hasRolled then     %% Dragging / piece movement
		if Mb = 1 then
		    player (ct).piece (dragPiece).pX := Mx - 23
		    player (ct).piece (dragPiece).pY := My - 23
		    var DetectPossibleMove : int := 0
		    if player (ct).piece (dragPiece).pP < 0 then
			DetectPossibleMove -= player (ct).piece (dragPiece).pP
		    end if
		    DetectPossibleMove += player (ct).piece (dragPiece).pP + player (ct).totalRoll
		    if DetectPossibleMove <= 0 then
			DetectPossibleMove := 0
			if ct = 1 then
			    Draw.Line (477, 282, 589, 282, 39) % Error
			elsif ct = 2 then
			    Draw.Line (692, 282, 804, 282, 39) % Error
			end if
		    elsif DetectPossibleMove > 15 then
			DetectPossibleMove := 16
		    else
			var BPXPredict : int := BoardPositions (DetectPossibleMove).bX
			var BPYPredict : int := BoardPositions (DetectPossibleMove).bY
			% Draw Prediction move
			Draw.Line (BPXPredict - 25, BPYPredict - 25, BPXPredict - 25, BPYPredict - 15, 30) % I
			Draw.Line (BPXPredict - 25, BPYPredict - 25, BPXPredict - 15, BPYPredict - 25, 30) % _
			Draw.Line (BPXPredict + 25, BPYPredict + 25, BPXPredict + 25, BPYPredict + 15, 30) %       I
			Draw.Line (BPXPredict + 25, BPYPredict + 25, BPXPredict + 15, BPYPredict + 25, 30) %      ^^
		    end if
		elsif Mb = 0 then
		    player (ct).piece (dragPiece).pX := StoreX
		    player (ct).piece (dragPiece).pY := StoreY
		    highlightPiece := false
		end if
	    end if
	    if Potential = true & Mb = 0 & player (ct).totalRoll > 0 then    %% Drag on top, drop, calculate and Move
		if Possible (player (1), player (2), ct, PotentialPosition, player (ct).piece (dragPiece).pP) then
		    var Kill : int := 0
		    AnimationType := "Movement"
		    if ct = 1 then
			for s : 1 .. 7     % Kill an opponent?
			    if PotentialPosition = player (2).piece (s).pP & Kill = 0 & PotentialPosition > 4 & PotentialPosition < 13 then
				Kill := 1
				player (2).piece (s) := FindVacancy (2, player (2).piece (s), player (2))
			    end if
			end for
		    elsif ct = 2 then
			for s : 1 .. 7     % Kill an opponent?
			    if PotentialPosition = player (1).piece (s).pP & Kill = 0 & PotentialPosition > 4 & PotentialPosition < 13 then
				Kill := 1
				player (1).piece (s) := FindVacancy (1, player (1).piece (s), player (1))
			    end if
			end for
		    end if
		    if Kill = 1 then
			var pKillFlavourText : string := ". "
			var pKillFTRNG : int := Rand.Int (0, 8)
			if pKillFTRNG = 1 then
			    pKillFlavourText += "Don't give up!"
			elsif pKillFTRNG = 2 then
			    pKillFlavourText += "Excellent!"
			elsif pKillFTRNG = 3 then
			    pKillFlavourText += "Efficient!"
			elsif pKillFTRNG = 4 then
			    pKillFlavourText += "A clean stroke."
			elsif pKillFTRNG = 5 then
			    pKillFlavourText += "They didn't see it coming."
			elsif pKillFTRNG = 6 then
			    pKillFlavourText += "Masterful."
			elsif pKillFTRNG = 7 then
			    pKillFlavourText += "Too fast to the naked eye."
			elsif pKillFTRNG = 8 then
			    pKillFlavourText += "What a tragedy."
			elsif pKillFTRNG = 0 then
			    pKillFlavourText += "Amazing!"
			else
			end if
			if ct = 1 then
			    Message := player (1).Name + " defeated a pawn of " + player (2).Name + pKillFlavourText
			else
			    Message := player (2).Name + " defeated a pawn of " + player (1).Name + pKillFlavourText
			end if
			AnimationType := "Destroy"
			Message += ". Click to continue (or hit the spacebar)."
			Pic.Draw (pDestroyed, 640 - 100, 360 - 42, picMerge)
			Font.Draw (Message, 9, 12, Font1, 29)
			Draw.Box (3, 324 - 4, 1277, 406 - 4, 16) % Draw "Battle" Outer Layer
			Draw.FillBox (3 + 1, 324 + 1 - 4, 1277 - 1, 406 - 1 - 4, Brown) % Main Fill
			Draw.FillBox (200 - 1, 324 + 2 - 4, 200 + 134, 406 - 1 - 4, 16) %% Middle []
			Draw.FillBox (maxx - 200 - 134 - 1, 324 + 2 - 4, maxx - 200, 406 - 1 - 4, 16) %% []
			Draw.Box (3 + 1, 324 + 1 - 4, 1277 - 1, 406 - 1 - 4, Bronze)
			Draw.Box (200 - 1, 324 + 1 - 4, 200 + 134, 406 - 1 - 4, Bronze) %% Middle
			Draw.Box (maxx - 200 - 134 - 1, 324 + 1 - 4, maxx - 200, 406 - 1 - 4, Bronze) %%
			if ct = 1 then
			    Pic.Draw (player (1).Avatar, 200 - 0, 322, picMerge)
			    Pic.Draw (player (2).Avatar, maxx - 200 - 134, 322, picMerge)
			elsif ct = 2 then
			    Pic.Draw (player (2).Avatar, 200 - 0, 322, picMerge)
			    Pic.Draw (player (1).Avatar, maxx - 200 - 134, 322, picMerge)
			else
			end if
			Pic.Draw (pDestroyed, 640 - 100, 360 - 42, picMerge)
			View.Update
			delay (100)
			loop
			    Mouse.Where (Mx, My, Mb)
			    Input.KeyDown (Pressed)
			    exit when Mb = 1
			    exit when Pressed (' ')
			    View.Update
			    delay (20)
			end loop
		    end if
		    player (ct).piece (dragPiece).pP := PotentialPosition
		    player (ct).piece (dragPiece).pX := BoardPositions (PotentialPosition).bX - 23
		    player (ct).piece (dragPiece).pY := BoardPositions (PotentialPosition).bY - 23
		    player (ct).turn := 100 %% End Turn
		    if PotentialPosition = 4 or PotentialPosition = 8 or PotentialPosition = 14 then
			player (ct).turn := 0
		    elsif PotentialPosition = 15 then
			player (ct).piece (dragPiece).pCondition := true
			if ct = 1 then
			    player (ct).piece (dragPiece).pP := 22 - p1Move
			    player (ct).piece (dragPiece).pX := 170 + 49 * (p1Move)
			    player (ct).piece (dragPiece).pY := 220
			    p1Move += 1
			elsif ct = 2 then
			    player (ct).piece (dragPiece).pP := 22 - p2Move
			    player (ct).piece (dragPiece).pX := 1064 - 49 * (p2Move)
			    player (ct).piece (dragPiece).pY := 220
			    p2Move += 1
			end if
		    end if
		    %player (ct).piece (dragPiece).pCondition := true
		    %Slide to Finish
		    %
		    PotentialPosition := 0
		    Current := false
		    Potential := false
		    exit
		else
		    Message := "Cannot move there."
		end if
		Potential := false
	    end if
	    var isDetectMouse : int := 0
	    % automove
	    if (ct = 1 and Mx >= 515 & Mx <= 589 and My >= 294 & My <= 345) or (ct = 2 and Mx >= 692 & Mx <= 765 and My >= 294 & My <= 345) then
		%isDetectMouse += 1
		if highlightPiece and hasRolled & Mb = 1 then
		    if ct = 1 then
			if (AnimationTime mod 45 = 0) then
			    Draw.Line (517 + 2 * (AnimationTime div 45), 343, 518 + 2 * (AnimationTime div 45), 343, Gold)
			    Draw.Line (517 + 2 * (AnimationTime div 45), 341, 518 + 2 * (AnimationTime div 45), 341, Gold)
			    Draw.Line (517 + 2 * (AnimationTime div 45), 297, 518 + 2 * (AnimationTime div 45), 297, Gold)
			    Draw.Line (517 + 2 * (AnimationTime div 45), 299, 518 + 2 * (AnimationTime div 45), 299, Gold)
			end if
		    elsif ct = 2 then
			if (AnimationTime mod 45 = 0) then
			    Draw.Line (764 - 2 * (AnimationTime div 45), 343, 763 - 2 * (AnimationTime div 45), 343, Gold)
			    Draw.Line (764 - 2 * (AnimationTime div 45), 341, 763 - 2 * (AnimationTime div 45), 341, Gold)
			    Draw.Line (764 - 2 * (AnimationTime div 45), 297, 763 - 2 * (AnimationTime div 45), 297, Gold)
			    Draw.Line (764 - 2 * (AnimationTime div 45), 299, 763 - 2 * (AnimationTime div 45), 299, Gold)
			end if
		    end if
		    if player (ct).totalRoll > 0 then
			isDetectMouse += 1
			var DetectPossibleMove : int := 0
			if player (ct).piece (dragPiece).pP < 0 then
			    DetectPossibleMove -= player (ct).piece (dragPiece).pP
			end if
			DetectPossibleMove += player (ct).piece (dragPiece).pP + player (ct).totalRoll
			PotentialPosition := DetectPossibleMove
			Potential := true
			Message := "Auto movement for " + intstr (DetectPossibleMove) + "."
		    end if
		end if
	    end if
	    % Auto Move
	    for b : 1 .. 15 %% Cycle box - highlight - While dragging
		if (((Mx - BoardPositions (b).bX) ** 2) + ((My - BoardPositions (b).bY) ** 2)) <= (36 ** 2) & highlightPiece then
		    % Debug
		    %Message := intstr (((Mx - BoardPositions (b).bX) ** 2) + ((My - BoardPositions (b).bY) ** 2))
		    var CDraw : int
		    var CXY : int := 0
		    if b = 4 or b = 8 or b = 14 then         % Square on Box hover
			CDraw := 39
			Message := "The Rosette grants an extra roll."
		    elsif b >= 5 and b <= 12 then
			CXY := 4
			CDraw := 31
			Message := "The danger zone."
		    elsif b >= 15 then
			CDraw := Gold
			Message := "The finish line."
		    else
			CDraw := 54
			Message := "Your territory. Keep it that way."
		    end if
		    Draw.Line (BoardPositions (b).bX - 38 - CXY, BoardPositions (b).bY - 37, BoardPositions (b).bX - 38 - CXY, BoardPositions (b).bY - 37 + 10, CDraw)
		    Draw.Line (BoardPositions (b).bX - 38 - CXY, BoardPositions (b).bY - 37, BoardPositions (b).bX - 38 - CXY + 10, BoardPositions (b).bY - 37, CDraw)

		    Draw.Line (BoardPositions (b).bX + 37 + CXY, BoardPositions (b).bY + 38, BoardPositions (b).bX + 37 + CXY, BoardPositions (b).bY + 38 - 10, CDraw)
		    Draw.Line (BoardPositions (b).bX + 37 - 10 + CXY, BoardPositions (b).bY + 38, BoardPositions (b).bX + 37 + CXY, BoardPositions (b).bY + 38, CDraw)
		    %if b = (player (ct).totalRoll + player (ct).piece (dragPiece).pP) then
		    isDetectMouse += 1
		    var realLocation : int := 0
		    if Mb = 1 & hasRolled then %% Is the dropped location legit?
			if player (ct).piece (dragPiece).pP <= 0 then
			    realLocation := 0
			elsif player (ct).piece (dragPiece).pP <= 14 & player (ct).piece (dragPiece).pP > 0 then
			    realLocation := player (ct).piece (dragPiece).pP
			end if
			if (player (ct).totalRoll + realLocation = b) then
			    % Debug
			    % Message += "Player roll CONNECTS: " + intstr (player (ct).totalRoll + realLocation) + " IS EQUAL TO!!! " + intstr (b)
			    PotentialPosition := b
			    Potential := true
			end if
		    end if
		    %end if
		else
		    %highlightPiece := false
		end if
	    end for
	    if isDetectMouse <= 0 then
		PotentialPosition := 0
		Potential := false
	    end if

	    % Pass check
	    if player (ct).totalRoll = 0 & hasRolled then
		Message := "Unfortunate. A 0 roll means you must pass."
		if Mx >= 1102 & Mx <= 1237 and My >= 498 & My <= 536 & ct = 2 then
		    Font.Draw ("P A S S", 1128, 508, Font3, Gold)
		    if Mb = 1 then
			player (ct).turn := 100 %% End Turn
			exit
		    end if
		elsif Mx >= 42 & Mx <= 176 and My >= 498 & My <= 536 & ct = 1 then
		    Font.Draw ("P A S S", 68, 508, Font3, Gold)
		    if Mb = 1 then
			player (ct).turn := 100 %% End Turn
			exit
		    end if
		end if
	    elsif hasRolled & player (ct).totalRoll > 0 then
		var TestPossiblePiecesCanMove : boolean := false
		var EqualizeToZero : int := 0
		for t : 1 .. 7
		    if player (ct).piece (t).pCondition = false then
			if player (ct).piece (t).pP < 0 then
			    EqualizeToZero := 0
			elsif player (ct).piece (t).pP <= 14 then
			    EqualizeToZero := player (ct).piece (t).pP
			else
			    player (ct).piece (t).pCondition := true
			end if
			if Possible (player (1), player (2), ct, player (ct).totalRoll + EqualizeToZero, EqualizeToZero) then
			    TestPossiblePiecesCanMove := true
			end if
			%% DEBUG Message += "{{{" + intstr (EqualizeToZero) + "}}}"
		    end if
		end for
		if TestPossiblePiecesCanMove = false then %% All moves NULL
		    Message := "Unfortunate. You simply cannot move."
		    if Mx >= 1102 & Mx <= 1237 and My >= 498 & My <= 536 & ct = 2 then
			Font.Draw ("P A S S", 1128, 508, Font3, Gold)
			if Mb = 1 then
			    player (ct).turn := 100             %% End Turn
			    exit
			end if
		    elsif Mx >= 42 & Mx <= 176 and My >= 498 & My <= 536 & ct = 1 then
			Font.Draw ("P A S S", 68, 508, Font3, Gold)
			if Mb = 1 then
			    player (ct).turn := 100             %% End Turn
			    exit
			end if
		    end if
		end if
	    end if

	    %CheckWin
	    var CheckCheat : int := 0 %% Debugging purposes
	    for CheckCondition : 1 .. 7
		if player (1).piece (CheckCondition).pCondition = true then
		    CheckCheat += 1
		end if
	    end for
	    if p1Move < CheckCheat then
		p1Move := CheckCheat
	    end if
	    CheckCheat := 0 % Reset
	    for CheckCondition : 1 .. 7
		if player (2).piece (CheckCondition).pCondition = true then
		    CheckCheat += 1
		end if
	    end for
	    if p2Move < CheckCheat then
		p2Move := CheckCheat
	    end if
	    if p1Move >= 7 then
		Condition := true
		winner := 1
	    elsif p2Move >= 7 then
		Condition := true
		winner := 2
	    end if
	    Font.Draw (Message, 9, 12, Font1, 29) % Message
	    delay (15)
	    View.Update
	    if AnimationTime >= 1000 then
		AnimationTime := 0
	    end if
	    if (Condition = true) or (Current = false) then
		exit
	    end if
	end loop
	if (Condition = true) then
	    exit
	end if
    end loop
    % winner : int
    Pic.Draw (postScreenBMP, 0, 0, picCopy)
    if winner = 1 then
	Font.Draw ("Leopard leans back, taking in his majestic victory. He had",270, 440, Font3, Gold)
	Font.Draw ("started out strong, but Owl had better dice in the mid-",270, 400, Font3, Gold)
	Font.Draw ("game, dropping Leopard behind. Luckily, Fortune shone on",270, 360, Font3, Gold)
	Font.Draw ("his paws as the game drew to a close. Rolling a few 4s",270, 320, Font3, Gold)
	Font.Draw ("and landing on Rosettes were all part of Leopard's plan.",270, 280, Font3, Gold)
	%Font.Draw ("beginning.",270, 240, Font3, Gold)
	Font.Draw ("You just can't match Leopard.",450, 15, Font3, Gold)
    elsif winner = 2 then
	Font.Draw ("After an exhausting match, filled with highs and lows, Owl",270, 420, Font3, Gold)
	Font.Draw ("sits back talons agape. 'I've won..', he thinks to himself.",270, 380, Font3, Gold)
	Font.Draw ("Indeed, in the Royal Game of Ur, wits beats out mechanical",270, 340, Font3, Gold)
	Font.Draw ("speed. Leopard may have a larger head and faster limbs, but",270, 300, Font3, Gold)
	Font.Draw ("his impulsiveness led to his downfall. ",270, 260, Font3, Gold)
	Font.Draw ("..",270, 220, Font3, Gold)
	Font.Draw ("Such is life.",480, 15, Font3, Gold)
    else
	Font.Draw ("Error 5: Report to the creator", 200, 200, Font3, Gold)
    end if
    View.Update
    loop
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)
	if Pressed (' ') or Mb = 1 then
	    exit
	end if
	delay (30)
    end loop
end ur

proc Introduction
    Draw.FillBox (0, 0, maxx, maxy, 16)
    View.Update
    delay (30)
    View.Set ("nooffscreenonly")
    Pic.DrawSpecial (introBMP, 0, 0, picCopy, picFadeIn, 1500)
    delay (2400)
    Pic.DrawSpecial (mainMenuBMP, 0, 0, picCopy, picFadeIn, 1500)
    View.Set ("offscreenonly")
    View.Update
    delay (200)
end Introduction

proc main
    Introduction
    loop
	Pic.Draw (mainMenuBMP, 0, 0, picCopy)
	Font.Draw ("Version 1.0.0 - Johnson Lai", 12, 16, Font1, 25)
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)

	if (Mx > 548 & Mx < 730) then
	    if (My >= 89 & My < 90 + 60) then                     % Quit
		Pic.Draw (mmQuitBMP, 550, 89, picMerge)
		if (Mb = 1) then
		    exit
		end if
	    elsif (My >= 178 & My < 179 + 60) then                     % Load
		Pic.Draw (mmRulesBMP, 550, 179 - 1, picMerge)
		if Mb = 1 then
		    loop
			Mouse.Where (Mx, My, Mb)
			Input.KeyDown (Pressed)
			Pic.Draw (mmRulesPageBMP, 0, 0, picCopy)
			if (Mx > 1229 & Mx < 1261) & (My > 22 & My < 38) then
			    Draw.Line (1229, 22, 1261, 22, 16)         %% Add on
			    if (Mb = 1) then
				exit
			    end if
			end if
			if Pressed (KEY_ESC) then
			    exit
			end if
			delay (50)
			View.Update
		    end loop
		    %  MML := true
		    % delay (150)
		end if
	    elsif (My >= 267 & My < 267 + 60) then                     % New
		Pic.Draw (mmPlayBMP, 550, 268 - 1, picMerge)
		if Mb = 1 then
		    ur (Team (0), Team (1), 1)         %% Version 1.0.0 - 1 PvP Mode
		    Mb := 0 % Ignore Next Click
		    Mx := 0
		    My := 0
		    Introduction
		end if
	    else
	    end if
	end if

	delay (15)
	View.Update
    end loop
end main

main
View.Set ("nooffscreenonly")
Pic.DrawSpecial (introBMP, 0, 0, picCopy, picFadeIn, 5000)
