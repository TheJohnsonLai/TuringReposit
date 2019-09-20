setscreen ("graphics:750,570")

var Money : int := 1
var Hp : real := 0
var THp : real := 60
var Mana : real := 100
var TMana : real := 120
var rangeX : int
var rangeY : int
var button : int
var CC : boolean := false
var HH : boolean := false
var RJuice : array 1 .. 3 of string
var Juice : string
var Teleport : boolean := false
var FirstKey : int := 0
var Debt : int := 0
var Transcision : int := 0
var RandomChoose : int
var SCL : array 1 .. 3 of int := init (39, 48, 54)
var Random : int
proc Screens
    Draw.FillBox (0, 0, maxx, maxy, 16)
    Draw.FillBox (50, 150, 200, 190, 48)
    Draw.FillBox (50, 100, 200, 140, 39)
    Draw.FillBox (50, 50, 200, 90, 54)
    Draw.FillBox (100, 380, 350, 400, 0)
    Draw.FillBox (330, 380, 350, 200, 0)
    Draw.FillBox (350, 200, 550, 220, 0)
    Draw.FillOval (400, 240, 20, 20, 43)
    Draw.FillBox (280, 450, 310, 480, 0)
    Draw.FillBox (360, 450, 390, 480, 0)
end Screens
Screens
for i : 1 .. 10
    Draw.Box (i, i, maxx + 1 - i, maxy + 1 - i, 25 - i)
end for
FirstKey := 0
Transcision := 0
Teleport := true
if Teleport = true then
    Teleport := false
    %Hp := 1
    Screens
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
end if
put Money
put Hp," / ",THp
put Mana," / ",TMana
