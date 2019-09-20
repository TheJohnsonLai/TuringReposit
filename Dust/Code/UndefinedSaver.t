proc Hooplay
    FileDir := LSN (4)
    open : stream, FileDir, write
    write : stream, name
    write : stream, Level
    write : stream, Money
    write : stream, Storyline
    write : stream, Style
    write : stream, Hp
    write : stream, THp
    write : stream, Mana
    write : stream, TMana
    write : stream, ManaRegen
    write : stream, Damage
    write : stream, Speed
    write : stream, Character
    write : stream, Skill_Level_SideCut
    write : stream, Intelligence
    write : stream, Skill_Level_AimedArrow
    write : stream, Skill_Level_BloodShot
    write : stream, Skill_Level_Mana_Shot
    write : stream, Skill_Level_SpeedSlice
    write : stream, Skill_Level_Shot_s
    write : stream, Skill_Level_DoubleSlash
    write : stream, Skill_Level_RaisedCurve
    write : stream, Skill_Level_StarShot
    write : stream, Skill_Level_WindLash
    write : stream, Skill_Level_BurningMetal
    write : stream, Skill_Level_Regen
    write : stream, Skill_Level_ZenosSword
    write : stream, Skill_Level_WhiteTundra
    write : stream, Skill_Level_Taggerung
    write : stream, Skill_Level_JetStream
    write : stream, Experience
    write : stream, Pet
    write : stream, FightingPet
    write : stream, Mission
    for LA : 1 .. 15
	write : stream, LevelArray (LA)
    end for
    for PA : 1 .. 8
	write : stream, PetArray (PA)
    end for
    write : stream, CreileFight
    write : stream, CSA1
    write : stream, CSA2
    write : stream, CSA3
    write : stream, CSA4
    write : stream, PreviousSpeed
    write : stream, AddedSpeed
    write : stream, PreviousDamage
    write : stream, AddedDamage
    write : stream, PreviousIntelligence
    write : stream, AddedIntelligence
    write : stream, PreviousHp
    write : stream, AddedHp
    write : stream, Added
end Hooplay
