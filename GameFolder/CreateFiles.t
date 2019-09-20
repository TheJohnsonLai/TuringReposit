
include "Code\\ImportStart.t"
for SaveNumber : 1 .. 9
    SaveName := "Data\\Save" + intstr (SaveNumber) + ".txt"
    open : stream, SaveName, put
    put : stream, SaveNumber
    put : stream, "Name"
    put : stream, UnlockedMap
    put : stream, -150
    put : stream, 95000
    for CycleMembers : 1 .. 10
	put : stream, Party (CycleMembers).Body
	put : stream, Party (CycleMembers).Identity
	put : stream, Party (CycleMembers).UB
	put : stream, Party (CycleMembers).Avatar
	put : stream, Party (CycleMembers).Experience
	put : stream, Party (CycleMembers).Name
	put : stream, Party (CycleMembers).Level
	put : stream, Party (CycleMembers).TotalLevel
	put : stream, Party (CycleMembers).ChangeLevel
	put : stream, Party (CycleMembers).Party
	put : stream, Party (CycleMembers).Health
	put : stream, Party (CycleMembers).TotalHealth
	put : stream, Party (CycleMembers).Attack
	put : stream, Party (CycleMembers).TotalAttack
	put : stream, Party (CycleMembers).ChangeAttack
	put : stream, Party (CycleMembers).Defense
	put : stream, Party (CycleMembers).ChangeDefense
	put : stream, Party (CycleMembers).Weapon
	put : stream, Party (CycleMembers).TotalDefense
	put : stream, Party (CycleMembers).CritChance
	put : stream, Party (CycleMembers).TotalCritChance
	put : stream, Party (CycleMembers).ChangeCritChance
	put : stream, Party (CycleMembers).CritDamage
	put : stream, Party (CycleMembers).TotalCritDamage
	put : stream, Party (CycleMembers).ChangeCritDamage
	put : stream, Party (CycleMembers).Power
	put : stream, Party (CycleMembers).TotalPower
	put : stream, Party (CycleMembers).Speed
	put : stream, Party (CycleMembers).ChangeSpeed
	put : stream, Party (CycleMembers).TotalSpeed
	put : stream, Party (CycleMembers).PositionX
	put : stream, Party (CycleMembers).PositionY
	for CShard : 1 .. 3
	    put : stream, Party (CycleMembers).GearType (CShard)
	    put : stream, Party (CycleMembers).GearStat (CShard)
	end for
	for CSkill : 1 .. 6
	    put : stream, Party (CycleMembers).Skill (CSkill).SkillID
	    put : stream, Party (CycleMembers).Skill (CSkill).Level
	end for
	for CBSkill : 1 .. 10
	    put : stream, Party (CycleMembers).BaseSkill (CBSkill).SkillID
	    put : stream, Party (CycleMembers).BaseSkill (CBSkill).Level
	end for
    end for
    for Cycle : 1 .. LocationSize
	put : stream, Location (Cycle).U
    end for
    for IHori : 1 .. 7
	for IVert : 1 .. 6
	    put : stream, Inventory (IHori, IVert).Type
	    put : stream, Inventory (IHori, IVert).Stat
	end for
    end for
    close : stream
end for
