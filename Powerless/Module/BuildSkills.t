%%% Skills, skill determining, and animations
%

fcn DamageVariation (charAttack, multiplier : real) : real
    var rNG : int := Rand.Int (93, 107)
    var damage : real := 0

    damage := charAttack * multiplier * rNG / 100

    result damage
end DamageVariation


proc ActivateDiamonds (xAlly : characterInfo, dCount : int)

end ActivateDiamonds

proc DisplayDiamonds (xAlly : characterInfo, dCount : int)
    var skillDesc : string := ""
    Pic.Draw (battleDesc, 139, 680, picMerge)
    if dCount = 1 then
	skillDesc += xAlly.dOne.sDesc
    elsif dCount = 2 then
	skillDesc += xAlly.dTwo.sDesc
    elsif dCount = 4 then
	skillDesc += xAlly.dFour.sDesc
    end if
    Draw.Text (skillDesc, 150, 687, FontM10, 31)
end DisplayDiamonds

proc CastSkill (xAlly : characterInfo, dCount : int, isActivateSkill : boolean)
    if isActivateSkill then
	ActivateDiamonds (xAlly, dCount)
    else
	DisplayDiamonds (xAlly, dCount)
    end if
    %% Animation
end CastSkill
%%%%%%%%%%%% Recovery
fcn APDamage (charAttack, multiplier : real) : real
    result charAttack
end APDamage
fcn checkHealth (checkHp, checkHpMax : real) : real
    var checkedHealth : real := checkHp
    if checkedHealth < 0 then
	checkedHealth := 0
    elsif checkedHealth > checkHpMax then
	checkedHealth := checkHpMax
    end if
    checkedHealth := round (checkedHealth * 100) / 100
    result checkedHealth
end checkHealth
fcn checkArmor (ctArmor, checkArmorMax : real) : real
    var checkedArmor : real := ctArmor
    if checkedArmor < 0 then
	checkedArmor := 0
    elsif checkedArmor > checkArmorMax then
	checkedArmor := checkArmorMax
    end if
    checkedArmor := round (checkedArmor * 100) / 100
    result checkedArmor
end checkArmor

%%%%%%%%%%%%%%%% Active Ally %%%% Target, Target,  %%%% isAlly? %%%%%%5%% char ID %%%% attackingChar %%%%%% char ID CHAR
fcn CastResult (dHovered, dCount, AllyID, FoeID, cloFoe, secFoe, farFoe, curID : int,
	isAlly : boolean, charCasting : characterInfo, charAffected : characterInfo) : characterInfo
    var actingChar : characterInfo := charCasting
    var xChar : characterInfo := charAffected
    var dealDamage : real := 1.00
    var dealHeal : real := 1.00

    var hasBuffed : int := 0
    var buffStack : int := 0
    var buffTimer : int := 0

    if isAlly then %% on Ally
	if xChar.passive.pName = "Reflection" & curID = dHovered then % Dragon - Do in Battle
	elsif xChar.passive.pName = "Half Blood" & curID = dHovered then % Dragon - Do in Battle, at end Tally lives
	elsif xChar.passive.pName = "Charge" & curID = dHovered then % Dragon
	    if xChar.passive.pTempCooldown <= 0 then
		xChar.passive.pTempCooldown := xChar.passive.pCooldown + 1
	    end if
	elsif actingChar.passive.pName = "Guardian" then % July p
	    var isHeal : boolean := false
	    if dCount = 1 then
		if actingChar.dOne.sName = "Empower"|
			actingChar.dOne.sName = "Hollow Palace" then
		    isHeal := true
		end if
	    elsif dCount = 2 then
	    elsif dCount = 4 then
		if actingChar.dFour.sName = "Light Angel"| actingChar.dFour.sName = "Catastrophe" then
		    isHeal := true
		end if
	    end if
	    if actingChar.passive.pTempCooldown <= 0 & isHeal then
		xChar.passive.pTempCooldown := xChar.passive.pCooldown + 1
	    end if
	    dealHeal := 1.3
	elsif xChar.passive.pName = "Courage" & curID = dHovered then %%%%%% Passive - July
	    if xChar.passive.pTempCooldown <= 0 then
		var isCC : boolean := false
		for r : 0 .. stackNum
		    if xChar.vulnTime (r) > 0 then
			isCC := true
		    elsif xChar.exhaustTime (r) > 0 then
			isCC := true
		    elsif xChar.poisonTime (r) > 0 then
			isCC := true
		    end if
		end for
		if isCC then
		    for r : 0 .. stackNum
			xChar.vulnTime (r) := 0
			xChar.exhaustTime (r) := 0
			xChar.poisonTime (r) := 0
		    end for
		    xChar.passive.pTempCooldown := xChar.passive.pCooldown
		    if xChar.passive.pRank = 4 then
			xChar.passive.pTempCooldown -= 1
		    end if
		end if
	    end if
	elsif xChar.passive.pName = "Shining Star" & curID = dHovered then %%%%%% Passive - July
	    var isOffensive : boolean := false
	    if dCount = 1 then
		if actingChar.dOne.sName = "Serene Silence" then
		    isOffensive := true
		end if
	    elsif dCount = 2 then
		if actingChar.dTwo.sName = "Red Night"| actingChar.dTwo.sName = "Diamond Shatter"|
			actingChar.dTwo.sName = "Crushed Magma" then
		    isOffensive := true
		end if
	    elsif dCount = 4 then
		if actingChar.dFour.sName = "White Void"| actingChar.dFour.sName = "Sacrifice" then
		    isOffensive := true
		end if
	    end if
	    if actingChar.passive.pTempCooldown <= 0 & isOffensive then
		xChar.passive.pTempCooldown := xChar.passive.pCooldown
	    end if
	elsif xChar.passive.pName = "Soul Seeker" & dHovered = curID then %%%%%% Passive - Blue
	    if xChar.passive.pTempCooldown <= 0 then
		var lifeLeech : real := 0.1
		if dCount = 1 then
		    lifeLeech *= DamageVariation (actingChar.attack,
			actingChar.dOne.sMultiplier + actingChar.dOne.sRank * 0.01)
		elsif dCount = 2 then
		    lifeLeech *= DamageVariation (actingChar.attack,
			actingChar.dTwo.sMultiplier + actingChar.dTwo.sRank * 0.02)
		elsif dCount = 4 then
		    lifeLeech *= DamageVariation (actingChar.attack,
			actingChar.dFour.sMultiplier + actingChar.dFour.sRank * 0.04)
		end if
		xChar.tempHealth += lifeLeech
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		xChar.passive.pTempCooldown := xChar.passive.pCooldown + 1
	    end if
	end if
	if dCount = 1 then     %%%%%%%%%%%%%%%% 1 Diamond-----------------------------
	    if actingChar.dOne.sName = "Upwards Strike" & dHovered = curID then
		buffStack := xChar.dOne.sRank - 2
		if buffStack < 1 then
		    buffStack := 1
		end if
		for t : 0 .. stackNum
		    if xChar.resistTime (t) <= 0 then
			hasBuffed += 1
			xChar.resistTime (t) := 2
			exit when hasBuffed >= buffStack
		    end if
		end for
	    elsif actingChar.dOne.sName = "Bait" & dHovered = curID then
		buffStack := xChar.dOne.sRank + 4
		if buffStack > 6 then
		    buffStack := 6
		end if
		if xChar.taunt < buffStack then
		    xChar.taunt := buffStack
		end if
	    elsif actingChar.dOne.sName = "Thousand Flash" & dHovered = curID then
		buffStack := xChar.dOne.sRank - 2
		if buffStack < 1 then
		    buffStack := 1
		end if
		for t : 0 .. stackNum
		    if xChar.enhanceTime (t) <= 0 then
			hasBuffed += 1
			xChar.enhanceTime (t) := 1
			exit when hasBuffed >= buffStack
		    end if
		end for
	    elsif actingChar.dOne.sName = "Blood Oust" & dHovered = curID then
		dealDamage *= xChar.tempHealth * (0.21 - (xChar.dOne.sRank * 0.01))
		xChar.tempHealth -= dealDamage
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%% 1D - Blue (None)
		%% 1D - July --------------------------------------------------- %%
	    elsif actingChar.dOne.sName = "Empower" & AllyID = curID then
		%%%% Buff
		buffStack := actingChar.dOne.sRank - 2
		buffTimer := 2
		if buffStack < 1 then
		    buffStack := 1
		end if
		for t : 0 .. stackNum
		    if xChar.enhanceTime (t) <= 0 then
			hasBuffed += 1
			xChar.enhanceTime (t) := buffTimer
			exit when hasBuffed >= buffStack
		    end if
		end for
		%%%% Heal
		dealHeal *= actingChar.attack * actingChar.dOne.sMultiplier
		xChar.tempHealth += dealHeal
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    elsif actingChar.dOne.sName = "Command" & AllyID = curID then
		%%%% Heal
		dealHeal *= actingChar.attack * actingChar.dOne.sMultiplier
		xChar.tempHealth += dealHeal
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    elsif actingChar.dOne.sName = "Shield of Light" & AllyID = curID then
		%%%% Armor and Chain
		dealDamage *= actingChar.attack * actingChar.dOne.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
	    elsif actingChar.dOne.sName = "Hollow Palace" & AllyID = curID then
		%%%% Heal
		dealHeal *= actingChar.attack * actingChar.dOne.sMultiplier
		xChar.tempHealth += dealHeal
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    end if
	elsif dCount = 2 then     %%%%%%%%%%%%%%%%%%%%% 2 Diamond -------------------------
	    % 2D. Dragon
	    if actingChar.dTwo.sName = "Horizontal Slash" & dHovered = curID then
		buffStack := actingChar.dTwo.sRank - 2         %% Set taunt to 1-2
		if buffStack <= 1 then
		    buffStack := 1
		end if
		if xChar.taunt < buffStack then
		    xChar.taunt := buffStack
		end if
	    elsif actingChar.dTwo.sName = "Tempered Cleave" & dHovered = curID then
		dealDamage *= actingChar.attack * actingChar.dTwo.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
	    elsif actingChar.dTwo.sName = "Scale Bash" & dHovered = curID then
		buffStack := 1     %% Stack (1 = 30%)
		buffTimer := 5 - actingChar.dTwo.sRank
		for t : 0 .. stackNum
		    if xChar.vulnTime (t) <= 0 then
			hasBuffed += 1
			xChar.vulnTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed >= buffStack
		    end if
		end for
		%2D. July %%%%
	    elsif actingChar.dTwo.sName = "Inspire" & AllyID = curID then
		%%%% Armor
		dealDamage *= actingChar.attack * actingChar.dTwo.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
	    elsif actingChar.dTwo.sName = "Embellish" & AllyID = curID then
		buffStack := 1
		buffTimer := actingChar.dTwo.sRank - 2
		if buffTimer < 1 then
		    buffTimer := 1
		end if
		for t : 0 .. stackNum
		    if xChar.resistTime (t) <= 0 then
			hasBuffed += 1
			xChar.resistTime (t) := buffTimer
			exit when hasBuffed >= buffStack
		    end if
		end for
	    end if
	elsif dCount = 4 then     %%%%%%%%%%%%%%%%%%%% 4 Diamond------------------------
	    if actingChar.dFour.sName = "Martial Fury" & dHovered = curID then
		buffStack := xChar.dFour.sRank - 1         %% Taunt = 1-3 (EX = MAX)
		if buffStack <= 1 then
		    buffStack := 1
		end if
		if xChar.taunt < buffStack then
		    xChar.taunt := buffStack
		end if
	    elsif actingChar.dFour.sName = "Lift Guard" & dHovered = curID then
		buffStack := xChar.dFour.sRank     % Taunt
		if buffStack < 2 then
		    buffStack := 2
		end if
		if xChar.taunt < buffStack then
		    xChar.taunt := buffStack
		end if
		buffStack := 2     % Resist % each "stack" is a single 30%, 2 times = 60% at 5 turn timer
		for t : 0 .. stackNum
		    if xChar.resistTime (t) <= 0 then
			hasBuffed += 1
			xChar.resistTime (t) := 5
			exit when hasBuffed >= buffStack
		    end if
		end for
		%%%%%%%%%%%%% Armor
		dealDamage *= actingChar.attack * actingChar.dFour.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
	    elsif actingChar.dFour.sName = "Nightowl" then
		buffStack := actingChar.dFour.sRank - 2
		if buffStack < 1 then %
		    buffStack := 1
		end if
		for t : 0 .. stackNum
		    if xChar.enhanceTime (t) <= 0 then
			hasBuffed += 1
			xChar.enhanceTime (t) := 1
			exit when hasBuffed >= buffStack
		    end if
		end for
		for t : 0 .. stackNum %%%%%%%%%% Second Buff
		    if xChar.resistTime (t) <= 0 then
			hasBuffed -= 1
			xChar.resistTime (t) := 1
			exit when hasBuffed <= 0
		    end if
		end for
	    elsif actingChar.dFour.sName = "Eruption" & dHovered = curID then
		buffStack := 1     %% Stack (1 = 30%)
		buffTimer := (4 - xChar.dFour.sRank)
		if buffTimer > 2 then
		    buffTimer := 2
		elsif buffTimer < 1 then
		    buffTimer := 1
		end if
		for t : 0 .. stackNum
		    if xChar.poisonTime (t) <= 0 then
			hasBuffed += 1
			xChar.poisonTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed >= buffStack
		    end if
		end for
		%4D. July %%%%
	    elsif actingChar.dFour.sName = "Judgement" then
		%%%% Armor
		dealDamage *= actingChar.attack * actingChar.dFour.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
	    elsif actingChar.dFour.sName = "Catastrophe" & AllyID = curID then
		%%%% Armor
		dealDamage *= actingChar.attack * actingChar.dFour.sMultiplier
		xChar.tempArmor += dealDamage
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		%%%% Heal
		dealHeal *= actingChar.attack * actingChar.dFour.sMultiplier
		xChar.tempHealth += dealHeal
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    elsif actingChar.dFour.sName = "Light Angel" & AllyID = curID then
		%%%% Heal
		dealHeal *= actingChar.attack * actingChar.dFour.sMultiplier
		xChar.tempHealth += dealHeal
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%%% Buff
		buffStack := 1
		buffTimer := actingChar.dFour.sRank - 2
		if buffTimer < 1 then
		    buffTimer := 1
		end if
		for t : 0 .. stackNum
		    if xChar.resistTime (t) <= 0 then
			hasBuffed += 1
			xChar.resistTime (t) := buffTimer
			exit when hasBuffed >= buffStack
		    end if
		end for
	    end if
	end if
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Enemies %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------------------%%%%%%%%
    else     %% Enemy stat calc
	%put "Enemy Receiving"
	%put FoeID
	%put curID
	%put dCount
	%put AllyID
	%put actingChar.dOne.sName
	%View.Update
	%delay (2500)
	if actingChar.passive.pName = "Charge" & curID = dHovered then     % Dragon (equivalent that affects damage)
	    if actingChar.passive.pTempCooldown > actingChar.passive.pCooldown then
		dealDamage *= (actingChar.passive.pMultiplier + actingChar.passive.pRank * 0.10)
	    end if
	elsif actingChar.passive.pName = "Shining Star" then     %%%%%% Passive - July
	    if actingChar.passive.pTempCooldown > actingChar.passive.pCooldown then
		xChar.tempSpeed += 1
	    end if
	elsif actingChar.passive.pName = "Punisher" then     %%%%%% Passive - Blue
	    var hasVuln : boolean := false
	    for v : 0 .. stackNum
		if xChar.vulnTime (v) > 0 then
		    hasVuln := true
		end if
	    end for
	    if hasVuln then
		dealDamage *= 1.25
	    end if
	end if
	var attackTarget : int := -1
	if dCount = 1 then
	    %%%%%%%%%%%%%%%%% Basic Damage << 1 Diamond >> ------------
	    if actingChar.dOne.sName = "Upwards Strike" & curID = cloFoe|
		    actingChar.dOne.sName = "Lightning Swing" & curID = cloFoe|
		    actingChar.dOne.sName = "Thousand Flash" & curID = cloFoe|
		    actingChar.dOne.sName = "Blood Oust" & curID = cloFoe|
		    actingChar.dOne.sName = "Imperilious Wing" & curID = FoeID then
		% Vulne add
		if actingChar.dOne.sName = "Imperilious Wing" then
		    %%% Debuff
		    buffStack := 1
		    buffTimer := 2
		    for t : 0 .. stackNum
			if xChar.vulnTime (t) <= 0 then
			    hasBuffed += 1
			    xChar.vulnTime (t) := buffTimer     %% Timer Length
			    exit when hasBuffed >= buffStack
			end if
		    end for
		end if
		% Damage
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dOne.sMultiplier + actingChar.dOne.sRank * 0.01)
		xChar.tempArmor -= dealDamage
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += xChar.tempArmor
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%%%%%%%%%%%%%%%% Armor Piercing << 1 Diamond >>
	    elsif actingChar.dOne.sName = "Searing Slash" & curID = FoeID|     %%%%%% Target
		    actingChar.dOne.sName = "Take Flight" & curID = FoeID|
		    actingChar.dOne.sName = "Z Shake" & curID = farFoe|
		    actingChar.dOne.sName = "Hei Twirl" then
		% Debuff
		% Taunt Remove
		if actingChar.dOne.sName = "Searing Slash"|
			actingChar.dOne.sName = "Z Shake"|
			actingChar.dOne.sName = "Take Flight" then
		    xChar.taunt := 0
		end if
		% resist Remove
		if actingChar.dOne.sName = "Take Flight" then
		    for r : 0 .. stackNum
			xChar.resistTime (r) := 0
		    end for
		end if
		% Damage - Armor Piercing
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dOne.sMultiplier + actingChar.dOne.sRank * 0.01)
		xChar.tempArmor -= 2 * dealDamage     % 2 = Armor Pierce
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += (xChar.tempArmor * 0.50)     % Armor Pierced, Reduction
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    end if
	elsif dCount = 2 then
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2 Diamonds << Basic >> ---------------
	    if actingChar.dTwo.sName = "Horizontal Slash" & curID = cloFoe|     %%%%%%%%%%% Close
		    actingChar.dTwo.sName = "Tail Thrash" & curID = cloFoe|
		    actingChar.dTwo.sName = "Scale Bash" & curID = cloFoe|
		    actingChar.dTwo.sName = "Tempered Cleave" & (curID = cloFoe| curID = secFoe)|     %%%%%% 2 Pierce
		    actingChar.dTwo.sName = "Earthquake"|
		    actingChar.dTwo.sName = "Swerve Height Pull" & curID = FoeID|
		    actingChar.dTwo.sName = "Vanishment" & curID = farFoe then
		% Debuff
		% Increase CD
		if actingChar.dTwo.sName = "Vanishment" then
		    xChar.tempSpeed += 1
		end if
		% Damage
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dTwo.sMultiplier + actingChar.dTwo.sRank * 0.02)
		xChar.tempArmor -= dealDamage
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += xChar.tempArmor
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2 Diamonds << Armor Piercing >> ---------------
	    elsif actingChar.dTwo.sName = "Sventhenon" & curID = FoeID|     %%%%%% Target
		    actingChar.dTwo.sName = "Veer Flesh" & curID = farFoe|
		    actingChar.dTwo.sName = "Pheonix Claw" & (curID = cloFoe| curID = secFoe) then
		% Debuff
		% resist Remove
		if actingChar.dTwo.sName = "Sventhenon" then
		    for r : 0 .. stackNum
			xChar.enhanceTime (r) := 0
		    end for
		end if
		% Damage - Armor Piercing
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dTwo.sMultiplier + actingChar.dTwo.sRank * 0.02)
		xChar.tempArmor -= 2 * dealDamage     % 2 = Armor Pierce
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += (xChar.tempArmor * 0.50)     % Armor Pierced, Reduction
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
	    end if
	elsif dCount = 4 then
	    %%%%%%%%%%%%%%%%%%%% 4 Diamonds << Basic >> ----------
	    if actingChar.dFour.sName = "Martial Fury" & curID = cloFoe|
		    actingChar.dFour.sName = "Disfigure" & curID = cloFoe|
		    actingChar.dFour.sName = "Eruption" & curID = cloFoe|
		    actingChar.dFour.sName = "Crow Form"|
		    actingChar.dFour.sName = "Imperial Feather" & curID = FoeID then
		% Debuff
		if actingChar.dFour.sName = "Eruption" then
		    buffStack := 1     %% Stack (1 = 30%)
		    buffTimer := 2     %% Timer
		    for t : 0 .. stackNum
			if xChar.poisonTime (t) <= 0 then
			    hasBuffed += 1
			    xChar.poisonTime (t) := buffTimer     %% Timer Length
			    exit when hasBuffed >= buffStack
			end if
		    end for
		end if
		% RNG
		if actingChar.dFour.sName = "Crow Form" then
		    var RollCrow1 : int := 0
		    var RollCrow2 : int := 0
		    RollCrow1 := Rand.Int (0, 100)
		    RollCrow2 := Rand.Int (0, 100)
		    if RollCrow1 > 70 & RollCrow2 > 70 then     %% 30% Both Fail
			dealDamage := 0
		    elsif RollCrow1 <= 70 & RollCrow2 <= 70 then     %% 70% Both Succeed
			dealDamage *= 2
		    end if     %% else nothing (1x)
		end if
		% Damage
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dFour.sMultiplier + actingChar.dFour.sRank * 0.01)
		xChar.tempArmor -= dealDamage
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += xChar.tempArmor
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 Diamonds << Armor Piercing >> ---------------
	    elsif actingChar.dFour.sName = "Chokehold" & curID = farFoe|     %%%%%% Target
		    actingChar.dFour.sName = "Render" & curID = FoeID then
		% Debuff
		%if actingChar.dFour.sName = "Chokehold"| actingChar.dFour.sName = "Render" then
		buffStack := 2     %% Stack (1 = 30%)
		buffTimer := 2     %% Timer
		for t : 0 .. stackNum
		    if xChar.vulnTime (t) <= 0 then
			hasBuffed += 1
			xChar.vulnTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed >= buffStack
		    end if
		end for
		for t : 0 .. stackNum
		    if xChar.exhaustTime (t) <= 0 then
			hasBuffed -= 1
			xChar.exhaustTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed <= 0     % Reverse
		    end if
		end for
		%end if
		% Damage - Armor Piercing
		dealDamage *= DamageVariation (actingChar.attack,
		    actingChar.dFour.sMultiplier + actingChar.dFour.sRank * 0.04)
		xChar.tempArmor -= 2 * dealDamage     % 2 = Armor Pierce
		if xChar.tempArmor < 0 then
		    xChar.tempHealth += (xChar.tempArmor * 0.50)     % Armor Pierced, Reduction
		end if
		xChar.tempArmor := checkArmor (xChar.tempArmor, xChar.armor)
		xChar.tempHealth := checkHealth (xChar.tempHealth, xChar.health)
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 Diamonds << DEBUFF only >> ---------------
	    elsif actingChar.dFour.sName = "Forgiven" & curID = FoeID then     %%%%%% Target
		buffStack := 3     %% Stack (1 = 30%)
		buffTimer := 2     %% Timer
		for t : 0 .. stackNum
		    if xChar.vulnTime (t) <= 0 then
			hasBuffed += 1
			xChar.vulnTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed >= buffStack
		    end if
		end for
		for t : 0 .. stackNum
		    if xChar.exhaustTime (t) <= 0 then
			hasBuffed -= 1
			xChar.exhaustTime (t) := buffTimer     %% Timer Length
			exit when hasBuffed <= 0     % Reverse
		    end if
		end for
	    end if
	end if
    end if
    result xChar
end CastResult
