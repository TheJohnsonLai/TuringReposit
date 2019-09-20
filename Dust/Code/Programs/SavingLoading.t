%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:  Johnson  Lai
%Date: November 25, 2013
%Course:  ICS3CU1
%Teacher: Mr.Holik
%Program Name: Turing
%Descriptions:  Saving/Loading - Saving and Loading lines of code {Procedures}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ******************************** Save Game Methods [Conventional / Futtons / Sub-Par]

proc Matiehano (SubPar : int)
    if LSC (SubPar) = "Magic" then
	Pic.Draw (SLMage, 40, PicturePlacement (SubPar), picCopy)
    elsif LSC (SubPar) = "Gunner" then
	Pic.Draw (SLGunner, 40, PicturePlacement (SubPar), picCopy)
    elsif LSC (SubPar) = "Melee" then
	Pic.Draw (SLMelee, 40, PicturePlacement (SubPar), picCopy)
    elsif LSC (SubPar) = "Ranged" then
	Pic.Draw (SLRanged, 40, PicturePlacement (SubPar), picCopy)
    end if
end Matiehano

proc SaveGame
    Call := 1
    cls
    Exiting := false
    Hoole := false
    Boole := false
    for i : 1 .. 4
	open : Lstream (i), LSN (i), read
	read : Lstream (i), name
	read : Lstream (i), LSL (i)
	read : Lstream (i), LSM (i)
	read : Lstream (i), LSS (i)
	read : Lstream (i), LSC (i)
	close : Lstream (i)
    end for
    Incry := -5
    Pic.Draw (SaveGamePic, 0, 0, picCopy)
    for i : 1 .. 2
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Incry += 100
    end for
    Incry += 50
    for i : 3 .. 4
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Incry += 107
    end for
    loop
	mousewhere (rangeX, rangeY, button)
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (4)
		if LSC (4) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 then
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (3)
		if LSC (3) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 then
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (2)
		if LSC (2) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 then
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (1)
		if LSC (1) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 23 then
	    Draw.Box (643, 6, 709, 33, 0)
	    Boole := true
	    if button = 1 then
		Exiting := true
		exit
	    end if
	end if
	if Boole = false then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 54)
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 54)
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 54)
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 54)
	    Draw.Box (643, 6, 709, 33, 38)
	end if
	Boole := false
    end loop
    loop
	if Exiting = true then
	    Exiting := false
	    exit
	end if
	if File.Exists (FileDir) then
	    put "File will be overwritten. Are you sure?"
	    put "[1] Yes, overwrite. [2] No, cancel save."
	    get answer
	    if answer = 1 then
		Call := 1
	    else
		exit
	    end if
	end if
	open : stream, FileDir, write
	write : stream, name
	write : stream, Level
	write : stream, Money
	write : stream, Storyline
	write : stream, Style
	write : stream, Hp
	write : stream, THp
	write : stream, Mana
	write : stream, TMana
	write : stream, ManaRegen
	write : stream, Damage
	write : stream, Speed
	write : stream, Character
	write : stream, Skill_Level_SideCut
	write : stream, Intelligence
	write : stream, Skill_Level_AimedArrow
	write : stream, Skill_Level_BloodShot
	write : stream, Skill_Level_Mana_Shot
	write : stream, Skill_Level_SpeedSlice
	write : stream, Skill_Level_Shot_s
	write : stream, Skill_Level_DoubleSlash
	write : stream, Skill_Level_RaisedCurve
	write : stream, Skill_Level_StarShot
	write : stream, Skill_Level_WindLash
	write : stream, Skill_Level_BurningMetal
	write : stream, Skill_Level_Regen
	write : stream, Skill_Level_ZenosSword
	write : stream, Skill_Level_WhiteTundra
	write : stream, Skill_Level_Taggerung
	write : stream, Skill_Level_JetStream
	write : stream, Experience
	write : stream, Pet
	write : stream, FightingPet
	write : stream, Mission
	for LA : 1 .. 15
	    write : stream, LevelArray (LA)
	end for
	for PA : 1 .. 8
	    write : stream, PetArray (PA)
	end for
	write : stream, CreileFight
	write : stream, CSA1
	write : stream, CSA2
	write : stream, CSA3
	write : stream, CSA4
	write : stream, PreviousSpeed
	write : stream, AddedSpeed
	write : stream, PreviousDamage
	write : stream, AddedDamage
	write : stream, PreviousIntelligence
	write : stream, AddedIntelligence
	write : stream, PreviousHp
	write : stream, AddedHp
	write : stream, Added
	close : stream
	put "File successfully saved."
	delay (500)
	exit
    end loop
    cls
end SaveGame
proc SaveGame2
    Extension := ".txt"
    FileDir := "data/"
    FileName := name
    FileName += Extension
    FileDir += FileName
    if File.Exists ("data/" + FileName) then
	File.Delete ("data/" + FileName)
    end if
    open : stream, FileDir, write
    write : stream, name
    write : stream, Level
    write : stream, Money
    write : stream, Storyline
    write : stream, Style
    write : stream, Hp
    write : stream, THp
    write : stream, Mana
    write : stream, TMana
    write : stream, ManaRegen
    write : stream, Damage
    write : stream, Speed
    write : stream, Character
    write : stream, Skill_Level_SideCut
    write : stream, Intelligence
    write : stream, Skill_Level_AimedArrow
    write : stream, Skill_Level_BloodShot
    write : stream, Skill_Level_Mana_Shot
    write : stream, Skill_Level_SpeedSlice
    write : stream, Skill_Level_Shot_s
    write : stream, Skill_Level_DoubleSlash
    write : stream, Skill_Level_RaisedCurve
    write : stream, Skill_Level_StarShot
    write : stream, Skill_Level_WindLash
    write : stream, Skill_Level_BurningMetal
    write : stream, Skill_Level_Regen
    write : stream, Skill_Level_ZenosSword
    write : stream, Skill_Level_WhiteTundra
    write : stream, Skill_Level_Taggerung
    write : stream, Skill_Level_JetStream
    write : stream, Experience
    write : stream, Pet
    write : stream, FightingPet
    write : stream, Mission
    for LA : 1 .. 15
	write : stream, LevelArray (LA)
    end for
    for PA : 1 .. 8
	write : stream, PetArray (PA)
    end for
    write : stream, CreileFight
    write : stream, CSA1
    write : stream, CSA2
    write : stream, CSA3
    write : stream, CSA4
    write : stream, PreviousSpeed
    write : stream, AddedSpeed
    write : stream, PreviousDamage
    write : stream, AddedDamage
    write : stream, PreviousIntelligence
    write : stream, AddedIntelligence
    write : stream, PreviousHp
    write : stream, AddedHp
    write : stream, Added
    close : stream

    put "Game saved as: ", FileName
    delay (1500)
end SaveGame2

proc SaveGame3
    Call := 1
    cls
    Exiting := false
    Hoole := false
    Boole := false
    for i : 1 .. 4
	open : Lstream (i), LSN (i), get
	get : Lstream (i), name
	get : Lstream (i), LSL (i)
	get : Lstream (i), LSM (i)
	get : Lstream (i), LSS (i)
	get : Lstream (i), LSC (i)
	close : Lstream (i)
    end for
    Incry := -5
    Pic.Draw (SaveGamePic, 0, 0, picCopy)
    for i : 1 .. 2
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Matiehano (i)
	Incry += 100
    end for
    Incry += 50
    for i : 3 .. 4
	Font.Draw ("Level: " + intstr (LSL (i)), 350, 465 - Incry, intfont1, 0)
	Font.Draw ("Money: " + intstr (LSM (i)), 350, 440 - Incry, intfont1, 42)
	Font.Draw ("Storyline: " + realstr (LSS (i), 4), 350, 415 - Incry, intfont1, 38)
	Font.Draw ("Class: " + (LSC (i)), 300, 490 - Incry, intfont1, 54)
	Matiehano (i)
	Incry += 107
    end for
    loop
	mousewhere (rangeX, rangeY, button)
	if rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY and rangeY <= SlotY + 100 then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (4)
		if LSC (4) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= SlotY + 111 and rangeY <= SlotY + 211 then
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (3)
		if LSC (3) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 310 and rangeY <= 410 then
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (2)
		if LSC (2) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= SlotX and rangeX <= SlotX + 250 and rangeY >= 420 and rangeY <= 520 then
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 48)
	    Boole := true
	    if button = 1 then
		FileDir := LSN (1)
		if LSC (1) not= "" then
		    Call := 2
		end if
		exit
	    end if
	elsif rangeX >= 643 and rangeX <= 711 and rangeY >= 6 and rangeY <= 33 then
	    Draw.Box (643, 6, 709, 33, 0)
	    Boole := true
	    if button = 1 then
		Exiting := true
		exit
	    end if
	end if
	if Boole = false then
	    Draw.Box (SlotX, SlotY - 1, SlotX + 250, SlotY + 99, 54)
	    Draw.Box (SlotX, SlotY + 110, SlotX + 250, SlotY + 210, 54)
	    Draw.Box (SlotX, 310, SlotX + 250, 410, 54)
	    Draw.Box (SlotX, 420, SlotX + 250, 520, 54)
	    Draw.Box (643, 6, 709, 33, 38)
	end if
	Boole := false
    end loop
    loop
	if Exiting = true then
	    Exiting := false
	    exit
	end if
	if File.Exists (FileDir) then
	    put "File will be overwritten. Are you sure?"
	    put "[1] Yes, overwrite. [2] No, cancel save."
	    get answer
	    if answer = 1 then
		Call := 1
	    else
		exit
	    end if
	end if
	open : stream, FileDir, put
	put : stream, name
	put : stream, Level
	put : stream, Money
	put : stream, Storyline
	put : stream, Style
	put : stream, Hp
	put : stream, THp
	put : stream, Mana
	put : stream, TMana
	put : stream, ManaRegen
	put : stream, Damage
	put : stream, Speed
	put : stream, Character
	put : stream, Skill_Level_SideCut
	put : stream, Intelligence
	put : stream, Skill_Level_AimedArrow
	put : stream, Skill_Level_BloodShot
	put : stream, Skill_Level_Mana_Shot
	put : stream, Skill_Level_SpeedSlice
	put : stream, Skill_Level_Shot_s
	put : stream, Skill_Level_DoubleSlash
	put : stream, Skill_Level_RaisedCurve
	put : stream, Skill_Level_StarShot
	put : stream, Skill_Level_WindLash
	put : stream, Skill_Level_BurningMetal
	put : stream, Skill_Level_Regen
	put : stream, Skill_Level_ZenosSword
	put : stream, Skill_Level_WhiteTundra
	put : stream, Skill_Level_Taggerung
	put : stream, Skill_Level_JetStream
	put : stream, Experience
	put : stream, Pet
	put : stream, FightingPet
	put : stream, Mission
	for LA : 1 .. 15
	    put : stream, LevelArray (LA)
	end for
	for PA : 1 .. 8
	    put : stream, PetArray (PA)
	end for
	put : stream, CreileFight
	put : stream, CSA1
	put : stream, CSA2
	put : stream, CSA3
	put : stream, CSA4
	put : stream, PreviousSpeed
	put : stream, AddedSpeed
	put : stream, PreviousDamage
	put : stream, AddedDamage
	put : stream, PreviousIntelligence
	put : stream, AddedIntelligence
	put : stream, PreviousHp
	put : stream, AddedHp
	put : stream, Added
	put : stream, Skill_Level_Eve
	put : stream, Skill_Level_HeartEndo
	put : stream, Skill_Level_OppedShield
	put : stream, Skill_Level_Shadow
	put : stream, Skill_Level_Sniper
	put : stream, Skill_Level_StingingBow
	put : stream, Skill_Level_SuperScription
	put : stream, Skill_Level_TunshShot
	put : stream, StackHp
	put : stream, StackDamage
	put : stream, StackIntelligence
	for MA : 1 .. 10
	    put : stream, MArray (MA)
	end for
	close : stream
	put "File successfully saved."
	delay (500)
	exit
    end loop
    cls
end SaveGame3
