% Syrian Spillover

setscreen ("graphics:1280,720")
View.Set ("offscreenonly")

% Normal Vars
var Pressed : array char of boolean
var Exiting : boolean := false
var Mx, My, Mb, TimeElapsed : int := 0
var OCLow, OCHigh : int := 1
var RFSurvivor, RFDeath : int := 0
var Funds : int := 2000000
var CurrentTime : string := "January"
var Month : array 1 .. 13 of string
var Win, Lose : boolean := false
Month (1) := "January"
Month (2) := "February"
Month (3) := "March"
Month (4) := "April"
Month (5) := "May"
Month (6) := "June"
Month (7) := "July"
Month (8) := "August"
Month (9) := "September"
Month (10) := "October"
Month (11) := "November"
Month (12) := "December"
Month (13) := "Complete"
var PianoDown : array 1 .. 8 of int
PianoDown (1) := 0
PianoDown (2) := 0
PianoDown (3) := 0
PianoDown (4) := 0
PianoDown (5) := 0
PianoDown (6) := 0
PianoDown (7) := 0
PianoDown (8) := 0
var PianoKey : array 1 .. 8 of char
PianoKey (1) := 'a'
PianoKey (2) := 's'
PianoKey (3) := 'd'
PianoKey (4) := 'f'
PianoKey (5) := 'h'
PianoKey (6) := 'j'
PianoKey (7) := 'k'
PianoKey (8) := 'l'
var PianoBoole : array 1 .. 8 of boolean
for k : 1 .. 8
    PianoBoole (k) := false
end for

% Fonts
var Font1 := Font.New ("Garamond:16")
var Font2 := Font.New ("Complex:30")
var Font3 := Font.New ("Garamond:12")
var Font4 := Font.New ("AR DESTINE:80")
var Font5 := Font.New ("AR DESTINE:35")
var Font6 := Font.New ("AR DESTINE:13")
var Font7 := Font.New ("AR DESTINE:24")

% Pictures
var Background : int := Pic.FileNew ("Syria_BG2.bmp")

% var People : array 1 .. 100,
var Blue : int := 1
var Sky : int := 2
var Brown : int := 3
var BlazeBlue : int := 4
var Slate : int := 5
var DarkPurple : int := 6
var HardBlue : int := 7
RGB.SetColor (Blue, 0.76, 0.87, 0.9) % (Colour Index / 255 = 0.-)
RGB.SetColor (Sky, 0.51, 0.914, 0.914)
RGB.SetColor (Brown, 0.97647, 0.8549, 0.6941)
RGB.SetColour (BlazeBlue, 0.298, 0.871, 0.988)
RGB.SetColour (Slate, 0.8765, 0.9588, 0.9588)
RGB.SetColour (DarkPurple, 0.0764, 0.0135, 0.1313)
RGB.SetColour (HardBlue, 0.4705, 0.7725, 0.9607)

type ID :
    record
	Type : array 1 .. 1000 of int
	XC : array 1 .. 1000 of int
	YC : array 1 .. 1000 of int
	Speed : array 1 .. 1000 of int
	Funds : array 1 .. 1000 of int
	State : array 1 .. 1000 of boolean
    end record

var People : ID

process Music_BGM
    loop
	Music.PlayFile ("Envy_Heaven.mp3")
    end loop
end Music_BGM

proc CalculateLeft
    for k : 1 .. 1000
	People.Type (k) := Rand.Int (1, 3)
	People.XC (k) := 500
	People.YC (k) := 750
	People.Speed (k) := Rand.Int (0, 4) + People.Type (k)
	People.Funds (k) := Rand.Int (1000, 45000)
	People.State (k) := false
    end for
    for k : 20 .. 400 by 20
	People.Type (k) := 5
	People.XC (k) := 500
	People.YC (k) := 750
	People.Speed (k) := Rand.Int (1, 2)
	People.Funds (k) := Rand.Int (40000, 80000)
	People.State (k) := false
    end for
    for k : 100 .. 900 by 100
	People.Type (k) := 4
	People.XC (k) := 500
	People.YC (k) := 750
	People.Speed (k) := Rand.Int (5, 10)
	People.Funds (k) := Rand.Int (500000 + (k * 500), 4000000 + (k * 1000))
	People.State (k) := false
    end for
end CalculateLeft

process MoneyShow (X, Y, ID, r1, Killed : int)
    for i : 1 .. 20
	if Killed = 1 then
	    Font.Draw ("+ " + intstr (ID), X + r1 + (i), Y - 25 + (i * 3), Font6, 56)
	else
	    Font.Draw ("- " + intstr (ID), X + r1 + (i), Y - 25 + (i * 3), Font6, 38)
	end if
	delay (10)
    end for
end MoneyShow

process DeathAnimation (X, Y, Type, ID, Killed : int)
    var C, CC, r1 : int
    if Killed = 1 then
	C := 176
	CC := 53
    elsif Type = 1 then
	C := 20
	CC := 123
    elsif Type = 2 then
	C := 19
	CC := 119
    elsif Type = 3 then
	C := 24
	CC := 16
    elsif Type = 4 then
	C := 17
	CC := 36
    elsif Type = 5 then
	C := 31
	CC := 48
    end if
    r1 := Rand.Int (-15, 15)
    % fork MoneyShow (X, Y, ID, r1, Killed)
    for i : 1 .. 12
	Draw.FillOval (X, Y, 6, 6, C + (i div 2))
	Draw.Oval (X, Y, 6 + i, 6 + i, CC + i * 4)
	if Killed = 1 then
	    Font.Draw ("+ " + intstr (ID), X + r1 + (i), Y - 25 + (i * 5), Font6, 56)
	else
	    Font.Draw ("- " + intstr (ID), X + r1 + (i), Y - 25 - (i * 5), Font6, 38)
	end if
	View.Update
	delay (10)
    end for
end DeathAnimation

proc DetermineFate (Key : int)
    for k : OCLow .. OCHigh
	if People.State (k) = true then
	    if People.YC (k) >= (234) and People.YC (k) <= 286 then
		if People.XC (k) >= 6 + Key + (Key - 1) * 122 and People.XC (k) <= 4 + Key + (Key) * 122 then
		    Funds += People.Funds (k)
		    if People.Type (k) = 3 then
			RFSurvivor += 4
		    elsif People.Type (k) = 4 then
			RFSurvivor += 7
		    elsif People.Type (k) = 5 then
			RFSurvivor += 35
		    else
			RFSurvivor += Rand.Int (1, 2)
		    end if
		    People.State (k) := false
		    fork DeathAnimation (People.XC (k), People.YC (k), People.Type (k), People.Funds (k), 1)
		    if OCHigh = 250 then
			CalculateLeft
			OCLow := 251
			OCHigh := 266
			for u : OCLow .. OCHigh
			    People.XC (u) := Rand.Int (1, 8) * 122 - 61 + 6
			    People.YC (u) := 727
			    People.State (u) := true
			end for
			Font.Draw ("x 3  Mode", 250, 330, Font4, 54)
			View.Update
			delay (500)
			Funds += 500000
		    elsif OCHigh = 100 then
			CalculateLeft
			OCLow := 101
			OCHigh := 110
			for u : OCLow .. OCHigh
			    People.XC (u) := Rand.Int (1, 8) * 122 - 61 + 6
			    People.YC (u) := 727
			    People.State (u) := true
			end for
			Font.Draw ("x 2  Mode", 250, 330, Font4, 54)
			View.Update
			delay (500)
			Funds += 240000
		    else
			OCHigh += 1
			People.XC (OCHigh + 1) := Rand.Int (1, 8) * 122 - 61 + 6
			People.YC (OCHigh + 1) := 727
			People.State (OCHigh + 1) := true
		    end if
		else
		    exit
		end if
	    elsif People.YC (k) <= (234) then
		Funds -= People.Funds (k) div People.Speed (k)
		People.State (k) := false
		if People.Type (k) = 3 then
		    RFDeath += 2
		elsif People.Type (k) = 4 then
		    RFDeath += 5
		elsif People.Type (k) = 5 then
		    RFDeath += 15
		else
		    RFDeath += 1
		end if
		fork DeathAnimation (People.XC (k), People.YC (k), People.Type (k), People.Funds (k), 0)
		if OCHigh >= 996 then
		elsif OCHigh = 250 then
		    CalculateLeft
		    OCLow := 251
		    OCHigh := 266
		    for u : OCLow .. OCHigh
			People.XC (u) := Rand.Int (1, 8) * 122 - 61 + 6
			People.YC (u) := 727
			People.State (u) := true
		    end for
		    Font.Draw ("x 3  Mode", 250, 330, Font4, 37)
		    View.Update
		    delay (500)
		elsif OCHigh = 100 then
		    CalculateLeft
		    OCLow := 101
		    OCHigh := 110
		    for u : OCLow .. OCHigh
			People.XC (u) := Rand.Int (1, 8) * 122 - 61 + 6
			People.YC (u) := 727
			People.State (u) := true
		    end for
		    Font.Draw ("x 2  Mode", 250, 330, Font4, 37)
		    View.Update
		    delay (500)
		else
		    OCHigh += 1
		    People.XC (OCHigh + 1) := Rand.Int (1, 8) * 122 - 61 + 6
		    People.YC (OCHigh + 1) := 727
		    People.State (OCHigh + 1) := true
		end if
	    end if
	end if
    end for
end DetermineFate

proc MouseDraw (Mx, My, Mb : int)
    Draw.Line (Mx, My - 5, Mx, My + 5, DarkPurple)
    Draw.Line (Mx - 5, My, Mx + 5, My, DarkPurple)
    Draw.Box (Mx - 5, My - 5, Mx + 5, My + 5, DarkPurple)
end MouseDraw

proc DetermineTime
    for k : 1 .. 12
	if ((Time.Elapsed - TimeElapsed) div 10000) >= 14 then
	    CurrentTime := "Complete"
	    Win := true
	elsif ((Time.Elapsed - TimeElapsed) div 10000) = k then
	    CurrentTime := Month (k)
	end if
    end for
end DetermineTime

% Intro %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%************** INTRO ****************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loop
    loop
	Draw.FillBox (0, 0, maxx, maxy, DarkPurple)
	Mouse.Where (Mx, My, Mb)
	MouseDraw (Mx, My, Mb)
	Font.Draw ("Controls", 50, 670, Font2, HardBlue)
	Font.Draw ("Press the following keys to hit the notes.", 10, 600, Font3, BlazeBlue)
	Font.Draw ("Each note will make a corresponding bar smash down.", 10, 580, Font3, BlazeBlue)
	Font.Draw ("Syrian refugees are coming into Jordan. As King Abdullah II, you must order where to send officers to deal with refugees.", 10, 560, Font3, BlazeBlue)
	Font.Draw ("Successfully hitting a note when a refugee comes within range allows the officers to help the refugees.", 10, 540, Font3, BlazeBlue)
	Font.Draw ("Refugees that slip by will be attacked by locals. They won't survive.", 10, 520, Font3, BlazeBlue)
	Font.Draw ("Keep an eye out on funds. Reaching 0 will mean your officers abort the mission, and then you'll fail to help the refugees.", 10, 500, Font3, BlazeBlue)
	Font.Draw ("Click to begin.", 10, 480, Font3, 31)

	Draw.FillOval (190, 360, 6, 6, 28)
	Draw.Oval (190, 360, 7, 7, 54)
	Draw.Oval (190, 360, 8, 8, 103)
	Draw.Line (190, 290, 190, 340, 31)
	Draw.Line (190, 290, 205, 305, 31)
	Draw.Line (190, 290, 175, 305, 31)
	Draw.FillBox (1014, 720 - 580, 1265, 720 - 500, 24)     % Pause
	Draw.Box (1014, 720 - 580, 1265, 720 - 500, DarkPurple)
	Font.Draw ("g", 1090, 170, Font5, 31)
	Font.Draw ("Pause", 1150, 170, Font3, 31)
	for k : 1 .. 8
	    if k = 1 then
		Draw.FillBox (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 28)
		Draw.Box (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 16)
		Draw.FillBox (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, 54)
		Draw.Box (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, 55)
		Font.Draw (PianoKey (k), k * 122 - 61, 32, Font5, 31)
		% fork DeathAnimation (66, 260, 4, 0)
		Draw.FillOval (66, 260, 6, 6, 31)
		Draw.Oval (66, 260, 7, 7, 55)
		Draw.Oval (66, 260, 9, 9, 53)
		Draw.Oval (66, 260, 12, 12, 52)
	    else
		Draw.FillBox (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 30)
		Draw.Box (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 16)
		Draw.FillBox (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, BlazeBlue)
		Draw.Box (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, HardBlue)
		Font.Draw (PianoKey (k), k * 122 - 61, 32, Font5, 31)
	    end if
	end for
	if Mb = 1 then
	    delay (200)
	    Draw.FillBox (600, 320, 680, 400, DarkPurple)
	    Font.Draw ("3", 620, 350, Font4, 39)
	    View.Update
	    delay (1000)
	    Draw.FillBox (600, 320, 680, 400, DarkPurple)
	    Font.Draw ("2", 620, 350, Font4, 39)
	    View.Update
	    delay (1000)
	    Draw.FillBox (600, 320, 680, 400, DarkPurple)
	    Font.Draw ("1", 620, 350, Font4, 39)
	    View.Update
	    delay (1000)
	    Draw.FillBox (600, 320, 680, 400, DarkPurple)
	    Font.Draw ("GO!", 620, 350, Font4, 39)
	    View.Update
	    fork Music_BGM
	    delay (1000)
	    for k : 1 .. 320
		Pic.Draw (Background, 0, 0, picCopy)
		Draw.FillBox (0, 0, 640 - (k * 2), maxy, DarkPurple)
		Draw.FillBox (640 + (k * 2), 0, maxx, maxy, DarkPurple)
		View.Update
		delay (15)
	    end for
	    exit
	end if
	View.Update
	delay (10)
    end loop

    % Main
    loop
	CalculateLeft
	TimeElapsed := Time.Elapsed
	OCLow := 1
	OCHigh := 6
	for k : 1 .. 6
	    People.XC (k) := Rand.Int (1, 8) * 122 - 61 + 6
	    People.YC (k) := 727
	    People.State (k) := true
	end for

	loop % Main Draw
	    Pic.Draw (Background, 0, 0, picCopy)
	    Draw.FillBox (1014, 720 - 580, 1265, 720 - 500, 24) % Pause
	    Draw.Box (1014, 720 - 580, 1265, 720 - 500, DarkPurple)
	    Font.Draw ("Pause", 1070, 165, Font5, 31)
	    Mouse.Where (Mx, My, Mb)
	    if OCHigh > 996 then
		OCHigh := 996
		Win := true
	    end if
	    for k : OCLow .. OCHigh
		if People.State (k) = true then
		    People.YC (k) -= People.Speed (k)
		    if People.Type (k) = 1 then
			Draw.FillOval (People.XC (k), People.YC (k), 6, 6, 16)
			Draw.Oval (People.XC (k), People.YC (k), 7, 7, 123)
			Draw.Oval (People.XC (k), People.YC (k), 8, 8, 49)
		    elsif People.Type (k) = 2 then
			Draw.FillOval (People.XC (k), People.YC (k), 6, 6, 33)
			Draw.Oval (People.XC (k), People.YC (k), 7, 7, 38)
			Draw.Oval (People.XC (k), People.YC (k), 8, 8, 64)
		    elsif People.Type (k) = 3 then
			Draw.FillOval (People.XC (k), People.YC (k), 6, 6, 28)
			Draw.Oval (People.XC (k), People.YC (k), 7, 7, 54)
			Draw.Oval (People.XC (k), People.YC (k), 8, 8, 103)
		    elsif People.Type (k) = 4 then
			Draw.FillOval (People.XC (k), People.YC (k), 6, 6, 17)
			Draw.Oval (People.XC (k), People.YC (k), 7, 7, 51)
			Draw.Oval (People.XC (k), People.YC (k), 8, 8, 52)
			Draw.Oval (People.XC (k), People.YC (k), 12, 12, 54)
			Draw.Oval (People.XC (k), People.YC (k), 11, 11, 54)
		    elsif People.Type (k) = 5 then
			Draw.FillOval (People.XC (k), People.YC (k), 6, 6, 31)
			Draw.Oval (People.XC (k), People.YC (k), 7, 7, HardBlue)
			Draw.Oval (People.XC (k), People.YC (k), 8, 8, BlazeBlue)
			Draw.Oval (People.XC (k), People.YC (k), 12, 12, 52)
			Draw.Oval (People.XC (k), People.YC (k), 11, 11, 51)
		    end if
		end if
	    end for

	    for k : 1 .. 8
		Input.KeyDown (Pressed)
		if Pressed (PianoKey (k)) then
		    Funds -= 1000
		    PianoBoole (k) := true
		    PianoDown (k) := 1
		end if
	    end for

	    for k : 1 .. 8
		if PianoBoole (k) = true then
		    Draw.FillBox (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 28)
		    Draw.Box (6 + k + (k - 1) * 122, 720 - 707, 4 + k + (k) * 122, 718 - 582, 16)
		    Draw.FillBox (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, BlazeBlue)
		    Draw.Box (6 + k + (k - 1) * 122, 720 - 479, 4 + k + (k) * 122, 718 - 440, HardBlue)
		    DetermineFate (k)
		end if
	    end for
	    DetermineFate (0)

	    if Funds <= 0 then
		Funds := 0
		Lose := true
		exit
	    elsif CurrentTime = "Complete" then
		Win := true
	    end if

	    Font.Draw (intstr (RFSurvivor) + "000", 1025, 720 - 311, Font6, 54)
	    Font.Draw (intstr (RFDeath) + "000", 1025, 720 - 376, Font6, 39)
	    Font.Draw (intstr (Funds), 1020, 15, Font7, 38)
	    DetermineTime
	    Font.Draw (CurrentTime, 1025, 720 - 435, Font3, BlazeBlue)
	    MouseDraw (Mx, My, Mb)
	    Input.KeyDown (Pressed)
	    if Mx >= 1014 and Mx <= 1265 and My >= (720 - 580) and My <= (720 - 500) or Pressed ('g') then
		Draw.FillBox (1014, 720 - 580, 1265, 720 - 500, HardBlue)
		Draw.Box (1014, 720 - 580, 1265, 720 - 500, DarkPurple)
		Font.Draw ("Pause", 1070, 165, Font5, 22)
		if Mb = 1 or Pressed ('g') then
		    View.Update
		    delay (200)
		    loop
			Mouse.Where (Mx, My, Mb)
			Input.KeyDown (Pressed)
			if Pressed ('g') then
			    delay (100)
			    exit
			end if
			if Mx >= 1014 and Mx <= 1265 and My >= (720 - 580) and My <= (720 - 500) then
			    Draw.FillBox (1014, 720 - 580, 1265, 720 - 500, Slate)
			    Draw.Box (1014, 720 - 580, 1265, 720 - 500, BlazeBlue)
			    Font.Draw ("Resume", 1065, 165, Font5, 22)
			    if Mb = 1 then
				delay (200)
				exit
			    end if
			else
			    Draw.FillBox (1014, 720 - 580, 1265, 720 - 500, HardBlue)
			    Draw.Box (1014, 720 - 580, 1265, 720 - 500, DarkPurple)
			    Font.Draw ("Paused", 1070, 165, Font5, 22)
			end if
			View.Update
		    end loop
		end if
	    end if
	    View.Update
	    if Lose = true then
		exit
	    elsif Win = true then
		exit
	    end if
	    delay (10)
	    cls
	    for k : 1 .. 8
		PianoDown (k) := 0
		PianoBoole (k) := false
	    end for
	end loop

	if Lose = true then
	    Draw.FillBox (50, 600, maxx - 50, 620, 16)
	    Font.Draw ("Failed", 500, 580, Font4, 39)
	elsif Win = true then
	    Draw.FillBox (50, 600, maxx - 50, 620, 16)
	    Font.Draw ("Success", 300, 580, Font4, 53)
	end if
	View.Update
	delay (1000)

	for decreasing k : 320 .. 1
	    Pic.Draw (Background, 0, 0, picCopy)
	    Draw.FillBox (0, 0, 640 - (k * 2), maxy, DarkPurple)
	    Draw.FillBox (640 + (k * 2), 0, maxx, maxy, DarkPurple)
	    View.Update
	    delay (15)
	end for
	for k : 1 .. 320
	    Draw.FillBox (0, 0, maxx, maxy, 16)
	    Draw.FillBox (0, 0, maxx, maxy, BlazeBlue)
	    Font.Draw ("Enter your name", 200, 350, Font4, 31)
	    Draw.FillBox (0, 0, 640 - (k * 2), maxy, DarkPurple)
	    Draw.FillBox (640 + (k * 2), 0, maxx, maxy, DarkPurple)
	    View.Update
	    delay (15)
	end for

	var stream : int
	var YourName : string := ""
	var YourScore : int := ((RFSurvivor - RFDeath) * 1000) + Funds
	var YourRank : int := 0
	var Tops : array 1 .. 11 of int
	var TopsName : array 1 .. 11 of string
	var TN : string
	var Temp : int := 0
	var ctr : int := 0
	var itis : int := 0
	var Pressed2 : boolean := false
	cls
	loop
	    Pressed2 := false
	    Draw.FillBox (0, 0, maxx, maxy, 16)
	    Draw.FillBox (0, 0, maxx, maxy, BlazeBlue)
	    Font.Draw ("Enter your name", 200, 350, Font4, 31)
	    Font.Draw (YourName + "_", 250, 280, Font5, 38)
	    Font.Draw ("Score: " + intstr (((RFSurvivor - RFDeath) * 1000) + Funds), 200, 220, Font6, 16)
	    Input.KeyDown (Pressed)
	    for k : 33 .. 122
		if Pressed ((chr (k))) then
		    ctr := 0
		    itis := k
		    for o : 1 .. length (YourName)
			ctr += 1
		    end for
		    if Pressed (chr (13)) then
			itis -= 27
		    end if
		    if ctr <= 20 then
			YourName += chr (itis)
		    else
			YourName := YourName (1 .. 20)
		    end if
		    Pressed2 := true
		end if
	    end for
	    if Pressed (KEY_BACKSPACE) then
		ctr := 0
		for o : 1 .. length (YourName)
		    ctr += 1
		end for
		if ctr > 1 then
		    YourName := YourName (1 .. * -1)
		elsif ctr = 1 then
		    YourName := ""
		end if
		Pressed2 := true
	    end if
	    if Pressed (KEY_ENTER) then
		exit
	    end if
	    View.Update
	    if Pressed2 = true then
		delay (140)
	    end if
	end loop

	open : stream, "Scores.txt", read
	for k : 1 .. 10
	    read : stream, Tops (k)
	    read : stream, TopsName (k)
	    exit when eof (stream)
	end for
	close : stream
	Tops (11) := YourScore
	TopsName (11) := YourName


	var Looped : boolean := false
	loop
	    Looped := false
	    for k : 1 .. 10
		if Tops (k) < Tops (k + 1) then
		    Temp := Tops (k + 1)
		    TN := TopsName (k + 1)
		    Tops (k + 1) := Tops (k)
		    TopsName (k + 1) := TopsName (k)
		    Tops (k) := Temp
		    TopsName (k) := TN
		    Looped := true
		end if
	    end for
	    if Looped = false then
		exit
	    end if
	end loop


	open : stream, "Scores.txt", write
	for f : 1 .. 10
	    write : stream, Tops (f)
	    write : stream, TopsName (f)
	end for
	close : stream

	for k : 1 .. 11
	    if Tops (k) = YourScore then
		YourRank := k
		exit
	    end if
	end for

	View.Update
	loop
	    Draw.FillBox (0, 0, maxx, maxy, 16)
	    Draw.FillBox (0, 0, maxx, maxy, BlazeBlue)
	    if Lose = true then
		Draw.FillBox (200, 100, maxx - 200, 550, Slate)
		Draw.Box (200, 100, maxx - 200, 550, HardBlue)
		Font.Draw ("You failed to protect the Syrian refugees.", 250, 490, Font1, 16)
		Font.Draw (intstr (RFDeath) + "000 refugees are facing persecution from local Jordanians.", 250, 450, Font1, 16)
		Font.Draw ("Those that do escape, at best, will live a life of fear and poverty.", 250, 410, Font1, 16)
		Font.Draw ("A small portion will be arrested and deports back into Syria.", 250, 370, Font1, 16)
		Font.Draw ("You've failed your country, King Abdullah II, and those migrating to it.", 250, 330, Font1, 16)
		Font.Draw ("[E] to Exit, [R] to restart", 250, 280, Font1, 21)
		Font.Draw ("Your score: " + intstr (((RFSurvivor - RFDeath) * 1000) + Funds), 250, 230, Font1, 58)
	    else
		Draw.FillBox (200, 100, maxx - 200, 550, Slate)
		Draw.Box (200, 100, maxx - 200, 550, HardBlue)
		Font.Draw ("You succeeded in securing the refugees.", 250, 490, Font1, 16)
		Font.Draw (intstr (RFSurvivor) + "000 refugees under your eye have made it safely across the border.", 250, 450, Font1, 16)
		Font.Draw ("Donations from Canada, U.K and the United States are coming in as they see results.", 250, 410, Font1, 16)
		Font.Draw ("The spillover has not been damaging to Jordan.", 250, 370, Font1, 16)
		Font.Draw ("Great job, King Abdullah II.", 250, 330, Font1, 16)
		Font.Draw ("[E] to Exit, [R] to restart", 250, 280, Font1, 21)
		Font.Draw ("Your score: " + intstr (((RFSurvivor - RFDeath) * 1000) + Funds), 250, 230, Font1, 58)
	    end if
	    Draw.FillBox (300, 20, 980, 220, 29)
	    Draw.Box (300, 20, 980, 220, 16)
	    for k : 1 .. 5
		if YourRank = k then
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 310, 215 - k * 35, Font6, 58)
		elsif k = 1 then
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 310, 215 - k * 35, Font6, 38)
		elsif k = 2 then
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 310, 215 - k * 35, Font6, 57)
		elsif k = 3 then
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 310, 215 - k * 35, Font6, 56)
		else
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 310, 215 - k * 35, Font6, 55)
		end if
	    end for
	    for k : 6 .. 10
		if YourRank = k then
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 650, 215 - (k - 5) * 35, Font6, 58)
		else
		    Font.Draw (intstr (k) + ". " + TopsName (k) + ": " + intstr (Tops (k)), 650, 215 - (k - 5) * 35, Font6, 54)
		end if
	    end for
	    Mouse.Where (Mx, My, Mb)
	    Input.KeyDown (Pressed)
	    if Pressed ('e') then
		Exiting := true
		exit
	    elsif Pressed ('r') then
		exit
	    end if
	    View.Update
	end loop
	Win := false
	Lose := false
	Funds := 2000000
	RFSurvivor := 0
	RFDeath := 0
	exit
    end loop
    exit when Exiting = true
end loop
