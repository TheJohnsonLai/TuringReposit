% Skills of enemies and main character
% Also has pet skills and teammate skills
% Animations are included

% Skill Animation [ANIMATION1]

proc Waitskill
end Waitskill

proc SideCut_Animation
    for i : 1 .. 6
	Pic.Draw (SideCutSword, SwordSwipeX, SwordSwipeY, picXor)
	delay (32)
	Pic.Draw (SideCutSword, SwordSwipeX, SwordSwipeY, picXor)
	SwordSwipeX += 40
	SwordSwipeY += 2
    end for
    Pic.Draw (SideCutSword, SwordSwipeX, SwordSwipeY, picXor)
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 280, intfont, 12)
end SideCut_Animation

proc BloodShot_Animation
    var Bulletx : int
    var Bullety : int := 150
    loop
	Bulletx := Rand.Int (500, 650)
	Bullety += 30
	Draw.FillOval (Bulletx, Bullety, 3, 3, 39)
	Draw.FillOval (Bulletx, Bullety, 3, 3, 38)
	delay (150)
	exit when Bullety >= 500
	Display := realstr (Attacked / 15, 4)
	Font.Draw (Display + "", Bulletx + 5, Bullety + 5, intfont2, 39)
    end loop
end BloodShot_Animation

proc ManaShot_Animation
    var Bulletx : int := 200
    var Bullety : int := 15
    var Bulletxy : int := 0
    var Bulletyx : int := 250
    var Switchin : int := 1
    loop
	Bulletx += 20
	Bullety := Rand.Int (14, 17)
	Bulletxy := Rand.Int (-1, 2)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 25)
	Draw.Oval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 34)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 3, Bullety - 3, 103)
	Draw.Line (Bulletx - 125, Bulletyx + Bulletxy, Bulletx - 70, Bulletyx + Bulletxy, 25)
	if Switchin = 1 then
	    Draw.Line (Bulletx - 95, Bulletyx + Bulletxy + 5, Bulletx - 60, Bulletyx + Bulletxy + 7, 27)
	    Draw.Line (Bulletx - 95, Bulletyx + Bulletxy - 5, Bulletx - 60, Bulletyx + Bulletxy - 7, 27)
	else
	    Draw.Line (Bulletx - 85, Bulletyx + Bulletxy + 9, Bulletx - 30, Bulletyx + Bulletxy + 10, 54)
	    Draw.Line (Bulletx - 115, Bulletyx + Bulletxy - 9, Bulletx - 30, Bulletyx + Bulletxy - 10, 54)
	end if
	delay (20)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 0)
	Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 3, Bullety - 3, 0)
	Draw.Line (Bulletx - 125, Bulletyx + Bulletxy, Bulletx - 70, Bulletyx + Bulletxy, 0)
	if Switchin = 1 then
	    Draw.Line (Bulletx - 95, Bulletyx + Bulletxy + 5, Bulletx - 60, Bulletyx + Bulletxy + 7, 0)
	    Draw.Line (Bulletx - 95, Bulletyx + Bulletxy - 5, Bulletx - 60, Bulletyx + Bulletxy - 7, 0)
	    Switchin := 2
	else
	    Draw.Line (Bulletx - 85, Bulletyx + Bulletxy + 9, Bulletx - 30, Bulletyx + Bulletxy + 10, 0)
	    Draw.Line (Bulletx - 115, Bulletyx + Bulletxy - 9, Bulletx - 30, Bulletyx + Bulletxy - 10, 0)
	    Switchin := 1
	end if
	exit when Bulletx >= 550
    end loop
    Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 25)
    Draw.Oval (Bulletx, Bulletyx + Bulletxy, Bullety, Bullety, 34)
    Draw.FillOval (Bulletx, Bulletyx + Bulletxy, Bullety - 3, Bullety - 3, 103)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (32)
    Draw.FillOval (Bulletx + 5, Bulletyx + Bulletxy, Bullety - 5, Bullety + 5, 103)
    delay (32)
    Draw.FillOval (Bulletx + 5, Bulletyx + Bulletxy, Bullety - 5, Bullety + 5, 0)
    Draw.FillOval (Bulletx + 10, Bulletyx + Bulletxy, Bullety - 10, Bullety + 10, 103)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (32)
    Draw.FillOval (Bulletx + 10, Bulletyx + Bulletxy, Bullety - 10, Bullety + 10, 0)
    Draw.FillOval (Bulletx + 13, Bulletyx + Bulletxy, Bullety - 13, Bullety + 13, 103)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (32)
    Draw.FillOval (Bulletx + 13, Bulletyx + Bulletxy, Bullety - 13, Bullety + 13, 0)
    Draw.FillOval (Bulletx + 11, Bulletyx + Bulletxy, Bullety + 19, Bullety + 19, 102)
    Draw.FillBox (Bulletx + 16, Bulletyx + Bulletxy - 65, Bulletx + 117, Bulletyx + Bulletxy + 75, 0)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (32)
    Draw.FillOval (Bulletx + 11, Bulletyx + Bulletxy, Bullety + 19, Bullety + 19, 0)
    Draw.Oval (Bulletx - 1, Bulletyx + Bulletxy, Bullety + 40, Bullety + 40, 101)
    Draw.Oval (Bulletx - 1, Bulletyx + Bulletxy, Bullety + 20, Bullety + 20, 100)
    Draw.FillOval (Bulletx - 1, Bulletyx + Bulletxy, Bullety + 6, Bullety + 6, 99)
    Draw.FillBox (Bulletx + 16, Bulletyx + Bulletxy - 65, Bulletx + 157, Bulletyx + Bulletxy + 125, 0)
    Draw.Line (Bulletx, Bulletyx + Bulletxy + 4, Bulletx - 50, Bulletyx + Bulletxy + 40, 38)
    Draw.Line (Bulletx, Bulletyx + Bulletxy - 4, Bulletx - 50, Bulletyx + Bulletxy - 40, 38)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (42)
    Draw.FillOval (Bulletx - 1, Bulletyx + Bulletxy, Bullety + 50, Bullety + 50, 0)
    Draw.Line (Bulletx - 100, Bulletyx + Bulletxy + 45, Bulletx - 150, Bulletyx + Bulletxy + 60, 38)
    Draw.Line (Bulletx - 100, Bulletyx + Bulletxy - 45, Bulletx - 150, Bulletyx + Bulletxy - 60, 38)
    Draw.Line (Bulletx - 45, Bulletyx + Bulletxy + 30, Bulletx - 80, Bulletyx + Bulletxy + 70, 43)
    Draw.Line (Bulletx - 45, Bulletyx + Bulletxy - 30, Bulletx - 80, Bulletyx + Bulletxy - 70, 43)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 55)
    delay (42)
    Draw.Line (Bulletx - 100, Bulletyx + Bulletxy + 45, Bulletx - 150, Bulletyx + Bulletxy + 60, 0)
    Draw.Line (Bulletx - 100, Bulletyx + Bulletxy - 45, Bulletx - 150, Bulletyx + Bulletxy - 60, 0)
    Draw.Line (Bulletx - 45, Bulletyx + Bulletxy + 30, Bulletx - 80, Bulletyx + Bulletxy + 70, 0)
    Draw.Line (Bulletx - 45, Bulletyx + Bulletxy - 30, Bulletx - 80, Bulletyx + Bulletxy - 70, 0)
    Draw.Line (Bulletx + Bullety, 340, Bulletx + Bullety, 160, 0)
    delay (200)
end ManaShot_Animation

proc DoubleSlash_Animation
    var DoubleX : int
    var DoubleY : int
    for l : 1 .. 10
	DoubleX := ((10000 - ((100 - (l * 10)) ** 2)) ** 0.5) div 2 * 2
	DoubleY := ((10000 - (DoubleX ** 2)) ** 0.5) div 2 * 2
	Draw.Line (350, 250, 590 + DoubleX, 270 + DoubleY, 44 - l)
	Draw.Line (350, 250, 590 + DoubleX, 266 + DoubleY, 43 - l)
	Draw.Line (350, 250, 590 + DoubleX, 262 + DoubleY, 42 - l)
	Draw.Line (350, 250, 590 + DoubleX, 258 + DoubleY, 41 - l)
	Draw.Line (350, 250, 590 + DoubleX, 254 + DoubleY, 40 - l)
	Draw.Line (350, 250, 590 + DoubleX, 250 + DoubleY, 39 - l)
	delay (32)
	Draw.Line (350, 250, 590 + DoubleX, 270 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 266 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 262 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 258 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 254 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 250 + DoubleY, 0)
    end for
    for decreasing l : 10 .. 1
	DoubleX := ((10000 - ((100 - (l * 10)) ** 2)) ** 0.5) div 2 * 2
	DoubleY := ((10000 - (DoubleX ** 2)) ** 0.5) div 2 * 2
	Draw.Line (350, 250, 590 + DoubleX, 270 + DoubleY, 44 - l)
	Draw.Line (350, 250, 590 + DoubleX, 266 + DoubleY, 43 - l)
	Draw.Line (350, 250, 590 + DoubleX, 262 + DoubleY, 42 - l)
	Draw.Line (350, 250, 590 + DoubleX, 258 + DoubleY, 41 - l)
	Draw.Line (350, 250, 590 + DoubleX, 254 + DoubleY, 40 - l)
	Draw.Line (350, 250, 590 + DoubleX, 250 + DoubleY, 39 - l)
	delay (32)
	Draw.Line (350, 250, 590 + DoubleX, 270 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 266 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 262 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 258 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 254 + DoubleY, 0)
	Draw.Line (350, 250, 590 + DoubleX, 250 + DoubleY, 0)
    end for
end DoubleSlash_Animation

proc SpeedSlice_Animation
    var Bulletx : int
    var Bullety : int
    delay (500)
    Draw.Oval (570, 260, 18, 18, 38)
    Draw.Oval (570, 260, 20, 20, 16)
    delay (350)
    for j : 1 .. 5
	Draw.Line (570, 260, 570, 260 + (j * 23), 51)
	delay (12)
    end for
    for i : 1 .. 9
	Bulletx := Rand.Int (560, 580)
	Bullety := Rand.Int (340, 440)
	Draw.Oval (Bulletx, Bullety, 2, 2, 39)
	delay (15)
    end for
    delay (350)
    for j : 1 .. 5
	Draw.Line (570 - (16 * j), 260 - (20 * j), 570, 260, 53)
	delay (12)
    end for
    for i : 1 .. 9
	Bulletx := Rand.Int (430, 482)
	Bullety := Rand.Int (110, 182)
	Draw.Oval (Bulletx, Bullety, 2, 2, 39)
	delay (15)
    end for
    delay (100)
    for j : 1 .. 5
	Draw.Line (570 + (j * 21), 260 - (20 * j), 570, 260, 52)
    end for
    for i : 1 .. 9
	Bulletx := Rand.Int (668, 720)
	Bullety := Rand.Int (110, 182)
	Draw.Oval (Bulletx, Bullety, 2, 2, 39)
	delay (15)
    end for
    delay (500)
end SpeedSlice_Animation

proc StarShot_Animation
    var Bulletx : int := 220
    var Bullety : int := 300
    var Radian : int := 25
    var SparkX : int
    var SparkY : int
    var Radius : int := 6
    var SXM : array 1 .. 3 of int
    var SYM : array 1 .. 3 of int
    var RSM : array 1 .. 3 of int
    for i : 1 .. 8
	Bullety := Rand.Int (298, 302)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian, Radian, 34)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian + 15, Radian + 15, 35)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian + 11, Radian + 11, 33)
	SparkX := Rand.Int (Bulletx + (i * 45) - 25, Bulletx + (i * 45) + 25)
	SparkY := Rand.Int (Bullety - 25, Bullety + 25)
	SXM (1) := SparkX
	SYM (1) := SparkY
	Draw.Oval (SparkX, SparkY, Radius, Radius, 40)
	SparkX := Rand.Int (Bulletx + (i * 45) - 25, Bulletx + (i * 45) + 25)
	SparkY := Rand.Int (Bullety - 25, Bullety + 25)
	SXM (2) := SparkX
	SYM (2) := SparkY
	Draw.Oval (SparkX, SparkY, Radius, Radius, 40)
	SparkX := Rand.Int (Bulletx + (i * 45) - 25, Bulletx + (i * 45) + 25)
	SparkY := Rand.Int (Bullety - 25, Bullety + 25)
	SXM (3) := SparkX
	SYM (3) := SparkY
	Draw.Oval (SparkX, SparkY, Radius, Radius, 40)
	delay (27)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian, Radian, 0)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian + 15, Radian + 15, 0)
	Draw.Oval (Bulletx + (i * 45), Bullety, Radian + 11, Radian + 11, 0)
	for k : 1 .. 3
	    Draw.Oval (SXM (k), SYM (k), Radius, Radius, 0)
	end for
    end for
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 320, intfont, 39)
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 15, Radian - 15, 34)
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 30, Radian, 35)
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 26, Radian - 4, 33)
    for k : 1 .. 3
	Draw.Oval (SXM (k) + 30, SYM (k), Radius + 1, Radius - 3, 40)
    end for
    delay (50) % Erase
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 15, Radian - 15, 0)
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 30, Radian, 0)
    Draw.Oval (Bulletx + (8 * 45) + 30, Bullety, Radian + 26, Radian - 4, 0)
    for k : 1 .. 3
	Draw.Oval (SXM (k) + 30, SYM (k), Radius + 1, Radius - 3, 0)
    end for
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 22, Radian - 22, 34)
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 37, Radian - 7, 35)
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 33, Radian - 11, 33)
    for k : 1 .. 3
	Draw.Oval (SXM (k) + 40, SYM (k), Radius + 2, Radius - 4, 40)
    end for
    delay (50) % Erase
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 22, Radian - 22, 0)
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 37, Radian - 7, 0)
    Draw.Oval (Bulletx + (8 * 45) + 40, Bullety, Radian + 33, Radian - 11, 0)
    for k : 1 .. 3
	Draw.Oval (SXM (k) + 40, SYM (k), Radius + 2, Radius - 4, 0)
    end for
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 280, intfont, 39)
    delay (50) % Erase
    for i : 1 .. 5
	Draw.Oval (580, 300, 35 + (i * 5), 35 + (i * 5), 36)
	Draw.Oval (580, 300, 35 + (i * 2), 35 + (i * 2), 34)
	Draw.Line (540 - (i * 9), 300, 560 - (i * 9), 300, 35)
	Draw.Line (600 + (i * 9), 300, 620 + (i * 9), 300, 35)
	Draw.Line (580, 310 + (i * 9), 580, 330 + (i * 9), 35)
	Draw.Line (580, 290 - (i * 9), 580, 270 - (i * 9), 35)
	delay (50)
	Draw.Oval (580, 300, 35 + (i * 5), 35 + (i * 5), 0)
	Draw.Oval (580, 300, 35 + (i * 2), 35 + (i * 2), 0)
	Draw.Line (540 - (i * 9), 300, 560 - (i * 9), 300, 0)
	Draw.Line (600 + (i * 9), 300, 620 + (i * 9), 300, 0)
	Draw.Line (580, 310 + (i * 9), 580, 330 + (i * 9), 0)
	Draw.Line (580, 290 - (i * 9), 580, 270 - (i * 9), 0)
    end for
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 570, 240, intfont, 39)
end StarShot_Animation

proc Shots_Animation
    var Bulletx : int
    var Bullety : int
    var Fired : int := 0
    Floaty := 300
    loop
	Floatx := Rand.Int (500, 530)
	Bulletx := Rand.Int (450, 600)
	Bullety := Rand.Int (170, 370)
	Fired += 1
	Draw.Oval (Bulletx, Bullety, 2, 2, red)
	delay (100)
	exit when Fired = 10
	Display := realstr (Attacked / 10, 4)
	Font.Draw (Display + "", Floatx, Floaty, intfont1, 16)
	Floaty -= 20
    end loop
end Shots_Animation

proc AimedArrow_Animation
    var Bulletx : int := 210
    var Bullety : int := 270
    var timer : int := 30
    var Sonny : int := 0
    loop
	Bulletx += 40
	Draw.Oval (Bulletx + 62, Bullety, 3, 2, 45)
	Draw.Line (Bulletx, Bullety, Bulletx + 60, Bullety, 48)
	Draw.Oval (Bulletx + 62, Bullety - 30, 3, 2, 45)
	Draw.Line (Bulletx, Bullety - 30, Bulletx + 60, Bullety - 30, 48)
	delay (32)
	Draw.Oval (Bulletx + 62, Bullety, 3, 2, 0)
	Draw.Line (Bulletx, Bullety, Bulletx + 60, Bullety, 0)
	Draw.Oval (Bulletx + 62, Bullety - 30, 3, 2, 0)
	Draw.Line (Bulletx, Bullety - 30, Bulletx + 60, Bullety - 30, 0)
	exit when Bulletx >= 480
    end loop
    Draw.Line (Bulletx, Bullety, Bulletx + 60, Bullety, 48)
    Draw.Oval (Bulletx + 62, Bullety, 3, 2, 45)
    Draw.Line (Bulletx, Bullety - 30, Bulletx + 60, Bullety - 30, 48)
    Draw.Oval (Bulletx + 62, Bullety - 30, 3, 2, 45)
    for k : 1 .. 10
	timer += 13
	Sonny := (2 * k)
	Bullety := Rand.Int (250, 290)
	Draw.FillOval (Bulletx + 60 + (k * 15), Bullety, 2, 2, 38)
	Draw.Line (Bulletx + 61, (270 - (k * 8) - Sonny), Bulletx + 61, 270, 39)
	Bullety := Rand.Int (250, 290)
	Draw.FillOval (Bulletx + 60 + (k * 15), Bullety - 30, 2, 2, 38)
	Draw.Line (Bulletx + 61, (240 - (k * 8) - Sonny), Bulletx + 61, 240, 39)
	exit when Sonny >= 7
	delay (10 + timer)
    end for
end AimedArrow_Animation

proc Regen_Animation
    var Bulletx : int := 150
    var Bullety : int := 440
    var Sonny : int := 1
    var Deep : int := 1
    var Switch : int := 50
    Draw.Oval (150, 440, 60, 10, 10)
    delay (100)
    Draw.Oval (150, 440, 36, 6, 10)
    delay (100)
    Draw.Oval (150, 440, 18, 3, 10)
    delay (100)
    loop
	Sonny += 4
	Deep += 1
	Draw.Line (Bulletx - Sonny, Bullety, Bulletx + Sonny, Bullety, 49)
	Draw.Line (Bulletx, Bullety - Deep, Bulletx, Bullety + Deep, 49)
	exit when Sonny >= 120
	delay (15)
    end loop
    Sonny := 1
    loop
	Sonny += 10
	Bulletx := Rand.Int (100, 240)
	Bullety := Rand.Int (100, 460 - Sonny)
	Draw.Oval (Bulletx, Bullety, 2, 2, Switch)
	if Switch = 50 then
	    Switch := 53
	else
	    Switch := 50
	end if
	delay (40)
	exit when Sonny >= 300
    end loop
    Display := realstr (Attacked, 6)
    Font.Draw (Display + "", 140, 160, intfont, 50)
end Regen_Animation

proc RaisedCurve_Animation
    for k : 1 .. 50
	Draw.Line (400, 200, 410, 450, 80 - k)
	Draw.Line (400, 200, 408, 450, 78 - k)
	Draw.Line (400, 200, 403, 450, 73 - k)
	Draw.Line (400, 200, 405, 450, 75 - k)
	Draw.Line (400, 200, 400, 450, 70 - k)
	delay (32)
    end for
    for k : 0 .. 4
	Draw.Line (400, 200, 410 - k, 450, 30 - k)
	Draw.Line (400, 200, 408 - k, 450, 28 - k)
	Draw.Line (400, 200, 405, 450, 25 - k)
	Draw.Line (400, 200, 403 + k, 450, 23 - k)
	Draw.Line (400, 200, 400 + k, 450, 20 - k)
	delay (72)
    end for
    Draw.Line (402, 200, 402, 450, 16)
    Draw.Line (401, 200, 402, 450, 16)
    delay (80)
    for k : 1 .. 15
	Draw.Line (401, 330, 401, 330 + (k * 10), 16 + k)
	Draw.Line (401, 320, 401, 320 - (k * 10), 16 + k)
	Draw.Line (391 - (k * 10), 325, 391, 320, 16 + k)
	Draw.Line (411 + (k * 10), 325, 411, 320, 16 + k)
	Draw.Line (406, 330, 406 + (k * 8), 330 + (k * 11), 16 + k)
	Draw.Line (406, 310, 406 + (k * 8), 310 - (k * 11), 16 + k)
	Draw.Line (396, 330, 396 - (k * 8), 330 + (k * 11), 16 + k)
	Draw.Line (396, 310, 396 - (k * 8), 310 - (k * 11), 16 + k)
	delay (45)
	Draw.Line (401, 330, 401, 330 + (k * 10), 0)
	Draw.Line (401, 320, 401, 320 - (k * 10), 0)
	Draw.Line (391 - (k * 10), 325, 391, 320, 0)
	Draw.Line (411 + (k * 10), 325, 411, 320, 0)
	Draw.Line (406, 330, 406 + (k * 8), 330 + (k * 11), 0)
	Draw.Line (406, 310, 406 + (k * 8), 310 - (k * 11), 0)
	Draw.Line (396, 330, 396 - (k * 8), 330 + (k * 11), 0)
	Draw.Line (396, 310, 396 - (k * 8), 310 - (k * 11), 0)
    end for
    delay (100)
end RaisedCurve_Animation

proc WindLash_Animation
    for k : 1 .. 400 by 5
	for j : 0 .. 7
	    Draw.Line (500 - k + (j * 2), 170, 500 - k + (j * 2), 390, 100 - j)
	    Draw.Line (500 - k + (j * 2), 170, 500 - k + (j * 5), 170, 90)
	    Draw.Line (500 - k + (j * 2), 390, 500 - k + (j * 5), 390, 90)
	end for
	delay (20)
	for j : 0 .. 7
	    Draw.Line (500 - k + (j * 2), 170, 500 - k + (j * 2), 390, 0)
	    Draw.Line (500 - k + (j * 2), 170, 500 - k + (j * 5), 170, 0)
	    Draw.Line (500 - k + (j * 2), 390, 500 - k + (j * 5), 390, 0)
	end for
    end for
    for k : 1 .. 10
	Draw.Oval (114, 280, (k * 15), (k * 15), 100 - k)
	delay (50 + k)
	Draw.Oval (114, 280, (k * 15), (k * 15), 0)
    end for
end WindLash_Animation

proc BMetal (H, Y, F : int)
    Draw.Oval (H, Y, 24, 24, 16)
    Draw.Oval (H, Y, 23, 23, 35)
    Draw.Oval (H, Y, 15, 24, 16)
    Draw.Oval (H, Y, 14, 23, 33)
    Draw.Oval (H, Y, 24, 15, 16)
    Draw.Oval (H, Y, 23, 14, 53)
    Draw.Oval (H, Y, 7, 7, 43)
    Draw.FillOval (H, 130, 24 - F, 7 - F, 176)
    delay (32)
    Draw.Oval (H, Y, 24, 24, 0)
    Draw.Oval (H, Y, 23, 23, 0)
    Draw.Oval (H, Y, 15, 24, 0)
    Draw.Oval (H, Y, 14, 23, 0)
    Draw.Oval (H, Y, 24, 15, 0)
    Draw.Oval (H, Y, 23, 14, 0)
    Draw.Oval (H, Y, 7, 7, 0)
    Draw.FillOval (H, 130, 24 - F, 7 - F, 0)
end BMetal

proc BurningMetal_Animation
    BMetal (500, 250, 0)
    for k : 1 .. 6
	BMetal (240 + (k * 30), 500 - (k * 20), k)
    end for
    BMetal (430, 370, 6)
    BMetal (440, 363, 5)
    BMetal (450, 358, 4)
    BMetal (460, 350, 3)
    BMetal (470, 346, 2)
    BMetal (480, 335, 1)
    BMetal (490, 329, 0)
    BMetal (500, 312, -1)
    BMetal (510, 301, -2)
    BMetal (520, 292, -2)
    BMetal (530, 287, -3)
    BMetal (540, 280, -3)
    BMetal (550, 267, -4)
    BMetal (560, 250, -5)
    BMetal (570, 241, -5)
    BMetal (580, 234, -5)
    BMetal (590, 228, -6)
    BMetal (600, 215, -6)
    BMetal (610, 201, -6)
    BMetal (620, 186, -7)
    BMetal (630, 165, -7)
    Draw.Oval (630, 165, 24, 24, 16)
    Draw.Oval (630, 165, 23, 23, 35)
    Draw.Oval (630, 165, 15, 24, 16)
    Draw.Oval (630, 165, 14, 23, 33)
    Draw.Oval (630, 165, 24, 15, 16)
    Draw.Oval (630, 165, 23, 14, 53)
    Draw.Oval (630, 165, 7, 7, 43)
    for k : 10 .. 140 by 3
	Draw.Oval (630, 165, k, k, 37)
	Draw.Oval (630, 165, k - 10, k - 10, 36)
	delay (40)
	Draw.Oval (630, 165, k, k, 0)
	Draw.Oval (630, 165, k - 10, k - 10, 0)
    end for
    Draw.FillOval (630, 165, 24, 24, 0)
end BurningMetal_Animation

proc SniperShoot (times, times2 : int)
    var BloodSplatterx : int
    var BloodSplattery : int
    for decreasing k : 40 .. 5
	Draw.Line (500, 310 - k, 500, 355 - k, red)
	Draw.Line (500, 230 + k, 500, 185 + k, red)
	Draw.Line (540 - k, 270, 585 - k, 270, red)
	Draw.Line (460 + k, 270, 415 + k, 270, red)
	Draw.Oval (500, 270, 5 + k, 5 + k, 16)
	if k mod 5 = 1 then
	    BloodSplatterx := Rand.Int (460, 540)
	    BloodSplattery := Rand.Int (240, 300)
	    Draw.Oval (BloodSplatterx, BloodSplattery, 2, 2, 39)
	end if
	delay (times)
	Draw.Line (500, 310 - k, 500, 355 - k, 0)
	Draw.Line (500, 230 + k, 500, 185 + k, 0)
	Draw.Line (540 - k, 270, 585 - k, 270, 0)
	Draw.Line (460 + k, 270, 415 + k, 270, 0)
	Draw.Oval (500, 270, 5 + k, 5 + k, 0)
    end for
    for k : 5 .. 40
	Draw.FillOval (500, 270, 45, 45, 0)
	Draw.Line (500, 310 - k, 500, 355 - k, red)
	Draw.Line (500, 230 + k, 500, 185 + k, red)
	Draw.Line (540 - k, 270, 585 - k, 270, red)
	Draw.Line (460 + k, 270, 415 + k, 270, red)
	Draw.Oval (500, 270, 5 + k, 5 + k, 53)
	delay (times2)
	Draw.Line (500, 310 - k, 500, 355 - k, 0)
	Draw.Line (500, 230 + k, 500, 185 + k, 0)
	Draw.Line (540 - k, 270, 585 - k, 270, 0)
	Draw.Line (460 + k, 270, 415 + k, 270, 0)
	Draw.Oval (500, 270, 5 + k, 5 + k, 0)
    end for
end SniperShoot

proc Sniper_Animation
    var BloodSplatterx : int
    var BloodSplattery : int
    for j : 1 .. 50
	Draw.Oval (200 + (j * 6), 270, 50, 50, 16)
	delay (32)
	Draw.Oval (200 + (j * 6), 270, 50, 50, 0)
    end for
    Draw.Oval (500, 270, 50, 50, 16)
    delay (300)
    for k : 1 .. 40
	Draw.Oval (500, 270, 5 + k, 5 + k, 16)
	Draw.Line (500, 310 - k, 500, 355 - k, red)
	Draw.Line (500, 230 + k, 500, 185 + k, red)
	Draw.Line (540 - k, 270, 585 - k, 270, red)
	Draw.Line (460 + k, 270, 415 + k, 270, red)
	Draw.Oval (500, 270, 50 - k, 50 - k, 16)
	delay (50)
	Draw.Oval (500, 270, 5 + k, 5 + k, 0)
	Draw.Line (500, 310 - k, 500, 355 - k, 0)
	Draw.Line (500, 230 + k, 500, 185 + k, 0)
	Draw.Line (540 - k, 270, 585 - k, 270, 0)
	Draw.Line (460 + k, 270, 415 + k, 270, 0)
	Draw.Oval (500, 270, 50 - k, 50 - k, 0)
    end for
    Draw.Oval (500, 270, 45, 45, 16)
    Draw.Line (500, 275, 500, 315, red)
    Draw.Line (500, 265, 500, 225, red)
    Draw.Line (505, 270, 545, 270, red)
    Draw.Line (495, 270, 455, 270, red)
    Draw.Oval (500, 270, 10, 10, 16)
    delay (1000)
    Draw.Line (500, 275, 500, 315, 0)
    Draw.Line (500, 265, 500, 225, 0)
    Draw.Line (505, 270, 545, 270, 0)
    Draw.Line (495, 270, 455, 270, 0)
    SniperShoot (10, 40)
    Draw.Oval (500, 270, 45, 45, 39)
    Draw.Line (500, 275, 500, 315, red)
    Draw.Line (500, 265, 500, 225, red)
    Draw.Line (505, 270, 545, 270, red)
    Draw.Line (495, 270, 455, 270, red)
    Draw.Oval (500, 270, 10, 10, 35)
    SniperShoot (10, 30)
    SniperShoot (10, 20)
    Draw.Oval (500, 270, 45, 45, 39)
    Draw.Line (500, 275, 500, 315, red)
    Draw.Line (500, 265, 500, 225, red)
    Draw.Line (505, 270, 545, 270, red)
    Draw.Line (495, 270, 455, 270, red)
    Draw.Oval (500, 270, 10, 10, 35)
end Sniper_Animation

proc Taggerung_Animation
    var Ballrung : int
    var Torpor : array 1 .. 30 of int
    var Tx : int
    var Ty : int
    var Sx : int
    var Sy : int
    for c : 1 .. 28
	Torpor (c) := (75 + c)
    end for
    for j : 1 .. 4
	for p : 1 .. 28
	    Tx := 15 * cos (p * 13) * 100 div 100
	    Ty := 35 * sin (p * 13) * 100 div 100
	    Sx := 5 * cos (p * 12) * 100 div 100
	    Sy := 12 * sin (p * 15) * 100 div 100
	    Draw.Oval (250, 250, 15, 35, Torpor (p))
	    Draw.Oval (250, 250, 5, 12, (180 - Torpor (p)))
	    Draw.Line (249 + Tx, 250 + Ty, 400 + Tx + (p * j), 250 + Ty, 100 - p)
	    Draw.Line (255 - Tx, 250 - Ty, 406 - Tx + (p * j), 250 - Ty, Torpor (p))
	    Draw.Line (249 + Sx, 250 + Sy, 400 + Sx, 250 + Sy, 56 + p)
	    Draw.Line (249 - Sx, 250 - Sy, 400 - Sx, 250 - Sy, 37 + p)
	    delay (50)
	    Draw.Line (249 + Tx, 250 + Ty, 400 + Tx + (p * j), 250 + Ty, 0)
	    Draw.Line (255 - Tx, 250 - Ty, 406 - Tx + (p * j), 250 - Ty, 0)
	    Draw.Line (249 + Sx, 250 + Sy, 400 + Sx, 250 + Sy, 0)
	    Draw.Line (249 - Sx, 250 - Sy, 400 - Sx, 250 - Sy, 0)
	end for
    end for
end Taggerung_Animation

process QSplosion (x, y, z : int)
    var SlowDown : int := 5
    for p : 1 .. 20 by 4
	SlowDown += (p * 2)
	Draw.Oval (x + z, y - (2 * z), p * 3, p, 152)
	delay (SlowDown)
    end for
end QSplosion

proc QuadShotAnimation
    var QSX : int
    var QSY : int
    var QSC : int
    for k : 1 .. 4
	QSC := Rand.Int (1, 5)
	for l : 1 .. 4
	    QSY := Rand.Int (291, 470)
	    QSX := Rand.Int (360, 650)
	    if QSC = 1 then
		QSC := 54
	    elsif QSC = 2 then
		QSC := 52
	    else
		QSC := 51
	    end if
	    for j : 1 .. 100
		Draw.Line (QSX, QSY, QSX + j, QSY - (2 * j), QSC)
		delay (1)
	    end for
	    fork QSplosion (QSX, QSY, 100)
	end for
	Display := realstr (QuadShots (k), 6)
	Font.Draw ("" + Display, 470 + (k * 28), 350 - (k * 50), DFont, 35)
    end for
end QuadShotAnimation

proc TunshShotAnimation
    var TSC : int := 53
    var TSX : int
    var TSY : int
    for f : 1 .. 10
	Draw.Oval (270, 270, 5 + f, 15 + (f * 3), TSC)
	delay (100)
	if f > 4 then
	    TSC := 102
	end if
    end for
    Draw.FillOval (270, 270, 3, 9, 106)
    for p : 1 .. 10
	Draw.FillBox (270, 268, 270 + (p * 35), 272, 105)
	delay (4)
	for t : 1 .. 5
	    TSX := Rand.Int (250 + (p * 35), 265 + (p * 35))
	    if p < 3 then
		TSY := Rand.Int (250, 290)
	    elsif p < 8 then
		TSY := Rand.Int (260, 280)
	    else
		TSY := Rand.Int (265, 275)
	    end if
	    Draw.FillOval (TSX, TSY, 2, 2, 36)
	end for
    end for
    Draw.FillOval (620, 270, 2, 6, 104)
    Display := realstr (Attacked, 6)
    Font.Draw ("" + Display, 590, 280, DFont, 54)
end TunshShotAnimation

process OSA
    for k : 1 .. 10
	Draw.Line (300, 300, 300 - (k * 6), 300 + (k * 5), 53)
	delay (22)
    end for
    Draw.Oval (240, 350, 5, 5, 69)
    for k : 1 .. 10
	Draw.Line (250, 200, 250 + (k * 5), 200 + (k * 20), 48)
	delay (22)
    end for
    Draw.Oval (300, 400, 5, 5, 69)
    for k : 1 .. 10
	Draw.Line (240, 350, 240 + (k * 6), 350 + (k * 5), 52)
	delay (22)
    end for
    Draw.Oval (300, 400, 5, 5, 69)
end OSA

proc OppedShieldAnimation
    for k : 1 .. 10
	Draw.Line (250, 200, 250 + (k * 5), 200 + (k * 10), 56)
	delay (22)
    end for
    Draw.Oval (250, 200, 5, 5, 69)
    fork OSA
    for k : 1 .. 10
	Draw.Line (300, 400, 300 - (k * 5), 400 + (k * 9), 42)
	delay (22)
    end for
    Draw.Oval (250, 490, 5, 5, 69)
    for k : 1 .. 10
	Draw.Line (250, 490, 250 + (k * 5), 490 - (k * 19), 35)
	delay (22)
    end for
    Draw.Oval (300, 300, 5, 5, 69)
end OppedShieldAnimation

proc ShadowAnimation
    setscreen ("offscreenonly")
    var SHA : int
    var SA : int
    for k : 1 .. 3
	Draw.FillOval (270 + (k * 40), 300, 6, 6, 16)
	View.Update
	delay (800)
    end for
    for k : 1 .. 95
	Draw.FillBox (0, 110, (k * 8), 490, black)
	SHA := Rand.Int (250, 740)
	SA := Rand.Int (1, 50)
	Draw.Line (SHA - 120, SHA - 150, 800 - SHA, SA * 12, 54)
	delay (15)
	View.Update
    end for
    setscreen ("nooffscreenonly")
end ShadowAnimation

proc HeartEndoAnimation
    var HER : int
    for m : 1 .. 10
	Draw.Line (200 + (m * 30), 190, 300 + (m * 30), 420, 39)
	Draw.Line (200 + (m * 30), 410, 300 + (m * 30), 180, 39)
	delay (33)
	Draw.Line (200 + (m * 30), 190, 300 + (m * 30), 420, 0)
	Draw.Line (200 + (m * 30), 410, 300 + (m * 30), 180, 0)
    end for
    Draw.Line (200 + (10 * 30), 190, 300 + (10 * 30), 420, 39)
    Draw.Line (200 + (10 * 30), 410, 300 + (10 * 30), 180, 39)
    for p : 1 .. 5
	HER := Rand.Int (-3, 3)
	Draw.Line (200, 410 + HER, 220, 410 + HER, 38)
	Draw.Line (300, 420 + HER, 320, 420 + HER, 38)
	Draw.Line (300, 180 + HER, 320, 180 + HER, 38)
	Draw.Line (200, 190 + HER, 220, 190 + HER, 38)
	delay (100)
	Draw.Line (200, 410 + HER, 220, 410 + HER, 106)
	Draw.Line (300, 420 + HER, 320, 420 + HER, 106)
	Draw.Line (300, 180 + HER, 320, 180 + HER, 106)
	Draw.Line (200, 190 + HER, 220, 190 + HER, 106)
    end for
    for m : 1 .. 10
	Draw.Line (200, 190, 201 + (m * 30), 190, 39)
	Draw.Line (300, 420, 301 + (m * 30), 420, 39)
	Draw.Line (200, 410, 201 + (m * 30), 410, 39)
	Draw.Line (300, 180, 301 + (m * 30), 180, 39)
	delay (32 - (m * 2))
	Draw.Line (200 + (m * 30), 190, 201 + (m * 30), 190, 0)
	Draw.Line (300 + (m * 30), 420, 301 + (m * 30), 420, 0)
	Draw.Line (200 + (m * 30), 410, 201 + (m * 30), 410, 0)
	Draw.Line (300 + (m * 30), 180, 301 + (m * 30), 180, 0)
    end for
    Draw.Line (200, 190, 201 + (10 * 30), 190, 39)
    Draw.Line (300, 420, 301 + (10 * 30), 420, 39)
    Draw.Line (200, 410, 201 + (10 * 30), 410, 39)
    Draw.Line (300, 180, 301 + (10 * 30), 180, 39)
    for k : 0 .. 6
	HER := Rand.Int (0, 245)
	Draw.Line (550, 300, 550 + (k * 30), 300, 16)
	delay (32)
	Draw.Box (555 + (k * 20) - k, 280 + k, 570 + (k * 20) - k, 320 - k, HER)
	Draw.Box (557 + (k * 22) - k, 283 + k, 572 + (k * 22) - k, 317 - k, HER)
    end for
    Draw.FillOval (730, 300, 2, 3, 49)
    Draw.Oval (730, 300, 7, 8, 63)
end HeartEndoAnimation

proc WhiteTundraAnimation
    var WTR : int
    var WTS : int
    var WTY : int
    for Pile : 1 .. 10
	Draw.FillBox (0, 120, maxx, 120 + (Pile * 10), 30)
	delay (32)
    end for
    for Snow : 1 .. 10
	WTR := Rand.Int (-100, 100)
	WTS := Rand.Int (11, 16)
	for s : 1 .. WTS
	    WTY := Rand.Int (-70, 50)
	    Draw.FillOval (100 + WTR + (s * 35), 500 - (Snow * 27) + WTY, 2, 2, 0)
	    Draw.Oval (100 + WTR + (s * 35), 500 - (Snow * 27) + WTY, 2, 2, 28)
	end for
	delay (32)
    end for
    delay (1000)
end WhiteTundraAnimation

proc JetStreamAnimation
    var JTY : int
    for j : 1 .. 170
	JTY := Rand.Int (-5, 5)
	Draw.Oval (150 + (j * 3), 390 + JTY, 14, 18, 29)
	Draw.Oval (150 + (j * 3), 230 + JTY, 14, 18, 29)
	delay (2)
    end for
    Draw.FillOval (150, 310, 3, 3, 29)
    for e : 1 .. 30
	Draw.Oval (150 + (e * 15), 310, 70 - (e * 2), 90 - (e * 2), 29)
	Draw.Line (150, 310, 150 + (e * 19), 310, 108)
	delay (23)
    end for
    delay (1000)
end JetStreamAnimation

proc StingingBowAnimation
    var SBR : int
    Draw.Line (260, 270, 190, 410, 120)
    Draw.Line (259, 270, 189, 410, 10)
    Draw.Line (260, 260, 190, 120, 120)
    Draw.Line (259, 260, 189, 120, 10)
    for s : 0 .. 9
	Draw.Line (185 + (s * 40), 266, 285 + (s * 40), 266, 41)
	Draw.Line (190 + (s * 40), 265, 290 + (s * 40), 265, 114)
	Draw.Line (185 + (s * 40), 264, 285 + (s * 40), 264, 41)
	delay (32 - s)
	Draw.Line (185 + (s * 40), 266, 285 + (s * 40), 266, 0)
	Draw.Line (190 + (s * 40), 265, 290 + (s * 40), 265, 0)
	Draw.Line (185 + (s * 40), 264, 285 + (s * 40), 264, 0)
    end for
    Draw.Line (185 + (400), 266, 285 + (400), 266, 0)
    Draw.Line (190 + (9 * 40), 265, 290 + (9 * 40), 265, 114)
    Draw.Line (185 + (400), 264, 285 + (400), 264, 0)
    delay (90)
    for s : 0 .. 9
	Draw.Box (590 - (s * 3), 265 - (s * 3), 590 + (s * 3), 265 + (s * 3), 124)
	Draw.Line (585 + s, 266 + (s * 3), 645, 266, 41)
	Draw.Line (585 + s, 264 - (s * 3), 645, 264, 41)
	delay (21 - s)
	Draw.Box (590 - (s * 3), 265 - (s * 3), 590 + (s * 3), 265 + (s * 3), 0)
	Draw.Line (585 + s, 266 + (s * 3), 645, 266, 0)
	Draw.Line (585 + s, 264 - (s * 3), 645, 264, 0)
    end for
    Draw.Box (590 - (9 * 3), 265 - (9 * 3), 590 + (9 * 3), 265 + (9 * 3), 124)
    Draw.Line (594, 293, 645, 266, 41)
    Draw.Line (594, 237, 645, 264, 41)
    for l : 0 .. 10
	Draw.Line (594 + (l * 3), 293 - (l * 3), 645 + (l * 3), 266 - (l * 3), 41)
	Draw.Line (594 + (l * 3), 237 + (l * 3), 645 + (l * 3), 264 + (l * 3), 41)
	delay (15 - l)
	Draw.Line (594 + (l * 3), 293 - (l * 3), 645 + (l * 3), 266 - (l * 3), 0)
	Draw.Line (594 + (l * 3), 237 + (l * 3), 645 + (l * 3), 264 + (l * 3), 0)
    end for
    Draw.Line (594 + (10 * 3), 293 - (10 * 3), 645 + (10 * 3), 266 - (10 * 3), 41)
    Draw.Line (594 + (10 * 3), 237 + (10 * 3), 645 + (10 * 3), 264 + (10 * 3), 41)
    delay (1000)
end StingingBowAnimation


proc EveAnimation
    for k : 1 .. 50
	Draw.FillOval (390 + k * 2, 270, 10 + k * 2, 16 + k * 3, 16)
	delay (10)
    end for
    for k : 1 .. 55
	Draw.Oval (490 - k * 2, 270, 110 - k * 2, 166 - k * 3, 113 - k)
	delay (5)
    end for
    for s : 1 .. 12
	Draw.Line (380 - (s * 30), 270, 380 + (s * 30), 270, 54)
	Draw.Line (380 - (s * 30), 272, 380 + (s * 30), 272, 132)
	Draw.Line (380 - (s * 30), 268, 380 + (s * 30), 268, 125)
	delay (7)
    end for
    delay (1000)
end EveAnimation

proc ZenosSwordAnimation
    for l : 1 .. 60
	Draw.Line (150 + l, 130 + l * 2, 300 + l * 6, 410 - l * 4, 112)
	Draw.Line (150 + l, 129 + l * 2, 300 + l * 6, 409 - l * 4, 13)
	if l = 20 then
	    for p : 1 .. 10
		Draw.Line (247 + (p * 10), 210, 247 - (p * 10), 210, 45)
		Draw.Line (247, 210 + (p * 10), 247, 210 - (p * 10), 45)
		delay (1)
	    end for
	elsif l = 40 then
	    for p : 1 .. 10
		Draw.Line (365 + p * 10, 230, 365 - p * 10, 230, 45)
		Draw.Line (365, 230 + p * 10, 365, 230 - p * 10, 45)
		delay (1)
	    end for
	elsif l = 60 then
	    for P : 1 .. 10
		Draw.Line (475 - P * 10, 190, 475 + P * 10, 190, 45)
		Draw.Line (475, 190 - P * 10, 475, 190 + P * 10, 45)
		delay (1)
	    end for
	end if
	delay (5)
	Draw.Line (150 + l, 130 + l * 2, 300 + l * 6, 410 - l * 4, 0)
	Draw.Line (150 + l, 129 + l * 2, 300 + l * 6, 409 - l * 4, 0)
	if l = 20 then
	    for p : 1 .. 10
		Draw.Line (210 + (p * 10), 246, 209 - (p * 10), 247, 151)
		Draw.Line (210, 246 + (p * 10), 209, 247 - (p * 10), 151)
	    end for
	elsif l = 40 then
	    for p : 1 .. 10
		Draw.Line (365 + p * 10, 229, 365 - p * 10, 229, 153)
		Draw.Line (365, 229 + p * 10, 365, 229 - p * 10, 153)
	    end for
	elsif l = 60 then
	    for P : 1 .. 10
		Draw.Line (474 - P * 10, 190, 474 + P * 10, 190, 152)
		Draw.Line (474, 190 - P * 10, 474, 190 + P * 10, 152)
	    end for
	end if
    end for
    delay (500)
end ZenosSwordAnimation

process SSAA
    var SAR : int := Rand.Int (110, 500)
    var SAX : int := Rand.Int (0, 200)
    var SAC : int := Rand.Int (46, 71)
    for p : 0 .. 30
	Draw.Line (SAX + p * 20, SAR, SAX + 100 + p * 20, SAR, SAC)
	delay (12)
	Draw.Line (SAX + p * 20, SAR, SAX + 100 + p * 20, SAR, 101)
    end for
end SSAA

proc SuperScriptionAnimation
    for s : 1 .. 50
	Draw.Oval (370, 190, 3 + s * 5, 3 + s, 122)
	delay (15)
	Draw.Oval (370, 190, 3 + s * 5, 3 + s, 0)
    end for
    Draw.Oval (370, 190, 3 + 50 * 5, 3 + 50, 122)
    Draw.Line (350, 243, 390, 243, 0)
    Draw.Line (350, 137, 390, 137, 0)
    delay (50)
    for l : 1 .. 10
	Draw.Line (117, 190, 117, 190 + (l * 30), 131)
	Draw.Line (623, 190, 623, 190 + (l * 30), 131)
	delay (20)
    end for
    for s : 1 .. 40
	fork SSAA
	delay (28)
    end for
end SuperScriptionAnimation

% Character Skills  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Skills [SKILL2]   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Animations end here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc SideCut
    Attacked := (Skill_Level_SideCut * 0.10 + 1) * Damage / 100 * Rand.Int (95, 105)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 16 * Level
    Mana += Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	put " Mana is somehow too low to cast."
    else
	put " Hyaa!! Damage dealt: ", Attacked
    end if
    SideCut_Animation
    Turn -= 1
end SideCut

proc AimedArrow
    if Style = "Ranged" then
	Attacked := (Skill_Level_AimedArrow * 0.18 + 1) * Damage / 100 * Rand.Int (115, 500) + Speed
    else
	Attacked := (Skill_Level_AimedArrow * 0.16 + 1) * Damage / 100 * Rand.Int (100, 150) + Speed
    end if
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 20
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
    else
	AimedArrow_Animation
	put " You cannot hide from the Brynhilder. Damage Dealt: ", Attacked
	Turn -= 1
	Display := realstr (Attacked, 6)
	Font.Draw (Display + "", 570, 290, DFont, 50)
    end if
end AimedArrow

proc BloodShot
    if Style = "Gunner" then
	Attacked := ((Skill_Level_BloodShot * 0.18 + 1) * Damage / 100 * Rand.Int (87, 135) + (Speed - EnemyIntelligence)) * 6
    else
	Attacked := ((Skill_Level_BloodShot * 0.18 + 1) * Damage / 100 * Rand.Int (87, 135) + (Speed - EnemyIntelligence)) * 2
    end if
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 21
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Insufficient mana."
    else
	BloodShot_Animation
	put " Stay still, please. Damage dealt: ", Attacked
	Turn -= 1
    end if
end BloodShot

proc DoubleSlash
    var EnemyCoop : real
    EnemyCoop := EnemyHp
    if Skill_Level_DoubleSlash = 1 then
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 2 then
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 3 then
	SideCut
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 4 then
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
    elsif Skill_Level_DoubleSlash = 5 then
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
	SideCut
    end if
    Mana += ManaRegen
    Mana -= 54
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked * Skill_Level_DoubleSlash
	Mana += 54
	put "Not enough mana to cast."
    else
	DoubleSlash_Animation
	put " Nort - Tun - Chea! Damage dealt: ", EnemyCoop - EnemyHp
	Turn -= 1
    end if
end DoubleSlash

proc Mana_Shot
    Attacked := (Skill_Level_Mana_Shot * 0.2 + 1) * Damage + Intelligence + Rand.Int (80, 135) + (Mana / 10)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 37
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Need 37 mana to cast."
    else
	ManaShot_Animation
	put " Ripple forth, ye cursed dirge! Damage dealt: ", Attacked
	put " Cost 37 mana"
	Turn -= 1
	Display := realstr (Attacked, 6)
	Font.Draw (Display + "", 570, 290, DFont, 54)
    end if
end Mana_Shot

proc SpeedSlice
    Attacked := (Skill_Level_SpeedSlice * 0.25 + 1) * Damage + Rand.Int (50, 80) + ((Speed * 3) * Skill_Level_SpeedSlice)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 28
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Mana much too low."
    else
	SpeedSlice_Animation
	put " May the heavens blow you asunder.. Damage dealt: ", Attacked
	Turn -= 1
	Display := realstr (Attacked, 6)
	Font.Draw (Display + "", 570, 290, intfont, 80)
    end if
end SpeedSlice

proc StarShot
    for j : 1 .. 3
	Attacked := (((Skill_Level_StarShot * 0.23 + 1) + Damage) / 100) * Rand.Int (90, 115) + Intelligence * Skill_Level_StarShot
	EnemyHp -= Attacked
	SShotA (j) := Attacked
    end for
    Mana += ManaRegen
    Manacost := 100
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += (Attacked * 0.7)
	Mana += 70
	put "Not enough mana to launch all shots."
    else
	StarShot_Animation
	put " Mhurkinfa..heruikine! Damage dealt: ", SShotA (1), " + ", SShotA (2), " + ", SShotA (3)
	Turn -= 1
    end if
end StarShot

proc RaisedCurve
    Attacked := (((Skill_Level_RaisedCurve * 0.5 + 1) * Damage) / 100) * Rand.Int (50, 250) + (Hp div 3)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 44
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put "The sword was not powered by any mana."
    else
	put " I'll tickle your throat, you ass-faced demon! Damage dealt: ", Attacked
	RaisedCurve_Animation
	Turn -= 1
    end if
end RaisedCurve

proc Shot_s
    Attacked := ((Skill_Level_Shot_s * 0.07 + 1) * Damage) / 100 * Rand.Int (50, 250)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 13 * Level
    Mana += Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana -= Manacost
	put " Reloading.."
    else
	Shots_Animation
	put " Rraaa ! Damage dealt: ", Attacked
	Turn -= 1
    end if
end Shot_s

proc WindLash
    Attacked := (Skill_Level_WindLash * 0.25 + 1) * Rand.Int (90, 110) + (THp * 0.15) * Level
    Hp += Attacked
    Mana += ManaRegen
    Manacost := 38
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	Hp -= Attacked
	Mana += Manacost
	put "No mana to cast spell."
    else
	put " Wounds, revile! Amount healed: ", Attacked
	Turn -= 1
	WindLash_Animation
    end if
end WindLash

proc BurningMetal
    Attacked := (((Skill_Level_BurningMetal * 0.34 + 2) * Damage) / 100) * Rand.Int (100, 150)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 59
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " There was not enough mana to burn the metal."
    else
	put " Can you notwithstand the pain? Damage dealt: ", Attacked
	Turn -= 1
	BurningMetal_Animation
    end if
end BurningMetal

proc Regen
    Attacked := Skill_Level_Regen * Rand.Int (10, 18) + Speed + (Intelligence / 10)
    Mana += Attacked
    Mana += ManaRegen
    Manacost := 25
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana - Attacked - ManaRegen < 25 then
	Mana -= Attacked - ManaRegen
	put "Not enough mana to regen mana. "
    else
	Regen_Animation
	put " You won't surpass these walls. Mana Raised: ", Attacked
	Turn -= 1
    end if
end Regen
%%%%%% REVISE MANA COST %%%%%%
proc Sniper_
    Attacked := (((Skill_Level_Sniper * 0.41 + 1) * (Damage + Speed + Intelligence)) / 100) * Rand.Int (140, 190)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 48
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Reloading shells.."
    else
	put " Sleep. Sleep forever. Damage dealt: ", Attacked
	Sniper_Animation
	Turn -= 1
    end if
end Sniper_

proc TunshShot_
    Attacked := ((((Skill_Level_TunshShot * 0.7) * Damage + Speed) / 100) * Rand.Int (83, 147)) * 3
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 51
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Shells rammed against each other. Need more mana to prevent."
    else
	put " Die Libelle. Damage dealt: ", Attacked
	Turn -= 1
	TunshShotAnimation
    end if
end TunshShot_

proc StingingBow_
    Attacked := ((Skill_Level_StingingBow * 0.28 + 1) * (Damage / Level) * Speed + Intelligence) / 100 * Rand.Int (102, 111)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 88
    Mana -= Manacost
    EnemyTurn -= 2
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyTurn += 1
	EnemyHp += Attacked
	Mana += Manacost
	put "The bow needed more mana, but slapped nonetheless."
    else
	put " Humph. So you think you can run away from my discipline? Damage dealt: ", Attacked
	Turn -= 1
	StingingBowAnimation
    end if
end StingingBow_

proc HeartEndo_
    Attacked := Damage * 2.3 / 100 * Rand.Int (100, 188) + Speed * Skill_Level_HeartEndo
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 77
    Mana -= Manacost
    HeartCrit := Rand.Int (1, 5)
    if HeartCrit = 2 then
	Attacked *= 7
    elsif Attacked = 5 then
	Attacked *= 3
    end if
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Mana was empty; 97 Mana was required."
    else
	put " Drag my sword across your heart, cross! Damage dealt: ", Attacked
	Turn -= 1
	HeartEndoAnimation
    end if
end HeartEndo_

proc Eve_
    Mana += ManaRegen
    Draw.FillBox (0, 550, maxx, 570, 0)
    Mana -= 132
    locatexy (0, 560)
    if Mana > 0 then
	EnemyHp := EnemyHp * (1 - (0.1 * Skill_Level_Eve))
	put " Gash your face, moonlight shadow! ", Attacked
	EveAnimation
    else
	Mana += 132
	put " Insufficient Mana."
    end if
    Turn -= 1
end Eve_

proc QuadShot_
    Mana += ManaRegen
    Draw.FillBox (0, 550, maxx, 570, 0)
    for q : 1 .. 4
	Attacked := ((Skill_Level_QuadShot * 0.34 + 1.3) * Damage + Speed / 100 * Rand.Int (80, 118))
	EnemyHp -= Attacked
	QuadShots (q) := Attacked
	Manacost := 26
	Mana -= Manacost
	if Mana < 0 then
	    EnemyHp += Attacked
	    Mana += Manacost
	else
	    locatexy (100 + (q * 85), 560)
	    put "", QuadShots (q), " - "
	end if
    end for
    if Mana >= 0 then
	locatexy (0, 560)
	QuadShotAnimation
    else
    end if
    Turn -= 1
end QuadShot_

proc OppedShield_
    EnemyTurn := (Skill_Level_OppedShield * -1)
    Manacost := 130
    Mana += ManaRegen
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyTurn += 5
	Mana += Manacost
	put "The Shield only half summoned, due to the lack of mana."
	Hp += (Level * 15)
	EnemyTurn := 1
    else
	put " Summon- Opped Shield! Shielding provided: ", Skill_Level_OppedShield
	Turn -= 1
	OppedShieldAnimation
    end if
end OppedShield_

proc Shadow_
    Attacked := (Skill_Level_Shadow * 0.5) * 700 * Level
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 181
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " The Shadow needs 181 mana to come out."
    else
	put " Welcome, my shadow. Shadow deals: ", Attacked
	Attacked := (Intelligence div 2) + Rand.Int (-10, 15)
	Mana += Attacked
	put " Recovered: ", Attacked, " mana"
	Turn -= 1
	ShadowAnimation
    end if
end Shadow_
proc SuperScription_
    Attacked := ((Skill_Level_SuperScription * 0.7 + 5) * (Speed + Damage) * 1.33) / 100 * Rand.Int (1, 999)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 140
    Hp += (THp * 0.25)
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	locatexy (0, 560)
	put " No damage due to insufficient mana."
    else
	put " Let's flip this dimension! Tachyon particles, pierce! Damage: ", Attacked
	Turn -= 1
	SuperScriptionAnimation
    end if
end SuperScription_

proc ZenosSword
    Attacked := (Skill_Level_ZenosSword * 0.75 + 3.4) * Rand.Int (90, 121) + (Speed * Skill_Level_ZenosSword)
    EnemyHp -= Attacked
    Mana += ManaRegen
    EnemyTHp -= (EnemyTHp * 0.2)
    Hp += (Hp * 0.3)
    Manacost := 245
    Mana -= Manacost
    if Mana < 0 then
	EnemyHp += Attacked
	EnemyTHp += (EnemyTHp * 0.22)
	Hp -= (Hp * 0.27)
	Mana += Manacost
	put " Zeno: You cannot summon me, there's no mana to eat!"
    else
	Turn -= 1
	EnemyMana := EnemyMana - (50 + Rand.Int (30, 70))
	put " Zeno, pummel this foe!"
	ZenosSwordAnimation
	Display := realstr (Attacked, 7)
	Font.Draw (Display + "!", 450, 260, intfont2, 112)
	delay (250)
    end if
end ZenosSword

proc WhiteTundra
    Attacked := (Skill_Level_WhiteTundra * 0.43 + 1.57) * Damage * 0.73 / 100 * Rand.Int (70, 160) + Intelligence
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 160
    Mana -= Manacost
    EnemyTurn -= 3
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " The Tundra failed to arrive, there was no snow. (160 mana.)"
    else
	put " I will shred your spine apart! Curse wither! (Freeze) Damage dealt: ", Attacked
	Turn -= 1
	WhiteTundraAnimation
    end if
end WhiteTundra

proc Taggerung
    Attacked := (Skill_Level_Taggerung * 0.7 + 3.13) * Damage / 100 * Rand.Int (50, 115) + (Speed * Skill_Level_Taggerung)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 210
    Mana -= Manacost
    EnemyTurn -= 1
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " Jareeeegh!! Not enough mana! (210)"
    else
	put " Dayna says no. Damage dealt: ", Attacked
	Taggerung_Animation
	Turn -= 1
    end if
end Taggerung

proc JetStream
    Attacked := (Skill_Level_JetStream * 0.62 + 1.9) * Damage * 1.7 / 100 * Rand.Int (1, 999)
    EnemyHp -= Attacked
    Mana += ManaRegen
    Manacost := 300
    Hp += 270
    Mana -= Manacost
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (0, 560)
    if Mana < 0 then
	EnemyHp += Attacked
	Mana += Manacost
	put " There was no fuel."
    else
	Turn -= 1
	put " Come to me, my Einherjars.. Damage dealt: ", Attacked
	JetStreamAnimation
    end if
end JetStream

% Enemy Skills
proc Bite
    Attacked := EnemyDamage
    Hp -= Attacked
    put "*Bites* Damage Dealt: ", Attacked
end Bite
proc PetStab
    Attacked := EnemyDamage
    NiceHp -= Attacked
    put "*Myar!* Damage Dealt to pet: ", Attacked
end PetStab
proc RockShatter
    Attacked := EnemyDamage * Rand.Int (80, 140) div 100
    NiceHp -= Attacked
    put "*Shattered!* Damage Dealt to pet: ", Attacked
end RockShatter
proc GutteralSlice
    Attacked := Rand.Int (100, 154) * Level
    Hp -= Attacked
    NiceHp -= Attacked
    put "Both you and your pet receieve ", Attacked, " damage."
end GutteralSlice
proc KnifeStab
    Attacked := EnemyDamage + Rand.Int (1, 50)
    Hp -= Attacked
    put "Critical! Damage Dealt: ", Attacked
end KnifeStab
proc WhorlsofHair
    Attacked := EnemyDamage * 1.3
    Hp -= Attacked
    put "Whorls of hair, make him itch! Damage Dealt: ", Attacked
end WhorlsofHair
proc Downwardsstroke
    Attacked := EnemyDamage * 0.7 + Rand.Int (10, 70)
    if Pet > 0 then
	NiceHp -= Attacked
    else
	Hp -= Attacked
    end if
    put "*Slashes downwards* Damage Dealt: ", Attacked
end Downwardsstroke
proc clawwed
    Attacked := EnemyDamage * 0.96 + 35 + Rand.Int (10, 24)
    Hp -= Attacked
    put "Chaaaaahhh!!! *Claws at you* ", Attacked
end clawwed
proc EHeal
    Attacked := EnemyTHp * 0.08 * Rand.Int (60, 110) / 100
    EnemyHp += Attacked
    put "Healed self: (", (Attacked), ")"
end EHeal
proc Buff_G         % Finish
    Attacked := EnemyIntelligence * 0.15
    EnemyHp += EnemyIntelligence
    EnemyTHp += EnemyIntelligence
    put "'Saghu maal..' Hp Up: ", Attacked
end Buff_G
proc TripleStrike
    Attacked := EnemyDamage * 3
    Hp -= Attacked
    put "Soit - Sut - Sain! 3 slices doing: ", Attacked
end TripleStrike
proc RedBurst
    Attacked := EnemyDamage + EnemyMana + EnemyIntelligence - Mana
    Hp -= Attacked
    put "Malevolent Thunderstorm.. crush these hapless foes! Damag Dealt: ", Attacked
end RedBurst
proc Magna
    Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 150) + EnemyIntelligence
    Hp -= Attacked
    put "Volcanoes, do not hesitate. Damage Dealt: ", Attacked
end Magna
proc SingedFeathers
    Attacked := EnemyDamage + EnemySpeed - Speed + Rand.Int (10, 50)
    Hp -= Attacked
    put "I will find the power within me! Damage Dealt: ", Attacked
end SingedFeathers
proc ThroatSlash
    Attacked := EnemyDamage / 100 * Rand.Int (70, 180)
    Hp -= Attacked
    put "Relish your last moment.. Die!  Damage Dealt: ", Attacked
end ThroatSlash
proc Freedom
    Attacked := (EnemyDamage + EnemyIntelligence) / 100 * Rand.Int (100, 130)
    Hp -= Attacked
    EnemyHp += 100
    put "Do you chain us like dogs.. and abuse this power? I will unleash these chains!  Damage Dealt: ", Attacked
end Freedom
proc PoisonBlow
    Attacked := (EnemyDamage + EnemyIntelligence) / 100 * Rand.Int (80, 120)
    Hp -= Attacked
    put "Poison.. poison..  Damage Dealt: ", Attacked
end PoisonBlow
proc BanditCut
    var BanCrit : int := Rand.Int (1, 10)
    if BanCrit = 4 then
	Attacked := EnemyDamage * Rand.Int (350, 390) / 100
	put "Nhhaaayy lung!  Damage Dealt: ", Attacked
    else
	Attacked := EnemyDamage * Rand.Int (77, 123) / 100
	put "hue hue  Damage Dealt: ", Attacked
    end if
    Hp -= Attacked
end BanditCut
proc BanditHigh
    Attacked := EnemyIntelligence * 6 + EnemyMana
    EnemyHp += Attacked
    put "Yew liddle waken. I've a plenny potions! Amount healed: ", Attacked
end BanditHigh
proc MinionCarry
    Attacked := EnemySpeed + EnemyDamage + (EnemyMana - EnemyTMana)
    if Pet > 0 then
	NiceHp -= Attacked
	put "A useless little companion you have there. Amount Dealt: ", Attacked
    else
	Hp -= Attacked
	put "My speed surpasses yours. Damage Dealt: ", Attacked
    end if
end MinionCarry
proc DoubleKill
    Attacked := EnemyDamage * Rand.Int (30, 66) / 100 + EnemySpeed
    Hp -= Attacked
    if Pet > 0 then
	NiceHp -= Attacked
    end if
    put "You die!..  Dealt:", Attacked
    delay (500)
    put " .. and you too!  Dealt:", Attacked
end DoubleKill
proc PistolShot
    Attacked := (Rand.Int (41, 112) / 100) * EnemyDamage - EnemySpeed
    Hp -= Attacked
    put "*Reloads pistol* Headshot, or no?   Dealt: ", Attacked
end PistolShot
proc MightySlam
    Attacked := EnemyDamage + EnemySpeed * 1.25
    NiceHp -= Attacked
    Hp -= Attacked
    put " Hits both you and pet, dealing: ", Attacked
end MightySlam
