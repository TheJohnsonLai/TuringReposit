%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:  Johnson  Lai
%Date: November 25, 2013
%Course:  ICS3CU1
%Teacher: Mr.Holik
%Program Name: Turing
%Descriptions:  Introduction - The basic introduction scene in the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc Introduction
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Font.Draw ("The Dust. . .", 280, 300, intfont, 54)
    Font.Draw ("A little intro.. when the window says waiting for input press any key. (getch) Do not spam.", 1, 2, intfont1, 0)
    loading
    cls

    % Game
    Draw.FillBox (0, 0, maxx, maxy, 151)
    Pic.Draw (IP,0,10,picCopy)
    Pic.Draw (Speech, 1, 1, 0)
    Font.Draw ("Doctor: Hey, I think this one's awake! ", 40, 120, intfont1, 16)
    delay (2300)
    Font.Draw ("Nurse: Impossible.. all victims had suffered over 50% body burns. ", 40, 90, intfont1, 16)
    delay (1600)
    Font.Draw ("Doctor: I don't see any burns here.. maybe the blast didn't blow through the wall?", 40, 60, intfont1, 16)
    delay (2200)
    Font.Draw ("Nurse: Hurry up, we don't have time. ", 40, 30, intfont1, 16)
    getch (waitkey)
    cls
    Pic.Draw (IP,0,10,picCopy)
    Pic.Draw (Speech, 1, 1, 0)
    Font.Draw ("Doctor: ..injured victims from Zone 31, Tam-Hutzi. ", 40, 120, intfont1, 16)
    delay (1100)
    Font.Draw ("Radio Operative: Hold tight, the airship's on the way. ", 40, 90, intfont1, 16)
    delay (1900)
    Font.Draw ("Nurse: Over there, Frizul! The airship's arriving.", 40, 60, intfont1, 16)
    delay (700)
    Font.Draw ("Doctor (Frizul): Looks like a Global-5 Airbird.  ", 40, 30, intfont1, 12)
    getch (waitkey)
    cls
    Pic.Draw (IP,0,10,picCopy)
    Pic.Draw (Speech, 1, 1, 0)
    Font.Draw ("Nurse: Impossible, is someone shooting the Airbird? ", 40, 120, intfont1, 16)
    delay (1500)
    Font.Draw ("*Tracers fly across the sky and pierce the Airbird. It explodes mid-air.* ", 40, 90, intfont1, 16)
    delay (500)
    Font.Draw ("*The ground collides with the frame and more hydrogen bursts into flames. *", 40, 60, intfont1, 16)
    delay (500)
    Font.Draw ("*Photonic energy shoots into the rubble, destroying the remains and the survivors.* ", 40, 30, intfont1, 16)
    getch (waitkey)
    cls
    Pic.Draw (IP,0,10,picCopy)
    Pic.Draw (Speech, 1, 1, 0)
    Font.Draw ("Nurse: RUN TO THE HOSPITAL! IT'S THE ONLY NEARBY SAFE SHELTER!", 40, 120, intfont1, 16)
    delay (1500)
    Font.Draw ("Frizul: Gahh.. we have to carry the survivor! I got it.", 40, 90, intfont1, 12)
    delay (2500)
    Font.Draw ("Frizul: Stay alive.. you didn't die from a Tunsh Shot.", 40, 60, intfont1, 12)
    delay (1200)
    Font.Draw ("*Bracck!!* A quad shot flies through the air and kills the pilot of the Global-5 Airbird.", 40, 30, intfont1, 16)
    getch (waitkey)
    cls
    % Main character class
    Draw.FillBox (0, 0, maxx, maxy, 151)       
    Font.Draw ("Hey.", 10, 540, intfont1, 0)
    delay (3000)
    Font.Draw ("*Prodding begins*", 10, 510, intfont1, 0)
    delay (1500)
    Font.Draw ("Huh? Still not awake?", 10, 480, intfont1, 0)
    delay (2500)
    Font.Draw ("Hey, you're moving! I'm Frizul.. you are?", 10, 450, intfont1, 12)
    delay (700)
    Font.Draw ("Don't remember? Why, you must've been our new recruit!", 10, 420, intfont1, 12)
    delay (1700)
    Font.Draw ("Sh sh shsh... you don't know anything. You live here!", 10, 390, intfont1, 12)
    delay (900)
    Font.Draw ("You must be good at something..", 10, 360, intfont1, 12)
    getch (waitkey)
    Pic.Draw (ClassSelect, 0, 0, picCopy)
    Boole := false
    loop
	loop
	    mousewhere (rangeX, rangeY, button)
	    if (rangeX >= 17 and rangeX <= 230) and (rangeY >= 120 and rangeY <= 175) then
		if Boole = false then
		    Draw.Box (17, 120, 230, 175, 12)
		    Boole := true
		end if
		if button = 1 then
		    Style := "Melee"
		    Exiting := true
		    exit
		end if
	    elsif (rangeX >= 400 and rangeX <= 630) and (rangeY >= 120 and rangeY <= 175) then
		if Boole = false then
		    Draw.Box (400, 120, 630, 175, 0)
		    Boole := true
		end if
		if button = 1 then
		    Style := "Ranged"
		    Exiting := true
		    exit
		end if
	    elsif (rangeX >= 17 and rangeX <= 230) and (rangeY >= 40 and rangeY <= 90) then
		if Boole = false then
		    Draw.Box (17, 40, 230, 90, 35)
		    Boole := true
		end if
		if button = 1 then
		    Style := "Gunner"
		    Exiting := true
		    exit
		end if
	    elsif (rangeX >= 400 and rangeX <= 630) and (rangeY >= 40 and rangeY <= 90) then
		if Boole = false then
		    Draw.Box (400, 40, 630, 90, 49)
		    Boole := true
		end if
		if button = 1 then
		    Style := "Magic"
		    Exiting := true
		    exit
		end if
	    elsif Boole = true then
		Draw.Box (17, 120, 230, 175, 176)
		Draw.Box (400, 120, 630, 175, 176)
		Draw.Box (17, 40, 230, 90, 176)
		Draw.Box (400, 40, 630, 90, 176)
		Boole := false
	    else
	    end if
	end loop
	if Exiting = true then
	    exit
	else
	end if
    end loop
    Draw.FillBox (6, 200, 290, 540, 0)

    % Ranges
    if Style = "Ranged" then
	Character := Archer
    elsif Style = "Melee" then
	Character := Sinjid
    elsif Style = "Gunner" then
	Character := Gunner
    elsif Style = "Magic" then
	Character := Mage
    end if
    % [Music]
    fork playstuffWhy
    Track := "Why, or Why not"
    Level := 1
    % Choice [STATS1]
    if Style = "Ranged" then
	put "You have chosen the Archer."
	put "Advantage : Speed"
	Pic.Draw (Archer, 40, 210, picMerge)
	Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
	Font.Draw ("Hp : 1400", 400, 370, intfont2, 54)
	Hp := 1400
	THp := 1400
	Font.Draw ("Mana : 110", 400, 340, intfont2, 54)
	Mana := 110
	TMana := 110
	ManaRegen := TMana * 0.05
	Font.Draw ("Damage : 110", 400, 310, intfont2, 54)
	Damage := 110
	Font.Draw ("Intelligence : 50", 400, 280, intfont2, 54)
	Intelligence := 50
	Font.Draw ("Speed : 75", 400, 250, intfont2, 54)
	Speed := 75
    elsif Style = "Melee" then
	put "You should wield knives like a pro."
	put "Advantage : Health"
	Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
	Font.Draw ("Hp : 1500", 400, 370, intfont2, 54)
	Hp := 1500
	THp := 1500
	Font.Draw ("Mana : 60", 400, 340, intfont2, 54)
	Mana := 80
	TMana := 80
	ManaRegen := TMana * 0.05
	Font.Draw ("Damage : 90", 400, 310, intfont2, 54)
	Damage := 90
	Font.Draw ("Intelligence : 10", 400, 280, intfont2, 54)
	Intelligence := 10
	Font.Draw ("Speed : 45", 400, 250, intfont2, 54)
	Speed := 45
	Pic.Draw (Sinjid, 40, 210, picXor)
    elsif Style = "Magic" then
	put "Mysteriously.. magic."
	put "Advantage : Mana"
	Pic.Draw (Mage, 40, 210, picXor)
	Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
	Font.Draw ("Hp :1100", 400, 370, intfont2, 54)
	Hp := 1100
	THp := 1100
	Font.Draw ("Mana : 280", 400, 340, intfont2, 54)
	Mana := 280
	TMana := 280
	ManaRegen := TMana * 0.06
	Font.Draw ("Damage : 100", 400, 310, intfont2, 54)
	Damage := 100
	Font.Draw ("Intelligence : 130", 400, 280, intfont2, 54)
	Intelligence := 130
	Font.Draw ("Speed : 50", 400, 250, intfont2, 54)
	Speed := 50
    elsif Style = "Gunner" then
	put "You are a gunner."
	put "Advantage : Damage"
	Pic.Draw (Gunner, 40, 210, picXor)
	Font.Draw ("Experience : 0", 400, 400, intfont2, 54)
	Font.Draw ("Hp :1400", 400, 370, intfont2, 54)
	Hp := 1400
	THp := 1400
	Font.Draw ("Mana : 180", 400, 340, intfont2, 54)
	Mana := 180
	TMana := 180
	ManaRegen := TMana * 0.06
	Font.Draw ("Damage : 110", 400, 310, intfont2, 54)
	Damage := 110
	Font.Draw ("Intelligence : 30", 400, 280, intfont2, 54)
	Intelligence := 30
	Font.Draw ("Speed : 90", 400, 250, intfont2, 54)
	Speed := 90
    end if

    getch (waitkey)
    cls
    if Style = "Ranged" then
	Font.Draw ("Ranged..", 310, 300, intfont, 54)
	loading2
    elsif Style = "Melee" then
	Font.Draw ("Melee..", 310, 300, intfont, 54)
	loading2
    elsif Style = "Magic" then
	Font.Draw ("Mage..", 310, 300, intfont, 54)
	loading2
    elsif Style = "Gunner" then
	Font.Draw ("Sniper..", 310, 300, intfont, 54)
	loading2
    end if

    % Beginning

    Draw.FillBox (0, 0, maxx, maxy, 151)
    colourback (151)
    delay (1000)
    Font.Draw ("The Gobalan - Global war has only begun 10 years ago...", 100, 400, intfont1, 0)
    delay (2000)
    Font.Draw (".. There are currently 564,401 military deaths", 100, 200, intfont1, 0)
    delay (2000)
    Font.Draw (" and an estimated 5,103,000 civillian deaths..(Press any key)", 80, 80, intfont1, 0)
    delay (500)
    getch (waitkey)
    cls

    Draw.FillBox (0, 0, maxx, maxy, 0)
    colourback (0)
    Pic.Draw (WorldMap, 0, 0, picXor)
    Font.Draw ("In the year 3754, tensions between country superpowers Gobalan and Crezin had risen.", 10, 70, intfont1, 0)
    delay (1500)
    Font.Draw ("Crezin was claiming control to a coastline of Hilyk (Fish) surrounding one of their islands.", 10, 50, intfont1, 0)
    delay (1500)
    Font.Draw ("As it was partially within Gobalan territory, Gobalan attacked fishing boats from the island.", 10, 30, intfont1, 0)
    getch (waitkey)
    cls
    Pic.Draw (WorldMap, 0, 0, picXor)
    Font.Draw ("The Civillian country Global and Grilore decided to take the matters to international court,", 10, 70, intfont1, 0)
    Font.Draw ("where their populations decided the case.", 10, 55, intfont1, 0)
    delay (1500)
    Font.Draw ("The decision was for Gobalan to discontinue aggression or to risk an invasion. ", 10, 40, intfont1, 0)
    delay (1500)
    Font.Draw ("However, Gobalan leader Dhun Ghablian disagreed, and decided to launch an attack on the court. ", 10, 25, intfont1, 0)
    delay (1)
    getch (waitkey)
    Pic.Free (WorldMap)
    cls
    Pic.Draw (WorldMap2, 0, 0, picXor)
    Font.Draw (" Global City almost fell within a week. Ambassadors were sent to allies immediately after the attack. ", 10, 70, intfont1, 0)
    delay (1500)
    Font.Draw (" With Global was the Engima, and the Enigma-Alliance", 10, 50, intfont1, 0)
    delay (1500)
    Font.Draw (" It consisted of Crezin, Zeno, Adreizu, Arnak, Tam-Hutzi, Andreos, Emerghuj, Klirantak and G'lispi.", 10, 30, intfont1, 0)
    getch (waitkey)
    Pic.Free (WorldMap2)
    cls
    Pic.Draw (WorldMap3, 0, 0, picXor)
    Font.Draw (" Arnak, Adreizu and Tam-Hutzi quickly responded to arms. Crezin and the rest followed later.", 10, 70, intfont1, 0)
    delay (1500)
    Font.Draw (" Gobalan quickly realized they had exposed their flank, and created the Torzon-Alliance. ", 10, 55, intfont1, 0)
    delay (1500)
    Font.Draw (" The old alliance of Torzon consisted of Phalack, Jreitcho and Hrizoq.", 10, 40, intfont1, 0)
    delay (1000)
    Font.Draw (" Phalack dropped out due to economical issues. The other countries followed Gobalan's path.", 10, 25, intfont1, 0)
    delay (1)
    getch (waitkey)
    Pic.Free (WorldMap3)
    cls
    Pic.Draw (WorldMap4, 0, 0, picXor)
    Font.Draw (" Horrendously, Gobalan's troops began to slaughter the Global civillians while Crezin ", 10, 75, intfont1, 0)
    Font.Draw ("took over their homebase.", 10, 59, intfont1, 0)
    delay (1500)
    Font.Draw (" Within 8 years Jreitcho and Hrizoq surrendered.", 10, 43, intfont1, 54)
    delay (1500)
    Font.Draw (" YOU are an assassin under Tam-Hutzi...", 10, 25, intfont1, 54)
    getch (waitkey)
    Pic.Free (WorldMap4)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    colorback (151)
    Font.Draw (" 20:31, January.11.3765", 20, 500, intfont1, 0)
    Font.Draw (" Zeno Secret Base - Commander Frizul", 20, 540, intfont1, 54)
    delay (4000)
    Font.Draw (" A secret meeting occurs at Tam-Hutzi Assassin HQ", 40, 460, intfont1, 0)
    delay (3000)
    Font.Draw (" You have been invited as a guest.", 60, 420, intfont1, 0)
    delay (3000)
    Font.Draw (" Frizul: Ravness, you and Joe will travel East into Gobalan Highlands and infiltrate them.", 80, 380, intfont1, 14)
    delay (3000)
    Font.Draw (" Frizul: Once you reach the Yurif Oxbow lake, locate a cabin on a hill...", 100, 340, intfont1, 14)
    delay (2500)
    Font.Draw (" Frizul: ..Ravness, you will continue to the lake. Meet Lukvel there.", 120, 300, intfont1, 14)
    delay (2000)
    Font.Draw (" Frizul: Joe, kill Lt. Ji-Lun. Then follow Ravness.", 140, 260, intfont1, 14)
    delay (1500)
    Font.Draw (" Frizul: As for you.. follow Joe. Find his note, and go to the town.", 10, 50, intfont1, 54)
    delay (1500)
    Font.Draw (" Frizul: Further orders will be there...", 10, 10, intfont1, 54)
    getch (waitkey)
    cls

    % Story
    loop
	Draw.FillBox (0, 0, maxx, maxy, 0)
	colorback (0)
	Pic.Draw (House, 0, 0, picXor)
	Font.Draw ("You arrive upon an empty house.", 100, 95, intfont1, 54)
	delay (2500)
	Font.Draw ("There appears to be no one inside..", 100, 75, intfont1, 54)
	delay (2500)
	Font.Draw ("You decide to investigate.", 100, 55, intfont1, 54)
	delay (2500)
	Font.Draw ("As you arrive, the ghosts dissipate. You find a note on the door..(Press any key)", 100, 35, intfont1, 54)
	delay (1)
	getch (waitkey)
	cls
	Pic.Draw (InsideHouse, 0, 0, picXor)
	delay (3500)
	Font.Draw ("It looks like Joe was successful..(Press any key)", 100, 95, intfont1, 0)
	delay (1)
	getch (waitkey)
	Pic.Free (InsideHouse)
	cls
	Draw.FillBox (0, 0, maxx, maxy, 151)
	colorback (151)
	Font.Draw ("You read the note left on the door:", 100, 500, intfont1, 11)
	delay (2000)
	Font.Draw (" - You. I killed that old bag. Now, it's time to make quick of their leaders.", 100, 460, intfont1, 11)
	delay (1400)
	Font.Draw (" Those doddering old fools can't lead a war; they're just playing Chess with each other.", 100, 420, intfont1, 11)
	delay (1400)
	Font.Draw (" We can end this now. Let's kill 'em!", 100, 380, intfont1, 11)
	delay (1400)
	Font.Draw (" Do you agree to your mission (1) ? Or flee from this life (2) ?", 100, 320, intfont1, 54)
	get answer
	if answer = 1 then
	    exit
	elsif answer = 2 then
	    cls
	    Font.Draw ("You decide to not take part of this murderous rampage. At the expense of your fellow men.", 10, 300, intfont1, 54)
	    delay (500)
	    Font.Draw ("You walk out of the house.", 100, 250, intfont1, 54)
	    delay (500)
	    Font.Draw ("Joe kills you.", 100, 200, intfont1, 40)
	    put "Think about it..."
	    delay (10000)
	end if
    end loop
    cls

    Font.Draw (" A slithering noise is coming from the roof.. ", 70, 500, intfont1, 11)
    delay (1800)
    Font.Draw (" Joe : ..Hey! .. New guy..", 70, 460, intfont1, 11)
    delay (1800)
    Font.Draw (" Joe : Glad you chose to help us. Gimme a hand.", 70, 420, intfont1, 11)
    delay (1000)
    Font.Draw (" You give Joe a hand.", 100, 200, intfont1, 54)
    delay (3000)
    Font.Draw (" Joe : ...I don't need a dead body's hand...", 70, 380, intfont1, 11)
    delay (1000)
    getch (waitkey)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)
    Pic.Draw (ToFields, 0, 0, picXor)                                              % Unfinished
    Font.Draw (" Joe : You need practice, eh? As a senior, it's my duty to ensure the success of our mission. ", 70, 500, intfont1, 11)
    delay (2500)
    Font.Draw ("         *He points to a structure on a field.*", 70, 480, intfont1, 0)
    delay (3000)
    Font.Draw (" You know what they said about Gobalani field farmers. Bluenecks, the lot of them.", 70, 460, intfont1, 11)
    delay (2300)
    Font.Draw (" I'll help you check it out. Why would there only be one farm out here?", 70, 100, intfont1, black)
    getch (waitkey)
    Font.Draw (" ..Ok..", 150, 70, intfont, 54)
    delay (1500)
    cls
    Draw.FillBox (0, 0, maxx, maxy, 0)
    colorback (0)

    % Fight AngryFarmer

    cls
    Draw.FillBox (0, 0, maxx, maxy, 151)
    colorback (151)
    Font.Draw (" As you near the farm.. a man in a bush approaches you.", 100, 400, intfont1, 0)
    delay (2000)
    Font.Draw (" Farmer: Whjy's y'all wantin in this hure lans?", 70, 360, intfont1, 16)
    delay (2000)
    Font.Draw (" Joe: Stand down, or die!", 70, 320, intfont1, 11)
    delay (1000)
    Font.Draw (" Farmer: Fhuq ye, ye'l be Zonen Swine! Guiha, cuhm ter me!", 70, 280, intfont1, 16)
    delay (1000)
    Font.Draw (" Joe looses an arrow at the bush. A slovenly dressed man ... (err woman)  ", 100, 240, intfont1, 0)
    Font.Draw (" falls out with the arrow pinned between its eyes.   ", 100, 210, intfont1, 0)
    delay (2500)
    Font.Draw (" Farmer: !AEEIIIEIEEEEGHHHHH, KILL, KILL, KILL! GULO! GULO! GULO!", 70, 170, intfont1, 16)
    delay (1000)
    Font.Draw (" Joe: Watch what I do...  ", 70, 130, intfont1, 11)
    getch (waitkey)
    cls
    Pic.Draw (ToFields, 0, 0, picXor)
    FarmerFight (Character)
end Introduction

proc DustIntro
    colourback (0)
    Draw.FillBox (0, 0, maxx, maxy, 16)
    Pic.DrawSpecial (StartPic, 0, 0, picCopy, picFadeIn, 2500)
    for j : 1 .. 4
	Draw.Oval (590, 350, 10 + (j * IC), 10 + (j * IC), 31 - j)
	delay (60)
	Draw.Oval (590, 350, 10 + (j * IC), 10 + (j * IC), 0)
    end for
    for j : 1 .. 2
	Draw.Oval (590, 350, 50 + (j * IC), 50 + (j * IC), 27 - j)
	Draw.Oval (590, 350, 10 + (j * IC), 10 + (j * IC), 31 - j)
	delay (60)
	Draw.Oval (590, 350, 50 + (j * IC), 50 + (j * IC), 0)
	Draw.Oval (590, 350, 10 + (j * IC), 10 + (j * IC), 0)
    end for
    for j : 1 .. 9
	Draw.Oval (590, 350, 70 + (j * IC), 70 + (j * IC), 25 - j)
	Draw.Oval (590, 350, 30 + (j * IC), 30 + (j * IC), 29 - j)
	Draw.Oval (590, 350, 5 + (j * IC), 5 + (j * IC), 31 - j)
	delay (60)
	Draw.Oval (590, 350, 70 + (j * IC), 70 + (j * IC), 0)
	Draw.Oval (590, 350, 30 + (j * IC), 30 + (j * IC), 0)
	Draw.Oval (590, 350, 5 + (j * IC), 5 + (j * IC), 0)
    end for
    for j : 1 .. 2
	Draw.Oval (590, 350, 120 + (j * IC), 120 + (j * IC), 20 - j)
	Draw.Oval (590, 350, 95 + (j * IC), 95 + (j * IC), 22 - j)
	delay (60)
	Draw.Oval (590, 350, 120 + (j * IC), 120 + (j * IC), 0)
	Draw.Oval (590, 350, 95 + (j * IC), 95 + (j * IC), 0)
    end for
    for j : 1 .. 4
	Draw.Oval (590, 350, 115 + (j * IC), 115 + (j * IC), 20 - j)
	delay (60)
	Draw.Oval (590, 350, 115 + (j * IC), 115 + (j * IC), 0)
    end for
    delay (1000)
    cls
end DustIntro
