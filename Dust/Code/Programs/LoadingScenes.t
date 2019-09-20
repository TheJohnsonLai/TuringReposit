% Loading Scenes
% Contains most loading scenes and procedures
% Basics to halt the user from stopping a button procedure

% [Loading Version 1 - Blue Background]

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

process IntroWind
    loop
	var WindL : int
	var WindR : int
	var WindU : int
	var Jagged : int
	var VX : int
	var VY : int
	var Cr : int
	var y : int := 0
	var Ticking : int := 0
	var TurnP : boolean := false
	if GenericInt = 2 then
	    exit
	end if
	loop
	    y += 1
	    exit when GenericInt = 1
	    exit when y = 302
	    if Exiting = true then
		exit
	    end if
	    if (y mod 40 = 0) then
		TurnP := false
	    elsif y mod 20 = 0 then
		TurnP := true
	    end if
	    if TurnP = false then
		Ticking += 5
	    else
		Ticking -= 5
	    end if
	    Draw.FillBox (45, 20, 165, 22, 22)
	    Draw.FillBox (50 + Ticking, 20, 70 + Ticking, 22, 53)
	    delay (100)
	    if GenericInt = 2 then
		y := 0
		exit
	    end if
	    if y = 300 then
		for k : 0 .. 50 by 2
		    exit when GenericInt = 1
		    Draw.Line (50 - k, 0, 0, 50 - k, 16)
		    Draw.Line (50 - k, 570, 0, 520 + k, 16)
		    Draw.Line (700 + k, 0, 750, 50 - k, 16)
		    Draw.Line (700 + k, 570, 750, 520 + k, 16)
		    delay (100)
		end for
		for p : 1 .. 280 by 10
		    exit when GenericInt = 1
		    Draw.FillBox (0, maxy, maxx, maxy - p, 16)
		    Draw.FillBox (0, 0, maxx, 0 + p, 16)
		    delay (50)
		end for
		Draw.Line (0, 300, maxx, 300, 27)
		Draw.Line (0, 270, maxx, 270, 27)
		delay (100)
		Draw.Line (0, 300, maxx, 300, 16)
		Draw.Line (0, 270, maxx, 270, 16)
		for k : 1 .. 50
		    exit when GenericInt = 1
		    VX := Rand.Int (1, 749)
		    VY := Rand.Int (1, 5)
		    Cr := Rand.Int (53, 58)
		    Draw.FillBox (VX, 270 + VY, VX + 2, 270 + VY + 2, Cr)
		    Draw.FillBox (VX, 300 - VY, VX + 2, 300 - VY + 2, Cr)
		    delay (3)
		end for
		delay (150)
		for k : 1 .. 34
		    exit when GenericInt = 1
		    VX := Rand.Int (1, 749)
		    VY := Rand.Int (1, 5)
		    Cr := Rand.Int (50, 55)
		    Draw.FillBox (VX, 275 + VY, VX + 2, 275 + VY + 2, Cr)
		    Draw.FillBox (VX, 295 - VY, VX + 2, 295 - VY + 2, Cr)
		    delay (2)
		end for
		delay (90)
		for k : 1 .. 16
		    exit when GenericInt = 1
		    VX := Rand.Int (1, 749)
		    VY := Rand.Int (1, 6)
		    Cr := Rand.Int (50, 59)
		    Draw.FillBox (VX, 290 - VY, VX + 2, 290 - VY + 2, Cr)
		    Draw.FillBox (VX, 280 + VY, VX + 2, 280 + VY + 2, Cr)
		    delay (1)
		end for
		DemoMode := true
		exit
	    end if
	end loop
	exit when GenericInt = 1
    end loop
end IntroWind

procedure loading
    loop
	Draw.Line (300, 240, 500, 240, white)                                      % Top line
	Draw.Line (300, 230, 500, 230, white)                                      % Bottom line
	Draw.Line (298, 239, 298, 231, white)                                      % Left line
	Draw.Line (502, 239, 502, 231, white)                                      % Right line
	Draw.FillBox (b, a, b2, a2, 53)
	b += 10
	b2 += 10
	j2 += 10
	j += 10
	delay (50)
	Draw.FillBox (j, a, j2, a2, 151)
	exit when 500 <= j2
	exit when 500 <= b2
    end loop
    delay (50)
    Draw.FillBox (477, 232, 489, 238, 151)
    delay (50)
    Draw.FillBox (490, 232, 500, 238, 151)
    b := 300
    b2 := 307
    j2 := 277
    j := 270
    a := 232
    a2 := 238
end loading

% [Loading Version 2 - White Background]
procedure loading2
    loop
	Draw.Line (300, 240, 500, 240, red)                                      % Top line
	Draw.Line (300, 230, 500, 230, red)                                      % Bottom line
	Draw.Line (298, 239, 298, 231, red)                                      % Left line
	Draw.Line (502, 239, 502, 231, red)                                      % Right line
	Draw.FillBox (b, a, b2, a2, 151)
	b += 10
	b2 += 10
	j2 += 10
	j += 10
	delay (50)
	Draw.FillBox (j, a, j2, a2, 0)
	exit when 500 <= j2
	exit when 500 <= b2
    end loop
    delay (50)
    Draw.FillBox (477, 232, 489, 238, 0)
    delay (50)
    Draw.FillBox (490, 232, 500, 238, 0)
    b := 300
    b2 := 307
    j2 := 277
    j := 270
    a := 232
    a2 := 238
end loading2

% [Town Loading]
proc loading3
    Draw.FillBox (0, 0, maxx, maxy, 29)
    var Loadx : int
    var Loady : int
    var mx, my, mb : int
    var x : int := 70
    var y : int := 50
    var h : int := 0
    var t : boolean := false
    var f : boolean := false
    var Tips : int
    var Load : int
    var sFont : int := Font.New ("Castellar:18:bold")
    var iFont : int := Font.New ("Sylfaen:13")
    Draw.FillBox (0, 0, maxx, 140, 16)
    Draw.Box (x - 1, y - 1, x + 601, y + 41, 39)
    Tips := Rand.Int (1, 30)
    if Tips = 1 then
	Font.Draw ("The war started on 3754, 65th of June.", 110, 190, iFont, 38)
    elsif Tips = 2 then
	Font.Draw ("The officer Je'xclim was once the Mayor of Global City.", 110, 190, iFont, 38)
    elsif Tips = 3 then
	Font.Draw ("Reiligs are mutant species of hounds that were bred by the [Gobalan leader].", 110, 190, iFont, 38)
    elsif Tips = 4 then
	Font.Draw ("The [Gobalan leader]'s name is unknown, even to his citizens.", 110, 190, iFont, 38)
    elsif Tips = 5 then
	Font.Draw ("The major assault on the East coast was carried out by Crezin's warplanes.", 110, 190, iFont, 38)
    elsif Tips = 6 then
	Font.Draw ("The commander of all Gobalan troops, [Mhir Toigre], always dons a red cape.", 110, 190, iFont, 38)
    elsif Tips = 7 then
	Font.Draw ("The commander of the [Crezin Elite Force] has a wife missing since 3759. ", 110, 190, iFont, 38)
    elsif Tips = 8 then
	Font.Draw ("[Drigos] are tiny creatures found living on the edge of forests and beach.", 110, 190, iFont, 38)
    elsif Tips = 9 then
	Font.Draw ("Different weapons offer different abilities, but the only useful ones are rare.", 110, 190, iFont, 38)
    elsif Tips = 10 then
	Font.Draw ("Training is the key to success.", 110, 190, iFont, 38)
    elsif Tips = 11 then
	Font.Draw ("The infamous [Mongorn] of Global City disappeared on a fateful night.", 110, 190, iFont, 38)
    elsif Tips = 12 then
	Font.Draw ("Tima Mansion was once called Timaq, and owned by a landlord.", 110, 190, iFont, 38)
    elsif Tips = 13 then
	Font.Draw ("The green robed man of Grilore has obtained the most kills, at 946.", 110, 190, iFont, 38)
    elsif Tips = 14 then
	Font.Draw ("Phalack is now a rich country due to manufacturing goods.", 110, 190, iFont, 38)
    elsif Tips = 15 then
	Font.Draw ("In land mass, Crezin is the most bountiful.", 110, 190, iFont, 38)
    elsif Tips = 16 then
	Font.Draw ("The country with the largest body of fresh water is Global.", 110, 190, iFont, 38)
    elsif Tips = 17 then
	Font.Draw ("There were sports tournaments before the war started. Now only a few remain.", 110, 190, iFont, 38)
    elsif Tips = 18 then
	Font.Draw ("Hai Zhang surrendered early to the pressure of Tam-Hutzi's assassins.", 110, 190, iFont, 38)
    elsif Tips = 19 then
	Font.Draw ("Certain skills can only be cast when enough experience has been obtained.", 110, 190, iFont, 38)
    elsif Tips = 20 then
	Font.Draw ("Gobalan's original army was 6,203,775 strong. Now it is 2,301,545.", 110, 190, iFont, 38)
    elsif Tips = 21 then
	Font.Draw ("Crezin's initial army was 4,152,607 strong. Now there are 3,950,291 men.", 110, 190, iFont, 38)
    elsif Tips = 22 then
	Font.Draw ("Tam-Hutzi started out with an army of 680,132 people. Currently there is 460,203.", 110, 190, iFont, 38)
    elsif Tips = 23 then
	Font.Draw ("The country with the highest military % loss was Hai Zhang, at 95% dead.", 110, 190, iFont, 38)
    elsif Tips = 24 then
	Font.Draw ("The most 'powerful' single man in duels is the infamous [Treiger], of Crezin.", 110, 190, iFont, 38)
    elsif Tips = 25 then
	Font.Draw ("Arnak's hero, Yoodah, was missing in action 3 years ago.", 110, 190, iFont, 38)
    elsif Tips = 26 then
	Font.Draw ("Adreizu is the most prolific country with tanks, the sloping is usually 35-55 degrees.", 110, 190, iFont, 38)
    elsif Tips = 27 then
	Font.Draw ("A Lieutenant of the Wantrin GB Force.One was killed by a thrown pan.", 110, 190, iFont, 38)
    elsif Tips = 28 then
	if Storyline > 15 then
	    Font.Draw ("[GBM] Warning, citizens! Kill any suspicious foreigners, or face death!", 110, 190, iFont, 49)
	elsif Storyline > 10 then
	    Font.Draw ("[GBM] Beware, citizens! Dangerous activity has been reported in your town.", 110, 190, iFont, 49)
	elsif Storyline > 7 then
	    Font.Draw ("[GBM] Dear citizens, nearby villages have fallen to the enemy.", 110, 190, iFont, 49)
	elsif Storyline > 5 then
	    Font.Draw ("[GBM] Dear townsfolk, we are winning the war!.", 110, 190, iFont, 49)
	else
	    Font.Draw ("[GBM] Dear citizens, be on the watch for assassins!", 110, 190, iFont, 49)
	end if
    elsif Tips = 29 then
	Font.Draw ("The North Pole might be the Leader's secret Winter Palace.", 110, 190, iFont, 38)
    else
	Font.Draw ("The [Wicked Hezlow] sent the order to destroy the civillian population.", 110, 190, iFont, 38)
    end if
    for i : 0 .. 10
	Draw.Box (0 + i, 0 + i, maxx - i, maxy - i, 21 + i)
    end for
    for i : 1 .. 100
	h := (6 * i)
	Load := i
	Draw.FillBox (300, y + 4, 360, y + 39, 16)
	for decreasing k : 9 .. 1
	    Draw.FillBox (x, y + k * 4, x + h, y + ((k + 1) * 4), 25 - k)
	end for
	Draw.FillBox (x, y, x + h, y + 8, 24)
	Font.Draw (intstr (Load) + "%", 305, 65, sFont, 54)
	View.Update
	delay (23)
    end for
end loading3
