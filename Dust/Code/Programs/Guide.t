% Guide & Credits
% A simple unfinished guide for the main screen, and a process to displaying some
% fake credits.

% FIX UP
proc Guide         %[Guide - Main Screen]
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    colourback (151)
    colour (54)
    put "To play this game, you need to know 2 things."
    colour (0)
    put " 1. How to type."
    put " 2. How to click."
    colour (54)
    put ""
    put "This game is still in Beta. Do not attempt to crash it."
    put "This game is heavy in dailogue. A delay of 0-4 seconds is needed for the"
    put " characters to talk. Any longer, then the game is waiting for you to allow it to "
    put " continue."
    put "Simply, press the space bar."
    put "However, don't spam buttons. This is because you will skip other getch codes"
    put " farther down the lines."
    put "To get to main areas, click the area's name. Typing will be in other Beta areas."
    put "Usually, the game will tell you when to type an answer."
    put "You can see this when the Turing App reads 'Waiting for Input'."
    put "Type all answers perfectly. Mispelling will produce undesired results."
    colour (38)
    locatexy (10, 50)
    put "Press the space bar to [Exit]"
    getch (waitkey)
    colourback (0)
end Guide

var Futtontext : string
var CreditNext : boolean := false
var CreditExit : boolean := false

process CreditShow
    Pic.DrawSpecial (CreditPicture (1), 20, 20, picXor, picFadeIn, 3000)
    loop
	if CreditNext = true then
	    Pic.DrawSpecial (CreditPicture (2), 250, 20, picXor, picFadeIn, 3000)
	    CreditNext := false
	    exit
	end if
    end loop
    loop
	if CreditNext = true then
	    Draw.FillBox (0, 0, maxx, maxy, black)
	    Pic.DrawSpecial (CreditPicture (3), 20, 20, picXor, picFadeIn, 3000)
	    CreditNext := false
	    exit
	end if
    end loop    
    loop
	if CreditNext = true then
	    Pic.DrawSpecial (CreditPicture (4), 250, 20, picXor, picFadeIn, 3000)
	    CreditNext := false
	    exit
	end if
    end loop
    loop
	exit when CreditNext = true
    end loop
    Pic.DrawSpecial (CreditPicture (5), 535, 20, picXor, picFadeIn, 3000)
    CreditExit := true
    Futtontext := "Exit"
end CreditShow

proc FuttonOut
    for c : 16 .. 23
	Draw.FillBox (110 - 16 + c, 510 - 16 + c, 190 + 16 - c, 540 + 16 - c, c)
    end for
    for decreasing k : 31 .. 23
	Draw.Line (110, 509 + k, 190, 509 + k, k)
    end for
    for decreasing j : 24 .. 16
	Draw.Line (110, 510 + j, 111, 510 + j, j)
	Draw.Line (189, 510 + j, 190, 510 + j, j)
    end for
    Font.Draw ("" + Futtontext, 130, 520, intfont1, 12)
end FuttonOut

proc FuttonIn
    for c : 16 .. 23
	Draw.FillBox (110 - 16 + c, 510 - 16 + c, 190 + 16 - c, 540 + 16 - c, c)
    end for
    for k : 23 .. 31
	Draw.Line (110, 541 - k, 190, 541 - k, k)
    end for
    for decreasing j : 24 .. 16
	Draw.Line (110, 540 - j, 111, 540 - j, j)
	Draw.Line (189, 540 - j, 190, 540 - j, j)
    end for
    Font.Draw ("" + Futtontext, 130, 520, intfont1, 48)
end FuttonIn

proc Credits         %[Credits - Main Screen]
    var FuttonColour : int
    var Mx, My, B : int
    cls

    setscreen ("offscreenonly")
    Draw.FillBox (0, 0, maxx, maxy, black)
    Futtontext := "Next"

    fork CreditShow
    loop
	for i : 0 .. 10
	    Draw.Box (0 + i, 0 + i, maxx - i, maxy - i, 31- i)
	end for
	Mouse.Where (Mx, My, B)
	FuttonOut
	if Mx >= 110 and Mx <= 190 then
	    if My >= 509 and My <= 540 then
		FuttonIn
		if B = 1 and CreditExit = true then
		    exit
		elsif B = 1 then
		    CreditNext := true
		else
		end if
	    end if
	end if
	View.Update
    end loop

    setscreen ("nooffscreenonly")
end Credits
