%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Battle Scene smaller procedures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Contains OrderDisplay
% Chatbox
% Skill Animation
% Battle buttons (Menu, help)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% ORDER DISPLAY %%%%%%%%%%%% CUrrent Turn up to 5 %%%%%%%%%%%

proc CurrentOrderDisplay
    var FirstGuyNum : int := 0
    var CTS : int := 1
    loop
	%% DETERMINE WHO'S FIRST!
	if Character (CTS).Identity not= 0 then             %%% Precondition to existence
	    if Character (CTS).Health > 0 then             %%%%%%%%%%%% Hp                 %%% if first not loaded
		CurrentTID := 1             %%Counter ID
		CT (1).ID := CTS             %% ID
		CT (1).Speed := Character (CTS).Speed
		FirstGuyNum := CTS + 1 %% SPeed to ID
		CTS := 12
	    end if
	end if
	CTS += 1
	exit when CTS >= 12
    end loop
    CTS := 2
    for nine : FirstGuyNum .. 12
	%% DETERMINE WHO'S FIRST!
	if Character (nine).Identity not= 0 then              %%% Precondition to existence
	    if Character (nine).Health > 0 then              %%%%%%%%%%%% Hp                 %%% if first not loaded
		CT (CTS).ID := nine           %% ID
		CT (CTS).Speed := (Character (nine).Speed)
		CTS += 1
	    end if
	end if
    end for
    for nine : 1 .. 12
	%% Calc 2x!
	if Character (nine).Identity not= 0 then              %%% Precondition to existence
	    if Character (nine).Health > 0 then              %%%%%%%%%%%% Hp
		CT (CTS).ID := nine           %% ID
		CT (CTS).Speed := (Character (nine).Speed + Character (nine).TotalSpeed)
		CTS += 1
	    end if
	end if
    end for
    CTS -= 1
    loop
	IsSortDone := true
	CurrentTID := 2
	for CycleTurns : FirstGuyNum .. CTS
	    %  put "CTID: " + intstr (CurrentTID)
	    %% one less because sorting            %%%%%%%%%%%% Hp            %%%%%%%%%%%%%%%%%% 2 + compare
	    %  CT (CurrentTID).ID := CycleTurns                 %% ID
	    %  CT (CurrentTID).Speed := Character (CycleTurns).Speed                 %% ID SPEED
	    if CT (CurrentTID - 1).Speed > CT (CurrentTID).Speed then
		%  put "-1: " + intstr (CT (CurrentTID - 1).Speed) + " -2: " + intstr (CT (CurrentTID).Speed)
		tempSpeed := CT (CurrentTID - 1).Speed
		tempID := CT (CurrentTID - 1).ID

		CT (CurrentTID - 1).Speed := CT (CurrentTID).Speed
		CT (CurrentTID - 1).ID := CT (CurrentTID).ID

		CT (CurrentTID).Speed := tempSpeed
		CT (CurrentTID).ID := tempID

		IsSortDone := false
	    end if
	    CurrentTID += 1                     %% Increase to search next

	    % Bubble Sort
	end for
	exit when IsSortDone = true
	/*
	 CurrentTID -= 1
	 put "FirstGuyNum: " + intstr (FirstGuyNum)
	 put "Listing:"
	 for testing : 1 .. CurrentTID
	 put "List: " + intstr (testing) + "[-]" + intstr (CT (testing).Speed)
	 end for */
    end loop
    if CurrentTID > 5 then
	CurrentTID := 5
    end if
end CurrentOrderDisplay

proc Movement_CurrentOrderDisplay
    for CTReset : 1 .. 36
	CT (CTReset).ID := 0
	CT (CTReset).LIST := 0
	CT (CTReset).Speed := 0
    end for
    var FirstGuyNum : int := 0
    var CTS : int := 1
    var StoreSpeed : int := Character (ActiveUser).Speed
    Character (ActiveUser).Speed := 0
    loop
	%% DETERMINE WHO'S FIRST!
	if Character (CTS).Identity not= 0 then             %%% Precondition to existence
	    if Character (CTS).Health > 0 then             %%%%%%%%%%%% Hp                 %%% if first not loaded
		CurrentTID := 1             %%Counter ID
		CT (1).ID := CTS             %% ID
		CT (1).Speed := Character (CTS).Speed
		FirstGuyNum := CTS + 1 %% SPeed to ID
		CTS := 12
	    end if
	end if
	CTS += 1
	exit when CTS >= 12
    end loop
    CTS := 2
    for nine : FirstGuyNum .. 12
	%% DETERMINE WHO'S FIRST!
	if Character (nine).Identity not= 0 then              %%% Precondition to existence
	    if Character (nine).Health > 0 then              %%%%%%%%%%%% Hp                 %%% if first not loaded
		CT (CTS).ID := nine           %% ID
		CT (CTS).Speed := (Character (nine).Speed)
		CTS += 1
	    end if
	end if
    end for
    for nine : 1 .. 12
	%% Calc 2x!
	if Character (nine).Identity not= 0 then              %%% Precondition to existence
	    if Character (nine).Health > 0 then              %%%%%%%%%%%% Hp
		CT (CTS).ID := nine           %% ID
		CT (CTS).Speed := (Character (nine).Speed + Character (nine).TotalSpeed)
		CTS += 1
	    end if
	end if
    end for
    CTS -= 1
    loop
	IsSortDone := true
	CurrentTID := 2
	for CycleTurns : FirstGuyNum .. CTS
	    %  put "CTID: " + intstr (CurrentTID)
	    %% one less because sorting            %%%%%%%%%%%% Hp            %%%%%%%%%%%%%%%%%% 2 + compare
	    %  CT (CurrentTID).ID := CycleTurns                 %% ID
	    %  CT (CurrentTID).Speed := Character (CycleTurns).Speed                 %% ID SPEED
	    if CT (CurrentTID - 1).Speed > CT (CurrentTID).Speed then
		%  put "-1: " + intstr (CT (CurrentTID - 1).Speed) + " -2: " + intstr (CT (CurrentTID).Speed)
		tempSpeed := CT (CurrentTID - 1).Speed
		tempID := CT (CurrentTID - 1).ID

		CT (CurrentTID - 1).Speed := CT (CurrentTID).Speed
		CT (CurrentTID - 1).ID := CT (CurrentTID).ID

		CT (CurrentTID).Speed := tempSpeed
		CT (CurrentTID).ID := tempID

		IsSortDone := false
	    end if
	    CurrentTID += 1                     %% Increase to search next

	    % Bubble Sort
	end for
	exit when IsSortDone = true
	/*
	 CurrentTID -= 1
	 put "FirstGuyNum: " + intstr (FirstGuyNum)
	 put "Listing:"
	 for testing : 1 .. CurrentTID
	 put "List: " + intstr (testing) + "[-]" + intstr (CT (testing).Speed)
	 end for */
    end loop
    if CurrentTID > 5 then
	CurrentTID := 5
    end if
	
    Character (ActiveUser).Speed := StoreSpeed
end Movement_CurrentOrderDisplay

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MENU %%%%%%%%%%%%%%%%%%%%%

proc BattleMenu
    Pic.Draw (BattleMenuSettings, 0, 0, picMerge)
    Font.Draw (intstr (Mx) + " :x<|>y: " + intstr (My), 100, 300, Font1, Gold)
    % Draw.FillBox (0, 100, 10, 620, 16)
    % Draw.Box (10, 100, 10, 620, BorderBlue)
    % Draw.FillBox (maxx, 100,maxx- 10, 620, 16)
    % Draw.Box (maxx-10, 100, maxx- 10, 620, BorderBlue)
    if Mx > 415 and Mx < 625 then
	if My > 470 and My < 530 then
	    Draw.Box (415, 470, 625, 530, BasicBlue)
	elsif My > 392 and My < 452 then
	    Draw.Box (415, 392, 625, 452, BasicBlue)
	elsif My > 307 and My < 367 then
	    Draw.Box (415, 307, 625, 367, BasicBlue)
	elsif My > 232 and My < 292 then
	    Draw.Box (415, 232, 625, 292, BasicBlue)
	elsif My > 162 and My < 222 then
	    Draw.Box (415, 162, 625, 222, BasicBlue)
	    if Mb = 1 then
		% Flee := true
	    end if
	end if
    end if
end BattleMenu

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HELP

proc BattleHelp
end BattleHelp
