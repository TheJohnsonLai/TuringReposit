% Skills.t

type skillInfo :
    record
	sName : string
	sRank : int
	sDesc : string
	sMultiplier : real % Total Multiplier
	sRange : int % 0 = FRONT, 1 = FRONT 2, 2 = All, 4 = Random, 5 = Back
	sCost : int % 1,2,4?
    end record

type passiveInfo :
    record
	pName : string
	pRank : int
	pDesc : string
	pMultiplier : real
	pRange : int
	pCooldown : int
	pTempCooldown : int
    end record

% null skill
var sEmpty : skillInfo
var pEmpty : passiveInfo

sEmpty.sName := ""
sEmpty.sRank := 0
sEmpty.sDesc := ""
sEmpty.sMultiplier := 0
sEmpty.sRange := 0
sEmpty.sCost := 0

pEmpty.pName := ""
pEmpty.pRank := 0
pEmpty.pDesc := ""
pEmpty.pMultiplier := 0
pEmpty.pRange := 0
pEmpty.pCooldown := 0
pEmpty.pTempCooldown := 0

%%%%%%% Skills - Main Characters
%%% Skill - Main Menu - Unlocked Array !
var characterSkillUnlocked : array 0 .. 2, 0 .. 2, 0 .. 4 of boolean
var characterPassiveUnlocked : array 0 .. 2, 0 .. 2 of boolean
for cycleChar : 0 .. 2 % Dragon, Blue, July
    for cycle124 : 0 .. 2 % 1, 2, 4
	for cycleTier : 1 .. 4 % Top to Bottom
	    characterSkillUnlocked (cycleChar, cycle124, cycleTier) := false % 1,2,3,4 = locked
	end for
	characterSkillUnlocked (cycleChar, cycle124, 0) := true % 0 = unlocked
	characterPassiveUnlocked (cycleChar, cycle124) := false % passives = locked
    end for
end for
%%%%%% Skill Array
var dragonSkill : array 0 .. 2, 0 .. 4 of skillInfo
var blueSkill : array 0 .. 2, 0 .. 4 of skillInfo
var julySkill : array 0 .. 2, 0 .. 4 of skillInfo
var dragonPassive : array 0 .. 2 of passiveInfo
var bluePassive : array 0 .. 2 of passiveInfo
var julyPassive : array 0 .. 2 of passiveInfo

for a : 0 .. 2 % 1, 2, 4
    for b : 0 .. 4 % Top to Bottom
	dragonSkill (a, b) := sEmpty
	blueSkill (a, b) := sEmpty
	julySkill (a, b) := sEmpty
    end for
    dragonPassive (a) := pEmpty
    bluePassive (a) := pEmpty
    julyPassive (a) := pEmpty
end for
dragonSkill (0, 0).sName := "Upwards Strike" %%%%%%%%% Damage Resist (1 Stack, 2 turns)
dragonSkill (0, 0).sDesc := "Deals 0.54× attack to the closest enemy and grants 1 stack resist for 2 turns"
dragonSkill (0, 0).sMultiplier := 0.54
dragonSkill (0, 1).sName := "Bait" %%%%%%%% Grant Taunt (5 turns)
dragonSkill (0, 1).sDesc := "Grants self taunt for 5 turns"
dragonSkill (0, 1).sMultiplier := 0.00
dragonSkill (0, 2).sName := "Lightning Swing" %%%%%%%%% Damage
dragonSkill (0, 2).sDesc := "Deals 0.70× attack to the closest enemy" %%%%%%%%% Damage
dragonSkill (0, 2).sMultiplier := 0.70
dragonSkill (0, 3).sName := "Thousand Flash" %%%%%%%%% Damage + Enhance (1 turn) (means grant 2 on timer)
dragonSkill (0, 3).sDesc := "Deals 0.61× attack to the targeted enemy and grants 1 stack enhance for 1 turn" %%%%%%%%% Damage
dragonSkill (0, 3).sMultiplier := 0.61
dragonSkill (0, 4).sName := "Blood Oust" %%%%%%%%%% Lose 20% of current HP
dragonSkill (0, 4).sDesc := "Deals 1.11× attack to the closest enemy and removes 21% of Dragon's current health" %%%%%%%%% Damage
dragonSkill (0, 4).sMultiplier := 1.11

dragonSkill (1, 0).sName := "Horizontal Slash" %%%%%%%% Basic damage + taunt (1 turn)
dragonSkill (1, 0).sDesc := "Deals 1.3× attack to the closest enemy and grants taunt for 1 turn"
dragonSkill (1, 0).sMultiplier := 1.3
dragonSkill (1, 1).sName := "Tempered Cleave" %%%%%%%% Hit (First 2) + Gain equivalent Armor
dragonSkill (1, 1).sDesc := "Deals 0.8× attack to the closest 2 enemies and gain 0.8× armor"
dragonSkill (1, 1).sMultiplier := 0.8
dragonSkill (1, 2).sName := "Earthquake" %%%%%%%% AoE all targets
dragonSkill (1, 2).sDesc := "Deals 0.90× attack to all enemies"
dragonSkill (1, 2).sMultiplier := 0.90
dragonSkill (1, 3).sName := "Tail Thrash" %%%%%%% Damage
dragonSkill (1, 3).sDesc := "Deals 1.70× attack to the closest enemy"
dragonSkill (1, 3).sMultiplier := 1.70
dragonSkill (1, 4).sName := "Scale Bash" %%%%%%% High damage, cause vulnerability on self (3 turns, EX = 1, S = 2)
dragonSkill (1, 4).sDesc := "Deals 2.30× attack to the closest enemy and grants Dragon with 1 stack vulnerability for 1 turn"
dragonSkill (1, 4).sMultiplier := 2.30

dragonSkill (2, 0).sName := "Martial Fury" %%%%%% Damage + grant Taunt (2 turns)
dragonSkill (2, 0).sDesc := "Deals 2.44× attack to the closest enemy and grants taunt for 2 turns"
dragonSkill (2, 0).sMultiplier := 2.44
dragonSkill (2, 1).sName := "Lift Guard" %%%%%% Grant Taunt (3 turns)+ 2 stacks Resist for 5 turns + armor
dragonSkill (2, 1).sDesc := "Grants taunt for 3 turns, 2 stacks resist for 5 turns, and 0.40× armor"
dragonSkill (2, 1).sMultiplier := 0.40
dragonSkill (2, 2).sName := "Nightowl" %%%%%%%% Ally Party 1 stack enhance+resist for 3 turns
dragonSkill (2, 2).sDesc := "Grants all allies 1 stack enhance and resist for 3 turns"
dragonSkill (2, 2).sMultiplier := 0.00
dragonSkill (2, 3).sName := "Disfigure" %%%%%% Damage
dragonSkill (2, 3).sDesc := "Deals 2.65× attack to the closest enemy"
dragonSkill (2, 3).sMultiplier := 2.65
dragonSkill (2, 4).sName := "Eruption" %%%%%% High DAMAGE + Poison (2 turns), cause poison (2 turns) on self (S = 1, EX = remove)
dragonSkill (2, 4).sDesc := "Deals 3.00× attack to the closest enemy and grants 1 stack poison for 2 turns to Dragon and enemy"
dragonSkill (2, 4).sMultiplier := 3.00

dragonPassive (0).pName := "Reflection"
dragonPassive (0).pDesc := "[CD:1] Counter enemy damage with 0.35× attack"
dragonPassive (0).pMultiplier := 0.35
dragonPassive (0).pCooldown := 0
dragonPassive (1).pName := "Charge"
dragonPassive (1).pDesc := "[CD:4]Every 4th turn, offensive skills deal 1.5× damage"
dragonPassive (1).pMultiplier := 1.5
dragonPassive (1).pCooldown := 4
dragonPassive (2).pName := "Half Blood"
dragonPassive (2).pDesc := "[CD:1] Recover 15% of current health on kill"
dragonPassive (2).pMultiplier := 0.15
dragonPassive (2).pCooldown := 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------- B l u e ----------------%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

blueSkill (0, 0).sName := "Searing Slash" %%%%%%%%%
blueSkill (0, 0).sDesc := "Deals 0.50× armor-piercing attack and removes taunt from the selected enemy"
blueSkill (0, 0).sMultiplier := 0.50
blueSkill (0, 1).sName := "Hei Twirl" %%%%%%%%
blueSkill (0, 1).sDesc := "Deals 0.30× armor-piercing attack to all enemies"
blueSkill (0, 1).sMultiplier := 0.30
blueSkill (0, 2).sName := "Z Shake" %%%%%%%%%
blueSkill (0, 2).sDesc := "Deals 0.60× armor-piercing attack to the furthest enemy and removes taunt" %%%%%%%%%
blueSkill (0, 2).sMultiplier := 0.60
blueSkill (0, 3).sName := "Take Flight" %%%%%%%%%
blueSkill (0, 3).sDesc := "Deals 0.42× armor-piercing attack to the targeted enemy and removes taunt and resist" %%%%%%%%
blueSkill (0, 3).sMultiplier := 0.42
blueSkill (0, 4).sName := "Imperilious Wing" %%%%%%%%%%
blueSkill (0, 4).sDesc := "Deals 0.4× damage and grants vulnerability for 2 turns to the selected enemy" %%%%%%%%%
blueSkill (0, 4).sMultiplier := 0.40

blueSkill (1, 0).sName := "Swerve Height Pull" %%%%%%%%
blueSkill (1, 0).sDesc := "Deals 1.40× attack to the selected enemy"
blueSkill (1, 0).sMultiplier := 1.40
blueSkill (1, 1).sName := "Sventhenon" %%%%%%%%
blueSkill (1, 1).sDesc := "Deals 0.90× armor-piercing attack the selected enemy and removes enhance"
blueSkill (1, 1).sMultiplier := 0.90
blueSkill (1, 2).sName := "Veer Flesh" %%%%%%%
blueSkill (1, 2).sDesc := "Deals 1.35× armor-piercing attack to the furthest enemy"
blueSkill (1, 2).sMultiplier := 1.35
blueSkill (1, 3).sName := "Vanishment" %%%%%%%
blueSkill (1, 3).sDesc := "Deals 1.10× attack and increases CD by 1 to the furthest enemy"
blueSkill (1, 3).sMultiplier := 1.10
blueSkill (1, 4).sName := "Pheonix Claw" %%%%%%%
blueSkill (1, 4).sDesc := "Deals 0.70× armor-piercing attack to the 2 closest enemies"
blueSkill (1, 4).sMultiplier := 0.70

blueSkill (2, 0).sName := "Chokehold" %%%%%%
blueSkill (2, 0).sDesc := "Deals 2.05× armor-piercing attack and grants 2 stacks of vulnerability and exhaust for 2 turns to the furthest enemy"
blueSkill (2, 0).sMultiplier := 2.05
blueSkill (2, 1).sName := "Render" %%%%%%
blueSkill (2, 1).sDesc := "Deals 1.55× armor-piercing attack and grants 2 stacks of vulnerability and exhaust for 2 turns to the selected enemy"
blueSkill (2, 1).sMultiplier := 1.55
blueSkill (2, 2).sName := "Forgiven" %%%%%%%%
blueSkill (2, 2).sDesc := "Removes all debuffs on Blue and grants selected enemy 3 stacks of vulnerability for 2 turns"
blueSkill (2, 2).sMultiplier := 0.00
blueSkill (2, 3).sName := "Crow Form" %%%%%%
blueSkill (2, 3).sDesc := "Deals 1.25× attack to all enemies, twice, with a 70% hit rate"
blueSkill (2, 3).sMultiplier := 1.25
blueSkill (2, 4).sName := "Imperial Feather" %%%%%%
blueSkill (2, 4).sDesc := "Deals 2.45× attack to the selected enemy"
blueSkill (2, 4).sMultiplier := 2.45

bluePassive (0).pName := "Preemptive"
bluePassive (0).pDesc := "Begins battles with 2 garuanteed blue diamonds"
bluePassive (0).pMultiplier := 2
bluePassive (0).pCooldown := 0
bluePassive (1).pName := "Soul seeker"
bluePassive (1).pDesc := "[CD:3] Recover 10% of skill damage"
bluePassive (1).pMultiplier := 0.1
bluePassive (1).pCooldown := 3
bluePassive (2).pName := "Punisher"
bluePassive (2).pDesc := "Deals 25% more damage to vulnerable targets"
bluePassive (2).pMultiplier := 1.25
bluePassive (2).pCooldown := 0

%%%%%%%%%%%%%%%%%%%%%%%% ---------------------- J u l y ------------------- %%%%%%%%%%%%%%%%%%%%%%%%

julySkill (0, 0).sName := "Empower" %%%%%%%%%
julySkill (0, 0).sDesc := "Heals ally 0.55× attack and grants enhance for 2 turns"
julySkill (0, 0).sMultiplier := 0.55
julySkill (0, 1).sName := "Command" %%%%%%%%
julySkill (0, 1).sDesc := "Heals ally 0.40× attack and forces their 1 diamond skill"
julySkill (0, 1).sMultiplier := 0.40
julySkill (0, 2).sName := "Shield of Light" %%%%%%%%%
julySkill (0, 2).sDesc := "Grants foremost ally armor equal to 0.65× attack and forces their 1 diamond skill"
julySkill (0, 2).sMultiplier := 0.65
julySkill (0, 3).sName := "Serene Silence" %%%%%%%%%
julySkill (0, 3).sDesc := "Deals 0.50× attack and grants exhaust for 1 turn to the targeted enemy"
julySkill (0, 3).sMultiplier := 0.50
julySkill (0, 4).sName := "Hollow Palace"
julySkill (0, 4).sDesc := "Heals 0.78× attack to the targeted ally"
julySkill (0, 4).sMultiplier := 0.78

julySkill (1, 0).sName := "Inspire" %%%%%%%%
julySkill (1, 0).sDesc := "Grants foremost ally armor equal to 1.2× attack and forces their 2 diamond skill"
julySkill (1, 0).sMultiplier := 1.2
julySkill (1, 1).sName := "Red Night" %%%%%%%%
julySkill (1, 1).sDesc := "Deals 0.95× attack to all enemies"
julySkill (1, 1).sMultiplier := 0.95
julySkill (1, 2).sName := "Crushed Magma" %%%%%%%%
julySkill (1, 2).sDesc := "Deals 0.45× attack to the foremost enemy and grant vulnerability for 2 turns"
julySkill (1, 2).sMultiplier := 0.45
julySkill (1, 3).sName := "Embellish" %%%%%%%
julySkill (1, 3).sDesc := "Removes debuffs from ally and grant resist for 1 turn"
julySkill (1, 3).sMultiplier := 0.00
julySkill (1, 4).sName := "Diamond Shatter" %%%%%%%
julySkill (1, 4).sDesc := "Deals 1.60× attack to the selected enemy"
julySkill (1, 4).sMultiplier := 1.60

julySkill (2, 0).sName := "Judgement" %%%%%%
julySkill (2, 0).sDesc := "Grants all allies armor equal to 2.40× attack"
julySkill (2, 0).sMultiplier := 2.40
julySkill (2, 1).sName := "Catastrophe" %%%%%%
julySkill (2, 1).sDesc := "Grants selected ally armor and health equal to 1.35× attack and forces their 4 diamond skill"
julySkill (2, 1).sMultiplier := 1.35
julySkill (2, 2).sName := "White Void" %%%%%%%%
julySkill (2, 2).sDesc := "Deals 2.40× attack to all enemies and 1.00× attack to other allies"
julySkill (2, 2).sMultiplier := 2.40
julySkill (2, 3).sName := "Sacrifice" %%%%%%
julySkill (2, 3).sDesc := "Deals 2.55× attack to the enemy and removes all of July's armor"
julySkill (2, 3).sMultiplier := 2.55
julySkill (2, 4).sName := "Light Angel" %%%%%%
julySkill (2, 4).sDesc := "Heals selected ally 2.35× attack and grants resist for 1 turn"
julySkill (2, 4).sMultiplier := 2.35

julyPassive (0).pName := "Guardian"
julyPassive (0).pDesc := "[CD:1] Heals are 30% more effective"
julyPassive (0).pMultiplier := 1.30
julyPassive (0).pCooldown := 1
julyPassive (1).pName := "Shining Star"
julyPassive (1).pDesc := "[CD:4] Next offensive skill stuns the target for 1 turn"
julyPassive (1).pMultiplier := 1
julyPassive (1).pCooldown := 4
julyPassive (2).pName := "Courage"
julyPassive (2).pDesc := "[CD:4] Automatically remove all control statuses on July"
julyPassive (2).pMultiplier := 1
julyPassive (2).pCooldown := 4
