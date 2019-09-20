%%% Skills, skill determining, and animations

%( This boolean is refreshed false, turns true t
% then ActiveTarget selected, then animation and damage subtraction, then exit)
% if Cast = true then SkillCast (break;)
var DefenseChange : int := 0
var ManaOk : boolean := false
var DisplayDescription : boolean := false
var DamageLower, DamageHigher : int := 0
var PowerCostAI : int := 0

var Animating : boolean := false
var AnimateDelay : int := 0
var AnimateCounter : int := 1

fcn DamageFormula (Base, Multiplier : int) : int

    DamageLower := 0
    DamageHigher := 0
    var Dice : int := Rand.Int (0, 100)
    if DraggedBaseHighlight = false then
	Damage := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).Skill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 + Rand.Int (-2 * Character (ActiveTarget).Level, 2 * Character (ActiveTarget).Level)
    else
	Damage := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).BaseSkill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 + Rand.Int (-2 * Character (ActiveTarget).Level, 2 * Character (ActiveTarget).Level)
    end if

    Dice := 1
    if Dice <= Character (ActiveUser).CritChance then
	Damage := (Damage * Character (ActiveUser).CritDamage) div 100
    end if

    if DraggedBaseHighlight = false then
	DamageLower := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).Skill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 - (2 * Character (ActiveTarget).Level)
	DamageHigher := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).Skill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 + (2 * Character (ActiveTarget).Level)
    else
	DamageLower := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).BaseSkill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 - (2 * Character (ActiveTarget).Level)
	DamageHigher := ((Character (ActiveUser).Attack * Base div 100
	    + (Character (ActiveUser).Attack * Multiplier div 100 * Character (ActiveUser).BaseSkill (SkillSelected).Level))
	    * (100 - Character (ActiveTarget).Defense)) div 100 + (2 * Character (ActiveTarget).Level)
    end if
    result Damage
end DamageFormula

fcn CalculatePower (SS : int) : int
    if SS = 1 then
	PowerCostAI := -4
    elsif SS = 2 then
	PowerCostAI := (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
    elsif SS = 3 then
	PowerCostAI := (10 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
    elsif SS = 4 then
	PowerCostAI := (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
    elsif SS = 5 then
	PowerCostAI := -5
    elsif SS = 6 then
	PowerCostAI := -4
    elsif SS = 7 then
	PowerCostAI := -6
    elsif SS = 8 then
	PowerCostAI := -4
    elsif SS = 10 then %% Sillness
	PowerCostAI := 8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 11 then
	PowerCostAI := 21 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 12 then
	PowerCostAI := 6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 13 then
	PowerCostAI := 11 + 4 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 14 then
	PowerCostAI := 25 + 9 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 15 then
	PowerCostAI := 13 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 16 then
	PowerCostAI := 50 + 15 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 17 then
	PowerCostAI := 33 + 14 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 20 then %% Ravness
	PowerCostAI := 5 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 21 then
	PowerCostAI := 8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 22 then
	PowerCostAI := 11 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 23 then
	PowerCostAI := 18 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 24 then %% Ravness
	PowerCostAI := 18 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 25 then
	PowerCostAI := 28 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 26 then
	PowerCostAI := 26 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 27 then
	PowerCostAI := 10 + 10 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 30 then %% Cosseus
	PowerCostAI := 14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 31 then
	PowerCostAI := 33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 32 then
	PowerCostAI := 16 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 33 then
	PowerCostAI := 20 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 34 then %% Cosseus
	PowerCostAI := 33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 36 then
	PowerCostAI := 31 + 14 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 37 then
	PowerCostAI := 40 + 12 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 40 then %%%  D _ RIn  %%% Dual Shot
	PowerCostAI := 10 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 41 then  %%% Headshot
	PowerCostAI := 7 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 42 then
	PowerCostAI := 13 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 43 then
	PowerCostAI := 21 + 6 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 44 then %%%  D _ RIn  %%% Dual Shot
	PowerCostAI := 25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 45 then  %%% Headshot
	PowerCostAI := 35 + 8 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 50 then % Wolfe
	PowerCostAI := 9 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 51 then            %%% Ferenspirr
	PowerCostAI := 11 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 52 then            %%% Silent Shadow
	PowerCostAI := 15 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 53 then             %%% Hunter of the night
	PowerCostAI := 19 + 6 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 54 then % Wolfe
	PowerCostAI := 20 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 55 then            %%% Ferenspirr
	PowerCostAI := 20 + 8 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 56 then            %%% Silent Shadow
	PowerCostAI := 15 + 11 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 57 then             %%% Hunter of the night
	PowerCostAI := 46 + 13 * Character (ActiveUser).Skill (SkillSelected).Level
	% elsif SS = 60 then
    elsif SS = 61 then %% Rage             %%% Electrocute
	PowerCostAI := 14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 62 then             %%% Backhand shot
	PowerCostAI := 14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 63 then             %%% Zero Energy
	PowerCostAI := 0 + 11 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 64 then %% Rage             %%% Electrocute
	PowerCostAI := 27 + 12 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 65 then             %%% Backhand shot
	PowerCostAI := 0
    elsif SS = 66 then             %%% Zero Energy
	PowerCostAI := 66 + 16 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 70 then %% Seira           %%% KAtanaDuelWIeld
	PowerCostAI := 15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 71 then            %%% KatanaFlash
	PowerCostAI := 20 + 4 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 72 then
	PowerCostAI := 15 + 6 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 73 then
	PowerCostAI := 20 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 74 then %% Seira           %%% KAtanaDuelWIeld
	PowerCostAI := 0
    elsif SS = 75 then            %%% KatanaFlash
	PowerCostAI := 24 + 8 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 76 then
	PowerCostAI := 25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 77 then
	PowerCostAI := 70 + 25 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 80 then %%% Zefan
	PowerCostAI := 1 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 81 then
	PowerCostAI := 8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 82 then
	PowerCostAI := 30 + 8 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 83 then
	PowerCostAI := 21 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 84 then %%% Zefan
	PowerCostAI := 0
    elsif SS = 85 then
	PowerCostAI := 15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 86 then
	PowerCostAI := 39 + 14 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 87 then
	PowerCostAI := 81 + 23 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 90 then %%% Cleo
	PowerCostAI := 13 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 91 then
	PowerCostAI := 12 + 4 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 92 then
	%  Character (ActiveTarget).Power -= 1
	PowerCostAI := 18 + 6 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 93 then
	%   Character (ActiveTarget).Power -= 4
	%  Character (ActiveUser).Health -= (Character (ActiveTarget).Attack * (Character (ActiveUser).Skill (SkillSelected).Level) div 3)
	PowerCostAI := 31 + 10 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 94 then %%% Cleo
	PowerCostAI := 23 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 95 then
	PowerCostAI := 35 + 5 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 96 then %%% Cleo
	PowerCostAI := 33 + 19 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 97 then
	PowerCostAI := 59 + 21 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 100 then %%% Aeron
	% Focus + 5 for all party members7 + 2 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 101 then     %%% King of Spades
	PowerCostAI := 15 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 102 then        %%% Queen's Mercy
	% Character (ActiveTarget).Power -= (5 + Character (ActiveUser).Skill (SkillSelected).Level)
	PowerCostAI := 16 + 3 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 103 then        %%% Hidden Ace
	PowerCostAI := 27 + 7 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 104 then     %%% King of Spades
	PowerCostAI := 0
    elsif SS = 105 then        %%% Queen's Mercy
	% Character (ActiveTarget).Power -= (5 + Character (ActiveUser).Skill (SkillSelected).Level)
	PowerCostAI := 40 + 15 * Character (ActiveUser).Skill (SkillSelected).Level
    elsif SS = 106 then        %%% Hidden Ace
	PowerCostAI := 100 + 33 * Character (ActiveUser).Skill (SkillSelected).Level
    else        %%% Hidden Ace
	PowerCostAI := 16 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    end if
    result PowerCostAI
end CalculatePower

fcn SkillDamage (SS : int) : int % SS is skill ID, which is 1 - 50. SkilLSelected is 1-6 based on character.
    if SS = 1 then %%% Basic Slash, Crescent Slash
	% Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	Character (ActiveUser).Power += 4
	Damage := DamageFormula (100, 10)
	if Damage <= 0 then
	    Damage := 0
	end if

    elsif SS = 2 then %%%% HeartWrench
	if Character (ActiveUser).Power >= CalculatePower (SS) then        %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= CalculatePower (SS)
	    Damage := DamageFormula (115, 25)
	    Character (ActiveUser).Health += (Damage div 10)
	    if Character (ActiveUser).Health > Character (ActiveUser).TotalHealth then
		Character (ActiveUser).Health := Character (ActiveUser).TotalHealth
	    end if
	    if Damage <= 0 then
		Damage := 0
	    end if
	end if
    elsif SS = 3 then     %%%%%Nebula
	% Damage is 0.8 + 0.8 (1.6)
	if Character (ActiveUser).Power >= (10 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= CalculatePower (SS)
	    Damage := DamageFormula (153, 28)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 4 then    % PhantomBurst
	if Character (ActiveUser).Power >= (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then     %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= CalculatePower (SS)
	    Damage := DamageFormula (131, 30)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 5 then     %%% Concentration (Regen mana)
	Character (ActiveUser).Power += 5
	Damage := DamageFormula (100, 10)
	if Damage <= 0 then
	    Damage := 0
	end if
    elsif SS = 6 then     %%% Singel Shot(Regen mana)
	Character (ActiveUser).Power += 4
	Damage := DamageFormula (100, 00)
	if Damage <= 0 then
	    Damage := 0
	end if
    elsif SS = 7 then     %%% Feather (Regen mana)
	Character (ActiveUser).Power += 6
	Damage := DamageFormula (97, 11)
	if Damage <= 0 then
	    Damage := 0
	end if
    elsif SS = 8 then     %%% QuickStrike (Regen mana)
	Character (ActiveUser).Power += 4
	Damage := DamageFormula (101, 11)
	if Damage <= 0 then
	    Damage := 0
	end if
    elsif SS = 10 then         %%% PhantomBurst % Cloak
	if Character (ActiveUser).Power >= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Defense += (15 + (Character (ActiveUser).Level * 2))
	    Character (ActiveTarget).ChangeDefense := 2
	    Damage := 0
	else
	    ManaOk := false
	end if
    elsif SS = 11 then        % Double Impact
	if Character (ActiveUser).Power >= (21 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then     %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= CalculatePower (SS)
	    Damage := 2 * (SkillDamage (1))
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 12 then             %%% QuickStep
	if Character (ActiveUser).Power >= (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then         %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Speed := Character (ActiveTarget).Speed - (Character (ActiveUser).Level + 10)
	    Character (ActiveTarget).ChangeSpeed := +2
	    Damage := 0
	else
	    ManaOk := false
	end if
    elsif SS = 13 then             %%% Rejuvenate // slow step
	if Character (ActiveUser).Power >= (11 + 4 * Character (ActiveUser).Skill (SkillSelected).Level) & Character (ActiveTarget).Health > 0 then
	    %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (11 + 4 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Health += (Character (ActiveUser).Attack) - 15 + (Character (ActiveUser).Level * 2)

	    Damage := 0
	else
	    ManaOk := false
	end if
    elsif SS = 14 then             %%%Lightning Pierce % 7 %% Pierce Enemies
	if Character (ActiveUser).Power >= (25 + 9 * Character (ActiveUser).Skill (SkillSelected).Level) then         %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (25 + 9 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget >= 10 & ActiveTarget <= 12 then
		if Character (ActiveTarget - 3).Identity not= 0 then
		    if Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (168, 26)
		    end if
		end if
	    elsif ActiveTarget <= 10 then
		if Character (ActiveTarget + 3).Identity not= 0 then
		    if Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (168, 26)
		    end if
		end if
	    end if
	    Damage := DamageFormula (168, 26)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 15 then             %%% LightningRend % 9 %% Basic mid tier attack, single target, Increases their turn by (level)
	if Character (ActiveUser).Power >= (13 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then         %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (13 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Speed += Character (ActiveUser).Skill (SkillSelected).Level
	    Damage := DamageFormula (139, 25)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 16 then             %%% RainbowNuke % 10 High Damage, hits square (circle radius detection)
	if Character (ActiveUser).Power >= (50 + 15 * Character (ActiveUser).Skill (SkillSelected).Level) then         %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (50 + 15 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget = 8 or ActiveTarget = 11 then %% Mid %% Hit in Circle around target.
		for DamageSquare : 7 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (79, 33)
		    end if
		end for
	    elsif ActiveTarget = 7 or ActiveTarget = 10 then % Edge Bot
		for DamageSquare : 7 .. 11
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 9 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (79, 33)
		    end if
		end for
	    elsif ActiveTarget = 9 or ActiveTarget = 11 then % Edge Top
		for DamageSquare : 8 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 10 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (79, 33)
		    end if
		end for
	    end if
	    Damage := DamageFormula (79, 33)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 17 then             %%% Shadow Lotus % 8 %% Increase def, and health temporarily, revive
	if Character (ActiveUser).Power >= (33 + 14 * Character (ActiveUser).Skill (SkillSelected).Level) then         %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (33 + 14 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Defense += 3 * Character (ActiveUser).Skill (SkillSelected).Level
	    var StoreTarget : int := ActiveTarget
	    for DetectDead : 1 .. 6
		if Character (DetectDead).Identity > 0 and Character (DetectDead).Health <= 0 then
		    StoreTarget := DetectDead
		    exit
		end if
	    end for
	    Character (StoreTarget).Health += (Character (StoreTarget).TotalHealth * (25 + (3 * Character (ActiveUser).Skill (SkillSelected).Level)) div 100)
	    Character (StoreTarget).ChangeDefense := 3
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 20 then         %%% Halberd Slam
	if Character (ActiveUser).Power >= (5 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (5 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (137, 26)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 21 then         %%% Swinging Carve
	if Character (ActiveUser).Power >= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)

	    if ActiveTarget not= 9 & ActiveTarget not= 12 then
		if Character (ActiveTarget + 1).Identity > 0 and Character (ActiveTarget + 1).Health > 0 then
		    Character (ActiveTarget + 1).Health -= DamageFormula (69, 8)
		end if
	    end if
	    if ActiveTarget not= 7 & ActiveTarget not= 10 then
		if Character (ActiveTarget - 1).Identity > 0 and Character (ActiveTarget - 1).Health > 0 then
		    Character (ActiveTarget - 1).Health -= DamageFormula (69, 8)
		end if
	    end if
	    Damage := DamageFormula (89, 14)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 22 then         %%% Pole Bash
	if Character (ActiveUser).Power >= (11 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (11 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (150, 17)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 23 then         %%% Neck Penetration
	if Character (ActiveUser).Power >= (18 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (18 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget >= 10 & ActiveTarget <= 12 then
		if Character (ActiveTarget - 3).Identity not= 0 then
		    if Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (162, 44)
		    end if
		end if
	    elsif ActiveTarget <= 10 then
		if Character (ActiveTarget + 3).Identity not= 0 then
		    if Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (162, 44)
		    end if
		end if
	    end if
	    Damage := DamageFormula (162, 44)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 24 then         %%% Armored Destruction %% Attacks, reduce their defense
	if Character (ActiveUser).Power >= (18 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (18 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (154, 41)
	    Character (ActiveTarget).Defense -= (5 + (Character (ActiveUser).Skill (SkillSelected).Level))
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 25 then         %%% Resurrect %% Revive a teammate with 0 Hp. (Health + 12%)
	if Character (ActiveUser).Power >= (28 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (28 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := 0
	    var StoreTarget : int := ActiveTarget
	    for DetectDead : 1 .. 6
		if Character (DetectDead).Identity > 0 and Character (DetectDead).Health <= 0 then
		    StoreTarget := DetectDead
		    exit
		end if
	    end for
	    Character (StoreTarget).Health += (Character (StoreTarget).TotalHealth * (12 + Character (ActiveUser).Skill (SkillSelected).Level) div 100)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 26 then         %%% Typhoon %% Strikes a Column %% 90%+28% Mid tier aoe
	if Character (ActiveUser).Power >= (26 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (26 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget < 10 then
		for CycleVictims : 7 .. 9
		    if Character (CycleVictims).Identity > 0 & ActiveTarget not= CycleVictims then
			Character (CycleVictims).Health -= DamageFormula (90, 28)
		    end if
		end for
	    else
		for CycleVictims : 10 .. 12
		    if Character (CycleVictims).Identity > 0 & ActiveTarget not= CycleVictims then
			Character (CycleVictims).Health -= DamageFormula (90, 28)
		    end if
		end for
	    end if
	    Damage := DamageFormula (91, 28)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 27 then         %%% Earthquake %% Single target damage based on Power
	if Character (ActiveUser).Power >= (10 + 10 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.

	    Damage := DamageFormula (65 + Character (ActiveUser).Power, 3 * Character (ActiveUser).Power * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Power := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 30 then         %%%Divine Armor
	if Character (ActiveUser).Power >= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Defense += Character (ActiveUser).Defense
	    Character (ActiveTarget).ChangeDefense := 2
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 31 then         %%%Crushing Roar
	if Character (ActiveUser).Power >= (33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for Cycle : 7 .. 12
		if Character (Cycle).Identity > 0 and Character (Cycle).Health > 0 then
		    Character (Cycle).Attack -= Character (ActiveUser).Defense
		    Character (Cycle).ChangeAttack := 1
		end if
	    end for
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 32 then         %%% MultiLaser
	if Character (ActiveUser).Power >= (16 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (16 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget = 10 then %%%% V shape attack
		if Character (ActiveTarget - 2).Identity not= 0 then
		    Character (ActiveTarget - 2).Health -= DamageFormula (72, 11)
		end if
	    elsif ActiveTarget = 11 then
		if Character (ActiveTarget - 2).Identity not= 0 then
		    Character (ActiveTarget - 2).Health -= DamageFormula (72, 11)
		end if
		if Character (ActiveTarget - 4).Identity not= 0 then
		    Character (ActiveTarget - 4).Health -= DamageFormula (72, 11)
		end if
	    elsif ActiveTarget = 12 then
		if Character (ActiveTarget - 4).Identity not= 0 then
		    Character (ActiveTarget - 4).Health -= DamageFormula (72, 11)
		end if
	    end if
	    Damage := DamageFormula (142, 22)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 33 then             %%% BodySlam
	if Character (ActiveUser).Power >= (20 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (20 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (155, 37)

	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 34 then       %%% Shield Blast
	if Character (ActiveUser).Power >= (33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then %%%% Is Power available to use? if not, no cast.
	    Character (ActiveUser).Power -= (33 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for Cycle : 7 .. 12
		if Character (Cycle).Identity > 0 and Character (Cycle).Health > 0 then
		    Character (Cycle).Defense -= Character (ActiveUser).Defense
		    if Character (Cycle).Defense < 0 then
			Character (Cycle).Defense := 0
		    end if
		    Character (Cycle).ChangeDefense := 1
		end if
	    end for
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 36 then             %%% MaserCannon Hits in a straight line
	if Character (ActiveUser).Power >= (31 + 14 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (31 + 14 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget >= 10 & ActiveTarget <= 12 then
		if Character (ActiveTarget - 3).Identity not= 0 then
		    if Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (222, 69)
		    end if
		end if
	    elsif ActiveTarget <= 10 then
		if Character (ActiveTarget + 3).Identity not= 0 then
		    if Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (222, 69)
		    end if
		end if
	    end if
	    Damage := DamageFormula (222, 69)

	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 37 then             %%% Quasar % High damage, hits random target + target
	if Character (ActiveUser).Power >= (40 + 12 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (40 + 12 * Character (ActiveUser).Skill (SkillSelected).Level)
	    var ChooseAnotherVictim : int := Rand.Int (7, 12)
	    if Character (ChooseAnotherVictim).Identity > 0 and Character (ChooseAnotherVictim).Health > 0 then
		Character (ChooseAnotherVictim).Health -= DamageFormula (169, 38)
	    end if
	    Damage := DamageFormula (261, 45)

	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 40 then             %%% Dual Shot
	if Character (ActiveUser).Power >= (10 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (10 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (145, 7)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 41 then             %%% Headshot
	if Character (ActiveUser).Power >= (7 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (7 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (70, 70)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 42 then             %%% spinfire
	if Character (ActiveUser).Power >= (13 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (13 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for EnemiesCycle : 7 .. 12
		if Character (EnemiesCycle).Identity > 0 & Character (EnemiesCycle).Health > 0 & EnemiesCycle not= ActiveTarget then
		    for Cyclic : 1 .. 2
			Character (EnemiesCycle).Health -= DamageFormula (24, 4)
		    end for
		end if
	    end for
	    Damage := DamageFormula (40, 15)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 43 then             %%% Critical Shot
	if Character (ActiveUser).Power >= (21 + 6 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (21 + 6 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (156, 27)
	    Character (ActiveUser).CritChance += 10 + (Character (ActiveUser).Level)
	    Character (ActiveUser).ChangeCritChance := 2
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 44 then             %%%  Restrain Shot (Stun 2 turns)
	if Character (ActiveUser).Power >= (25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (74, 15)
	    Character (ActiveTarget).Speed += 2 * Character (ActiveTarget).TotalSpeed
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 45 then            %%% Virus Shot (Infection) = % Hp
	if Character (ActiveUser).Power >= (35 + 8 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (35 + 8 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Health -= (Character (ActiveTarget).TotalHealth * (15 + Character (ActiveUser).Skill (SkillSelected).Level) div 100)
	    Damage := DamageFormula (100, 25)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 50 then             %%% ClaweStrike
	if Character (ActiveUser).Power >= (9 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then           %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (9 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (124, 29)
	    Damage += ((Character (ActiveTarget).TotalSpeed - Character (ActiveTarget).Speed) div 3)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 51 then             %%% Ferenspirr
	if Character (ActiveUser).Power >= (11 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (11 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (166, 26)
	    Damage += ((Character (ActiveTarget).TotalSpeed - Character (ActiveTarget).Speed) div 3)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 52 then             %%% Silent Shadow
	if Character (ActiveUser).Power >= (15 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := 0
	    Character (ActiveTarget).Speed -= Character (ActiveTarget).Level
	    Character (ActiveTarget).ChangeSpeed := 2
	    Character (ActiveTarget).Attack += Character (ActiveTarget).Level * 5
	    Character (ActiveTarget).ChangeAttack := 3
	    Character (ActiveTarget).CritChance += Character (ActiveUser).Skill (SkillSelected).Level
	    Character (ActiveTarget).ChangeCritChance := 3
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 53 then             %%% Hunter of the night
	if Character (ActiveUser).Power >= (19 + 6 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (19 + 6 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (148, 35)
	    Damage += ((Character (ActiveTarget).TotalHealth * (5 + Character (ActiveUser).Level div 2))) div 100 + (Character (ActiveUser).TotalSpeed div 7)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 54 then             %%% Round Hauser %% Kicks in a 2x8m radius straight
	if Character (ActiveUser).Power >= (20 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (20 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget >= 10 & ActiveTarget <= 12 then
		if Character (ActiveTarget - 3).Identity not= 0 then
		    if Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (185, 25)
		    end if
		end if
	    elsif ActiveTarget <= 10 then
		if Character (ActiveTarget + 3).Identity not= 0 then
		    if Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (185, 25)
		    end if
		end if
	    end if
	    Damage := DamageFormula (185, 25)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 55 then             %%% Searing Palms %% Leeches enemy Crit Chance
	if Character (ActiveUser).Power >= (20 + 8 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (20 + 8 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (135, 35)
	    Character (ActiveUser).CritChance += Character (ActiveTarget).CritChance
	    Character (ActiveUser).ChangeCritChance := 3
	    Character (ActiveTarget).CritChance := 0
	    Character (ActiveTarget).ChangeCritChance := 2
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 56 then             %%% Buster Jam %% Damage enhanced by Crit Damage
	if Character (ActiveUser).Power >= (15 + 11 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 11 * Character (ActiveUser).Skill (SkillSelected).Level)
	    %var TempCritDamage : int
	    Damage := DamageFormula (150, 25 + Character (ActiveUser).CritDamage)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 57 then             %%% 57 Five Point Strike Random Hits on 5 other Targets
	if Character (ActiveUser).Power >= (46 + 13 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (46 + 13 * Character (ActiveUser).Skill (SkillSelected).Level)
	    var Struck : int := 0
	    for SwapTarget : 1 .. 5
		Struck := Rand.Int (7, 12)
		if Character (Struck).Identity > 0 then
		    Character (Struck).Health -= DamageFormula (110, 37)
		    Character (ActiveUser).Speed -= 1
		end if
	    end for
	    Damage := DamageFormula (110, 37)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 61 then             %%% Electrocute
	if Character (ActiveUser).Power >= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (131, 33)
	    Character (ActiveTarget).Power -= (Character (ActiveUser).Skill (SkillSelected).Level * 2)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 62 then             %%% Backhand shot
	if Character (ActiveUser).Power >= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (14 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (125, 26)
	    Character (ActiveTarget).Defense -= (Character (ActiveUser).Skill (SkillSelected).Level * 3)
	    Character (ActiveTarget).ChangeDefense := 2
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 63 then             %%% Zero Energy
	if Character (ActiveUser).Power >= (0 + 11 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (0 + 11 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (10, 111)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 65 then             %%% Thief
	if Character (ActiveUser).Power >= (0) then
	    if Damage <= 0 then
		Damage := 0
	    end if
	    ManaOk := false
	end if
    elsif SS = 64 then             %%% Electric Vortex %% Circular damage, low on edges
	if Character (ActiveUser).Power >= (27 + 12 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (27 + 12 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget = 8 or ActiveTarget = 11 then %% Mid %% Hit in Circle around target.
		for DamageSquare : 7 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (120, 44)
		    end if
		end for
	    elsif ActiveTarget = 7 or ActiveTarget = 10 then % Edge Bot
		for DamageSquare : 7 .. 11
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 9 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (120, 44)
		    end if
		end for
	    elsif ActiveTarget = 9 or ActiveTarget = 11 then % Edge Top
		for DamageSquare : 8 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 10 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (120, 44)
		    end if
		end for
	    end if
	    Damage := DamageFormula (152, 55)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 66 then             %%% Hands Blazin %%% Shoots Target + 3 random
	if Character (ActiveUser).Power >= (66 + 16 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (66 + 16 * Character (ActiveUser).Skill (SkillSelected).Level)
	    var Struck : int := 0
	    for CycleVictims : 1 .. 3
		Struck := Rand.Int (7, 12)
		if Character (Struck).Identity > 0 and Character (Struck).Health > 0 then
		    Character (Struck).Health -= DamageFormula (195, 47)
		end if
	    end for
	    Damage := DamageFormula (205, 52)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 70 then             %%% KAtanaDuelWIeld
	if Character (ActiveUser).Power >= (15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (75, 15)
	    Character (ActiveTarget).Speed += Character (ActiveTarget).TotalSpeed
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 71 then             %%% KatanaFlash
	if Character (ActiveUser).Power >= (20 + 4 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (20 + 4 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (200, 30)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 72 then             %%%Singularity
	if Character (ActiveUser).Power >= (15 + 6 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 6 * Character (ActiveUser).Skill (SkillSelected).Level)
	    %var OriginalUser : int := ActiveUser
	    for CycleParty : 1 .. 6
		if Character (CycleParty).Identity > 0 then
		    if Character (CycleParty).Health > 0 then
			%ActiveUser := CycleParty
			Damage += DamageFormula (55, 17)
		    end if
		end if
	    end for
	    %ActiveUser := OriginalUser
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 73 then            %%% Thousand SLashes
	if Character (ActiveUser).Power >= (20 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (20 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for EnemiesCycle : 7 .. 12
		if Character (EnemiesCycle).Identity > 0 & Character (EnemiesCycle).Health > 0 & EnemiesCycle not= ActiveTarget then
		    for Cyclic : 1 .. 6
			Character (EnemiesCycle).Health -= (DamageFormula (10, 1) + (4 * Character (ActiveTarget).Level))
		    end for
		end if
	    end for
	    Damage := DamageFormula (75, 11)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 74 then             %%% Focus %%%% Passive Regen Skill (2+SkillLevel)
	if Character (ActiveUser).Power >= 0 then             %%%% Is Power available to use? if not, no cast.

	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	    ManaOk := false
	end if
    elsif SS = 75 then             %%% Parry %% Increase max defense and Parry
	if Character (ActiveUser).Power >= (24 + 8 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (24 + 8 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Defense += (5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).ChangeDefense := 3
	    Character (ActiveUser).Power += (5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Health += (15 * Character (ActiveUser).Skill (SkillSelected).Level)
	    %Character (ActiveUser).ChangePower := 5
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 76 then             %%% LonelySpirit %% Attack x 2
	if Character (ActiveUser).Power >= (25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) & ActiveUser = ActiveTarget then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (25 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Attack := (2 * Character (ActiveUser).Attack) + ((Character (ActiveUser).Attack + 3 * Character (ActiveUser).Skill (SkillSelected).Level) * 40 div 100)
	    Character (ActiveUser).ChangeAttack := 1
	    Damage := 0
	else
	    ManaOk := false
	end if
    elsif SS = 77 then             %%% GodHand
	if Character (ActiveUser).Power >= (70 + 25 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (70 + 25 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (555, 160)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 80 then             %%% Gyro Burn
	if Character (ActiveUser).Power >= (1 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (1 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Power += 5
	    Damage := DamageFormula (125, 18)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 81 then             %%% Photon Blaze
	if Character (ActiveUser).Power >= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (8 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (136, 24)
	    Character (ActiveTarget).Speed += 5
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 82 then             %%% Pillars of Light
	if Character (ActiveUser).Power >= (30 + 8 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (30 + 8 * Character (ActiveUser).Skill (SkillSelected).Level)
	    var OriginalTarget : int := ActiveTarget

	    if ActiveTarget = 7 or ActiveTarget = 10 then     %% TBottom _|_
		if Character (ActiveTarget + 1).Identity > 0 & Character (ActiveTarget + 1).Health > 0 then
		    Character (ActiveTarget + 1).Health -= DamageFormula (188, 26)
		end if
		if ActiveTarget = 7 then
		    if Character (ActiveTarget + 3).Identity > 0 & Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (188, 26)
		    end if
		elsif ActiveTarget = 10 then
		    if Character (ActiveTarget - 3).Identity > 0 & Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (188, 26)
		    end if
		end if
	    elsif ActiveTarget = 8 or ActiveTarget = 11 then     %%%%%%%% Middle -+-
		if Character (ActiveTarget + 1).Identity > 0 & Character (ActiveTarget + 1).Health > 0 then
		    Character (ActiveTarget + 1).Health -= DamageFormula (188, 26)
		end if
		if Character (ActiveTarget - 1).Identity > 0 & Character (ActiveTarget - 1).Health > 0 then
		    Character (ActiveTarget - 1).Health -= DamageFormula (188, 26)
		end if
		if ActiveTarget = 8 then
		    if Character (ActiveTarget + 3).Identity > 0 & Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (188, 26)
		    end if
		elsif ActiveTarget = 11 then
		    if Character (ActiveTarget - 3).Identity > 0 & Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (188, 26)
		    end if
		end if
	    elsif ActiveTarget = 9 or ActiveTarget = 12 then     %%%%%%%% Top -[-
		if Character (ActiveTarget - 1).Identity > 0 & Character (ActiveTarget - 1).Health > 0 then
		    Character (ActiveTarget - 1).Health -= DamageFormula (188, 26)
		end if
		if ActiveTarget = 9 then
		    if Character (ActiveTarget + 3).Identity > 0 & Character (ActiveTarget + 3).Health > 0 then
			Character (ActiveTarget + 3).Health -= DamageFormula (188, 26)
		    end if
		elsif ActiveTarget = 12 then
		    if Character (ActiveTarget - 3).Identity > 0 & Character (ActiveTarget - 3).Health > 0 then
			Character (ActiveTarget - 3).Health -= DamageFormula (188, 26)
		    end if
		end if
	    end if
	    Damage := DamageFormula (210, 31)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 83 then             %%% Split Laser
	if Character (ActiveUser).Power >= (21 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (21 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for EnemiesCycle : 7 .. 12
		if Character (EnemiesCycle).Identity > 0 & Character (EnemiesCycle).Health > 0 & EnemiesCycle not= ActiveTarget then
		    Character (EnemiesCycle).Health -= DamageFormula (41, 15)
		end if
	    end for
	    Damage := DamageFormula (61, 15)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 84 then             %%% Regenerate %% HP and POWER regen passive
	if Character (ActiveUser).Power >= (0) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple

	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 85 then             %%% Photon Vortex (Heal)
	if Character (ActiveUser).Power >= (15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Health += (Character (ActiveTarget).TotalHealth * (16 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) div 100)
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 86 then             %%% Meteor Shower %%% AoE
	if Character (ActiveUser).Power >= (39 + 14 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (39 + 14 * Character (ActiveUser).Skill (SkillSelected).Level)
	    if ActiveTarget = 8 or ActiveTarget = 11 then %% Mid %% Hit in Circle around target.
		for DamageSquare : 7 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (144, 41)
		    end if
		end for
	    elsif ActiveTarget = 7 or ActiveTarget = 10 then % Edge Bot
		for DamageSquare : 7 .. 11
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 9 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (144, 41)
		    end if
		end for
	    elsif ActiveTarget = 9 or ActiveTarget = 11 then % Edge Top
		for DamageSquare : 8 .. 12
		    if Character (DamageSquare).Identity > 0 & DamageSquare not= 10 & DamageSquare not= ActiveTarget then
			Character (DamageSquare).Health -= DamageFormula (144, 41)
		    end if
		end for
	    end if
	    Damage := DamageFormula (144, 41)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 87 then             %%% Photon Explosion %% U
	if Character (ActiveUser).Power >= (81 + 23 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (81 + 23 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= 10
	    Damage := DamageFormula (601, 142)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 90 then             %%% World Edit
	if Character (ActiveUser).Power >= (13 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then             %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (13 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := (Character (ActiveTarget).TotalHealth) * 12 div 100 + (Character (ActiveTarget).TotalHealth * 2 * Character (ActiveUser).Skill (SkillSelected).Level div 100)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 91 then             %%% BloodOust
	if Character (ActiveUser).Power >= (12 + 4 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (12 + 4 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power += 2
	    Character (ActiveTarget).Health += (Character (ActiveUser).Attack * (2 + Character (ActiveUser).Skill (SkillSelected).Level))
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 92 then             %%% DemonCall
	if Character (ActiveUser).Power >= (18 + 6 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (18 + 6 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= 1
	    Damage := DamageFormula (169, 45)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 93 then             %%% Signify
	if Character (ActiveUser).Power >= (31 + 10 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (31 + 10 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= 4
	    Character (ActiveUser).Health -= (Character (ActiveTarget).Attack * (Character (ActiveUser).Skill (SkillSelected).Level) div 3)
	    Damage := DamageFormula (210, 55)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 94 then             %%% SpiritOust %% Leeches half power stolen
	if Character (ActiveUser).Power >= (23 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (23 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= (12 + 4 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveUser).Power += (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (34, 14)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 95 then             %%% Chained Links %% Lowers enemy Hp by % and stuns .5 turn
	if Character (ActiveUser).Power >= (35 + 5 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (35 + 5 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Speed += (Character (ActiveTarget).TotalSpeed div 2)
	    Damage := (Character (ActiveTarget).Health * (25 + Character (ActiveUser).Skill (SkillSelected).Level) div 100)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 96 then             %%% Destroy Nature %% AoE Damage
	if Character (ActiveUser).Power >= (33 + 19 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (33 + 19 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for CycleAll : 7 .. 12
		if Character (CycleAll).Identity > 0 and Character (CycleAll).Health > 0 & CycleAll not= ActiveTarget then
		    Character (CycleAll).Health -= DamageFormula (69, 77)
		    Character (ActiveTarget).Power -= 1
		end if
	    end for
	    Damage := DamageFormula (69, 77)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 97 then             %%% Dragon Call
	if Character (ActiveUser).Power >= (59 + 21 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (59 + 21 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= 4
	    Damage := DamageFormula (367, 120)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 100 then             %%% Center Focus
	if Character (ActiveUser).Power >= (7 + 2 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (7 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for Cycle : 1 .. 6
		if Character (Cycle).Identity > 0 then
		    if Character (Cycle).Health > 0 then
			Character (Cycle).Power += (5 + Character (ActiveUser).Skill (SkillSelected).Level)
		    end if
		end if
	    end for
	    Damage := 0
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 101 then             %%% King of Spades
	if Character (ActiveUser).Power >= (15 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (15 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (147, 28)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 102 then             %%% Queen's Mercy
	if Character (ActiveUser).Power >= (16 + 3 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (16 + 3 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Character (ActiveTarget).Power -= (5 + Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (36, 19)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 103 then             %%% Hidden Ace
	if Character (ActiveUser).Power >= (27 + 7 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (27 + 7 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (177, 35)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    elsif SS = 104 then             %%% Wise %%%% EXP Boost
	if Character (ActiveUser).Power >= 0 then            %%%% Is Power available to use? if not, no cast.
	    Damage := 0
	    ManaOk := false
	end if
    elsif SS = 105 then             %%% All Up Buff party
	if Character (ActiveUser).Power >= (40 + 15 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (40 + 15 * Character (ActiveUser).Skill (SkillSelected).Level)
	    for CycleBuff : 1 .. 6
		if Character (CycleBuff).Identity > 0 and Character (CycleBuff).Health > 0 then
		    Character (CycleBuff).Attack += 3 * Character (ActiveUser).Skill (SkillSelected).Level
		    Character (CycleBuff).Defense += 2 * Character (ActiveUser).Skill (SkillSelected).Level
		    Character (CycleBuff).Speed -= 2 * Character (ActiveUser).Skill (SkillSelected).Level
		    Character (CycleBuff).CritChance += Character (ActiveUser).Skill (SkillSelected).Level
		    Character (CycleBuff).CritDamage += 3 * Character (ActiveUser).Skill (SkillSelected).Level
		    Character (CycleBuff).ChangeAttack := 10
		    Character (CycleBuff).ChangeDefense := 10
		    Character (CycleBuff).ChangeSpeed := 10
		    Character (CycleBuff).ChangeCritChance := 10
		    Character (CycleBuff).ChangeCritDamage := 00
		end if
	    end for
	    Damage := 0
	else
	    ManaOk := false
	end if
    elsif SS = 106 then             %%% Orb Of The Past -- Swaps enemy's stats %% Full RNG
	if Character (ActiveUser).Power >= (100 + 33 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (100 + 33 * Character (ActiveUser).Skill (SkillSelected).Level)
	    var Restruction : int := 7
	    var TempSwap : int
	    for SWAPPED : 1 .. Character (ActiveUser).Skill (SkillSelected).Level
		Restruction := Rand.Int (1, 10)
		if Restruction = 1 then
		    TempSwap := Character (ActiveTarget).Defense
		    Character (ActiveTarget).Defense := Character (ActiveTarget).Attack
		    Character (ActiveTarget).Attack := TempSwap
		elsif Restruction = 2 then
		    TempSwap := Character (ActiveTarget).Attack
		    Character (ActiveTarget).Attack := Character (ActiveTarget).Defense
		    Character (ActiveTarget).Defense := TempSwap
		elsif Restruction = 3 then
		    TempSwap := Character (ActiveTarget).Power
		    Character (ActiveTarget).Power := Character (ActiveTarget).Health
		    Character (ActiveTarget).Health := TempSwap
		elsif Restruction = 4 then
		    TempSwap := Character (ActiveTarget).Power
		    Character (ActiveTarget).Power := Character (ActiveTarget).Attack
		    Character (ActiveTarget).Attack := TempSwap
		elsif Restruction = 5 then
		    TempSwap := Character (ActiveTarget).Speed
		    Character (ActiveTarget).Speed := Character (ActiveTarget).Defense
		    Character (ActiveTarget).Defense := TempSwap
		elsif Restruction = 6 then
		    TempSwap := Character (ActiveTarget).Speed
		    Character (ActiveTarget).Speed := Character (ActiveTarget).Attack
		    Character (ActiveTarget).Attack := TempSwap
		elsif Restruction = 7 then
		    TempSwap := Character (ActiveTarget).Speed
		    Character (ActiveTarget).Speed := Character (ActiveTarget).Power
		    Character (ActiveTarget).Power := TempSwap
		elsif Restruction = 8 then
		    Character (ActiveTarget).Health := Character (ActiveTarget).Health div 2
		elsif Restruction = 9 then
		    Character (ActiveTarget).Power := Character (ActiveTarget).Power div 2
		elsif Restruction = 10 then
		    Character (ActiveTarget).Attack := Character (ActiveTarget).Attack div 2
		    Character (ActiveTarget).ChangeAttack := 3
		end if
	    end for
	    Damage := DamageFormula (0, 0)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    else           %%% Hidden Ace
	if Character (ActiveUser).Power >= (16 + 1 * Character (ActiveUser).Skill (SkillSelected).Level) then            %%%% Is Power available to use? if not, no cast.
	    % Damage is Attack + Attack*40*Level + Random (-Level, Level Advantage) = 1.4 x Level.attack, Defense = Multiple
	    Character (ActiveUser).Power -= (16 + 1 * Character (ActiveUser).Skill (SkillSelected).Level)
	    Damage := DamageFormula (255, 66)
	    if Damage <= 0 then
		Damage := 0
	    end if
	else
	    ManaOk := false
	end if
    end if
    result Damage
end SkillDamage
%%%%%%%%%%%%%%%%%%%%%% displays power cost, and shows dmg possibility
var TextFormat : int := 0
proc SkillPowerCost (Name, Text : string)
    if ActiveTarget <= 6 then
	Font.Draw (Name + " -." + intstr (Character (ActiveUser).Skill (SkillSelected).Level) + ".-", Mx + 12, My - 16, FontDescriptionTitle, PowerWhite)
	Font.Draw (Text + " power", Mx + 4, My - 30, FontDescription, BorderBlue)
	Font.Draw (intstr (DamageLower) + " - " + intstr (DamageHigher) + " damage", Mx + 6, My - 50, FontDescription, Gold)
	if SkillSelected = 10 then
	end if
    elsif DraggedBaseHighlight = true then
	Font.Draw (Name + " -." + intstr (Character (ActiveUser).BaseSkill (SkillSelected).Level) + ".-", Mx - 240 + 6 + 4, My - 16, FontDescriptionTitle, PowerWhite)
	Font.Draw (Text + " power", Mx - 240 + 4, My - 30, FontDescription, BorderBlue)
	Font.Draw (intstr (DamageLower) + " - " + intstr (DamageHigher) + " damage", Mx - 240 + 4, My - 50, FontDescription, Gold)
    else
	Font.Draw (Name + " -." + intstr (Character (ActiveUser).Skill (SkillSelected).Level) + ".-", Mx - 240 + 6 + 4, My - 16, FontDescriptionTitle, PowerWhite)
	Font.Draw (Text + " power", Mx - 240 + 4, My - 30, FontDescription, BorderBlue)
	Font.Draw (intstr (DamageLower) + " - " + intstr (DamageHigher) + " damage", Mx - 240 + 4, My - 50, FontDescription, Gold)
    end if
end SkillPowerCost

proc SkillDescriptionInfo (SkillDInput : string)
    var FormatX, FormatY : int := 0
    var ClipX, ExtendX : int := 0
    FormatY := My - 90     %%%50 - 120 = 115, 95, 75
    if ActiveTarget <= 6 then
	ClipX := 2
	ExtendX := 238
	% Draw.FillBox (Mx, My, Mx + 240, My - 120, 16)
	% Draw.Box (Mx, My, Mx + 240, My - 120, BorderBlue)
	% Draw.FillBox (Mx + 2, My - 2, Mx + 240 - 2, My - 20, BorderBlue)
	% Draw.FillBox (Mx + 2, My - 20, Mx + 240 - 2, My - 32, 29)
	FormatX := 4
    else
	%  Draw.FillBox (Mx - 240, My - 120, Mx, My, 16)
	%  Draw.Box (Mx - 240, My - 120, Mx, My, BorderBlue)
	%  Draw.FillBox (Mx - 240 + 2, My - 20, Mx - 2, My - 2, BorderBlue)
	%  Draw.FillBox (Mx - 240 + 2, My - 20, Mx - 2, My - 32, 29)
	FormatX := -236
	ClipX := -2
	ExtendX := -238
    end if
    if length (SkillDInput) < 37 then
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (42), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (42), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. *), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
    elsif length (SkillDInput) < 74 then
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (28), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (28), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. 36), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (37 .. *), Mx + FormatX, My - 84, FontDescriptionSkill, ChatGrey)
    elsif length (SkillDInput) < 111 then
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (14), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (14), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. 36), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (37 .. 73), Mx + FormatX, My - 84, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (74 .. *), Mx + FormatX, My - 98, FontDescriptionSkill, ChatGrey)
    elsif length (SkillDInput) < 148 then
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (0), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (0), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. 36), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (37 .. 73), Mx + FormatX, My - 84, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (74 .. 110), Mx + FormatX, My - 98, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (111 .. *), Mx + FormatX, My - 112, FontDescriptionSkill, ChatGrey)
    elsif length (SkillDInput) < 185 then
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (-14), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (-14), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. 36), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (37 .. 73), Mx + FormatX, My - 84, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (74 .. 110), Mx + FormatX, My - 98, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (111 .. 147), Mx + FormatX, My - 112, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (148 .. *), Mx + FormatX, My - 126, FontDescriptionSkill, ChatGrey)
    else
	Draw.FillBox (Mx, My, Mx + ExtendX + ClipX, My - 120 + (0), 16)
	Draw.Box (Mx, My, Mx + ExtendX + ClipX, My - 120 + (0), BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 2, Mx + ExtendX, My - 20, BorderBlue)
	Draw.FillBox (Mx + ClipX, My - 20, Mx + ExtendX, My - 32, 29)
	Draw.Text (SkillDInput (1 .. 36), Mx + FormatX, My - 70, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (37 .. 73), Mx + FormatX, My - 84, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (74 .. 110), Mx + FormatX, My - 98, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (111 .. 147), Mx + FormatX, My - 112, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (148 .. 184), Mx + FormatX, My - 126, FontDescriptionSkill, ChatGrey)
	Draw.Text (SkillDInput (185 .. *), Mx + FormatX, My - 140, FontDescriptionSkill, ChatGrey)
    end if
end SkillDescriptionInfo

fcn CalculatePowerBase (SS : int) : int
    if SS = 1 then
	PowerCostAI := -4
    elsif SS = 2 then
	PowerCostAI := (8 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level)
    elsif SS = 3 then
	PowerCostAI := (10 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level)
    elsif SS = 4 then
	PowerCostAI := (6 + 2 * Character (ActiveUser).Skill (SkillSelected).Level)
    elsif SS = 5 then
	PowerCostAI := -5
    elsif SS = 6 then
	PowerCostAI := -4
    elsif SS = 7 then
	PowerCostAI := -6
    elsif SS = 8 then
	PowerCostAI := -4
    elsif SS = 10 then %% Sillness
	PowerCostAI := 8 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 11 then
	PowerCostAI := 21 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 12 then
	PowerCostAI := 6 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 13 then
	PowerCostAI := 11 + 4 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 14 then
	PowerCostAI := 25 + 9 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 15 then
	PowerCostAI := 13 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 16 then
	PowerCostAI := 50 + 15 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 17 then
	PowerCostAI := 33 + 14 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 20 then %% Ravness
	PowerCostAI := 5 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 21 then
	PowerCostAI := 8 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 22 then
	PowerCostAI := 11 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 23 then
	PowerCostAI := 18 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 24 then %% Ravness
	PowerCostAI := 18 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 25 then
	PowerCostAI := 28 + 1 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 26 then
	PowerCostAI := 26 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 27 then
	PowerCostAI := 10 + 10 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 30 then %% Cosseus
	PowerCostAI := 14 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 31 then
	PowerCostAI := 33 + 1 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 32 then
	PowerCostAI := 16 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 33 then
	PowerCostAI := 20 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 34 then %% Cosseus
	PowerCostAI := 33 + 1 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 36 then
	PowerCostAI := 31 + 14 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 37 then
	PowerCostAI := 40 + 12 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 40 then %%%  D _ RIn  %%% Dual Shot
	PowerCostAI := 10 + 1 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 41 then  %%% Headshot
	PowerCostAI := 7 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 42 then
	PowerCostAI := 13 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 43 then
	PowerCostAI := 21 + 6 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 44 then %%%  D _ RIn  %%% Dual Shot
	PowerCostAI := 25 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 45 then  %%% Headshot
	PowerCostAI := 35 + 8 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 50 then % Wolfe
	PowerCostAI := 9 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 51 then            %%% Ferenspirr
	PowerCostAI := 11 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 52 then            %%% Silent Shadow
	PowerCostAI := 15 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 53 then             %%% Hunter of the night
	PowerCostAI := 19 + 6 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 54 then % Wolfe
	PowerCostAI := 20 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 55 then            %%% Ferenspirr
	PowerCostAI := 20 + 8 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 56 then            %%% Silent Shadow
	PowerCostAI := 15 + 11 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 57 then             %%% Hunter of the night
	PowerCostAI := 46 + 13 * Character (ActiveUser).BaseSkill (SkillSelected).Level
	% elsif SS = 60 then
    elsif SS = 61 then %% Rage             %%% Electrocute
	PowerCostAI := 14 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 62 then             %%% Backhand shot
	PowerCostAI := 14 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 63 then             %%% Zero Energy
	PowerCostAI := 0 + 11 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 64 then %% Rage             %%% Electrocute
	PowerCostAI := 27 + 12 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 65 then             %%% Backhand shot
	PowerCostAI := 0
    elsif SS = 66 then             %%% Zero Energy
	PowerCostAI := 66 + 16 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 70 then %% Seira           %%% KAtanaDuelWIeld
	PowerCostAI := 15 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 71 then            %%% KatanaFlash
	PowerCostAI := 20 + 4 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 72 then
	PowerCostAI := 15 + 6 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 73 then
	PowerCostAI := 20 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 74 then %% Seira           %%% KAtanaDuelWIeld
	PowerCostAI := 0
    elsif SS = 75 then            %%% KatanaFlash
	PowerCostAI := 24 + 8 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 76 then
	PowerCostAI := 25 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 77 then
	PowerCostAI := 70 + 25 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 80 then %%% Zefan
	PowerCostAI := 1 + 1 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 81 then
	PowerCostAI := 8 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 82 then
	PowerCostAI := 30 + 8 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 83 then
	PowerCostAI := 21 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 84 then %%% Zefan
	PowerCostAI := 0
    elsif SS = 85 then
	PowerCostAI := 15 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 86 then
	PowerCostAI := 39 + 14 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 87 then
	PowerCostAI := 81 + 23 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 90 then %%% Cleo
	PowerCostAI := 13 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 91 then
	PowerCostAI := 12 + 4 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 92 then
	%  Character (ActiveTarget).Power -= 1
	PowerCostAI := 18 + 6 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 93 then
	%   Character (ActiveTarget).Power -= 4
	%  Character (ActiveUser).Health -= (Character (ActiveTarget).Attack * (Character (ActiveUser).BaseSkill (SkillSelected).Level) div 3)
	PowerCostAI := 31 + 10 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 94 then %%% Cleo
	PowerCostAI := 23 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 95 then
	PowerCostAI := 35 + 5 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 96 then %%% Cleo
	PowerCostAI := 33 + 19 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 97 then
	PowerCostAI := 59 + 21 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 100 then %%% Aeron
	% Focus + 5 for all party members7 + 2 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 101 then     %%% King of Spades
	PowerCostAI := 15 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 102 then        %%% Queen's Mercy
	% Character (ActiveTarget).Power -= (5 + Character (ActiveUser).BaseSkill (SkillSelected).Level)
	PowerCostAI := 16 + 3 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 103 then        %%% Hidden Ace
	PowerCostAI := 27 + 7 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 104 then     %%% King of Spades
	PowerCostAI := 0
    elsif SS = 105 then        %%% Queen's Mercy
	% Character (ActiveTarget).Power -= (5 + Character (ActiveUser).BaseSkill (SkillSelected).Level)
	PowerCostAI := 40 + 15 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    elsif SS = 106 then        %%% Hidden Ace
	PowerCostAI := 100 + 33 * Character (ActiveUser).BaseSkill (SkillSelected).Level
    else        %%% Hidden Ace
	PowerCostAI := 16 + 1 * Character (ActiveUser).Skill (SkillSelected).Level
    end if
    result PowerCostAI
end CalculatePowerBase

proc SkillDescriptionDisplay (SS : int)
    var CalSkillLevel : int := 1
    if DraggedBaseHighlight = false then
	CalSkillLevel := Character (ActiveUser).Skill (SkillSelected).Level
    else
	CalSkillLevel := Character (ActiveUser).BaseSkill (SkillSelected).Level
    end if
    % Damage := SkillDamage (SS) Causes error with skill>baseskill

    if SS = 1 then
	SkillDescriptionInfo ("[Physical] Basic slash that recovers power. Deals [100%] + " +
	    intstr (10 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (100, 10)
	SkillPowerCost ("Crescent Slash", "Recovers 4")
    elsif SS = 2 then
	Damage := DamageFormula (115, 25)
	SkillDescriptionInfo ("[Physical] Stab straight into the victim's heart, wrenching blood and absorbing health. Deals [115%] + " +
	    intstr (25 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Heart Wrench", "Costs " + intstr (8 + 2 * CalSkillLevel))
    elsif SS = 3 then
	SkillDescriptionInfo ("[Light] Magical damage of the cosmos. Call upon the birth of stars to sear the enemy. Deals [153%] + " +
	    intstr (28 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (153, 28)
	SkillPowerCost ("Nebula Burst", "Costs " + intstr (10 + 3 * CalSkillLevel))
    elsif SS = 4 then
	SkillDescriptionInfo ("[Dark] Strike and leave no trace, with the use of the shadows. Deals [131%] + " +
	    intstr (30 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (131, 30)
	SkillPowerCost ("PhantomBurst", "Costs " + intstr (6 + 2 * CalSkillLevel))
    elsif SS = 5 then
	SkillDescriptionInfo ("[Light] Basic magic that recovers power. Deals [100%] + " +
	    intstr (10 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (100, 10)
	SkillPowerCost ("Concentration", "Recovers 5")
    elsif SS = 6 then
	SkillDescriptionInfo ("[Physical] Basic gunshot that recovers power. Deals [100%] + " +
	    intstr (10 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (100, 10)
	SkillPowerCost ("Single Shot", "Recovers 4")
    elsif SS = 7 then
	SkillDescriptionInfo ("[Physical] Basic fan slap that recovers power. Deals [97%] + " +
	    intstr (11 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (97, 11)
	SkillPowerCost ("Feather Strike", "Recovers 6")
    elsif SS = 8 then         %%% QuickStrike (Regen mana)
	SkillDescriptionInfo ("[Physical] Basic strike that recovers power. Deals [101%] + " +
	    intstr (11 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (101, 11)
	SkillPowerCost ("Quick Strike", "Recovers 4")
	%%%%%%%%%%%%%%%%%%%%%%%%%%% SILLNESS FURLENSTORN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 10 then         %% Sillness
	Damage := (15 + (Character (ActiveUser).Level * 2))
	SkillDescriptionInfo ("[Buff] Places an invisible cloak on the target. Provides an additional " + intstr (Damage) + " Defense to the target for 2 turns.")
	DamageLower := 0
	DamageHigher := 0
	SkillPowerCost ("Armored Cloak", "Costs " + intstr (8 + 2 * CalSkillLevel))
    elsif SS = 11 then
	SkillDescriptionInfo ("[Physical] Slashes with crescent strike twice. Deals [240%] + " +
	    intstr (40 * CalSkillLevel) + "% Damage")
	Damage := DamageFormula (120, 20)
	DamageLower *= 2
	DamageHigher *= 2
	SkillPowerCost ("Double Impact", "Costs " + intstr (21 + 3 * CalSkillLevel))
    elsif SS = 12 then
	Damage := Character (ActiveUser).Level + 10
	SkillDescriptionInfo ("[Buff] Hastens the target's speed by " + intstr (Damage) + " for 2 turns.")
	DamageLower := 0
	DamageHigher := 0
	SkillPowerCost ("Quick Step", "Costs " + intstr (6 + 2 * CalSkillLevel))
    elsif SS = 13 then
	SkillDescriptionInfo ("[Heal] Heals a target for " + intstr ((Character (ActiveUser).Attack) - 15 + (Character (ActiveUser).Level * 2)) + " health.")
	DamageLower := 0
	DamageHigher := 0
	% Character (ActiveTarget).Health += (Character (ActiveUser).Attack) - 15 + (Character (ActiveUser).Level * 2)
	SkillPowerCost ("Rejuvenation", "Costs " + intstr (11 + 4 * CalSkillLevel))
    elsif SS = 14 then         %% Sillness
	Damage := DamageFormula (168, 26)
	SkillDescriptionInfo ("[Physical] Strike straight ahead, piercing anything in the way. Deals [168%] + " + intstr (26 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Lightning Pierce", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 15 then
	Damage := DamageFormula (139, 25)
	SkillDescriptionInfo ("[Physical] Rend the air visible, and force static to strike the foe. Deals [139%] + " + intstr (25 * CalSkillLevel) + "% Damage, and temporarily slows the enemy.")
	SkillPowerCost ("Lightning Rend", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 16 then
	Damage := DamageFormula (79, 33)
	SkillDescriptionInfo ("[AoE 'O'] Toss a loaded mine in the midst of the swarm. Deals [79%] + " + intstr (33 * CalSkillLevel) + "% Damage to all enemies within 1 position of the target")
	SkillPowerCost ("Rainbow Nuke", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 17 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Buff] Increases health and defense, can revive downed members. ")
	SkillPowerCost ("Shadow Lotus", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RAVNESS LOXAERION %%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 20 then         %% Ravness
	Damage := DamageFormula (137, 26)
	SkillDescriptionInfo ("[Physical] Slams the halberd into the enemy, causing blunt force trauma. Deals [137%] + " +
	    intstr (26 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Halberd Slam", "Costs " + intstr (5 + 2 * CalSkillLevel))
    elsif SS = 21 then
	Damage := DamageFormula (89, 14)
	% (69, 8)
	SkillDescriptionInfo ("[AoE ')'] Swings the halberd in a wide arc to slice the foe. Deals [89%] + " +
	    intstr (14 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Swinging Carve", "Costs " + intstr (8 + 2 * CalSkillLevel))
    elsif SS = 22 then
	Damage := DamageFormula (150, 17)
	SkillDescriptionInfo ("[Physical] Bashes the pole onto the enemy's head. Deals [150%] + " +
	    intstr (17 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Pole Bash", "Costs " + intstr (11 + 3 * CalSkillLevel))
    elsif SS = 23 then
	Damage := DamageFormula (162, 44)
	SkillDescriptionInfo ("[AoE '-'] Precisely stab the halberd into the enemy's neck, piercing multiple targets. Deals [162%] + " +
	    intstr (44 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Neck Penetration", "Costs " + intstr (18 + 5 * CalSkillLevel))
    elsif SS = 24 then
	Damage := DamageFormula (154, 41)
	SkillDescriptionInfo ("[Physical] Slam down and crush the opponent's armor, reducing their defense temporarily. [154%] + " + intstr (41 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Armored Destruction", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 25 then
	Damage := DamageFormula (12, 1)
	SkillDescriptionInfo ("[Buff] Revive downed members, and regain health. Recovers [12%] + " + intstr (1 * CalSkillLevel) + "% Health")
	SkillPowerCost ("Resurrect", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 26 then
	Damage := DamageFormula (91, 28)
	SkillDescriptionInfo ("[AoE ')'] Spin the halberd a multitude of times and hack away at the foe. Deals [91%] + " + intstr (28 * CalSkillLevel) + "% Damage to enemies in a column")
	SkillPowerCost ("Typhoon", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 27 then
	Damage := DamageFormula (15 + Character (ActiveUser).Power, Character (ActiveUser).Power * CalSkillLevel)
	SkillDescriptionInfo ("[Physical] Ignite the mantle below and summon an earthquake. The earth shakes, consuming all power and sacrificing it as damage." +
	    "Deals " + intstr (65 + Character (ActiveUser).Power) + " % + " + intstr (3 * Character (ActiveUser).Power * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Earthquake", "Requires " + intstr (CalculatePowerBase (SS)) + "+ to cast")
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COSSEUS REGANTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 30 then         %% Cosseus
	Damage := Character (ActiveUser).Defense
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Buff] Creates a holy force field around the target. " + intstr (Damage) + " Defense is added for 2 turns.")
	SkillPowerCost ("Divine Armor", "Costs " + intstr (14 + 3 * CalSkillLevel))
    elsif SS = 31 then
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Debuff] Decreases the attack of all foes scaled by defense. -" + intstr (Character (ActiveUser).Defense) + " attack for 1 turn.")
	%Damage := Character (Cycle).Attack -= Character (ActiveUser).Defense
	SkillPowerCost ("Crushing Roar", "Costs " + intstr (33 + 1 * CalSkillLevel))
    elsif SS = 32 then
	Damage := DamageFormula (142, 22)
	SkillDescriptionInfo ("[AoE '<'] Scathe the enemy with blinding lasers in a V shaped pattern. Deals [142%] + " +
	    intstr (22 * CalSkillLevel) + "% Damage")                                                                                  % attack to the enemy.")
	SkillPowerCost ("Multi Lasers", "Costs " + intstr (16 + 2 * CalSkillLevel))
    elsif SS = 33 then
	Damage := DamageFormula (155, 37)
	SkillDescriptionInfo ("[Physical] Hunk behind the armor and charge straight at the enemy. Sacifical damage. Deals [155%] + " +
	    intstr (37 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Body Slam", "Costs " + intstr (20 + 5 * CalSkillLevel))
    elsif SS = 34 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Debuff] Destroy enemy armor, decreasing their defense by " + intstr (Character (ActiveUser).Defense) + " for one turn.")
	SkillPowerCost ("Shield Blast", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 36 then
	Damage := DamageFormula (222, 69)
	SkillDescriptionInfo ("[AoE '-'] Fire a concentrated maser in a straight line, incinerating foes with [222%] + " + intstr (69 * CalSkillLevel) + "% of Damage")
	SkillPowerCost ("Maser Cannon", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 37 then
	Damage := DamageFormula (261, 45)
	SkillDescriptionInfo ("[Light] Consumes power to generate a quasar's gamma burst. Hits the target and has a chance for another blast, dealing [261%] + " + intstr (45 * CalSkillLevel) +
	    "% Damage")
	SkillPowerCost ("Quasar", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% D-Rin SHIBU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 40 then         %%%  D _ RIn  %%% Dual Shot
	Damage := DamageFormula (145, 7)
	SkillDescriptionInfo ("[Physical] Fire with twin revolvers at the enemy. Low ceiling. [145%] + " +
	    intstr (7 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Dual Shot", "Costs " + intstr (10 + 1 * CalSkillLevel))
    elsif SS = 41 then         %%% Headshot
	Damage := DamageFormula (70, 70)
	SkillDescriptionInfo ("[Physical] Snipes the enemy with a rifle, dealing high damage. High ceiling. Deals [70%] + " +
	    intstr (70 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Headshot", "Costs " + intstr (7 + 7 * CalSkillLevel))
    elsif SS = 42 then
	Damage := DamageFormula (40, 15)
	SkillDescriptionInfo ("[Physical] Spin a circle, firing the magazine at supersonic speed. Deals [40%] + " +
	    intstr (15 * CalSkillLevel) + "% to all enemies.")
	% Character (EnemiesCycle).Health -= DamageFormula (40, 8)
	SkillPowerCost ("Spinfire", "Costs " + intstr (13 + 3 * CalSkillLevel))
    elsif SS = 43 then
	Damage := DamageFormula (156, 27)
	SkillDescriptionInfo ("[XFactor] Increase the chance to crit with self meditation while firing blind. Deals [156%] + " +
	    intstr (27 * CalSkillLevel) + "% Damage, and adds 10% critchance for 2 turns.")
	%    Character (ActiveUser).CritChance += 10 + (Character (ActiveUser).Level)
	%    Character (ActiveUser).ChangeCritChance := 2
	SkillPowerCost ("Critical Shot", "Costs " + intstr (21 + 6 * CalSkillLevel))
    elsif SS = 44 then
	Damage := DamageFormula (74, 15)
	SkillDescriptionInfo ("[CC] Restrain the enemy for 2 turns under binding bullets. Deals [74%] + " + intstr (15 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Restrain Shot", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 45 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[XFactor] Infect the enemy, reducing their health by " + intstr (15 + (CalSkillLevel)) + "% and dealing [100%] + " + intstr (25 * CalSkillLevel) + "% of Damage")
	SkillPowerCost ("Virus Shot", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WOLFE SHANE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 50 then         % Wolfe
	Damage := DamageFormula (124, 29)
	Damage += ((Character (ActiveTarget).TotalSpeed - Character (ActiveTarget).Speed) div 3)
	SkillDescriptionInfo ("[Physical] Strike the enemy with the claws, additional scaling to how close their turn is. Deals [124%] + " +
	    intstr (29 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Clawe gash", "Costs " + intstr (9 + 3 * CalSkillLevel))
    elsif SS = 51 then            %%% Ferenspirr
	Damage := DamageFormula (166, 26)
	%  Damage += ((Character (ActiveTarget).TotalSpeed - Character (ActiveTarget).Speed) div 3)
	SkillDescriptionInfo ("[Light] Fire a spirit of the earth at the enemy, digging through their flesh. Deals [166%] + " +
	    intstr (26 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Ferenspirr", "Costs " + intstr (11 + 5 * CalSkillLevel))
    elsif SS = 52 then            %%% Silent Shadow
	DamageLower := 0
	DamageHigher := 0
	% Character (ActiveTarget).Speed -= Character (ActiveTarget).Level
	% Character (ActiveTarget).ChangeSpeed := 2
	% Character (ActiveTarget).Attack += Character (ActiveTarget).Level * 5
	% Character (ActiveTarget).ChangeAttack := 3
	% Character (ActiveTarget).CritChance += CalSkillLevel
	% Character (ActiveTarget).ChangeCritChance := 3
	SkillDescriptionInfo ("[Buff] " + intstr (Character (ActiveTarget).Level) +
	    " Speed increase, " + intstr (Character (ActiveTarget).Level * 5) +
	    " Attack increase, and " + intstr (CalSkillLevel) +
	    "% Crit Chance increase. Lasts 2, 3, and 3 turns respectively.")
	SkillPowerCost ("Silent Shadow", "Costs " + intstr (15 + 5 * CalSkillLevel))
    elsif SS = 53 then             %%% Hunter of the night
	Damage := DamageFormula (148, 35)
	SkillDescriptionInfo ("[XFactor] Strike viciously with all weapons, sword or bone. Deals [148%] + " +
	    intstr (35 * CalSkillLevel) + "% Damage plus an additional " +
	    intstr ((((Character (ActiveTarget).TotalHealth * (5 + Character (ActiveUser).Level div 2))) div 100) + (Character (ActiveUser).TotalSpeed div 7)) + " damage.")
	%  Damage += ((Character (ActiveTarget).TotalHealth * (5 + Character (ActiveUser).Level div 2))) div 100 + (Character (ActiveUser).TotalSpeed div 7)

	SkillPowerCost ("Hunter of the Night", "Costs " + intstr (19 + 6 * CalSkillLevel))
    elsif SS = 54 then
	Damage := DamageFormula (185, 25)
	SkillDescriptionInfo ("[AoE '-'] Perform an aerial spinning kick into the fray. Deals [185%] + " + intstr (25 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Roundhauser", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 55 then
	Damage := DamageFormula (135, 35)
	SkillDescriptionInfo ("[XFactor] Strike the vitals of the opponent, leeching their critical stats. Deals [135%] + " + intstr (35 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Searing Palms", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 56 then
	Damage := DamageFormula (150, 25 + Character (ActiveUser).CritDamage)
	SkillDescriptionInfo ("[Physical] Jam the sword forcefully down the opponent's throat, damage increasing with crit damage. Deals [150%] + " + intstr (25 + Character (ActiveUser).CritDamage) +
	    "% Damage")
	SkillPowerCost ("Buster Jam", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 57 then
	Damage := DamageFormula (110, 37)
	SkillDescriptionInfo ("[Physical] Javelin the buster into the first enemy, splitting the clone swords to strike 1-5 random targets. Deals [110%] + " + intstr (37 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Five Point Strike", "Costs " + intstr (CalculatePowerBase (SS)))
	% elsif SS = 60 then
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RAGE RHINSTONE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 61 then         %% Rage             %%% Electrocute
	Damage := DamageFormula (131, 33)
	%  Character (ActiveTarget).Power -= (CalSkillLevel * 2)
	SkillDescriptionInfo ("[Light] Fire a whirlstorm circuit at an enemy and introduce them to modern technology. [131%] + " +
	    intstr (33 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Electrocute", "Costs " + intstr (14 + 3 * CalSkillLevel))
    elsif SS = 62 then             %%% Backhand shot
	Damage := DamageFormula (125, 26)
	%    Character (ActiveTarget).Defense -= (CalSkillLevel * 3)
	%    Character (ActiveTarget).ChangeDefense := 2
	SkillDescriptionInfo ("[Physical] Fire a gunshot blind, with an outstretched arm behind. [126%] + " +
	    intstr (26 * CalSkillLevel) + "% Damage and decreases the target's defense for 2 turns.")
	SkillPowerCost ("Backhand shot", "Costs " + intstr (14 + 3 * CalSkillLevel))
    elsif SS = 63 then             %%% Zero Energy
	Damage := DamageFormula (10, 111)
	SkillDescriptionInfo ("[Light] Summon a vortex and effortlessly vacuum the space in front of you. Scales extremely well. [10%] + " +
	    intstr (111 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Zero Energy", "Costs " + intstr (0 + 11 * CalSkillLevel))
    elsif SS = 64 then
	Damage := DamageFormula (152, 55)
	SkillDescriptionInfo ("[Hybrid] Create a whirlwind with electricity and devour enemies in a radius. Deals [152%] + " + intstr (55 * CalSkillLevel) +
	    "% Damage to the target, lower to surrounding foes.")
	SkillPowerCost ("Electric Vortex", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 65 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Passive] Having this passive in your loaded skills increases your silver gained.")
	SkillPowerCost ("Thief", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 66 then
	Damage := DamageFormula (205, 52)
	SkillDescriptionInfo ("[Physical] Fire full magazine pistols in all directions, dancing in the chaos. Connects 1-4 shots. Deals [205%] + " + intstr (52 * CalSkillLevel) + "% per shot")
	SkillPowerCost ("Hands Blazin'", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SEIRA VON HERAIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 70 then         %% Seira           %%% KAtanaDuelWIeld
	Damage := DamageFormula (75, 15)
	%   Character (ActiveTarget).Speed += Character (ActiveTarget).TotalSpeed
	SkillDescriptionInfo ("[XFactor] Slinging 2 katanas, stun the enemy for one turn, and deal [75%] + " +
	    intstr (15 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Katana Dual Wield", "Costs " + intstr (15 + 2 * CalSkillLevel))
    elsif SS = 71 then            %%% KatanaFlash
	Damage := DamageFormula (200, 30)
	SkillDescriptionInfo ("[Physical] Unleash the katana in a split second, cutting through bone and flesh. [200%] + " +
	    intstr (30 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Katana Flash", "Costs " + intstr (20 + 4 * CalSkillLevel))
    elsif SS = 72 then
	DamageLower := 0
	DamageHigher := 0
	for CycleParty : 1 .. 6
	    if Character (CycleParty).Identity > 0 then
		if Character (CycleParty).Health > 0 then
		    DamageLower += ((Character (ActiveUser).Attack * 55 div 100
			+ (Character (ActiveUser).Attack * 17 div 100 * CalSkillLevel))
			* (100 - Character (ActiveTarget).Defense)) div 100
		    DamageHigher += ((Character (ActiveUser).Attack * 55 div 100
			+ (Character (ActiveUser).Attack * 17 div 100 * CalSkillLevel))
			* (100 - Character (ActiveTarget).Defense)) div 100
		end if
	    end if
	end for
	DamageLower -= (5 * Character (ActiveTarget).Level)
	DamageHigher += (5 * Character (ActiveTarget).Level)
	SkillDescriptionInfo ("[XFactor] Gather the moral of your team to strike the foe. Damage increases with party size. [55%] + " +
	    intstr (17 * CalSkillLevel) + "% Damage per member.")
	SkillPowerCost ("Singularity", "Costs " + intstr (15 + 6 * CalSkillLevel))
    elsif SS = 73 then
	Damage := DamageFormula (75, 11)
	SkillDescriptionInfo ("[Physical] Cut every enemy in the field with blazing speed. [10%] + " +
	    intstr (1 * CalSkillLevel) + "% Damage 6 times to all enemies.")
	SkillPowerCost ("Thousand Slashes", "Costs " + intstr (20 + 3 * CalSkillLevel))
    elsif SS = 74 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Passive] While this skill is loaded, passive power regen is increased.")
	SkillPowerCost ("Focus", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 75 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Buff] Increases defense for 5 turns, and slightly increases power.")
	SkillPowerCost ("Parry", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 76 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Buff] Increases attack for the next turn to 240% + " + intstr (CalSkillLevel * 3) + "% Damage")
	SkillPowerCost ("Lonely Spirit", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 77 then
	Damage := DamageFormula (555, 160)
	SkillDescriptionInfo ("[Ultimate] Conform the location to your liking and strike fury into the disabling barrier. Deals [555%] + " + intstr (160 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("God Hand", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ZEFAN DE LUNE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 80 then         %%% Zefan
	Damage := DamageFormula (125, 18)
	SkillDescriptionInfo ("[Light] Propel a basic magic-type orb that recovers some power. [125%] + " +
	    intstr (18 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Gyroburn", "Recovers 5, Costs " + intstr (1 + 1 * CalSkillLevel))
    elsif SS = 81 then
	Damage := DamageFormula (136, 24)
	%  Character (ActiveTarget).Speed += 5
	SkillDescriptionInfo ("[XFactor] Lob an orbital energy ball at the enemy and increase their turn duration. [136%] + " +
	    intstr (24 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Photon Blaze", "Costs " + intstr (8 + 2 * CalSkillLevel))
    elsif SS = 82 then
	Damage := DamageFormula (210, 31)
	SkillDescriptionInfo ("[AoE '+'] Generate a massive flash of light to consume enemies adjacent to the victim. [210%] + " +
	    intstr (31 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Pillar of Light", "Costs " + intstr (30 + 8 * CalSkillLevel))
    elsif SS = 83 then
	Damage := DamageFormula (66, 15)         % All enemies
	SkillDescriptionInfo ("[Light] Fire photons of light in all directions, burning holes in the foe. [66%] + " +
	    intstr (15 * CalSkillLevel) + "% Damage to all opponents.")
	SkillPowerCost ("Split Beam Lasers", "Costs " + intstr (21 + 5 * CalSkillLevel))
    elsif SS = 84 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Passive] While this skill is loaded, Health and Power regeneration are increased.")
	SkillPowerCost ("Regenerate", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 85 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Heal] Recovers health for any target. Regens [16%] + " + intstr (3 * CalSkillLevel) + "% total Health")
	SkillPowerCost ("Photon Vortex", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 86 then
	Damage := DamageFormula (144, 41)
	SkillDescriptionInfo ("[AoE 'O'] Casts into the air, creating simulated comets to fly into the ground. Deals [144%] + " + intstr (41 * CalSkillLevel) + "% Damage to all adjacent enemies.")
	SkillPowerCost ("Meteor Shower", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 87 then
	Damage := DamageFormula (601, 142)
	SkillDescriptionInfo ("[Ultimate] Drain the energy in the surrounding hectare and combust a nuclear photon explosion. Deals [601%] + " + intstr (142 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Photon Ultima", "Costs " + intstr (CalculatePowerBase (SS)))
	%$%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLEO SUCCUBUS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 90 then         %%% Cleo
	Damage := (Character (ActiveTarget).TotalHealth) * 12 div 100 + (Character (ActiveTarget).TotalHealth * 2 * CalSkillLevel div 100)

	SkillDescriptionInfo ("[Demonic] Cut the victim and severe their tie to life. [12%] + " +
	    intstr (Character (ActiveTarget).TotalHealth * 2 * CalSkillLevel div 100) + "% of their total hp removed.")
	SkillPowerCost ("World Edit", "Costs " + intstr (13 + 7 * CalSkillLevel))
    elsif SS = 91 then
	% Character (ActiveTarget).Power += 2
	% Character (ActiveTarget).Health += (Character (ActiveUser).Attack * (2 + CalSkillLevel))

	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[XFactor] Recover the target 2 focus and " +
	    intstr (Character (ActiveUser).Attack * (2 + CalSkillLevel)) + " Health.")
	SkillPowerCost ("Blood Oust", "Costs " + intstr (12 + 4 * CalSkillLevel))
    elsif SS = 92 then
	%  Character (ActiveTarget).Power -= 1
	Damage := DamageFormula (169, 45)
	SkillDescriptionInfo ("[Demonic] Summon an underling to leap on the prey, savagely clawing in vengeance. [169%] + " +
	    intstr (45 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Demon Call", "Costs " + intstr (18 + 6 * CalSkillLevel))
    elsif SS = 93 then
	%   Character (ActiveTarget).Power -= 4
	%  Character (ActiveUser).Health -= (Character (ActiveTarget).Attack * (CalSkillLevel) div 3)
	Damage := DamageFormula (210, 55)
	SkillDescriptionInfo ("[Demonic] Burn a beam onto the enemy, and destroy them with demonic energy. [210%] + " +
	    intstr (55 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Signify", "Costs " + intstr (31 + 10 * CalSkillLevel))
    elsif SS = 94 then
	Damage := DamageFormula (34, 14)
	SkillDescriptionInfo ("[XFactor] Strain and reflect the power of the enemy, then tear it away with a blinding force. Deals [34%] + " + intstr (14 * CalSkillLevel) + "% Damage and leeches " +
	    intstr (12 + 4 * CalSkillLevel) + " power, taking in 50%.")
	SkillPowerCost ("Spirit Oust", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 95 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[CC] Remove 25% of the victim's current health, and stuns them for half a turn. Deals " + intstr ((Character (ActiveTarget).Health * (25 +
	    CalSkillLevel) div 100)) + " Damage")
	SkillPowerCost ("Chained Links", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 96 then
	Damage := DamageFormula (69, 77)
	SkillDescriptionInfo ("[AoE] Summon whorls of demonic energy to flood the space and vapourize all foes. Deals [69%] + " + intstr (77 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Destroy Nature", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 97 then
	Damage := DamageFormula (367, 120)
	SkillDescriptionInfo ("[Ultimate] Sick an undead dragon to feed on your prey. Deals [367%] + " + intstr (120 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Dragon Call", "Costs " + intstr (CalculatePowerBase (SS)))
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AERON  CAS  GRAE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elsif SS = 100 then         %%% Aeron
	% Focus + 5 for all party members
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Light] Bring forth focus to all    allies, restoring " + intstr (5 + CalSkillLevel) + " power.")
	SkillPowerCost ("Center Focus", "Costs " + intstr (7 + 2 * CalSkillLevel))
    elsif SS = 101 then         %%% King of Spades
	Damage := DamageFormula (147, 28)
	SkillDescriptionInfo ("[Light] Summon the King of Spades to smite the foe with his highness. [147%] + " +
	    intstr (28 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("King of Spades", "Costs " + intstr (15 + 3 * CalSkillLevel))
    elsif SS = 102 then         %%% Queen's Mercy
	% Character (ActiveTarget).Power -= (5 + CalSkillLevel)
	Damage := DamageFormula (36, 19)
	SkillDescriptionInfo ("[XFactor] Summons the Queen to remove " +
	    intstr (5 + CalSkillLevel) + " focus from enemies. Also deals [36%] " +
	    intstr (19 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Queen's Mercy", "Costs " + intstr (16 + 3 * CalSkillLevel))
    elsif SS = 103 then         %%% Hidden Ace
	Damage := DamageFormula (177, 35)
	SkillDescriptionInfo ("[Light] Take out the trump card and summon it against the enemy, allowing it to take life. [177%] + " +
	    intstr (35 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Hidden Ace", "Costs " + intstr (27 + 7 * CalSkillLevel))
    elsif SS = 104 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Passive] While this skill is loaded, all experience gained is increased.")
	SkillPowerCost ("Wise", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 105 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Party Buff] Increases all offensive and defensive stats of party members for 10 turns.")
	SkillPowerCost ("All Up!", "Costs " + intstr (CalculatePowerBase (SS)))
    elsif SS = 106 then
	Damage := 0
	DamageLower := 0
	DamageHigher := 0
	SkillDescriptionInfo ("[Ultimate] Randomizes the stats of the opponent, traveling back and changing time. " + intstr (CalSkillLevel) + " rolls.")
	SkillPowerCost ("Orb of the Past", "Costs " + intstr (CalculatePowerBase (SS)))
    else        %%% Hidden Ace
	Damage := DamageFormula (255, 66)
	SkillDescriptionInfo ("[Generic] Skill unassigned, filler text. [255%] + " +
	    intstr (66 * CalSkillLevel) + "% Damage")
	SkillPowerCost ("Generic", "Costs " + intstr (27 + 7 * CalSkillLevel))
    end if
end SkillDescriptionDisplay

proc SkillAnimation (SS : int)

end SkillAnimation

proc SkillCast
    %% Animation
    ManaOk := true
    Damage := 0
    DamageLower := 0
    DamageHigher := 0
    if Character (ActiveUser).Skill (SkillSelected).Level > 0 then
	%SkillAnimation (SkillSelected)             % (ActiveUser, ActiveTarget)
	Damage := SkillDamage (Character (ActiveUser).Skill (SkillSelected).SkillID)
	if ManaOk = false then
	else
	    Character (ActiveTarget).Health -= Damage
	    if Character (ActiveTarget).Health < 0 then
		Character (ActiveTarget).Health := 0
	    end if
	    %Font.Draw (intstr (Damage), 516, 52, Font13, PowerWhite)
	    View.Update
	    delay (300)
	end if
    end if
    if ManaOk = true then
	Cast := false
	Animating := true
	FinishedTurn := false
	AnimateCounter := 1
	AnimateDelay := 0
    elsif ManaOk = false then
	Cast := false
	FinishedTurn := false
    end if
end SkillCast
