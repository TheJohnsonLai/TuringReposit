% Fighting Procedures [FIGHTS1]
% Fighting Procedures, Pet skills, Levelling and battle results

proc stats (ATRICK : real)
    if Style = "Melee" then
	Hp := 1500 * 1.41 ** Level
	Intelligence += 35 + StackIntelligence
	Speed += 8
	THp := Hp + StackHp + 55
	Mana := 80 * 1.17 ** Level
	TMana := Mana + ATRICK + Level
	Damage := 90 * (1.24) ** Level + StackDamage
    elsif Style = "Ranged" then
	Hp := 1400 * 1.37 ** Level
	Intelligence += 64 + ATRICK + StackIntelligence
	Speed += 14 + ATRICK
	THp := Hp + StackHp + 34
	Mana := 110 * 1.24 ** Level
	TMana := Mana + (ATRICK * 2) + Level
	Damage := 110 * (1.26) ** Level + StackDamage
    elsif Style = "Magic" then
	Hp := 1100 * 1.33 ** Level
	Intelligence += 88 + (ATRICK * 7) + StackIntelligence
	Speed += 14
	THp := Hp + StackHp + 21
	Mana := 280 * 1.26 ** Level
	TMana := Mana + (ATRICK * 3) + Level
	Damage := 100 * (1.31) ** Level + StackDamage
    elsif Style = "Gunner" then
	Hp := 1400 * 1.38 ** Level
	Intelligence += 47 + StackIntelligence
	Speed += 20
	THp := Hp + StackHp + 24
	Mana := 180 * 1.2 ** Level
	TMana := Mana + (ATRICK * 2) + Level
	Damage := 110 * (1.29) ** Level + 1 + StackDamage
    end if
end stats
proc level         %[LEVEL1]
    if Experience >= 10000 and LevelArray (15) = 0 then
	Level := 15
	stats (215)
	ManaRegen := TMana * 0.05
	LevelArray (15) := 1
	Added += 30
    elsif Experience >= 8000 and LevelArray (14) = 0 then
	Level := 14
	stats (105)
	ManaRegen := TMana * 0.05
	LevelArray (14) := 1
	Added += 10
    elsif Experience >= 6300 and LevelArray (13) = 0 then
	Level := 13
	stats (90)
	ManaRegen := TMana * 0.05
	LevelArray (13) := 1
	Added += 10
    elsif Experience >= 5000 and LevelArray (12) = 0 then
	Level := 12
	stats (75)
	ManaRegen := TMana * 0.05
	LevelArray (12) := 1
	Added += 10
    elsif Experience >= 4000 and LevelArray (11) = 0 then
	Level := 11
	stats (56)
	ManaRegen := TMana * 0.05
	LevelArray (11) := 1
	Added += 10
    elsif Experience >= 3100 and LevelArray (10) = 0 then
	Level := 10
	stats (45)
	ManaRegen := TMana * 0.05
	LevelArray (10) := 1
	Added += 20
    elsif Experience >= 2500 and LevelArray (9) = 0 then
	Level := 9
	stats (34)
	ManaRegen := TMana * 0.05
	LevelArray (9) := 1
	Added += 10
    elsif Experience >= 1735 and LevelArray (8) = 0 then
	Level := 8
	stats (30)
	ManaRegen := TMana * 0.05
	LevelArray (8) := 1
	Added += 10
    elsif Experience >= 1280 and LevelArray (7) = 0 then
	Level := 7
	stats (36)
	ManaRegen := TMana * 0.05
	LevelArray (7) := 1
	Added += 10
    elsif Experience >= 860 and LevelArray (6) = 0 then
	Level := 6
	stats (25)
	ManaRegen := TMana * 0.05
	LevelArray (6) := 1
	Added += 10
    elsif Experience >= 550 and LevelArray (5) = 0 then
	Level := 5
	stats (20)
	ManaRegen := TMana * 0.05
	LevelArray (5) := 1
	Added += 15
    elsif Experience >= 350 and LevelArray (4) = 0 then
	Level := 4
	stats (15)
	ManaRegen := TMana * 0.05
	LevelArray (4) := 1
	Added += 10
    elsif Experience >= 200 and LevelArray (3) = 0 then
	Level := 3
	stats (10)
	ManaRegen := TMana * 0.05
	LevelArray (3) := 1
	Added += 10
    elsif Experience >= 100 and LevelArray (2) = 0 then
	Level := 2
	stats (5)
	ManaRegen := TMana * 0.05
	LevelArray (2) := 1
	Added += 10
    else
	for decreasing k : 15 .. 1
	    if LevelArray (k) = 1 then
		Level := k
		exit
	    end if
	end for
    end if
    Hp := round (Hp)
    THp := round (THp)
    Mana := round (Mana)
    TMana := round (TMana)
    Damage := round (Damage)
end level

proc ClearTop
    Draw.FillBox (500, 30, 600, 40, 0)
    EnemyHpbar (EnemyHp, EnemyTHp)
    delay (1500)
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (10, 560)
end ClearTop


proc PetFight
    PetsChoice := Rand.Int (1, 8)
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    colour (48)
    if Pet = 0 then
    elsif PetsChoice = 1 then
	Attacked := NiceDamage + Rand.Int (50, 200)
	EnemyHp -= Attacked
	locatexy (10, 560)
	put "EEiiii.... Damage Dealt: ", Attacked
    elsif PetsChoice = 2 then
	Attacked := NiceDamage + NiceSpeed + NiceIntelligence
	EnemyHp -= Attacked
    elsif PetsChoice = 3 then
	Attacked := NiceIntelligence * Rand.Int (1, 10)
	Hp += Attacked
	locatexy (10, 560)
	put "Hushhhshhs.... Healed: ", Attacked
    elsif PetsChoice = 4 then
	Attacked := NiceDamage * 1.6
	EnemyHp -= Attacked
	locatexy (10, 560)
	put "Raa raaa    Damage Dealt: ", Attacked
    elsif PetsChoice = 5 then
	Attacked := NiceDamage / 100 * Rand.Int (80, 150)
	EnemyHp -= Attacked
	locatexy (10, 560)
	put "Moi .. moi .. Damage Dealt: ", Attacked
    elsif PetsChoice = 6 then
	Attacked := NiceDamage / 100 * Rand.Int (10, 500)
	EnemyHp -= Attacked
	locatexy (10, 560)
	put "Eiinya!   Damage Dealt: ", Attacked
    elsif PetsChoice = 7 then
	Attacked := NiceDamage * 2
	EnemyHp -= Attacked
	locatexy (10, 560)
	put "Miiuu.. 2 .. Damage Dealt: ", Attacked
    else
	Attacked := NiceDamage + NiceIntelligence
	Hp += Attacked
	locatexy (10, 560)
	put "-Jirch- Healed: ", Attacked
    end if
end PetFight

procedure FarmerFight (Character : int)
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    EnemyHp := 2896
    EnemyTHp := 3000
    EnemyIntelligence := 70
    EnemyDamage := 70
    EnemySpeed := 4
    Turn := 0
    EnemyTurn := 0
    EnemyThing := AngryFarmer
    Joe_
    Pet := 9
    GG := true
    loop
	loop
	    locatexy (2, 560)
	    Tutorial := Rand.Int (1, 5)
	    delay (1)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    Pic.Draw (Joe, 150, 110, picCopy)
	    FightGUI
	    Turn += 1
	    Futton
	    delay (1700)
	    cls
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    Pic.Draw (Joe, 150, 110, picCopy)
	    FightGUI
	    ScreenSet
	    if EnemyHp <= 0 then
		exit
	    elsif Hp <= 0 then
		cls
		Failed
		exit
	    elsif Flee = true then
		exit
	    end if
	    ClearTop
	    put " Joe's Turn.."
	    delay (2000)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    JoeChoice := Rand.Int (1, 7)
	    colour (11)
	    if JoeChoice = 1 then
		EnemyHp -= 866
		Display := realstr (866, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hyaa!! Damage dealt: 866"
	    elsif JoeChoice = 2 then
		EnemyHp -= JoeDefense
		Attacked := JoeDefense
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " Hiiyyyaaa!!!", JoeDefense
	    elsif JoeChoice = 3 then
		EnemyHp -= 164
		Attacked := 164
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " 164 damage.."
	    elsif JoeChoice = 4 then
		JoeHp += 170
		Attacked := 170
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " That was nice, healed myself. (170)"
	    elsif JoeChoice = 5 then
		Hp += 432
		Attacked := 432
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " Really nice, 432 hp for you."
	    elsif JoeChoice = 6 then
		EnemyHp := 1
		Display := realstr (99.99, 4)
		Font.Draw ("-" + Display + "%", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " DIE!"
	    elsif JoeChoice = 7 then
		EnemyHp -= 1602
		Attacked := 1602
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 570, 290, intfont, 16)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (20, 550)
		put " I will crush your soul. (1602)"
	    end if
	    if EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1000)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put " The Farmer's Turn"
	    delay (2000)
	    EnemyChoice := Rand.Int (1, 6)
	    EnemyTurn += 1
	    colour (11)
	    loop
		if EnemyTurn <= 0 then
		    exit
		end if
		if EnemyChoice = 1 then
		    JoeHp := JoeHp - Rand.Int (59, 243)
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 250, 350, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Fhuq u zonen swine! "
		elsif EnemyChoice = 2 then
		    JoeHp := JoeHp - 257
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 250, 350, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Guttural Slice!! (257)"
		elsif EnemyChoice = 3 then
		    EnemyDamage := EnemyDamage + 25
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " hah, i helz myseiph sum 25 attack."
		elsif EnemyChoice = 4 then
		    Hp -= 68
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 140, 270, intfont, 39)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " I WILL KILL YOU! (68)"
		elsif EnemyChoice = 5 then
		    locatexy (500, 550)
		    put " IMA KILL YEH"
		elsif EnemyChoice = 6 then
		    EnemyHp := EnemyHp + Rand.Int (60, 200)
		    Display := realstr (Attacked, 6)
		    Font.Draw (Display + "", 560, 290, intfont, 48)
		    Draw.FillBox (0, 550, maxx, 570, 0)
		    locatexy (20, 550)
		    put " Agggg hhaaaa!!! (Heals self random hp)"
		end if
		exit
	    end loop
	    delay (1500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	    MAX
	    NICEMAX
	end loop
	delay (1500)
	if Hp <= 0 then
	    cls
	    Hp := THp
	    put "Joe revives you."
	    delay (1200)
	elsif EnemyHp <= 0 then
	    exit
	end if
    end loop
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("The Farmer screams in agony as Joe thrusts his daggers into his chest.", 100, 450, intfont1, 16)
    delay (2000)
    Font.Draw ("He gapes wide-eyed at you two. 'U're...naught Zeno?'", 100, 420, intfont1, 16)
    delay (2000)
    Font.Draw ("He collapses, dead.", 100, 390, intfont1, 16)
    delay (2000)
    Font.Draw (" Joe: Go to Town of Billejun. There should be a training site there. ", 100, 300, intfont1, 11)
    delay (2000)
    Font.Draw (" Joe: I'll start you off. Here's an item... ", 100, 270, intfont1, 11)
    Font.Draw (" Joe: And some money.. (60)", 100, 240, intfont1, 11)
    if Style = "Melee" then
	Damage += 40
	locatexy (20, 10)
	put "Obtained Necklace of Joe (+ 40 Damage)"
    elsif Style = "Ranged" then
	Speed += 35
	locatexy (20, 10)
	put "Obtained The Horned Gizzard (+ 35 Speed)"
    elsif Style = "Gunner" then
	Skill_Level_Shot_s := 3
	locatexy (20, 10)
	put "Obtained Tome of Lazard (+ Shot Skill level)"
    elsif Style = "Magic" then
	Intelligence += 70
	locatexy (20, 10)
	put "Obtained Ten'shaar Shoulderplates (+ 70 Int)"
    end if
    delay (2000)
    Font.Draw ("..Ok..", 100, 100, intfont1, 0)
    Font.Draw ("(Press any key)", 100, 50, intfont1, 0)
    getch (waitkey)
    locatexy (10, 10)
    Money += 75
    Experience += 15
    Storyline += 1
    Congratulations
    put "Money gained: + 15 + 60"
    put "Experience gained: + 15"
    getch (waitkey)
    cls
    Pet := 0
    GG := false
end FarmerFight

proc NaLongVsRebel
    Rebel_
    NaLong_
    fork playstuffSoldier
    Track := "Soldier"
    EnemyTurn := 0
    loop
	loop
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    colorback (0)
	    Pic.Draw (FightingSkill, 0, 0, picXor)
	    Pic.Draw (Rebel, 500, 110, picXor)
	    Pic.Draw (NaLong, 20, 110, picXor)
	    NPCCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Na-Long's Turn"
	    delay (2000)
	    NiceChoice := Rand.Int (1, 5)
	    if NiceChoice = 1 then
		Attacked := (4 * Rand.Int (90, 121) + NiceSpeed) * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Shadow No.14  Kicks felt: ", Attacked
	    elsif NiceChoice = 2 then
		Attacked := (1 * 0.6 + 2) + NiceDamage / 100 * Rand.Int (70, 500)
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Exquisite darts.. fly! Shots fired and pierced: ", Attacked
	    elsif NiceChoice = 3 then
		Attacked := NiceDamage * 0.73 / 100 * Rand.Int (300, 450) + NiceIntelligence
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Nan jing, wo bu shuo, hai mei li!  Damage dealt: ", Attacked
	    elsif NiceChoice = 4 then
		Attacked := 999 * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Do you want to die? Damage dealt: ", Attacked
	    elsif NiceChoice = 5 then
		NiceHp := NiceTHp
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		put " Wounds, revile! Amount healed: ", Attacked
	    elsif NiceChoice = 6 then
		EnemyHp := EnemyHp / 2
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 540, 270, intfont, 39)
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "Begin.. to seperate!  Body Sliced: ", EnemyHp / 2
	    end if
	    NICEMAX
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " The Rebel's turn"
	    delay (2000)
	    EnemyChoice := Rand.Int (1, 5)
	    EnemyTurn := EnemyTurn + 1
	    if EnemyTurn <= 0 then
		exit
	    end if
	    if EnemyChoice = 1 then
		Attacked := EnemyDamage + EnemySpeed - NiceSpeed - NiceIntelligence
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Curses! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 2 then
		Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 88)
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "I will fight, for the glory of Gobalan! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 3 then
		Attacked := EnemyDamage * 0.5 + Rand.Int (50, 70)
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Neeeeaaaaaaiiiihhh! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 4 then
		Attacked := EnemyDamage * 1.3
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Whorls; of hair! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 5 then
		Attacked := EnemyDamage * 3
		NiceHp := NiceHp - Attacked
		Display := realstr (Attacked, 6)
		Font.Draw (Display + "", 140, 270, intfont, 39)
		put "Soit - Sut - Sain! 3 slices doing: ", Attacked
	    end if
	    delay (1500)
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif NiceHp <= 0 then
	    cls
	    NiceHp := NiceTHp
	    put "Na-Long revives himself."
	    delay (1200)
	end if
    end loop
end NaLongVsRebel

proc JoeVsOlba
    Joe_
    Olba_
    loop
	loop
	    cls
	    Draw.FillBox (0, 0, maxx, maxy, 0)
	    colorback (0)
	    Pic.Draw (FightingSkill, 0, 0, picXor)
	    Pic.Draw (Joe, 20, 110, picXor)
	    Pic.Draw (Olba, 500, 110, picXor)
	    NPCCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Joe's Turn"
	    delay (2000)
	    NiceChoice := Rand.Int (1, 5)
	    if NiceChoice = 1 then
		Attacked := NiceDamage
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hyaa!! Damage Dealt: ", Attacked
	    elsif NiceChoice = 2 then
		Attacked := JoeDefense + NiceIntelligence
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Hiiyyyaaa!!! ", Attacked
	    elsif NiceChoice = 3 then
		Attacked := 345
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "345.. you say "
	    elsif NiceChoice = 4 then
		Attacked := 999 * Level
		EnemyHp := EnemyHp - Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " Fallengin, crush my foe! Damage Dealt: ", Attacked
	    elsif NiceChoice = 5 then
		Attacked := NiceTHp * 0.7
		NiceHp := NiceHp + Attacked
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put " That was nice, healed myself!  (", Attacked, ")"
	    elsif NiceChoice = 6 then
		EnemyHp := 1
		Draw.FillBox (0, 550, maxx, 570, 0)
		locatexy (0, 560)
		put "DIE!"
	    end if
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Olba's turn"
	    delay (2000)
	    EnemyChoice := Rand.Int (1, 5)
	    EnemyTurn += 1
	    if EnemyTurn <= 0 then
		exit
	    end if
	    if EnemyChoice = 1 then
		Attacked := EnemyDamage + EnemySpeed - NiceSpeed - NiceIntelligence
		NiceHp := NiceHp - Attacked
		put "Curses! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 2 then
		Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 88)
		NiceHp := NiceHp - Attacked
		put "I will fight, for the glory of Gobalan! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 3 then
		Attacked := EnemyDamage * 0.5 + Rand.Int (50, 70)
		NiceHp := NiceHp - Attacked
		put "Neeeeaaaaaaiiiihhh! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 4 then
		Attacked := EnemyDamage * 1.3
		NiceHp := NiceHp - Attacked
		put "Whorls; of hair! Damage Dealt: ", Attacked
	    elsif EnemyChoice = 5 then
		Attacked := EnemyDamage * 3
		NiceHp := NiceHp - Attacked
		put "Soit - Sut - Sain! 3 slices doing: ", Attacked
	    end if
	    delay (1500)
	    if NiceHp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    end if
	    cls
	end loop
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif NiceHp <= 0 then
	    cls
	    Failed
	    exit
	end if
    end loop
    if Teleport = true then
	Exiting := true
    end if
    EMon := EnemyMoney
    Money += EMon
    Exper := EnemyExperience
    Experience += Exper
end JoeVsOlba

proc CreileStoryLine7Fight
    EnemyTurn := 0
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("A horn sounds.", 50, 540, intfont1, 54)
    delay (400)
    Font.Draw ("The Gobalan are coming!", 50, 520, intfont1, 54)
    delay (350)
    Font.Draw ("You rush onto the Ramparts. Behind the ballista, you see about 1500 tired soldiers slowly moving to Creile.", 50, 500, intfont1, 54)
    delay (700)
    Font.Draw ("Crezin soldiers rush by you, loading bows, explosives and guns.", 50, 480, intfont1, 54)
    delay (1500)
    Font.Draw ("Joe on the pipes: Capture them when they surrender. That is our focus goal.", 50, 450, intfont1, 11)
    delay (1200)
    Font.Draw ("When they panic away from the large projectiles, use a ranged item to shoot at them. ", 50, 430, intfont1, 11)
    delay (1200)
    Font.Draw ("Try to kill as many as possible, not just kill the closest to the gates. When they reach the gate..", 50, 410, intfont1, 11)
    delay (1200)
    Font.Draw (".. pour the steaming sludge onto their armor and fire more explosives.", 50, 390, intfont1, 11)
    delay (1200)
    Font.Draw ("When the gate is about to fall, light the brush pile on fire and brun the gate down.", 50, 370, intfont1, 11)
    delay (1200)
    Font.Draw ("Then, once the fire is out, and they begin the final charge..", 50, 350, intfont1, 11)
    delay (1200)
    Font.Draw ("Drop the spike net on top of them.", 50, 330, intfont1, 11)
    delay (1200)
    Font.Draw ("Any survivors that fight, let our captains and lieutenants deal with.", 50, 310, intfont1, 11)
    delay (1200)
    Font.Draw ("Assassins, snipe their leaders, and kill them. Follow me.", 50, 290, intfont1, 11)
    Font.Draw ("(Press any button)", 100, 100, intfont1, 54)
    getch (waitkey)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("You enter a chamber, with an outwards window. Inside are the assassins.", 100, 400, intfont1, 54)
    delay (900)
    Font.Draw ("Lukvel: We wait here until they enter the gate. ", 30, 350, intfont1, 43)
    delay (900)
    Font.Draw ("Ravness has a gun pointed out of the window, and is shooting at a flagbearer. ", 10, 300, intfont1, 54)
    delay (900)
    Font.Draw (" A second later, the flag disappears.", 10, 275, intfont1, 54)
    delay (500)
    Font.Draw ("Lukvel: We must remian hidden from view. If a survive decides to flee.. ", 30, 250, intfont1, 43)
    delay (900)
    Font.Draw ("Lukvel: they cannot report that assassins commanded this.", 30, 225, intfont1, 43)
    delay (100)
    Font.Draw ("Lukvel: Currently, they will believe that credit goes to Na-Long, Jasqur and the Crezin army.", 30, 200, intfont1, 43)
    delay (900)
    Font.Draw ("Joe: You're tired, right? Sleep. We'll need the energy.", 20, 150, intfont1, 11)
    delay (900)
    Font.Draw ("  Sleep... I do need it..", 100, 100, intfont1, 54)
    getch (waitkey)
    % Draw battle scenes
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("An unknown amount of time passes. Now, Ravness is tossing jars of spiders,", 10, 400, intfont1, 54)
    Font.Draw (" eggs, insects and grubs out of the window.", 10, 375, intfont1, 54)
    delay (900)
    Font.Draw ("The field is splattered with dead bodies..", 100, 350, intfont1, 54)
    delay (900)
    Font.Draw ("The brush is being set on fire, with some Gobalani burning with it.", 100, 300, intfont1, 54)
    delay (900)
    Font.Draw ("Some swordsmen rush forward, to be warded off by the heat. A few are cooked alive.", 100, 250, intfont1, 54)
    delay (900)
    Font.Draw ("You pass 6 floors and jump out to a roof.", 100, 200, intfont1, 54)
    delay (900)
    Font.Draw ("Nearby, the Gobalani are putting out the fire with dead, dying and injured bodies.", 100, 150, intfont1, 54)
    delay (900)
    Font.Draw ("The remains of the army are a tattered group, barely numbering 90.", 100, 100, intfont1, 54)
    delay (900)
    getch (waitkey)
    loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Font.Draw ("Enemy Moral Remaining", 260, 50, intfont1, red)
	Moral
	if EnemyMoral <= 0 then
	    exit
	else
	end if
	Turn := 0
	Font.Draw ("The enemy is spreading into the town! Who do you target?", 100, 400, intfont1, 54)
	Font.Draw ("[1] A Mage", 110, 200, intfont1, 53)
	Font.Draw ("[2] A Gunner", 110, 170, intfont1, 53)
	Font.Draw ("[3] A Pikesman", 110, 140, intfont1, 53)
	Font.Draw ("[4] A Swordsman", 110, 110, intfont1, 53)
	get MoralFightanswer
	if MoralFightanswer = 1 then
	    GBMage
	    EnemyThing := GBMagePic
	    EnemyMoral -= 7
	elsif MoralFightanswer = 2 then
	    GBGunner
	    EnemyThing := GBGunnerPic
	    EnemyMoral -= 5
	elsif MoralFightanswer = 3 then
	    GBPike
	    EnemyThing := GBPikePic
	    EnemyMoral -= 3
	elsif MoralFightanswer = 4 then
	    GBSword
	    EnemyThing := GBSwordPic
	    EnemyMoral -= 2
	end if
	if Track = "Winter Fireworks" then
	else
	    fork playstuffFireworks
	    Track := "Winter Fireworks"
	end if
	if Pet = 0 then
	    nothing
	elsif Pet = 1 then
	    Roque
	elsif Pet = 2 then
	    Bunion
	elsif Pet = 3 then
	    Hairi
	elsif Pet = 4 then
	    GhostBunny
	elsif Pet = 5 then
	    Dolphi
	elsif Pet = 6 then
	    Hushsh
	elsif Pet = 7 then
	    Turtle
	elsif Pet = 8 then
	    Drigo
	end if
	loop
	    cls
	    MAX
	    NICEMAX
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " YOUR Turn"
	    FightGUI
	    Turn += 1
	    Futton
	    delay (1700)
	    cls
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    FightGUI
	    ScreenSet
	    if EnemyHp <= 0 then
		exit
	    elsif Hp <= 0 then
		cls
		Failed
		exit
	    elsif Flee = true then
		exit
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put "Pet's Turn.. if any"
	    PetFight
	    delay (500)
	    if EnemyHp <= 0 then
		exit
	    elsif Hp <= 0 then
		cls
		Failed
		exit
	    elsif Flee = true then
		exit
	    end if
	    Draw.FillBox (500, 30, 600, 40, 0)
	    EnemyHpbar (EnemyHp, EnemyTHp)
	    delay (1500)
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 550)
	    put " Opponent's Turn"
	    delay (2000)
	    EnemyChoice := Rand.Int (1, 6)
	    EnemyTurn += 1
	    if EnemyTurn <= 0 then
		put " Stunned"
	    elsif EnemyChoice = 1 then
		Magna
	    elsif EnemyChoice = 2 then             %% put enemy skill procedures here
		SingedFeathers
	    elsif EnemyChoice = 3 then
		EHeal
	    elsif EnemyChoice = 4 then
		WhorlsofHair
	    elsif EnemyChoice = 5 then
		KnifeStab
	    elsif EnemyChoice = 6 then
		RedBurst
	    end if
	    delay (1500)
	    if EnemyHp <= 0 then
		exit
	    elsif Hp <= 0 then
		cls
		Failed
		exit
	    elsif Flee = true then
		exit
	    end if
	end loop
	if Teleport = true then
	    Exiting := true
	    exit
	elsif Flee = true then
	    put "Joe: We can't lose, you know! He heals you for 100% hp."
	    Hp := THp
	elsif Hp <= 0 then
	    Failed
	else
	    Congratulations
	    Exper := EnemyExperience
	    Experience += Exper
	    EMon := EnemyMoney
	    Money += EMon
	    locatexy (10, 560)
	    put "Money gained: ", EMon
	    put "Experience gained: ", Exper
	end if
	getch (waitkey)
	cls
    end loop
    if EnemyMoral < 0 then
	Money += 50
	Experience += 60
    else
    end if
    level
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("The Gobalani forces have fallen below 0 moral.. they have surrendered!", 100, 400, intfont1, 54)
    getch (waitkey)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("Your foot is on top of an injured Mage. His pride left his body minutes ago,", 50, 260, intfont1, 54)
    delay (1)
    Font.Draw ("what is left of his courage is a hollow bag of skin and bones.", 50, 240, intfont1, 54)
    delay (1000)
    Font.Draw ("A mage: Who knew it would come to this? Has Commander Anscelsior-Haltin left us for dead?", 50, 220, intfont1, 55)
    delay (2000)
    Font.Draw ("Joe calls from overhead:", 10, 550, intfont1, 11)
    delay (200)
    Font.Draw ("All of you. Soldiers, magic users, snipers. You hail from Gobalan. You are our enemy.", 20, 530, intfont1, 11)
    delay (1000)
    Font.Draw ("We will spare you. Consider it a favour.", 20, 510, intfont1, 11)
    delay (1000)
    Font.Draw ("The cowardly soldiers nod in agreement, eager to taste life again.", 50, 200, intfont1, 54)
    delay (1000)
    Font.Draw ("You will join the ranks of townspeople, and till the fields. Provide bountiful crops for Zeno.", 20, 490, intfont1, 11)
    delay (400)
    Font.Draw ("If anyone disagrees, make your voice heard.", 20, 470, intfont1, 11)
    delay (100)
    Font.Draw ("The same mage from last time: I'll CULL YOU, you Crezin demon!", 50, 180, intfont1, 59)
    delay (1000)
    Font.Draw ("Joe smiles. ", 30, 450, intfont1, 11)
    delay (200)
    Font.Draw ("Joe: Come here. ", 20, 430, intfont1, 11)
    delay (1000)
    Font.Draw ("A raggedy mage steps forth. 'I am Olba, son of the Magician Hezlow.'", 20, 160, intfont1, 59)
    delay (800)
    Font.Draw ("Joe: Pshh, who's Hezlow? ", 20, 410, intfont1, 11)
    delay (300)
    Font.Draw ("Olba: You dare silence me? You have no chance!", 30, 140, intfont1, 59)
    delay (760)
    Font.Draw ("Joe laughs. 'Come. Here.'", 20, 390, intfont1, 11)
    getch (waitkey)
    cls
    JoeVsOlba
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("Olba: Im.--..imposss---..bbll!!ee!!", 30, 400, intfont1, 59)
    delay (3000)
    Font.Draw ("Olba: Forgive me, father..", 30, 370, intfont1, 59)
    delay (2500)
    Font.Draw ("Olba's dead body falls off the podium. Money falls out of his cloak.", 30, 300, intfont1, 59)
    delay (2500)
    Font.Draw ("Joe: What's done is irreversible. Now, let's move on.. to a new future!", 30, 200, intfont1, 11)
    delay (500)
    Storyline := 8
    getch (waitkey)
end CreileStoryLine7Fight

proc Fight     % Training / Field
    EnemyTurn := 0
    if Track = "Winter Fireworks" or Track = "Days of Dash" then
    else
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    if Level >= 10 then
	EnemyType := Rand.Int (1, 5)
    elsif Level >= 5 then
	EnemyType := Rand.Int (1, 4)
    elsif Level >= 1 then
	EnemyType := Rand.Int (1, 3)
    end if
    if EnemyType = 1 then
	HighwayBandit
	EnemyThing := HighwayBandit_
	Pic.Draw (HighwayBandit_, 500, 100, picCopy)
    elsif EnemyType = 2 then
	Rogue
	EnemyThing := Rogue_
	Pic.Draw (Rogue_, 500, 100, picCopy)
    elsif EnemyType = 3 then
	Robber
	EnemyThing := Robber_
	Pic.Draw (Robber_, 500, 100, picCopy)
    elsif EnemyType = 4 then
	Cadet
	EnemyThing := Cadet_
	Pic.Draw (Cadet_, 500, 100, picCopy)
    elsif EnemyType = 5 then
	GBSoldier
	EnemyThing := GBSoldier_
	Pic.Draw (GBSoldier_, 500, 100, picCopy)
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	MAX
	NICEMAX
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 560)
	put " YOUR Turn"
	delay (1)
	FightGUI
	Turn += 1
	Futton
	delay (1700)
	cls
	FightGUI
	ScreenSet
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put "Pet's Turn.. if any"
	PetFight
	delay (500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put " Opponent's Turn"
	colour (110)
	delay (2000)
	if Pet > 0 then
	    EnemyChoice := Rand.Int (1, 9)
	else
	    EnemyChoice := Rand.Int (1, 6)
	end if
	EnemyTurn += 1
	if EnemyTurn <= 0 then
	    put "Stunned"
	elsif EnemyChoice = 1 then
	    Bite
	    EnemyTurn -= 1
	elsif EnemyChoice = 2 then             %% put enemy skill procedures here
	    clawwed
	    EnemyTurn -= 1
	elsif EnemyChoice = 3 then
	    EHeal
	    EnemyTurn -= 1
	elsif EnemyChoice = 4 then
	    WhorlsofHair
	    EnemyTurn -= 1
	elsif EnemyChoice = 5 then
	    KnifeStab
	    EnemyTurn -= 1
	elsif EnemyChoice = 6 then
	    RedBurst
	    EnemyTurn -= 1
	elsif EnemyChoice = 7 then
	    PetStab
	    EnemyTurn -= 1
	elsif EnemyChoice = 8 then
	    RockShatter
	    EnemyTurn -= 1
	elsif EnemyChoice = 9 then
	    GutteralSlice
	    EnemyTurn -= 1
	end if
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	delay (1500)
	cls
    end loop
    if Teleport = true then
	Exiting := true
    elsif Flee = true then
	put "Fleeing.."
	delay (500)
	Flee := false
    elsif Hp <= 0 then
	Failed
    else
	Congratulations
	Exper := EnemyExperience
	Experience += Exper
	EMon := EnemyMoney
	Money += EMon
	locatexy (10, 560)
	put "Money gained: ", EMon
	put "Experience gained: ", Exper
    end if
    getch (waitkey)
    cls
    level
end Fight

% [FIGHT2]
proc Fight2
    EnemyTurn := 0
    if Track = "Winter Fireworks" or Track = "Days of Dash" then
    else
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    if Level >= 5 then
	EnemyType := Rand.Int (1, 5)
    elsif Level >= 3 then
	EnemyType := Rand.Int (1, 4)
    elsif Level >= 1 then
	EnemyType := Rand.Int (1, 3)
    end if
    if EnemyType = 1 then
	RiotSoldier
	EnemyThing := RiotSoldier_
    elsif EnemyType = 2 then
	EscapedPrisonmate
	EnemyThing := EscapedPrisonmate_
    elsif EnemyType = 3 then
	Gobassin
	EnemyThing := Gobassin_
    elsif EnemyType = 4 then
	DoctorLevun
	EnemyThing := DoctorLevun_
    elsif EnemyType = 5 then
	Glabezir
	EnemyThing := Glabezir_
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	MAX
	NICEMAX
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 560)
	put " YOUR Turn"
	delay (1)
	FightGUI
	Turn := Turn + 1
	Futton
	delay (1700)
	cls
	FightGUI
	ScreenSet
	Turn += 1
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put "Pet's Turn.. if any"
	PetFight
	delay (500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put " Opponent's Turn"
	colour (110)
	delay (2000)
	if EnemyType = 4 then
	    if Pet > 0 then
		EnemyChoice := Rand.Int (3, 10)
	    else
		EnemyChoice := Rand.Int (3, 9)
	    end if
	elsif EnemyType = 5 then
	    if Pet > 0 then
		EnemyChoice := Rand.Int (1, 8)
		if EnemyChoice = 4 then
		    EnemyChoice := 10
		else
		    EnemyChoice := Rand.Int (1, 7)
		end if
	    else
		EnemyChoice := Rand.Int (1, 7)
	    end if
	else
	    EnemyChoice := Rand.Int (1, 8)
	    if EnemyChoice = 3 or EnemyChoice = 8 then
		EnemyChoice := 10
	    else
		EnemyChoice := Rand.Int (1, 6)
	    end if
	end if
	EnemyTurn += 1
	if EnemyTurn <= 0 then
	    put "Stunned"
	elsif EnemyChoice = 1 then
	    Downwardsstroke
	    EnemyTurn -= 1
	elsif EnemyChoice = 2 then             %% put enemy skill procedures here
	    KnifeStab
	    EnemyTurn -= 1
	elsif EnemyChoice = 3 then
	    Buff_G
	    EnemyTurn -= 1
	elsif EnemyChoice = 4 then
	    SingedFeathers
	    EnemyTurn -= 1
	elsif EnemyChoice = 5 then
	    Magna
	    EnemyTurn -= 1
	elsif EnemyChoice = 6 then
	    RedBurst
	    EnemyTurn -= 1
	elsif EnemyChoice = 7 then
	    ThroatSlash
	    EnemyTurn -= 1
	elsif EnemyChoice = 8 then
	    Freedom
	    EnemyTurn -= 2
	elsif EnemyChoice = 9 then
	    PoisonBlow
	    EnemyTurn -= 1
	elsif EnemyChoice = 10 then
	    MightySlam
	    EnemyTurn -= 1
	end if
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	delay (1500)
	cls
    end loop
    if Teleport = true then
	Exiting := true
    elsif Flee = true then
	put "Fleeing.."
	delay (500)
	Flee := false
    elsif Hp <= 0 then
	Failed
    else
	Congratulations
	Exper := EnemyExperience
	Experience += Exper
	EMon := EnemyMoney
	Money += EMon
	locatexy (10, 560)
	put "Money gained: ", EMon
	put "Experience gained: ", Exper
    end if
    getch (waitkey)
    cls
    level
end Fight2

proc BanditFight
    EnemyTurn := 0
    if Track = "Winter Fireworks" then
    else
	fork playstuffFireworks
	Track := "Winter Fireworks"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    if Townanswer = 3 then
	Wurbul
	TabBandit := 1
	EnemyThing := Wurbul_
    elsif Townanswer = 1 or Townanswer = 2 or Townanswer not= 3 or Townanswer not= 4 then
	Oreg
	TabBandit := 2
	EnemyThing := Oreg_
    else
	Wurbul
	TabBandit := 1
	EnemyThing := Wurbul_
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	MAX
	NICEMAX
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 560)
	put " YOUR Turn"
	delay (1)
	FightGUI
	Turn += 1
	Futton
	delay (1700)
	cls
	Draw.FillBox (0, 550, maxx, 570, 0)
	FightGUI
	ScreenSet
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put "Pet's Turn.. if any"
	PetFight
	delay (500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
	ClearTop
	put " Opponent's Turn"
	delay (2000)
	EnemyTurn += 1
	if EnemyTurn <= 0 then
	elsif TabBandit = 1 then
	    EnemyChoice := Rand.Int (1, 6)
	elsif TabBandit = 2 then
	    EnemyChoice := Rand.Int (7, 10)
	else
	    EnemyChoice := Rand.Int (5, 8)
	end if
	if EnemyChoice = 1 then
	    BanditCut
	elsif EnemyChoice = 2 then             %% put enemy skill procedures here
	    KnifeStab
	elsif EnemyChoice = 3 then
	    clawwed
	elsif EnemyChoice = 4 then
	    BanditHigh
	elsif EnemyChoice = 5 then
	    MinionCarry
	elsif EnemyChoice = 6 then
	    DoubleKill
	elsif EnemyChoice = 7 then
	    ThroatSlash
	elsif EnemyChoice = 8 then
	    PistolShot
	elsif EnemyChoice = 9 then
	    MinionCarry
	elsif EnemyChoice = 10 then
	    Bite
	end if
	EnemyTurn -= 1
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if

	delay (1500)
	cls
    end loop
    if Teleport = true then
	Exiting := true
    elsif Flee = true then
	put "Fleeing.."
	delay (500)
	Flee := false
    elsif Hp > 0 then
	Exper := EnemyExperience
	Experience += Exper
	EMon := EnemyMoney
	Money += EMon
    else
	Failed
    end if
    cls
    level
end BanditFight

proc SpecialTraining
    % Code to choose difficulty
    put "Enter a number 1-5 for difficulty"
    get EnemyType
    % change
    EnemyTurn := 0
    if Track = "Soldier" then
    else
	fork playstuffSoldier
	Track := "Soldier"
    end if
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    EnemyThing := ZenoPracticeDummy
    if EnemyType = 1 then
	ZenoPracticeDummyArcher
    elsif EnemyType = 2 then
	ZenoPracticeDummyMelee
    elsif EnemyType = 3 then
	ZenoPracticeDummyGunner
    elsif EnemyType = 4 then
	ZenoPracticeDummyMagic
    elsif EnemyType = 5 then
	ZenoPracticeDummyMixed
    else
    end if
    Turn := 0
    if Pet = 0 then
	nothing
    elsif Pet = 1 then
	Roque
    elsif Pet = 2 then
	Bunion
    elsif Pet = 3 then
	Hairi
    elsif Pet = 4 then
	GhostBunny
    elsif Pet = 5 then
	Dolphi
    elsif Pet = 6 then
	Hushsh
    elsif Pet = 7 then
	Turtle
    elsif Pet = 8 then
	Drigo
    end if
    loop
	MAX
	NICEMAX
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 560)
	put " YOUR Turn"
	delay (1)
	FightGUI
	Turn += 1
	Futton
	delay (1700)
	cls
	FightGUI
	ScreenSet
	if Hp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	else
	end if
	EnemyExperience += 4
	Draw.FillBox (500, 30, 600, 40, 0)
	EnemyHpbar (EnemyHp, EnemyTHp)
	delay (1500)
	if Pet = 0 then
	else
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (10, 560)
	    put "Pet's Turn.. if any"
	    PetFight
	    delay (500)
	    if Hp <= 0 then
		exit
	    elsif EnemyHp <= 0 then
		exit
	    else
	    end if
	end if
	ClearTop
	put " Dummy's Turn"
	delay (2000)
	if EnemyType = 1 then
	    EnemyChoice := Rand.Int (1, 3)
	    EnemyExperience += 3
	    % Archer
	elsif EnemyType = 2 then
	    EnemyChoice := Rand.Int (4, 6)
	    EnemyExperience += 3
	    % Melee
	elsif EnemyType = 3 then
	    EnemyChoice := Rand.Int (7, 9)
	    EnemyExperience += 3
	    % Gunner
	elsif EnemyType = 4 then
	    EnemyChoice := Rand.Int (10, 12)
	    EnemyExperience += 3
	    % Magic
	elsif EnemyType = 5 then
	    EnemyChoice := Rand.Int (1, 14)
	    EnemyExperience += 5
	else
	    EnemyChoice := Rand.Int (3, 10)
	end if
	EnemyTurn := EnemyTurn + 1

	if EnemyTurn <= 0 then
	elsif EnemyChoice = 1 then
	    Hp -= 30
	    put "30 damage."
	elsif EnemyChoice = 2 then             %% put enemy skill procedures here
	    Hp -= 50
	    put "50 damage."
	elsif EnemyChoice = 3 then
	    EnemyHp += 60
	    put "Heals self 60."
	elsif EnemyChoice = 4 then
	    Hp -= 32
	    put "32 damage - slice"
	elsif EnemyChoice = 5 then
	    Hp -= 47
	    put "47 damage - cut"
	elsif EnemyChoice = 6 then
	    Hp -= 27
	    put "27 damage - stab"
	elsif EnemyChoice = 7 then
	    Hp -= 40
	    put "Bullet shot. 40 damage."
	elsif EnemyChoice = 8 then
	    Hp -= 42
	    put "Lung Shot. 42 damage."
	elsif EnemyChoice = 9 then
	    EnemyHp += 70
	    put "Reloading. Heals 70."
	elsif EnemyChoice = 10 then
	    Hp -= 10
	    put "Fizz of vapour. 10 damage."
	elsif EnemyChoice = 11 then
	    Hp -= 50
	    put "Earth toss. 50 damage."
	elsif EnemyChoice = 12 then
	    EnemyHp += 130
	    put "Rejuvinate. 130 healed."
	end if
	EnemyTurn := EnemyTurn - 1
	delay (1500)
	if EnemyHp <= 0 then
	    exit
	elsif Hp <= 0 then
	    cls
	    Failed
	    exit
	elsif Flee = true then
	    exit
	end if
    end loop
    if Teleport = true then
	Exiting := true
    elsif Flee = true then
	put "Fleeing.."
	delay (500)
	Flee := false
    elsif Hp <= 0 then
	Failed
    else
	Congratulations
	Exper := EnemyExperience
	Experience += Exper
	EMon := EnemyMoney
	Money += EMon
	locatexy (10, 560)
	put "Money gained: ", EMon
	put "Experience gained: ", Exper
    end if
    getch (waitkey)
    cls
    level
end SpecialTraining

proc DemoAnimation1
    Level := 3
    EnemyTurn := 0
    Joe_
    Olba_
    loop
	cls
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Pic.Draw (FightingSkill, 0, 0, picXor)
	Pic.Draw (Joe, 20, 110, picXor)
	Pic.Draw (Olba, 500, 140, picXor)
	NPCCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
	EnemyHpbar (EnemyHp, EnemyTHp)
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 550)
	put " Joe's Turn"
	delay (2000)
	NiceChoice := Rand.Int (1, 5)
	if NiceChoice = 1 then
	    Attacked := NiceDamage
	    EnemyHp -= Attacked
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put " Hyaa!! Damage Dealt: ", Attacked
	elsif NiceChoice = 2 then
	    Attacked := JoeDefense + NiceIntelligence
	    EnemyHp := EnemyHp - Attacked
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put " Hiiyyyaaa!!! ", Attacked
	elsif NiceChoice = 3 then
	    Attacked := 345
	    EnemyHp := EnemyHp - Attacked
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put "345.. you say "
	elsif NiceChoice = 4 then
	    Attacked := 999 * Level
	    EnemyHp := EnemyHp - Attacked
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put " Fallengin, crush my foe! Damage Dealt: ", Attacked
	elsif NiceChoice = 5 then
	    Attacked := NiceTHp * 0.7
	    NiceHp := NiceHp + Attacked
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put " That was nice, healed myself!  (", Attacked, ")"
	elsif NiceChoice = 6 then
	    EnemyHp := 1
	    Draw.FillBox (0, 550, maxx, 570, 0)
	    locatexy (0, 560)
	    put "DIE!"
	end if
	if NiceHp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	else
	end if
	Draw.FillBox (500, 30, 600, 40, 0)
	EnemyHpbar (EnemyHp, EnemyTHp)
	delay (1500)
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 550)
	put " Olba's turn"
	delay (2000)
	EnemyChoice := Rand.Int (1, 5)
	EnemyTurn += 1
	if EnemyTurn <= 0 then
	elsif EnemyChoice = 1 then
	    Attacked := EnemyDamage + EnemySpeed - NiceSpeed - NiceIntelligence
	    NiceHp -= Attacked
	    put "Curses! Damage Dealt: ", Attacked
	elsif EnemyChoice = 2 then
	    Attacked := EnemyDamage * 1.5 / 100 * Rand.Int (70, 88)
	    NiceHp -= Attacked
	    put "I will fight, for the glory of Gobalan! Damage Dealt: ", Attacked
	elsif EnemyChoice = 3 then
	    Attacked := EnemyDamage * 0.5 + Rand.Int (50, 70)
	    NiceHp := NiceHp - Attacked
	    put "Neeeeaaaaaaiiiihhh! Damage Dealt: ", Attacked
	elsif EnemyChoice = 4 then
	    Attacked := EnemyDamage * 1.3
	    NiceHp := NiceHp - Attacked
	    put "Whorls; of hair! Damage Dealt: ", Attacked
	elsif EnemyChoice = 5 then
	    Attacked := EnemyDamage * 3
	    NiceHp := NiceHp - Attacked
	    put "Soit - Sut - Sain! 3 slices doing: ", Attacked
	end if
	delay (1500)
	if NiceHp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	end if
	cls
    end loop
    delay (1500)
end DemoAnimation1

proc DemoAnimation2
    var DemoChoice : int
    EnemyTurn := 0
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    Level := 11
    if Level >= 10 then
	EnemyType := Rand.Int (1, 5)
    elsif Level >= 5 then
	EnemyType := Rand.Int (1, 4)
    elsif Level >= 1 then
	EnemyType := Rand.Int (1, 3)
    end if
    Hp := 18241
    THp := Hp
    Mana := 1744
    TMana := Mana
    Damage := 5702
    Intelligence := 1250
    Speed := 520
    Skill_Level_SideCut := 2
    Skill_Level_AimedArrow := 5
    Skill_Level_BloodShot := 5
    Skill_Level_Mana_Shot := 2
    Skill_Level_SpeedSlice := 3
    Skill_Level_Shot_s := 5
    Skill_Level_DoubleSlash := 1
    Skill_Level_RaisedCurve := 1
    Skill_Level_StarShot := 1
    Skill_Level_WindLash := 4
    Skill_Level_BurningMetal := 1
    Skill_Level_Regen := 3
    Skill_Level_QuadShot := 5
    Skill_Level_ZenosSword := 1
    Skill_Level_WhiteTundra := 1
    Skill_Level_Taggerung := 5
    Skill_Level_JetStream := 3
    Skill_Level_Eve := 1
    Skill_Level_HeartEndo := 1
    Skill_Level_OppedShield := 1
    Skill_Level_Shadow := 1
    Skill_Level_Sniper := 5
    Skill_Level_StingingBow := 5
    Skill_Level_SuperScription := 4
    Skill_Level_TunshShot := 3
    if EnemyType = 1 then
	HighwayBandit
	EnemyThing := HighwayBandit_
	Pic.Draw (HighwayBandit_, 500, 100, picCopy)
    elsif EnemyType = 2 then
	Rogue
	EnemyThing := Rogue_
	Pic.Draw (Rogue_, 500, 100, picCopy)
    elsif EnemyType = 3 then
	Robber
	EnemyThing := Robber_
	Pic.Draw (Robber_, 500, 100, picCopy)
    elsif EnemyType = 4 then
	Cadet
	EnemyThing := Cadet_
	Pic.Draw (Cadet_, 500, 100, picCopy)
    elsif EnemyType = 5 then
	GBSoldier
	EnemyThing := GBSoldier_
	Pic.Draw (GBSoldier_, 500, 100, picCopy)
    end if
    Turn := 0
    GhostBunny
    Character := Gunner
    loop
	MAX
	NICEMAX
	Draw.FillBox (0, 550, maxx, 570, 0)
	locatexy (10, 560)
	put " C"
	delay (1)
	FightGUI
	Turn += 1
	DemoChoice := Rand.Int (1, 15)
	if Mana < 50 then
	    Regen
	elsif DemoChoice = 1 then
	    SideCut
	elsif DemoChoice = 2 then
	    Shot_s
	elsif DemoChoice = 3 then
	    Mana_Shot
	elsif DemoChoice = 4 then
	    AimedArrow
	elsif DemoChoice = 5 then
	    BloodShot
	elsif DemoChoice = 6 then
	    SpeedSlice
	elsif DemoChoice = 7 then
	    BurningMetal
	elsif DemoChoice = 8 then
	    Regen
	elsif DemoChoice = 9 then
	    StarShot
	elsif DemoChoice = 10 then
	    RaisedCurve
	elsif DemoChoice = 11 then
	    Taggerung
	elsif DemoChoice = 12 then
	    WindLash
	elsif DemoChoice = 13 then
	    QuadShot_
	elsif DemoChoice = 14 then
	    SuperScription_
	else
	    TunshShot_
	end if
	delay (1700)
	cls
	Draw.FillBox (0, 550, maxx, 570, 0)
	FightGUI
	ScreenSet
	if Hp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	else
	end if
	ClearTop
	put "Ghost's turn.."
	PetFight
	delay (500)
	if Hp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	else
	end if
	ClearTop
	put " Opponent's Turn"
	delay (2000)
	EnemyChoice := Rand.Int (1, 6)
	EnemyTurn += 1
	if EnemyTurn <= 0 then
	elsif EnemyChoice = 1 then
	    Bite
	    EnemyTurn -= 1
	elsif EnemyChoice = 2 then
	    clawwed
	    EnemyTurn -= 1
	elsif EnemyChoice = 3 then
	    EHeal
	    EnemyTurn -= 1
	elsif EnemyChoice = 4 then
	    WhorlsofHair
	    EnemyTurn -= 1
	elsif EnemyChoice = 5 then
	    KnifeStab
	    EnemyTurn -= 1
	elsif EnemyChoice = 6 then
	    RedBurst
	    EnemyTurn -= 1
	end if
	delay (1500)
	if Hp <= 0 then
	    exit
	elsif EnemyHp <= 0 then
	    exit
	end if
	cls
    end loop
    delay (1500)
end DemoAnimation2
