% Battle file
/*
 proc setPositions
 for i : 1 .. 2
 for pD : 1 .. 7
 if (i = 1) then
 player (i).piece (pD).pX := 170 + 49 * (pD - 1)
 else
 player (i).piece (pD).pX := 1111 - 49 * (pD - 1)
 end if
 player (i).piece (pD).pY := (317)
 end for
 end for
 end setPositions

 proc DrawGUI
 for i : 1 .. 2
 for pD : 1 .. 7
 if player (i).piece (pD).pID = "red"
 pic.Draw (pRedBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
 elsif p1.piece (pD).pID = "blue"
 pic.Draw (pBlueBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
 elsif p1.piece (pD).pID = "grey"
 pic.Draw (pGreyBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
 elsif p1.piece (pD).pID = "black"
 pic.Draw (pBlackBMP, player (i).piece (pD).pX, player (i).piece (pD).pY, picMerge)
 end if
 end for
 end for
 end DrawGUI
 */

proc CheckMouse
    if Mx < 0 then
	Mx := 0
    end if
    if Mx > 1280 then
	Mx := 1280
    end if
    if My < 0 then
	My := 0
    end if
    if My > 720 then
	My := 720
    end if
end CheckMouse

type BoardComposition :
    record
	bX : int
	bY : int
    end record
var BoardPositions : array 1 .. 15 of BoardComposition
proc BP (ct : int)
    if ct = 1 then
	for b : 1 .. 4
	    BoardPositions (b).bX := 560
	end for
	for b : 13 .. 14
	    BoardPositions (b).bX := 560
	end for
	BoardPositions (15).bX := 560 %% Ending
	BoardPositions (15).bY := 242
    else
	for b : 1 .. 4
	    BoardPositions (b).bX := 722
	end for
	for b : 13 .. 14
	    BoardPositions (b).bX := 722
	end for
	BoardPositions (15).bX := 722 %% Ending RIght (CT = 2)
	BoardPositions (15).bY := 242
    end if
    for b : 1 .. 4
	BoardPositions (b).bY := 398 + (b - 1) * 78
    end for
    for b : 13 .. 14
	BoardPositions (b).bY := 86 + (b - 13) * 78
    end for
    for b : 5 .. 12
	BoardPositions (b).bX := 641
	BoardPositions (b).bY := 632 - (b - 5) * 78
    end for
end BP

fcn FindVacancy (teamNum : int, p : pieceComposition, pTeam : teamComposition) : pieceComposition %% KILLED PIECE
    var newPiece : pieceComposition := p
    if teamNum = 1 then
	for s : 1 .. 7
	    if ((1 - s) not= pTeam.piece (s).pP) then
		newPiece.pX := (171 + 49 * (s - 1))
		newPiece.pY := 297
		newPiece.pP := (1 - s)
		newPiece.pCondition := false
		exit
	    end if
	end for
    else
	for s : 1 .. 7
	    if (1 - s) not= pTeam.piece (s).pP then
		newPiece.pX := 1064 - 49 * (s - 1)
		newPiece.pY := 297
		newPiece.pP := (1 - s)
		newPiece.pCondition := false
		exit
	    end if
	end for
    end if
    result newPiece
end FindVacancy

fcn Possible (p1 : teamComposition, p2 : teamComposition, ID : int, To : int, From : int) : boolean
    var CanDo : boolean := false
    var Vacancy : int := 0
    if To >= 16 or From >= 16 then
	result false
    end if
    if ID = 1 then % Determine possible landing with "player 1"
	for s : 1 .. 7 % Land on own?
	    if (To = p1.piece (s).pP) then
		Vacancy := -1
	    end if
	end for
	for s : 1 .. 7 % Kill an opponent?
	    if (To = p2.piece (s).pP) then
		if To = 8 then
		    Vacancy := -1
		else
		    Vacancy := 1
		end if
	    end if
	end for
	if To = 15 then % TO = 1 to 15, FROM = 1 to 15
	    Vacancy := 0
	end if

	if Vacancy = -1 then
	    CanDo := false
	elsif Vacancy = 1 then
	    CanDo := true
	    Pass := false
	elsif Vacancy = 0 then
	    CanDo := true
	    Pass := false
	end if
    elsif ID = 2 then % Determine possible landing with "player 2"
	for s : 1 .. 7 % Land on own?
	    if (To = p2.piece (s).pP) then
		Vacancy := -1
	    end if
	end for
	for s : 1 .. 7 % Kill an opponent?
	    if (To = p1.piece (s).pP) then
		if To = 8 then
		    Vacancy := -1
		else
		    Vacancy := 1
		end if
	    end if
	end for
	if To = 15 then % TO = 1 to 15, FROM = 1 to 15
	    Vacancy := 0
	end if

	if Vacancy = -1 then
	    CanDo := false
	elsif Vacancy = 1 then
	    CanDo := true
	    Pass := false
	elsif Vacancy = 0 then
	    CanDo := true
	    Pass := false
	end if
    end if
    % Debug
    %put CanDo
    %View.Update
    %delay (5000)
    % End Debug
    result CanDo
end Possible

fcn Movement (ct : int, var pD : int) : int

    result pD
end Movement

proc Battle (ct : int)


end Battle
