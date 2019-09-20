%%%%%%% World load

proc MouseRestriction
    if Mx < 0 then
	Mx := 0
    elsif Mx > maxx then
	Mx := maxx
    end if
    if My < 0 then
	My := 0
    elsif My > maxy then
	My := maxy
    end if
end MouseRestriction

proc DisplayInventory (H, V, Type, Amount : int)
    Draw.FillBox (Mx + 5, My, Mx + 175, My - 35, 16)
    Draw.Box (Mx + 5, My, Mx + 175, My - 35, PSODarkBlue)
    %Font.Draw (intstr (Type),Mx + 10, My - 15,FontInfo,Gold)
    if Type = 1 then
	Font.Draw ("Health shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 2 then
	Font.Draw ("Power shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 3 then
	Font.Draw ("Attack shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 4 then
	Font.Draw ("Defense shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 5 then
	Font.Draw ("Crit Chance shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat) + "%", Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 6 then
	Font.Draw ("Crit Damage shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat) + "%", Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 7 then
	Font.Draw ("Speed shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Inventory (H, V).Stat), Mx + 10, My - 30, FontInfo, PSOWhite)
    end if

end DisplayInventory

proc DisplayCombination (Type, Amount : int)
    if Type = 0 then
    else
	Draw.FillBox (Mx + 5, My, Mx + 175, My - 35, 16)
	Draw.Box (Mx + 5, My, Mx + 175, My - 35, PSODarkBlue)
    end if
    %Font.Draw (intstr (Type),Mx + 10, My - 15,FontInfo,Gold)
    if Type = 1 then
	Font.Draw ("Health shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 2 then
	Font.Draw ("Power shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 3 then
	Font.Draw ("Attack shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 4 then
	Font.Draw ("Defense shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount), Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 5 then
	Font.Draw ("Crit Chance shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount) + "%", Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 6 then
	Font.Draw ("Crit Damage shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount) + "%", Mx + 10, My - 30, FontInfo, PSOWhite)
    elsif Type = 7 then
	Font.Draw ("Speed shard", Mx + 10, My - 15, FontInfo, PSOWhite)
	Font.Draw ("Output: " + intstr (Amount), Mx + 10, My - 30, FontInfo, PSOWhite)
    end if

end DisplayCombination

proc DetermineMapUnlocked
    %%Determine if map overlay is unlocked based on city progress
    if Location (32).U = true then
	MapOverlayPosition (15).U := true
    end if
    if Location (37).U = true then
	MapOverlayPosition (14).U := true
    end if
    if Location (35).U = true then
	MapOverlayPosition (13).U := true
    end if
    if Location (27).U = true then
	MapOverlayPosition (12).U := true
    end if
    if Location (23).U = true then
	MapOverlayPosition (11).U := true
    end if
    if Location (19).U = true then
	MapOverlayPosition (10).U := true
    end if
    if Location (17).U = true then
	MapOverlayPosition (9).U := true
    end if
    if Location (16).U = true then
	MapOverlayPosition (8).U := true
    end if
    if Location (12).U = true then
	MapOverlayPosition (7).U := true
    end if
    if Location (11).U = true then
	MapOverlayPosition (6).U := true
    end if
    if Location (8).U = true then
	MapOverlayPosition (5).U := true
    end if
    if Location (6).U = true then
	MapOverlayPosition (4).U := true
    end if
    if Location (5).U = true then
	MapOverlayPosition (3).U := true
    end if
    UnlockedMap := true
    for DetermineSettingClear : 1 .. LocationSize
	if Location (DetermineSettingClear).U = false then
	    UnlockedMap := false
	end if
    end for
end DetermineMapUnlocked

proc LevelUpdate
    for lvlup : 1 .. 10
	if Party (lvlup).Identity > 0 then
	    if Party (lvlup).Experience >= 150000 then
		if Party (lvlup).TotalLevel < 30 then
			Party (lvlup).TotalLevel := 30
		    if Party (lvlup).Name = "Sillness" then
			Party (lvlup).TotalHealth := 30000
			Party (lvlup).TotalPower := 220
			Party (lvlup).TotalAttack := 1200
			Party (lvlup).TotalDefense := 19
			Party (lvlup).TotalCritChance := 21
			Party (lvlup).TotalCritDamage := 225
			Party (lvlup).TotalSpeed := 75
		    end if
		    if Party (lvlup).Name = "Ravness" then
			Party (lvlup).TotalHealth := 36000
			Party (lvlup).TotalPower := 140
			Party (lvlup).TotalAttack := 1040
			Party (lvlup).TotalDefense := 24
			Party (lvlup).TotalCritChance := 17
			Party (lvlup).TotalCritDamage := 240
			Party (lvlup).TotalSpeed := 92
		    end if
		    if Party (lvlup).Name = "Cosseus" then
			Party (lvlup).TotalHealth := 37000
			Party (lvlup).TotalPower := 105
			Party (lvlup).TotalAttack := 965
			Party (lvlup).TotalDefense := 35
			Party (lvlup).TotalCritChance := 15
			Party (lvlup).TotalCritDamage := 210
			Party (lvlup).TotalSpeed := 100
		    end if
		    if Party (lvlup).Name = "D-rin" then
			Party (lvlup).TotalHealth := 29000
			Party (lvlup).TotalPower := 194
			Party (lvlup).TotalAttack := 1057
			Party (lvlup).TotalDefense := 20
			Party (lvlup).TotalCritChance := 19
			Party (lvlup).TotalCritDamage := 222
			Party (lvlup).TotalSpeed := 85
		    end if
		    if Party (lvlup).Name = "Wolfe" then
			Party (lvlup).TotalHealth := 34900
			Party (lvlup).TotalPower := 155
			Party (lvlup).TotalAttack := 1010
			Party (lvlup).TotalDefense := 25
			Party (lvlup).TotalCritChance := 20
			Party (lvlup).TotalCritDamage := 241
			Party (lvlup).TotalSpeed := 77
		    end if
		    if Party (lvlup).Name = "Rage" then
			Party (lvlup).TotalHealth := 29300
			Party (lvlup).TotalPower := 180
			Party (lvlup).TotalAttack := 1238
			Party (lvlup).TotalDefense := 15
			Party (lvlup).TotalCritChance := 23
			Party (lvlup).TotalCritDamage := 235
			Party (lvlup).TotalSpeed := 83
		    end if
		    if Party (lvlup).Name = "Zefan" then
			Party (lvlup).TotalHealth := 33600
			Party (lvlup).TotalPower := 260
			Party (lvlup).TotalAttack := 1337
			Party (lvlup).TotalDefense := 20
			Party (lvlup).TotalCritChance := 22
			Party (lvlup).TotalCritDamage := 255
			Party (lvlup).TotalSpeed := 80
		    end if
		    if Party (lvlup).Name = "Cleo" then
			Party (lvlup).TotalHealth := 32500
			Party (lvlup).TotalPower := 260
			Party (lvlup).TotalAttack := 1141
			Party (lvlup).TotalDefense := 22
			Party (lvlup).TotalCritChance := 18
			Party (lvlup).TotalCritDamage := 228
			Party (lvlup).TotalSpeed := 90
		    end if
		    if Party (lvlup).Name = "Seira" then
			Party (lvlup).TotalHealth := 28000
			Party (lvlup).TotalPower := 300
			Party (lvlup).TotalAttack := 1270
			Party (lvlup).TotalDefense := 23
			Party (lvlup).TotalCritChance := 22
			Party (lvlup).TotalCritDamage := 233
			Party (lvlup).TotalSpeed := 81
		    end if
		    if Party (lvlup).Name = "Aeron" then
			Party (lvlup).TotalHealth := 31700
			Party (lvlup).TotalPower := 280
			Party (lvlup).TotalAttack := 1220
			Party (lvlup).TotalDefense := 26
			Party (lvlup).TotalCritChance := 25
			Party (lvlup).TotalCritDamage := 217
			Party (lvlup).TotalSpeed := 84
		    end if
		    for AddGear : 1 .. 3
			if Party (lvlup).GearType (AddGear) = 1 then
			    Party(lvlup).TotalHealth += Party (lvlup).GearStat (AddGear) 
			elsif Party (lvlup).GearType (AddGear) = 2 then
			    Party(lvlup).TotalPower += Party (lvlup).GearStat (AddGear)
			elsif Party (lvlup).GearType (AddGear) = 3 then
			    Party(lvlup).TotalAttack += Party (lvlup).GearStat (AddGear)
			elsif Party (lvlup).GearType (AddGear) = 4 then
			    Party(lvlup).TotalDefense += Party (lvlup).GearStat (AddGear)
			elsif Party (lvlup).GearType (AddGear) = 5 then
			    Party(lvlup).TotalCritChance += Party (lvlup).GearStat (AddGear)
			elsif Party (lvlup).GearType (AddGear) = 6 then
			    Party(lvlup).TotalCritDamage += Party (lvlup).GearStat (AddGear)
			elsif Party (lvlup).GearType (AddGear) = 7 then
			    Party(lvlup).TotalSpeed += Party (lvlup).GearStat (AddGear)
			end if
		    end for
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 29 then
		    Party (lvlup).TotalLevel := 29
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 28 then
		    Party (lvlup).TotalLevel := 28
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 27 then
		    Party (lvlup).TotalLevel := 27
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 26 then
		    Party (lvlup).TotalLevel := 26
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 25 then
		    Party (lvlup).TotalLevel := 25
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 24 then
		    Party (lvlup).TotalLevel := 24
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 23 then
		    Party (lvlup).TotalLevel := 19
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 22 then
		    Party (lvlup).TotalLevel := 19
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 21 then
		    Party (lvlup).TotalLevel := 19
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 20 then
		    Party (lvlup).TotalLevel := 19
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 100000 then
		if Party (lvlup).TotalLevel < 19 then
		    Party (lvlup).TotalLevel := 19
		    Party (lvlup).TotalHealth += 91
		    Party (lvlup).TotalPower += 8
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 2
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 75999 then
		if Party (lvlup).TotalLevel < 18 then
		    Party (lvlup).TotalLevel := 18
		    Party (lvlup).TotalHealth += 87
		    Party (lvlup).TotalPower += 6
		    Party (lvlup).TotalAttack += 6
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 58000 then
		if Party (lvlup).TotalLevel < 17 then
		    Party (lvlup).TotalLevel := 17
		    Party (lvlup).TotalHealth += 85
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 5
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 39999 then
		if Party (lvlup).TotalLevel < 16 then
		    Party (lvlup).TotalLevel := 16
		    Party (lvlup).TotalHealth += 80
		    Party (lvlup).TotalPower += 4
		    Party (lvlup).TotalAttack += 5
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 28000 then
		if Party (lvlup).TotalLevel < 15 then
		    Party (lvlup).TotalLevel := 15
		    Party (lvlup).TotalHealth += 100
		    Party (lvlup).TotalPower += 5
		    Party (lvlup).TotalAttack += 8
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 1
		    Party (lvlup).TotalCritDamage += 3
		    Party (lvlup).TotalSpeed -= 1
		end if
	    elsif Party (lvlup).Experience >= 20000 then
		if Party (lvlup).TotalLevel < 14 then
		    Party (lvlup).TotalLevel := 14
		    Party (lvlup).TotalHealth += 60
		    Party (lvlup).TotalPower += 1
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 14500 then
		if Party (lvlup).TotalLevel < 13 then
		    Party (lvlup).TotalLevel := 13
		    Party (lvlup).TotalHealth += 41
		    Party (lvlup).TotalPower += 4
		    Party (lvlup).TotalAttack += 4
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 9670 then
		if Party (lvlup).TotalLevel < 12 then
		    Party (lvlup).TotalLevel := 12
		    Party (lvlup).TotalHealth += 40
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 4
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 6000 then
		if Party (lvlup).TotalLevel < 11 then
		    Party (lvlup).TotalLevel := 11
		    Party (lvlup).TotalHealth += 40
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 4
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 3700 then
		if Party (lvlup).TotalLevel < 10 then
		    Party (lvlup).TotalLevel := 10
		    Party (lvlup).TotalHealth += 75
		    Party (lvlup).TotalPower += 7
		    Party (lvlup).TotalAttack += 7
		    Party (lvlup).TotalDefense += 2
		    Party (lvlup).TotalCritChance += 1
		    Party (lvlup).TotalCritDamage += 3
		    Party (lvlup).TotalSpeed -= 1
		end if
	    elsif Party (lvlup).Experience >= 2000 then
		if Party (lvlup).TotalLevel < 9 then
		    Party (lvlup).TotalLevel := 9
		    Party (lvlup).TotalHealth += 37
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 1400 then
		if Party (lvlup).TotalLevel < 8 then
		    Party (lvlup).TotalLevel := 8
		    Party (lvlup).TotalHealth += 33
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 880 then
		if Party (lvlup).TotalLevel < 7 then
		    Party (lvlup).TotalLevel := 7
		    Party (lvlup).TotalHealth += 30
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 550 then
		if Party (lvlup).TotalLevel < 6 then
		    Party (lvlup).TotalLevel := 6
		    Party (lvlup).TotalHealth += 30
		    Party (lvlup).TotalPower += 1
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 300 then
		if Party (lvlup).TotalLevel < 5 then
		    Party (lvlup).TotalLevel := 5
		    Party (lvlup).TotalHealth += 50
		    Party (lvlup).TotalPower += 4
		    Party (lvlup).TotalAttack += 4
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 1
		    Party (lvlup).TotalCritDamage += 2
		    Party (lvlup).TotalSpeed -= 1
		end if
	    elsif Party (lvlup).Experience >= 190 then %%% Double Lv1 stats
		if Party (lvlup).TotalLevel < 4 then
		    Party (lvlup).TotalLevel := 4
		    Party (lvlup).TotalHealth += 25
		    Party (lvlup).TotalPower += 3
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 120 then
		if Party (lvlup).TotalLevel < 3 then
		    Party (lvlup).TotalLevel := 3
		    Party (lvlup).TotalHealth += 15
		    Party (lvlup).TotalPower += 2
		    Party (lvlup).TotalAttack += 3
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Party(lvlup).TotalSpeed
		end if
	    elsif Party (lvlup).Experience >= 50 then
		if Party (lvlup).TotalLevel < 2 then
		    Party (lvlup).TotalLevel := 2
		    Party (lvlup).TotalHealth += 15
		    Party (lvlup).TotalPower += 2
		    Party (lvlup).TotalAttack += 2
		    Party (lvlup).TotalDefense += 1
		    Party (lvlup).TotalCritChance += 0
		    Party (lvlup).TotalCritDamage += 1
		    %   Character (lvlup).TotalSpeed
		end if
	    else
		Party (lvlup).TotalLevel := 1
	    end if
	end if
    end for
end LevelUpdate
