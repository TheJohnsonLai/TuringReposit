% Fighting GUI
% Hp bars, Mana bars, updated stats

proc MAX
    if Hp > THp then
	Hp := THp
    end if
    if Mana > TMana then
	Mana := TMana
    end if
end MAX

proc NICEMAX
    if NiceHp > NiceTHp then
	NiceHp := NiceTHp
    end if
    if NiceMana > NiceTMana then
	NiceMana := NiceTMana
    end if
end NICEMAX

proc EnemyHpbar (EnemyHp, EnemyTHp : real)
    derpy := EnemyHp * 100 div EnemyTHp + 500
    Draw.FillBox (500, 30, derpy, 40, 12)
    Draw.Line (500, 29, 600, 29, 57)
    Draw.Line (500, 41, 600, 41, 57)
    Draw.Line (500, 29, 500, 41, 57)
    Draw.Line (600, 29, 600, 41, 57)
    locatexy (505, 60)
    put "Health :", EnemyHp, " / ", EnemyTHp
end EnemyHpbar

proc Manabar (Mana, TMana : real)
    Draw.FillBox (50, 16, 150, 22, 0)
    Mbar := Mana * 100 div TMana + 50
    Draw.FillBox (50, 16, Mbar, 22, 53)
    Draw.Line (50, 15, 150, 15, 9)
    Draw.Line (50, 23, 150, 23, 9)
    Draw.Line (50, 15, 50, 23, 9)
    Draw.Line (150, 15, 150, 23, 9)
    locatexy (170, 20)
    put "Mp: ", Mana, " / ", TMana
end Manabar

proc NiceManabar (NiceMana, NiceTMana : real)
    Draw.FillBox (50, 63, 150, 69, 0)
    Mbar := NiceMana * 100 div NiceTMana + 50
    Draw.FillBox (50, 63, Mbar, 69, 53)
    Draw.Line (50, 62, 150, 62, 16)
    Draw.Line (50, 70, 150, 70, 16)
    Draw.Line (50, 62, 50, 70, 16)
    Draw.Line (150, 62, 150, 70, 16)
    locatexy (170, 65)
    put "Mp: ", NiceMana, " / ", NiceTMana
end NiceManabar

proc Hpbar (Hp, THp : real)
    Draw.FillBox (50, 30, 150, 40, 0)
    MAX
    edge := Hp * 100 div THp + 50
    Draw.FillBox (50, 30, edge, 40, 13)
    Draw.Line (50, 29, 150, 29, 16)
    Draw.Line (50, 41, 150, 41, 16)
    Draw.Line (50, 29, 50, 41, 16)
    Draw.Line (150, 29, 150, 41, 16)
    locatexy (170, 40)
    put "Hp: ", Hp, " / ", THp
end Hpbar

proc NiceHpbar (NiceHp, NiceTHp : real)
    var Flung : int
    Draw.FillBox (50, 77, 150, 87, 0)
    NICEMAX
    Flung := NiceHp * 100 div NiceTHp + 50
    Draw.FillBox (50, 77, Flung, 87, 48)
    Draw.Line (50, 76, 150, 76, 16)
    Draw.Line (50, 88, 150, 88, 16)
    Draw.Line (50, 76, 50, 88, 16)
    Draw.Line (150, 76, 150, 88, 16)
    locatexy (170, 60)
    put "Hp: ", NiceHp, " / ", NiceTHp
end NiceHpbar

proc NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana : real)
    var Flung : int
    Draw.FillBox (50, 77, 150, 87, 0)
    NICEMAX
    if Pet not= 0 then
	Flung := NiceHp * 100 div NiceTHp + 50
	Mbar := NiceMana * 100 div NiceTMana + 50
	Draw.FillBox (50, 77, Flung, 87, 48)
	Draw.Line (50, 76, 150, 76, 16)
	Draw.Line (50, 88, 150, 88, 16)
	Draw.Line (50, 76, 50, 88, 16)
	Draw.Line (150, 76, 150, 88, 16)
	Draw.FillBox (50, 63, 150, 69, 0)
	Draw.FillBox (50, 63, Mbar, 69, 53)
	Draw.Line (50, 62, 150, 62, 16)
	Draw.Line (50, 70, 150, 70, 16)
	Draw.Line (50, 62, 50, 70, 16)
	Draw.Line (150, 62, 150, 70, 16)
	locatexy (170, 65)
	put "Mp: ", NiceMana, " / ", NiceTMana
	locatexy (170, 85)
	put "Hp: ", NiceHp, " / ", NiceTHp
    else
	Flung := 50
	Mbar := 50
    end if
end NiceCombo

proc NPCCombo (NiceHp, NiceTHp, NiceMana, NiceTMana : real)
    var Flung : int
    Draw.FillBox (50, 77, 150, 87, 0)
    NICEMAX
    Flung := NiceHp * 100 div NiceTHp + 50
    Mbar := NiceMana * 100 div NiceTMana + 50
    Draw.FillBox (50, 77, Flung, 87, 48)
    Draw.Line (50, 76, 150, 76, 16)
    Draw.Line (50, 88, 150, 88, 16)
    Draw.Line (50, 76, 50, 88, 16)
    Draw.Line (150, 76, 150, 88, 16)
    Draw.FillBox (50, 63, 150, 69, 0)
    Draw.FillBox (50, 63, Mbar, 69, 53)
    Draw.Line (50, 62, 150, 62, 16)
    Draw.Line (50, 70, 150, 70, 16)
    Draw.Line (50, 62, 50, 70, 16)
    Draw.Line (150, 62, 150, 70, 16)
    locatexy (170, 65)
    put "Mp: ", NiceMana, " / ", NiceTMana
    locatexy (170, 85)
    put "Hp: ", NiceHp, " / ", NiceTHp
end NPCCombo

proc JoeHpbar (JoeHp, JoeTHp : real)
    Joy := JoeHp * 100 div JoeTHp + 50
    Draw.FillBox (50, 50, Joy, 60, 52)
    Draw.Line (50, 49, 150, 49, 55)
    Draw.Line (50, 61, 150, 61, 55)
    Draw.Line (50, 49, 50, 61, 55)
    Draw.Line (150, 49, 150, 61, 55)
    locatexy (170, 57)
    put "", JoeHp, " / ", JoeTHp
end JoeHpbar

proc Moral
    M := EnemyMoral * 100 div EnemyTotalMoral + 100
    Draw.FillBox (100, 50, M, 60, 52)
    Draw.Line (100, 49, 200, 49, 55)
    Draw.Line (100, 61, 200, 61, 55)
    Draw.Line (100, 49, 100, 61, 55)
    Draw.Line (200, 49, 200, 61, 55)
end Moral

proc FightGUI
    Pic.Draw (Character, 20, 100, picXor)
    Pic.Draw (EnemyThing, 500, 100, picCopy)
    Pic.Draw (FightingPet, 150, 150, picXor)
    colour (38)
    Hpbar (Hp, THp)
    colour (54)
    Manabar (Mana, TMana)
    colour (48)
    NiceCombo (NiceHp, NiceTHp, NiceMana, NiceTMana)
    colour (16)
    EnemyHpbar (EnemyHp, EnemyTHp)
end FightGUI
