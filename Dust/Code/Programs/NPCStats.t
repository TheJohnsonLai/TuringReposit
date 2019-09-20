% Procedures for enemy statistics and teammates
% Contains all stats
% List of Friendlies [FRIENDLY1]

proc nothing
    NiceHp := 0
    NiceTHp := 0
    NiceMana := 0
    NiceTMana := 0
    NiceDamage := 0
    NiceIntelligence := 0
    NiceSpeed := 0
end nothing

proc Roque
    NiceHp := round (1800 * 1.26 ** Level)
    NiceTHp := 1800 * Level
    NiceMana := 5
    NiceTMana := 5
    NiceDamage := 1 * Level
    NiceIntelligence := 1 * Level
    NiceSpeed := 1
end Roque

proc Bunion
    NiceHp := round (400 * 1.28 ** Level)
    NiceTHp := NiceHp
    NiceMana := 60
    NiceTMana := 60
    NiceDamage := 30 * Level
    NiceIntelligence := 50 * Level
    NiceSpeed := 55
end Bunion

proc Hairi
    NiceHp := 500 * 1.26 ** Level * 100 div 100
    NiceTHp := NiceHp
    NiceMana := 15
    NiceTMana := 15
    NiceDamage := 70 * Level
    NiceIntelligence := 0 * Level
    NiceSpeed := 30
end Hairi

proc GhostBunny
    NiceHp := 800 * 1.29 ** Level * 100 div 100
    NiceTHp := NiceHp
    NiceMana := 150
    NiceTMana := 600
    NiceDamage := 80 * Level
    NiceIntelligence := 106 * Level
    NiceSpeed := 50
end GhostBunny

proc Dolphi
    NiceHp := 500 * 1.31 ** Level * 100 div 100
    NiceTHp := NiceHp
    NiceMana := 700
    NiceTMana := 700
    NiceDamage := 400 * Level
    NiceIntelligence := 80 * Level
    NiceSpeed := 180
end Dolphi

proc Hushsh
    NiceHp := round (960 * 1.28 ** Level)
    NiceTHp := NiceHp
    NiceMana := 500
    NiceTMana := 550
    NiceDamage := 130 * Level
    NiceIntelligence := 219 * Level
    NiceSpeed := 78
end Hushsh

proc Turtle
    NiceHp := round (2000 * 1.32 ** Level)
    NiceTHp := NiceHp
    NiceMana := 700
    NiceTMana := 800
    NiceDamage := 200 * Level
    NiceIntelligence := 60 * Level
    NiceSpeed := 35
end Turtle

proc Drigo
    NiceHp := round (450 * 1.4 ** Level)
    NiceTHp := NiceHp + 99
    NiceMana := 450
    NiceTMana := 550
    NiceDamage := 455 * Level
    NiceIntelligence := 180 * Level
    NiceSpeed := 350
end Drigo

proc Lukvel_
    NiceHp := round (3500 * 1.27 ** Level)
    NiceTHp := NiceHp + 1
    NiceMana := 17000
    NiceTMana := 18000
    NiceDamage := 560 * 1.26 ** Level
    NiceIntelligence := 300 * Level
    NiceSpeed := 96
end Lukvel_

proc Ravness_
    NiceHp := round (2200 * 1.25 ** Level)
    NiceTHp := NiceHp
    NiceMana := 1400 * Level
    NiceTMana := 1400 * Level
    NiceDamage := 475 * 1.25 ** Level
    NiceIntelligence := 140 * Level
    NiceSpeed := 20 * Level
end Ravness_

proc Joe_
    NiceHp := round (2560 * 1.28 ** Level)
    NiceTHp := NiceHp
    NiceMana := 1180 * Level
    NiceTMana := 1180 * Level
    NiceDamage := 866 * 1.33 ** Level
    NiceIntelligence := 600 * Level
    NiceSpeed := 202 * Level
end Joe_

proc NaLong_
    NiceHp := round (1679 * 1.265 ** Level)
    NiceTHp := NiceHp
    NiceMana := 1200 * Level
    NiceTMana := 1200 * Level
    NiceDamage := 535 * 1.25 ** Level
    NiceIntelligence := 180 * Level
    NiceSpeed := 77 * Level
end NaLong_

proc Jasqur_
    NiceHp := round (2800 * 1.28 ** Level )
    NiceTHp := NiceHp
    NiceMana := 1000 * Level
    NiceTMana := 1000 * Level
    NiceDamage := 380 * 1.23 ** Level
    NiceIntelligence := 85 * Level
    NiceSpeed := 24 * Level
end Jasqur_

proc GongsunSheng_
    NiceHp := round (3523 * 1.34 ** Level)
    NiceTHp := NiceHp
    NiceMana := 1675 * Level
    NiceTMana := 1680 * Level
    NiceDamage := 375 * 1.32 ** Level
    NiceIntelligence := round (341 * 1.32 ** Level )
    NiceSpeed := 12 * Level
end GongsunSheng_

proc Seyla_
    NiceHp := round (1780 * 1.37 ** Level )
    NiceTHp := NiceHp
    NiceMana := 1000 * Level
    NiceTMana := 1000 * Level
    NiceDamage := 745 * 1.31 ** Level
    NiceIntelligence := 233 * Level
    NiceSpeed := 99 * Level
end Seyla_
% List of Officers

proc Olba_
    EnemyHp := 1700 * Level
    EnemyTHp := 1700 * Level
    EnemyTMana := 3300
    EnemyMana := 3300
    EnemyDamage := 200 * Level
    EnemyIntelligence := 346 * Level
    EnemySpeed := 22 * Level
    EnemyMoney := 1 * Level
    EnemyExperience := 34 * Level
end Olba_

proc Rebel_
    EnemyHp := 1344 * Level
    EnemyTHp := 1345 * Level
    EnemyTMana := 260
    EnemyMana := 260
    EnemyDamage := 100 * Level
    EnemyIntelligence := 90 * Level
    EnemySpeed := 33 * Level
    EnemyMoney := 20 * Level
    EnemyExperience := 5 * Level
end Rebel_

proc Jexclim_
    EnemyHp := round (5000 * 1.2 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 400
    EnemyMana := 400
    EnemyDamage := 180 * 1.23 ** Level
    EnemyIntelligence := 70
    EnemySpeed := 55
    % EnemyMoney := Rand.Int (11, 15) * Level
    % EnemyExperience := Rand.Int (11, 15) * Level
end Jexclim_

proc Glacius_
    EnemyHp := round (Rand.Int (3500, 3599) * 1.19 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 2514
    EnemyMana := 500
    EnemyDamage := 350 * 1.21 ** Level
    EnemyIntelligence := 600 * Level
    EnemySpeed := 108
    %EnemyMoney := Rand.Int (11, 15) * Level
    % EnemyExperience := Rand.Int (11, 15) * Level
end Glacius_

proc Senso_
    EnemyHp := round (2000 * 1.17 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 340 * Level
    EnemyMana := 340 * Level
    EnemyDamage := 150 * 1.41 ** Level
    EnemyIntelligence := 66
    EnemySpeed := 30 * Level
    %EnemyMoney := Rand.Int (11, 15) * Level
    %EnemyExperience := Rand.Int (11, 15) * Level
end Senso_

% List of Foes

% Sparring
proc ZenoPracticeDummyArcher
    EnemyHp := round (Rand.Int (800, 850) * 1.3 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 70
    EnemyExperience := 8 * Level
end ZenoPracticeDummyArcher
proc ZenoPracticeDummyMelee
    EnemyHp := round (Rand.Int (4400, 4500) * 1.4 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 10
    EnemyExperience := 8 * Level
end ZenoPracticeDummyMelee
proc ZenoPracticeDummyGunner
    EnemyHp := round (Rand.Int (670, 730) * 1.34 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 62
    EnemyExperience := 8 * Level
end ZenoPracticeDummyGunner
proc ZenoPracticeDummyMagic
    EnemyHp := round (Rand.Int (590, 645) * 1.3 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 15
    EnemyExperience := 8 * Level
end ZenoPracticeDummyMagic
proc ZenoPracticeDummyMixed
    EnemyHp := Rand.Int (590, 1500) * Level
    EnemyTHp := EnemyHp
    EnemyTMana := 0
    EnemyMana := 0
    EnemySpeed := 15
    EnemyExperience := 10 * Level
end ZenoPracticeDummyMixed
% Foes

proc GBMage
    EnemyHp := round (Rand.Int (500, 700) * 1.27 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 50
    EnemyMana := 50
    EnemyDamage := 110 * 1.25 ** Level
    EnemyIntelligence := 100
    EnemySpeed := 36
    EnemyMoney := 12 * Level
    EnemyExperience := 19
end GBMage

proc GBGunner
    EnemyHp := round (Rand.Int (579, 600) * 1.29 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 30
    EnemyMana := 30
    EnemyDamage := 120 * 1.25 ** Level
    EnemyIntelligence := 50
    EnemySpeed := 50
    EnemyMoney := 10 * Level
    EnemyExperience := 15
end GBGunner

proc GBPike
    EnemyHp := round (Rand.Int (800, 900) * 1.3 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 15
    EnemyMana := 15
    EnemyDamage := 75 * 1.25 ** Level
    EnemyIntelligence := 20
    EnemySpeed := 10
    EnemyMoney := 4 * Level
    EnemyExperience := 8
end GBPike

proc GBSword
    EnemyHp := round (Rand.Int (970, 1000) * 1.35 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 17
    EnemyMana := 17
    EnemyDamage := 59 * 1.25 ** Level
    EnemyIntelligence := 36
    EnemySpeed := 19
    EnemyMoney := 4 * Level
    EnemyExperience := 8
end GBSword

proc HighwayBandit
    EnemyHp := round (Rand.Int (350, 1820) * 1.31 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 100
    EnemyMana := 60
    EnemyDamage := 69 * 1.25 ** Level
    EnemyIntelligence := 30
    EnemySpeed := 45
    EnemyMoney := Rand.Int (11, 15) * Level
    EnemyExperience := Rand.Int (11, 15) * Level
end HighwayBandit

proc Rogue
    EnemyHp := round (Rand.Int (1650, 1700) * 1.26 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 75
    EnemyMana := 10
    EnemyDamage := Rand.Int (75, 150) * 1.25 ** Level
    EnemyIntelligence := 63
    EnemySpeed := 78
    EnemyMoney := Rand.Int (6, 22) * Level
    EnemyExperience := Rand.Int (5, 9) * Level
end Rogue


proc Cadet
    EnemyHp := round (Rand.Int (1700, 1968) * 1.29 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 180
    EnemyMana := 80
    EnemyDamage := Rand.Int (105, 113) * 1.25 ** Level
    EnemyIntelligence := 120
    EnemySpeed := 15
    EnemyMoney := Rand.Int (30, 35) * Level
    EnemyExperience := Rand.Int (14, 18) * Level
end Cadet

proc Robber
    EnemyHp := round (Rand.Int (700, 1400) * 1.21 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 50
    EnemyMana := 48
    EnemyDamage := 280 * 1.29 ** Level
    EnemyIntelligence := 12
    EnemySpeed := 70
    EnemyMoney := Rand.Int (50, 65) * Level
    EnemyExperience := Rand.Int (20, 25) * Level
end Robber

proc GBSoldier         % Lv 10
    EnemyHp := round (Rand.Int (2601, 3003) * 1.3 ** Level)
    EnemyTHp := Rand.Int (3003, 3500) * Level
    EnemyTMana := 800
    EnemyMana := 700
    EnemyDamage := Rand.Int (147, 164) * 1.25 ** Level
    EnemyIntelligence := Rand.Int (200, 260) * Level
    EnemySpeed := 29 + (Level * 5)
    EnemyMoney := Rand.Int (45, 154) * Level
    EnemyExperience := Rand.Int (14, 50) * Level
end GBSoldier

proc Wurbul
    EnemyHp := round (Rand.Int (2666, 3999) * 1.23 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 500
    EnemyMana := 600
    EnemyDamage := Rand.Int (130, 400) * 1.28 ** Level
    EnemyIntelligence := Rand.Int (6, 9) * Level
    EnemySpeed := 10 * Level
    EnemyMoney := Rand.Int (100, 160) * Level
    EnemyExperience := Rand.Int (17, 30) * Level
end Wurbul

proc Oreg
    EnemyHp := round (Rand.Int (1000, 1400) * 1.23 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 200
    EnemyMana := 232
    EnemyDamage := Rand.Int (60, 180) * 1.25 ** Level
    EnemyIntelligence := Rand.Int (1, 2) * Level
    EnemySpeed := 104
    EnemyMoney := Rand.Int (2, 5) * Level
    EnemyExperience := Rand.Int (23, 28) * Level
end Oreg

% Creile Fight

proc RiotSoldier
    EnemyHp := round (Rand.Int (800, 1500) * 1.27 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 200
    EnemyMana := 200
    EnemyDamage := 160 * 1.25 ** Level
    EnemyIntelligence := 40
    EnemySpeed := 25
    EnemyMoney := 4 * Level
    EnemyExperience := 27
end RiotSoldier

proc EscapedPrisonmate
    EnemyHp := round (Rand.Int (1900, 2100) * 1.29 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 70
    EnemyMana := 70
    EnemyDamage := 145 * 1.25 ** Level
    EnemyIntelligence := 34
    EnemySpeed := 40
    EnemyMoney := 3 * Level
    EnemyExperience := 25
end EscapedPrisonmate

proc Gobassin
    EnemyHp := round (Rand.Int (600, 999) * 1.24 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 200
    EnemyMana := 200
    EnemyDamage := Rand.Int (120, 600) * 1.25 ** Level
    EnemyIntelligence := 100
    EnemySpeed := 67
    EnemyMoney := 5 * Level
    EnemyExperience := 29
end Gobassin

proc DoctorLevun
    EnemyHp := round (Rand.Int (550, 620) * 1.21 ** Level)
    EnemyTHp := EnemyHp
    EnemyTMana := 400 * Level
    EnemyMana := 400 * Level
    EnemyDamage := 180 * 1.05 ** Level
    EnemyIntelligence := 275 * Level
    EnemySpeed := 35 * Level
    EnemyMoney := Rand.Int (37, 50) * Level
    EnemyExperience := 36
end DoctorLevun

proc Glabezir
    EnemyHp := round (Rand.Int (3000, 5000) * 1.37 ** (Level - 1))
    EnemyTHp := EnemyHp
    EnemyTMana := 260 * Level
    EnemyMana := 260 * Level
    EnemyDamage := 210 * 1.28 ** Level
    EnemyIntelligence := 21 * Level
    EnemySpeed := 48 * Level
    EnemyMoney := Rand.Int (1, 100) * Level
    EnemyExperience := 34
end Glabezir
