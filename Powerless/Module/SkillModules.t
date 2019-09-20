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
