% Character.t

var stackNum : int := 9 %% Number of active buffs/debuffs allowed
% type Character Variable
type characterInfo :
    record
	name : string %
	level : int % 1 - 10
	rank : int % C, B, A, S, EX
	sprite : int
	avatar : int

	% Stats
	health : real
	armor : real
	attack : real
	speed : int

	% Skill 1D+
	dOne : skillInfo % 1 - 5
	dTwo : skillInfo
	dFour : skillInfo
	passive : passiveInfo % 1 - 3

	% Battle Functions & Variables & Status
	tempHealth : real
	tempArmor : real
	tempSpeed : int

	% Debuff/Buff will be in seperate array in Battle.t
	stunTime : array 0 .. 9 of int
	poisonTime : array 0 .. 9 of int
	enhanceTime : array 0 .. 9 of int
	resistTime : array 0 .. 9 of int
	vulnTime : array 0 .. 9 of int
	exhaustTime : array 0 .. 9 of int
	taunt : int

	% Equipment
	weapon : weaponInfo
	garb : garbInfo

    end record

%%% Characters are of type "characterStat"
var cEmpty : characterInfo

% null puppet
cEmpty.name := "empty"
cEmpty.level := 0
cEmpty.rank := 0
cEmpty.sprite := ExitFalse
cEmpty.avatar := ExitFalse
cEmpty.health := 0
cEmpty.armor := 0
cEmpty.attack := 0
cEmpty.speed := 0
cEmpty.dOne := sEmpty
cEmpty.dTwo := sEmpty
cEmpty.dFour := sEmpty
cEmpty.passive := pEmpty
cEmpty.tempHealth := 0
cEmpty.tempArmor := 0
%cEmpty.tempAttack := 0
cEmpty.tempSpeed := 0
for a : 0 .. stackNum
    cEmpty.stunTime (a) := 0
    cEmpty.poisonTime (a) := 0
    cEmpty.enhanceTime (a) := 0
    cEmpty.resistTime (a) := 0
    cEmpty.vulnTime (a) := 0
    cEmpty.exhaustTime (a) := 0
end for
cEmpty.weapon := wEmpty
cEmpty.garb := gEmpty

% Basic Char avatar (Permanent)
var cDragon : characterInfo := cEmpty % Dragon
var cBlue : characterInfo := cEmpty % Blue
var cJuly : characterInfo := cEmpty % July
% << Character DRAGON >>
cDragon.name := "Dragon"
cDragon.sprite := DragonSprite
cDragon.avatar := DragonAvatar
cDragon.dOne := dragonSkill (0, 0)
cDragon.dTwo := dragonSkill (1, 0)
cDragon.dFour := dragonSkill (2, 0)
cDragon.weapon.wName := "System Blade"
cDragon.garb.gName := "Half Scale"

cDragon.level := 1 % Level 1, Base Stats
cDragon.rank := 0
cDragon.health := 3000
cDragon.armor := 3600
cDragon.attack := 610
%cDragon.tempHealth := cDragon.health
cDragon.tempArmor := 0
cDragon.tempSpeed := cDragon.speed
% << Character BLUE >>
cBlue.name := "Blue"
cBlue.sprite := BlueSprite
cBlue.avatar := BlueAvatar
cBlue.dOne := blueSkill (0, 0)
cBlue.dTwo := blueSkill (1, 0)
cBlue.dFour := blueSkill (2, 0)
cBlue.weapon.wName := "Murder's Scythe"
cBlue.garb.gName := "Black Collar"

cBlue.level := 1
cBlue.rank := 0
cBlue.health := 2600
cBlue.armor := 2500
cBlue.attack := 770
% << Character July >>
cJuly.name := "July"
cJuly.sprite := JulySprite
cJuly.avatar := JulyAvatar
cJuly.dOne := julySkill (0, 0)
cJuly.dTwo := julySkill (1, 0)
cJuly.dFour := julySkill (2, 0)
cJuly.weapon.wName := "Diamory"
cJuly.garb.gName := "Cardiform"

cJuly.level := 1
cJuly.rank := 0
cJuly.health := 2800
cJuly.armor := 2800
cJuly.attack := 700

