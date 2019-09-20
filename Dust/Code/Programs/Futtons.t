%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:  Johnson  Lai
%Date: November 25, 2013
%Course:  ICS3CU1
%Teacher: Mr.Holik
%Program Name: Turing
%Descriptions:  Futtons - Buttons that are widely used
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proc ScreenSet
    Pic.Draw (FightingSkill, 0, 0, picXor)
    Pic.Draw (Side_Cut, 306, 492, picCopy)
    Pic.Draw (Shots, 343, 492, picCopy)
    Pic.Draw (ManaShot, 380, 492, picCopy)
    Pic.Draw (Double_Slash, 417, 492, picCopy)
    Pic.Draw (Bow, 454, 492, picCopy)
    Pic.Draw (Blood_Shot, 491, 492, picCopy)
    Pic.Draw (Speed_Slice, 528, 492, picCopy)
    Pic.Draw (Regen_, 565, 492, picCopy)
    Pic.Draw (Star_Shot, 602, 492, picCopy)
    Pic.Draw (Raised_Curve, 639, 492, picCopy)
    Pic.Draw (Taggerung_, 676, 492, picCopy)
    Pic.Draw (Wind_Lash, 713, 492, picCopy)
    Pic.Draw (Burning_Metal, 306, 455, picCopy)
    Pic.Draw (White_Tundra, 343, 455, picCopy)
    Pic.Draw (Sniper, 380, 455, picCopy)
    Pic.Draw (TunshShot, 417, 455, picCopy)
    Pic.Draw (StingingBow, 454, 455, picCopy)
    Pic.Draw (HeartEndo, 491, 455, picCopy)
    Pic.Draw (QuadShot, 528, 455, picCopy)
    Pic.Draw (OppedShield, 565, 455, picCopy)
    Pic.Draw (Shadow, 602, 455, picCopy)
    Pic.Draw (SuperScription, 639, 455, picCopy)
    Pic.Draw (Zenos_Sword, 676, 455, picCopy)
    Pic.Draw (Jet_Stream, 713, 455, picCopy)
    Pic.Draw (Eve, 269, 492, picCopy)
end ScreenSet

proc TutorialX
    ScreenSet
    locatexy (0, 550)
    colour (11)
    if Tutorial = 1 then
	if Style = "Magic" then
	    put "Joe: Use Burning Metal"
	elsif Mana < 44 then
	    put "Joe: Regen Mana or Side-Cut!"
	elsif Style = "Melee" then
	    put "Joe: Use Raised Curve"
	elsif Style = "Gunner" then
	    put "Joe: Try Blood Shot"
	elsif Style = "Ranged" then
	    put "Joe: Use Shots"
	end if
    elsif Tutorial = 2 then
	if Style = "Magic" then
	    put "Joe: Regen Mana!"
	elsif Style = "Melee" and Mana < 53 then
	    put "Joe: Use Double Slash"
	elsif Style = "Melee" then
	    put "Joe: Use Regen Mana"
	elsif Style = "Gunner" then
	    put "Joe: I recommend Speed Slice"
	elsif Style = "Ranged" then
	    put "Joe: Speed Slice would be nice"
	end if
    else
	if Style = "Magic" then
	    put "Joe: Use Mana Shot"
	elsif Style = "Melee" then
	    put "Joe: Use Side Cut"
	elsif Style = "Gunner" then
	    put "Joe: Try Shots"
	elsif Style = "Ranged" then
	    put "Joe: Go for Aimed Arrow"
	end if
    end if
end TutorialX

proc Preset
    Draw.FillBox (0, 550, maxx, 570, 0)
    locatexy (10, 560)
end Preset

proc Futton
    var Flicker : boolean := true
    Boole := true
    Hoole := true
    var Coward : int
    if GG = false then
	ScreenSet
    else
	TutorialX
    end if
    colour (54)
    loop
	if Flicker = true then
	    Preset
	end if
	mousewhere (rangeX, rangeY, button)
	if Turn <= 0 then
	    exit
	elsif rangeX > 1 and rangeX < 38 and rangeY >= 492 and rangeY <= 527 then
	    Draw.Box (2, 492, 37, 526, red)
	    if Flicker = true then
		put "Flee - Flee the scene, lose experience and money"
		Flicker := false
	    end if
	    if GG = true then
		put "Cannot flee from here."
		delay (1000)
	    else
		if button = 1 then
		    put "Are you sure you want to FLEE? [1]..yes [2]No!"
		    get Coward
		    if Coward = 1 then
			Flee := true
			Money -= 3 * Level
			Experience -= 10 * Level
			put "Fleeing.."
			delay (500)
			exit
		    else
			put "Not fleeing"
		    end if
		end if
	    end if
	    Boole := true
	    Hoole := true
	elsif rangeX > 1 and rangeX < 38 and rangeY >= 455 and rangeY <= 489 then
	    Draw.Box (2, 455, 37, 489, 38)
	    if Flicker = true then
		put "Hp + - Heal 60% Hp, Level x 18 = cost of gold"
		Flicker := false
	    end if
	    if button = 1 then
		Money -= 20
		if Money < 0 then
		    put "No money left."
		    Money += 20
		    delay (400)
		else
		    Hp += round (THp * 0.6)
		    put "Money remaining: ", Money, " - Healed around ", round (THp * 0.6), " Hp"
		    delay (600)
		    exit
		end if
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 269 and rangeX <= 304) and (rangeY >= 492 and rangeY <= 527) then
	    Draw.Box (269, 492, 304, 526, 48)
	    if Flicker = true then
		put "Eve - Leachs - Cost 132"
		Flicker := false
	    end if
	    Boole := true
	    Hoole := true
	    if button = 1 then
		Eve_
		exit
	    end if
	elsif (rangeX >= 306 and rangeX <= 341) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (306, 492, 341, 526, 37)
	    if Flicker = true then
		put "Side Cut - Regens 16 mana x Level"
		Flicker := false
	    end if
	    if button = 1 then
		SideCut
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (343, 492, 378, 526, 37)
	    if Flicker = true then
		put "Shots - Regens 13 mana x Level"
		Flicker := false
	    end if
	    if button = 1 then
		Shot_s
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (380, 492, 415, 526, 37)
	    if Flicker = true then
		put "Mana Shot - Cost 37 mana"
		Flicker := false
	    end if
	    if button = 1 then
		Mana_Shot
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (417, 492, 452, 526, 37)
	    if Flicker = true then
		put "Double Slash - Cost 54 mana"
		Flicker := false
	    end if
	    if button = 1 then
		DoubleSlash
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (454, 492, 489, 526, 37)
	    if Flicker = true then
		put "Aimed Arrow - Cost 20 mana"
		Flicker := false
	    end if
	    if button = 1 then
		AimedArrow
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (491, 492, 526, 526, 37)
	    if Flicker = true then
		put "Blood Shot - Cost 21 mana"
		Flicker := false
	    end if
	    if button = 1 then
		BloodShot
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (528, 492, 563, 526, 37)
	    if Flicker = true then
		put "Speed Slice - Cost 28 Mana"
		Flicker := false
	    end if
	    if button = 1 then
		SpeedSlice
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (565, 492, 600, 526, 37)
	    if Flicker = true then
		put "Regen Mana - Recovers - Cost 25 mana"
		Flicker := false
	    end if
	    if button = 1 then
		Regen
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (602, 492, 637, 526, 37)
	    if Flicker = true then
		put "Star Shot - Cost 100 mana"
		Flicker := false
	    end if
	    if button = 1 then
		StarShot
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (639, 492, 674, 526, 37)
	    if Flicker = true then
		put "Raised Curve - Cost 44 mana"
		Flicker := false
	    end if
	    if button = 1 then
		RaisedCurve
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (676, 492, 711, 526, 37)
	    if Flicker = true then
		put "Taggerung - Summons - Cost 210 mana"
		Flicker := false
	    end if
	    if button = 1 then
		Taggerung
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 492 and rangeY <= 526) then
	    Draw.Box (713, 492, 748, 526, 37)
	    if Flicker = true then
		put "Wind Lash - Heals - Cost 38 mana"
		Flicker := false
	    end if
	    if button = 1 then
		WindLash
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 306 and rangeX <= 341) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (306, 455, 341, 489, 37)
	    if Flicker = true then
		put "Burning Metal - Cost 59 mana"
		Flicker := false
	    end if
	    if button = 1 then
		BurningMetal
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 343 and rangeX <= 378) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (343, 455, 378, 489, 37)
	    if Flicker = true then
		put "White Tundra - Freezes - Cost 160 mana"
		Flicker := false
	    end if
	    if button = 1 then
		WhiteTundra
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 380 and rangeX <= 415) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (380, 455, 415, 489, 37)
	    if Flicker = true then
		put "Sniper - Cost 48 mana"
		Flicker := false
	    end if
	    if button = 1 then
		Sniper_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 417 and rangeX <= 452) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (417, 455, 452, 489, 37)
	    if Flicker = true then
		put "Tunsh Shot - Cost 51 mana"
		Flicker := false
	    end if
	    if button = 1 then
		TunshShot_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 454 and rangeX <= 489) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (454, 455, 489, 489, 37)
	    if Flicker = true then
		put "Stinging Bow - Cost 88 mana"
		Flicker := false
	    end if
	    if button = 1 then
		StingingBow_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 491 and rangeX <= 526) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (491, 455, 526, 489, 37)
	    if Flicker = true then
		put "Heart Endo - Cost 77 mana"
		Flicker := false
	    end if
	    if button = 1 then
		HeartEndo_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 528 and rangeX <= 563) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (528, 455, 563, 489, 37)
	    if Flicker = true then
		put "Quad Shot - Cost 26 mana per hit"
		Flicker := false
	    end if
	    if button = 1 then
		QuadShot_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 565 and rangeX <= 600) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (565, 455, 600, 489, 37)
	    if Flicker = true then
		put "Opped Shield - Defensive - Cost 130 mana"
		Flicker := false
	    end if
	    if button = 1 then
		OppedShield_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 602 and rangeX <= 637) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (602, 455, 637, 489, 37)
	    if Flicker = true then
		put "Shadow - Recovery - Cost 181 mana"
		Flicker := false
	    end if
	    if button = 1 then
		Shadow_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 639 and rangeX <= 674) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (639, 455, 674, 489, 48)
	    if Flicker = true then
		put "Super Scription - Stuns - Cost 140 mana"
		Flicker := false
	    end if
	    if button = 1 then
		SuperScription_
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 676 and rangeX <= 711) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (676, 455, 711, 489, 48)
	    if Flicker = true then
		put "Zeno's Sword - Leachs - Cost 245 mana"
		Flicker := false
	    end if
	    if button = 1 then
		ZenosSword
		exit
	    end if
	    Boole := true
	    Hoole := true
	elsif (rangeX >= 713 and rangeX <= 748) and (rangeY >= 455 and rangeY <= 489) then
	    Draw.Box (713, 455, 748, 489, 48)
	    if Flicker = true then
		put "Jet Stream - Insanity - Cost 300 mana"
		Flicker := false
	    end if
	    if button = 1 then
		JetStream
		exit
	    end if
	    Boole := true
	    Hoole := true
	else
	end if
	if Boole = true and Hoole = false then
	    Draw.Box (269, 492, 304, 526, 39)
	    Draw.Box (306, 492, 341, 526, 51)
	    Draw.Box (343, 492, 378, 526, 51)
	    Draw.Box (380, 492, 415, 526, 51)
	    Draw.Box (417, 492, 452, 526, 51)
	    Draw.Box (454, 492, 489, 526, 51)
	    Draw.Box (491, 492, 526, 526, 51)
	    Draw.Box (528, 492, 563, 526, 51)
	    Draw.Box (306, 455, 341, 489, 51)
	    Draw.Box (565, 492, 600, 526, 51)
	    Draw.Box (602, 492, 637, 526, 51)
	    Draw.Box (639, 492, 674, 526, 51)
	    Draw.Box (676, 492, 711, 526, 51)
	    Draw.Box (713, 492, 748, 526, 51)
	    Draw.Box (343, 455, 378, 489, 51)
	    Draw.Box (380, 455, 415, 489, 51)
	    Draw.Box (417, 455, 452, 489, 51)
	    Draw.Box (454, 455, 489, 489, 51)
	    Draw.Box (491, 455, 526, 489, 51)
	    Draw.Box (528, 455, 563, 489, 51)
	    Draw.Box (565, 455, 600, 489, 51)
	    Draw.Box (602, 455, 637, 489, 51)
	    Draw.Box (2, 492, 37, 526, 51)
	    Draw.Box (2, 455, 37, 489, 51)
	    Draw.Box (639, 455, 674, 489, 34)
	    Draw.Box (676, 455, 711, 489, 34)
	    Draw.Box (713, 455, 748, 489, 34)
	    Boole := false
	    Flicker := true
	else
	end if
	Hoole := false
    end loop
end Futton
