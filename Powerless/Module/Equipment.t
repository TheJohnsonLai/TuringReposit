% Weapons & Armor -

type weaponInfo :
    record
	wName : string
	wPower : real
	wSpeed : int

    end record

type garbInfo :
    record
	gName : string
	gHealth : real
	gArmor : real

    end record

var wEmpty : weaponInfo
var gEmpty : garbInfo

wEmpty.wName := "Weapon"
wEmpty.wPower := 0
wEmpty.wSpeed := 0

gEmpty.gName := "Garb"
gEmpty.gHealth := 0
gEmpty.gArmor := 0
