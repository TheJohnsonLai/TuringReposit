%NPC_

% Boss
var DerissMashete : ID % `1 Knight of Valor
DerissMashete.Avatar := AV_Cosseus % 10 %%% Role: All rounder + CC
DerissMashete.Body := CB_Cosseus
DerissMashete.UB := UB_Cosseus
DerissMashete.Identity := 3
DerissMashete.Name := "Deriss Mashete"
DerissMashete.Experience := 0
DerissMashete.Party := 1
DerissMashete.Level := 3
DerissMashete.TotalLevel := 3
DerissMashete.Health := 1321
DerissMashete.TotalHealth := 1321
DerissMashete.TotalAttack := 40
DerissMashete.TotalDefense := 25
DerissMashete.TotalCritChance := 10
DerissMashete.TotalCritDamage := 112
DerissMashete.Attack := 40
DerissMashete.Defense := 25
DerissMashete.CritChance := 10
DerissMashete.CritDamage := 112
DerissMashete.Power := 38
DerissMashete.TotalPower := 38
DerissMashete.Speed := 125
DerissMashete.TotalSpeed := 125
DerissMashete.ChangeLevel := 0
DerissMashete.ChangeAttack := 0
DerissMashete.ChangeDefense := 0
DerissMashete.ChangeCritChance := 0
DerissMashete.ChangeCritDamage := 0
DerissMashete.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
DerissMashete.PositionX := 1
DerissMashete.PositionY := 1
DerissMashete.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
DerissMashete.GearStat (1) := 0 %% Value of said stat
DerissMashete.GearType (2) := 0
DerissMashete.GearStat (2) := 0
DerissMashete.GearType (3) := 0
DerissMashete.GearStat (3) := 0
DerissMashete.Skill (1).SkillID := 1
DerissMashete.Skill (1).Level := 2
DerissMashete.Skill (2).SkillID := 2
DerissMashete.Skill (2).Level := 2
DerissMashete.Skill (3).SkillID := 3
DerissMashete.Skill (3).Level := 1
DerissMashete.Skill (4).SkillID := 4
DerissMashete.Skill (4).Level := 1
DerissMashete.Skill (5).SkillID := 5
DerissMashete.Skill (5).Level := 1
DerissMashete.Skill (6).SkillID := 6
DerissMashete.Skill (6).Level := 3
DerissMashete.Skill (1).Picture := SkillPic (1) %% ??
DerissMashete.Skill (2).Picture := SkillPic (2)
DerissMashete.Skill (3).Picture := SkillPic (3)
DerissMashete.Skill (4).Picture := SkillPic (4)
DerissMashete.Skill (5).Picture := SkillPic (5)
DerissMashete.Skill (6).Picture := SkillPic (6)



% Mediah Knight
var EmptyNPC : ID % `1 mpty = 0
EmptyNPC.Identity := 0
EmptyNPC.Name := "Empty NPC"
EmptyNPC.Experience := 0
EmptyNPC.Level := 0
EmptyNPC.Party := 0
EmptyNPC.Health := 0
EmptyNPC.TotalHealth := 0
EmptyNPC.TotalLevel := 0
EmptyNPC.TotalAttack :=0
EmptyNPC.TotalDefense :=0
EmptyNPC.TotalCritChance := 0
EmptyNPC.TotalCritDamage := 0
EmptyNPC.ChangeLevel := 0
EmptyNPC.ChangeAttack := 0
EmptyNPC.ChangeDefense := 0
EmptyNPC.ChangeCritChance := 0
EmptyNPC.ChangeCritDamage := 0
EmptyNPC.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
EmptyNPC.Attack := 0
EmptyNPC.Defense := 0
EmptyNPC.CritChance :=0
EmptyNPC.CritDamage := 0
EmptyNPC.Power :=0
EmptyNPC.TotalPower := 0
EmptyNPC.Speed := 0
EmptyNPC.TotalSpeed :=0
EmptyNPC.PositionX :=0
EmptyNPC.PositionY := 0

Character (0) := EmptyNPC % Damage dummy

var PracticeDummy : ID % `1 Knight of Valor
PracticeDummy.Avatar := AV_Cosseus % 10 %%% Role: All rounder + CC
PracticeDummy.Body := CB_Cosseus
PracticeDummy.UB := UB_Cosseus
PracticeDummy.Identity := 2
PracticeDummy.Name := "Practice Dummy"
PracticeDummy.Experience := 0
PracticeDummy.Party := 1
PracticeDummy.Level := 1
PracticeDummy.TotalLevel := 2
PracticeDummy.Health := 500
PracticeDummy.TotalHealth := 500
PracticeDummy.TotalAttack := 20
PracticeDummy.TotalDefense := 0
PracticeDummy.TotalCritChance := 5
PracticeDummy.TotalCritDamage := 110
PracticeDummy.Attack := 20
PracticeDummy.Defense := 0
PracticeDummy.CritChance := 5
PracticeDummy.CritDamage := 110
PracticeDummy.Power := 90
PracticeDummy.TotalPower := 90
PracticeDummy.Speed := 95
PracticeDummy.TotalSpeed := 95
PracticeDummy.ChangeLevel := 0
PracticeDummy.ChangeAttack := 0
PracticeDummy.ChangeDefense := 0
PracticeDummy.ChangeCritChance := 0
PracticeDummy.ChangeCritDamage := 0
PracticeDummy.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
PracticeDummy.PositionX := 1
PracticeDummy.PositionY := 1
PracticeDummy.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
PracticeDummy.GearStat (1) := 0 %% Value of said stat
PracticeDummy.GearType (2) := 0
PracticeDummy.GearStat (2) := 0
PracticeDummy.GearType (3) := 0
PracticeDummy.GearStat (3) := 0
PracticeDummy.Skill (1).SkillID := 1
PracticeDummy.Skill (1).Level := 1
PracticeDummy.Skill (2).SkillID := 2
PracticeDummy.Skill (2).Level := 1
PracticeDummy.Skill (3).SkillID := 3
PracticeDummy.Skill (3).Level := 1
PracticeDummy.Skill (4).SkillID := 4
PracticeDummy.Skill (4).Level := 1
PracticeDummy.Skill (5).SkillID := 5
PracticeDummy.Skill (5).Level := 1
PracticeDummy.Skill (6).SkillID := 6
PracticeDummy.Skill (6).Level := 3
PracticeDummy.Skill (1).Picture := SkillPic (1) %% ??
PracticeDummy.Skill (2).Picture := SkillPic (2)
PracticeDummy.Skill (3).Picture := SkillPic (3)
PracticeDummy.Skill (4).Picture := SkillPic (4)
PracticeDummy.Skill (5).Picture := SkillPic (5)
PracticeDummy.Skill (6).Picture := SkillPic (6)


var MediahKnight : ID % `1 Knight of Valor
MediahKnight.Avatar := AV_Cosseus % 10 %%% Role: All rounder + CC
MediahKnight.Body := CB_Cosseus
MediahKnight.UB := UB_Cosseus
MediahKnight.Identity := 2
MediahKnight.Name := "Mediah Knight"
MediahKnight.Experience := 0
MediahKnight.Level := 1
MediahKnight.Party := 1
MediahKnight.Health := 200
MediahKnight.TotalHealth := 200
MediahKnight.TotalLevel := 1
MediahKnight.TotalAttack := 58
MediahKnight.TotalDefense := 10
MediahKnight.TotalCritChance := 15
MediahKnight.TotalCritDamage := 117
MediahKnight.ChangeLevel := 0
MediahKnight.ChangeAttack := 0
MediahKnight.ChangeDefense := 0
MediahKnight.ChangeCritChance := 0
MediahKnight.ChangeCritDamage := 0
MediahKnight.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
MediahKnight.Attack := 58
MediahKnight.Defense := 20
MediahKnight.CritChance := 15
MediahKnight.CritDamage := 117
MediahKnight.Power := 140
MediahKnight.TotalPower := 140
MediahKnight.Speed := 86
MediahKnight.TotalSpeed := 86
MediahKnight.PositionX := 1
MediahKnight.PositionY := 1
MediahKnight.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
MediahKnight.GearStat (1) := 0 %% Value of said stat
MediahKnight.GearType (2) := 0
MediahKnight.GearStat (2) := 0
MediahKnight.GearType (3) := 0
MediahKnight.GearStat (3) := 0
MediahKnight.Skill (1).SkillID := 1
MediahKnight.Skill (1).Level := 1
MediahKnight.Skill (1).Picture := Skill_CrescentSlash
MediahKnight.Skill (2).SkillID := 7
MediahKnight.Skill (2).Level := 1
MediahKnight.Skill (2).Picture := Skill_NebulaBurst
MediahKnight.Skill (3).SkillID := 3
MediahKnight.Skill (3).Level := 1
MediahKnight.Skill (3).Picture := Skill_DoubleImpact
MediahKnight.Skill (4).SkillID := 4
MediahKnight.Skill (4).Level := 1
MediahKnight.Skill (4).Picture := Skill_QuickStep
MediahKnight.Skill (5).SkillID := 5
MediahKnight.Skill (5).Level := 1
MediahKnight.Skill (5).Picture := Skill_PhantomBurst
MediahKnight.Skill (6).SkillID := 6
MediahKnight.Skill (6).Level := 1
MediahKnight.Skill (6).Picture := Skill_SlowStep

var PowderMonkey : ID % `1 Knight of Valor
PowderMonkey.Avatar := AV_Cosseus % 10 %%% Role: All rounder + CC
PowderMonkey.Body := CB_Cosseus
PowderMonkey.UB := UB_Cosseus
PowderMonkey.Identity := 2
PowderMonkey.Name := "Powder Monkey"
PowderMonkey.Experience := 0
PowderMonkey.Level := 1
PowderMonkey.Party := 1
PowderMonkey.Health := 330
PowderMonkey.TotalHealth := 330
PowderMonkey.TotalLevel := 1
PowderMonkey.TotalAttack := 33
PowderMonkey.TotalDefense := 10
PowderMonkey.TotalCritChance := 4
PowderMonkey.TotalCritDamage := 105
PowderMonkey.ChangeLevel := 0
PowderMonkey.ChangeAttack := 0
PowderMonkey.ChangeDefense := 0
PowderMonkey.ChangeCritChance := 0
PowderMonkey.ChangeCritDamage := 0
PowderMonkey.ChangeSpeed := 0 %%% = totalspeed - (level + amount)
PowderMonkey.Attack := 33
PowderMonkey.Defense := 10
PowderMonkey.CritChance := 4
PowderMonkey.CritDamage := 105
PowderMonkey.Power := 60
PowderMonkey.TotalPower := 60
PowderMonkey.Speed := 88
PowderMonkey.TotalSpeed := 88
PowderMonkey.PositionX := 1
PowderMonkey.PositionY := 1
PowderMonkey.GearType (1) := 0 %% Means no gear (1 = hp, 2 = pwoer, 3 = ap, 4 = dp, 5 = cc, 6 = cd)
PowderMonkey.GearStat (1) := 0 %% Value of said stat
PowderMonkey.GearType (2) := 0
PowderMonkey.GearStat (2) := 0
PowderMonkey.GearType (3) := 0
PowderMonkey.GearStat (3) := 0
PowderMonkey.Skill (1).SkillID := 1
PowderMonkey.Skill (1).Level := 1
PowderMonkey.Skill (1).Picture := Skill_CrescentSlash
PowderMonkey.Skill (2).SkillID := 1
PowderMonkey.Skill (2).Level := 1
PowderMonkey.Skill (2).Picture := Skill_CrescentSlash
PowderMonkey.Skill (3).SkillID := 1
PowderMonkey.Skill (3).Level := 1
PowderMonkey.Skill (3).Picture := Skill_CrescentSlash
PowderMonkey.Skill (4).SkillID := 1
PowderMonkey.Skill (4).Level := 1
PowderMonkey.Skill (4).Picture := Skill_CrescentSlash
PowderMonkey.Skill (5).SkillID := 5
PowderMonkey.Skill (5).Level := 1
PowderMonkey.Skill (5).Picture := Skill_PhantomBurst
PowderMonkey.Skill (6).SkillID := 1
PowderMonkey.Skill (6).Level := 1
PowderMonkey.Skill (6).Picture := Skill_CrescentSlash

