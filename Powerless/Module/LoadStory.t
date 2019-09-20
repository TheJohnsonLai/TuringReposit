%%%% Story - Chat and cutscenes.


proc MapStory
    loop
	Mouse.Where (Mx, My, Mb)
	Input.KeyDown (Pressed)
	if Chapter < -50 then
	    Pic.Draw (BG_Herain, 0, 0, picCopy)
	    if Chapter = -100 then     %%% Intro to the story.
		InputChat := "The city of Herain."
		StoryProgress (Sillness, true)     %% Name, true = rightside bar
	    elsif Chapter = -99 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -98 then
		InputChat := "That's where I was born."
		StoryProgress (Sillness, true)
	    elsif Chapter = -97 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -96 then
		InputChat := "I came into this world in a machine. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -95 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -94 then
		InputChat := "My world was advanced, technologically sound, futuristic."
		StoryProgress (Sillness, true)
	    elsif Chapter = -93 then
		InputChat := "I was created as a human, one of the lower-ranked species in the universe."
		StoryProgress (Sillness, true)
	    elsif Chapter = -92 then
		InputChat := "My mother had abandoned me at the age of 15. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -91 then
		InputChat := " .. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -90 then
		InputChat := "I couldn't blame her, she had more important things to do."
		StoryProgress (Sillness, true)
	    elsif Chapter = -89 then
		InputChat := "Her life was just beginning, and the other species had invented the tech to handle issues of birth."
		StoryProgress (Sillness, true)
	    elsif Chapter = -88 then
		InputChat := "I still don't know who they were."
		StoryProgress (Sillness, true)
	    elsif Chapter = -87 then
		InputChat := "'They' as in my parents."
		StoryProgress (Sillness, true)
	    elsif Chapter = -86 then
		InputChat := "It's not something I think about anymore."
		StoryProgress (Sillness, true)
	    elsif Chapter = -85 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -84 then
		InputChat := "The name's [Sillness]."
		StoryProgress (Sillness, true)
	    elsif Chapter = -83 then
		InputChat := "The name, my name, whatever sounds nicer. Sillness Furlenstorn."
		StoryProgress (Sillness, true)
	    elsif Chapter = -82 then
		InputChat := "I grew up in an orphanage here. In Herain."
		StoryProgress (Sillness, true)
	    elsif Chapter = -81 then
		InputChat := "Herain's a massive metropolis. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -80 then
		InputChat := "The particular area I lived was called Sans Tsuko."
		StoryProgress (Sillness, true)
	    elsif Chapter = -79 then
		InputChat :=
		    "Retro-styled machinery filled my streets, oil and gas permeated my neighbourhood's layers. Though we were part of the intergalactic intelligence union, us humans lived lives akin to ghettos."
		StoryProgress (Sillness, true)
	    elsif Chapter = -78 then
		InputChat := "But I loved the city's emotions. Whenever I could, I took to explore the city's inner workings, climbing over bridges and weaving past traffic."
		StoryProgress (Sillness, true)
		Chapter := -60
	    end if
	elsif Chapter < -20 then
	    Pic.Draw (SansTsukoCorner, 0, 0, picCopy)
	    if Chapter = -60 then
		InputChat := "I found some quiet places, tucked between buildings, that muffled the noise of the city."
		StoryProgress (Sillness, true)
	    elsif Chapter = -59 then
		InputChat := "It was in these places I would read my favourite books and watch my favourite videos."
		StoryProgress (Sillness, true)
	    elsif Chapter = -58 then
		InputChat := "I took to reading at a young age. Socially awkward, I made no friends at my orphanage."
		StoryProgress (Sillness, true)
	    elsif Chapter = -57 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -56 then
		InputChat := "Surprising, isn't it? "
		StoryProgress (Sillness, true)
	    elsif Chapter = -55 then
		InputChat := "Most kids my age didn't read at all. The holonet was the popular item of the time. And everyone used that."
		StoryProgress (Sillness, true)
	    elsif Chapter = -54 then
		InputChat := "The holonet was an inter-species device that could do whatever you wanted. Displaying books was a feature, but no one used that."
		StoryProgress (Sillness, true)
	    elsif Chapter = -53 then
		InputChat := "Only old academics and the like. Boring people."
		StoryProgress (Sillness, true)
	    elsif Chapter = -52 then
		InputChat := "My brothers and sisters at the orphanage would play all kinds of games on their holonets."
		StoryProgress (Sillness, true)
	    elsif Chapter = -51 then
		InputChat := "I didn't fit in as I had different tastes. My interest in ancient fantasy and the downfall of the humans was not reciprocated."
		StoryProgress (Sillness, true)
	    elsif Chapter = -50 then
		InputChat := "I remember asking one of the superiors: "
		StoryProgress (Sillness, true)
	    elsif Chapter = -49 then
		InputChat := "Why aren't we as important as the other species?"
		StoryProgress (Sillness, true)
	    elsif Chapter = -48 then
		InputChat := "The superior said: 'What a dangerous question! We were discovered a few hundred years ago.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -47 then
		InputChat := "'We must thank the Fantasies and the Cybens for their sharing of technology.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -46 then
		InputChat := "'Otherwise, we wouldn't be living in this magnificent city, with the wonders we own today.'"
		StoryProgress (Sillness, true)
	    elsif Chapter = -45 then
		InputChat := "The superior didn't really give me the answer I was looking for. The question stuck with me these past years."
		StoryProgress (Sillness, true)
	    elsif Chapter = -44 then
		InputChat := "So I took to the libraries in Sans Tsuko. There were many books, thousands of books, old and smelly but still legible."
		StoryProgress (Sillness, true)
	    elsif Chapter = -43 then
		InputChat := "I read about the human race. How they used to be the top predator in their world, 'Earth'."
		StoryProgress (Sillness, true)
	    elsif Chapter = -42 then
		InputChat := "The humans had just begun space travel, landing on a neighbouring planet, when they discovered by the famous starcharter Kristoffer Coelombus."
		StoryProgress (Sillness, true)
	    elsif Chapter = -41 then
		InputChat := "Kristoffer Coelombus then declared 'Earth' and its natives as his property."
		StoryProgress (Sillness, true)
	    elsif Chapter = -40 then
		InputChat := "Of course, the humans didn't take lightly to that. So they fought a 2 years war with Coelombus before he destroyed 60% of humans with a giant photon beam."
		StoryProgress (Sillness, true)
	    elsif Chapter = -39 then
		InputChat := "The intergalactic government discovered of Coelombus's savage behaviour and took over the operation of what was known as 'Project Earth'."
		StoryProgress (Sillness, true)
	    elsif Chapter = -38 then
		InputChat :=
		    "The humans, it seemed, were an intelligent species a few thousand years from intergalactic travel. Their destructive history deemed them as dangerous to all other intergalactic species."
		StoryProgress (Sillness, true)
	    elsif Chapter = -37 then
		InputChat := "The government ruled them fit to serve as low-class citizens, with basic rights and technology, but with no say in laws or governance. "
		StoryProgress (Sillness, true)
	    elsif Chapter = -36 then
		InputChat := "Space travel for low-class citizens was off-limits. Attempting to surpass laws such as these resulted in immediate death."
		StoryProgress (Sillness, true)
	    elsif Chapter = -35 then
		InputChat := "The other species worried that the humans would cause suffering to them. And such was the fate of the humans, sealed in their history and instincts."
		StoryProgress (Sillness, true)
	    elsif Chapter = -34 then
		InputChat := "At least, that's what I know from the books. But hey, they were written by human scholars from that time."
		StoryProgress (Sillness, true)
	    elsif Chapter = -33 then
		InputChat := 
		    "It might sound harsh, but there is a silver lining. There are always exemptions to the rule, and once every few years a human is taken away to the government's home planet."
		StoryProgress (Sillness, true)
	    elsif Chapter = -32 then
		InputChat := "Those taken are usually the extreme elite of the human race, those with magnificent brains, those who have demonstrated proven capacity and usefulness."
		StoryProgress (Sillness, true)
	    elsif Chapter = -31 then
		InputChat := "I don't know if I ever wanted to be one of them."
		StoryProgress (Sillness, true)
	    elsif Chapter = -30 then
		InputChat := "It sounds exciting, at the same time, we've never heard of those humans again."
		StoryProgress (Sillness, true)
	    elsif Chapter = -29 then
		InputChat := " ... "
		StoryProgress (Sillness, true)
	    elsif Chapter = -28 then
		InputChat := " 'WHOA!' "
		StoryProgress (Sillness, true)
	    elsif Chapter = -27 then
		Chapter := 0
	    end if
	elsif Chapter < 10 then
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    if Chapter = 0 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
	    elsif Chapter = 1 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
		InputChat := ".... -pause-                                                          (that's an odd question, but I'll go with the wind)"
		StoryProgress (Sillness, false)
	    elsif Chapter = 2 then     %%% INtro, first battle, tutorial
		InputChat := "Hey you, with the cape! Are you of human descent?"
		StoryProgress (Ravness, true)     %% Name, true = rightside bar
		InputChat := "Yes."
		StoryProgress (Sillness, false)
	    elsif Chapter = 3 then     %%%
		InputChat := "My, you don't look like one of our people. Our ship is under fire from the port bow, get to it!"
		StoryProgress (Ravness, true)
		InputChat := "Yes."
		StoryProgress (Sillness, false)
	    elsif Chapter = 4 then     %%%
		InputChat := "My, you don't look like one of our people. Our ship is under fire from the port bow, get to it!"
		StoryProgress (Ravness, true)
		InputChat := ".. Alright."
		StoryProgress (Sillness, false)
	    elsif Chapter = 6 then     %%%    %%%
		InputChat := "I'm surprised, you aren't bad at killing. I honestly didn't expect you to jump into action."
		StoryProgress (Ravness, true)
	    elsif Chapter = 7 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "I'm surprised, you aren't bad at killing. I honestly didn't expect you to jump into action."
		StoryProgress (Ravness, true)
		InputChat := "I guess that's just me."
		StoryProgress (Sillness, false)
	    elsif Chapter = 8 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "Are you really part of the resistance?"
		StoryProgress (Ravness, true)
		InputChat := "I guess that's just me."
		StoryProgress (Sillness, false)
	    elsif Chapter = 8 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "Are you really part of the resistance?"
		StoryProgress (Ravness, true)
		InputChat := "I guess that's just me."
		StoryProgress (Sillness, false)
	    elsif Chapter = 9 then     %%%    %%%
		% InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
		InputChat := "Are you really part of the resistance?"
		StoryProgress (Ravness, true)
		InputChat := "Nope."
		StoryProgress (Sillness, false)
	    elsif Chapter = 5 or Chapter < 10 then     %%%
		Pic.Draw (MidscreenMessage, 0, 0, picMerge)
		InputChat := "It appears there's no choice but to fight."
		Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
		Pic.Draw (Border, 0, 0, picMerge)
		if Mb = 1 or Pressed (' ') then
		    Chapter := 10
		    delay (120)
		    BattleBackground := BattleScene_Balenos
		    Character (1) := Sillness
		    Character (3) := EmptyNPC
		    Character (2) := Ravness
		    Character (2).Identity := 5
		    Character (4) := MediahKnight
		    Character (5) := EmptyNPC
		    Character (6) := MediahKnight
		    Character (7) := EmptyNPC
		    Character (8) := EmptyNPC
		    Character (9) := EmptyNPC
		    Battle
		    Chapter := 6
		end if
	    end if
	elsif Chapter = 10 then         %%%    %%%
	    % InputChat := "I'm surprised, you aren't bad for such an oddly dressed person."
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    InputChat := "Then follow me, and let's learn about each other."
	    StoryProgress (Ravness, true)
	    InputChat := "Nope."
	    StoryProgress (Sillness, false)
	elsif Chapter = 11 then     %%%%%%% Cutscene
	    fork PlayMusic (10)
	    View.Set ("nooffscreenonly")
	    Pic.DrawSpecial (IntroBMP, 0, 0, picCopy, picFadeIn, 2500)
	    delay (2000)
	    View.Set ("offscreenonly")
	    Chapter := 12
	elsif Chapter = 12 then     %% Chapter
	    Draw.FillBox (0, 0, maxx, maxy, BGBlue)
	    Pic.Draw (MidscreenMessage, 0, 0, picMerge)
	    InputChat := "-. Chapter 1: Where am I? .-"
	    Font.Draw (InputChat, maxx div 2 - Font.Width (InputChat, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)
	    Pic.Draw (Border, 0, 0, picMerge)
	    if Mb = 1 or Pressed (' ') then
		delay (150)
		Chapter := 13
		exit
	    end if
	elsif Chapter < 50 then     %% INtro to the game, move towards velia, map,
	    Pic.Draw (BG_Balenos, 0, 0, picCopy)
	    if Chapter = 13 then
		InputChat := "Here you can call me Ravness. It's nice to meet you."
		StoryProgress (Ravness, true)
	    elsif Chapter = 14 then
		InputChat := "Here you can call me Ravness. It's nice to meet you."
		StoryProgress (Ravness, true)
		InputChat := "Likewise."
		StoryProgress (Sillness, false)
	    elsif Chapter = 15 then
		InputChat := "Where I used to live, knights would wear plated armor."
		StoryProgress (Ravness, true)
		InputChat := "Likewise."
		StoryProgress (Sillness, false)
	    elsif Chapter = 16 then
		InputChat := "I've never seen the likes of you, flaunting cloth and mask. That makes it all the more exciting to know that you've come to my ship."
		StoryProgress (Ravness, true)
	    elsif Chapter = 17 then
		InputChat := "On that note, you can't be a knight. Or a merc. Maybe an assassin?"
		StoryProgress (Ravness, true)
	    elsif Chapter = 18 then
		InputChat := "Explain yourself."
		StoryProgress (Ravness, true)
	    elsif Chapter = 19 then
		InputChat := "Explain yourself."
		StoryProgress (Ravness, true)
		InputChat := "Well, I.. err.."
		StoryProgress (Sillness, false)
	    elsif Chapter = 20 then
		InputChat := "Explain yourself."
		StoryProgress (Ravness, true)
		InputChat := ".. I haven't the slightest clue where I've come from, or what my background is."
		StoryProgress (Sillness, false)
	    elsif Chapter = 21 then
		InputChat := "I'm sorry."
		StoryProgress (Sillness, false)
	    elsif Chapter = 22 then
		InputChat := "Aren't you a peculiar one~"
		StoryProgress (Ravness, true)
		InputChat := "I'm sorry."
		StoryProgress (Sillness, false)
	    elsif Chapter = 23 then
		InputChat := "Well then, I'm under suspicion you mean no harm."
		StoryProgress (Ravness, true)
	    elsif Chapter = 24 then
		InputChat := "If that is the case, I welcome you to the resistance."
		StoryProgress (Ravness, true)
	    elsif Chapter = 25 then
		InputChat := "This land, this world, is called the 'Lost Forest'."
		StoryProgress (Ravness, true)
		InputChat := " (ok) "
		StoryProgress (Sillness, false)
	    elsif Chapter = 26 then
		InputChat := "The 'Lost Forest' is a super continent, according to our best navigators. Surrounding us is a massive ocean that leads to the other side of the 'Lost Forest'."
		StoryProgress (Ravness, true)
		InputChat := " (mhm) "
		StoryProgress (Sillness, false)
	    elsif Chapter = 27 then
		InputChat := "In the 'Lost Forest', we had 4 warring factions. The 4 leaders were bloodborne descendants of the 2 legendary founders, the ancient Gods that created this world."
		StoryProgress (Ravness, true)
		InputChat := " -nods-"
		StoryProgress (Sillness, false)
	    elsif Chapter = 28 then
		InputChat := "The war began"
		StoryProgress (Ravness, true)
		InputChat := " -nods-"
		StoryProgress (Sillness, false)
	    end if
	elsif Chapter < 150 then     %% Intro to skills, city, members
	    Pic.Draw (City_Velia, 0, 0, picCopy)
	    if Chapter = 10 then
		InputChat := "So this is the city of Velia"
		StoryProgress (Sillness, true)
	    end if
	elsif Chapter < 200 then     %% Cron Castle disturbance
	    Pic.Draw (BattleScene_CronCastle, 0, 0, picCopy)
	    if Chapter = 10 then
		InputChat := "I hear this is the castle?"
		StoryProgress (Sillness, true)
	    end if
	elsif Chapter < 400 then
	elsif Chapter < 500 then

	end if
	delay (15)
	View.Update
    end loop
end MapStory
