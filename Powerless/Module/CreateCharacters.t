% CreateCharacters.t

fcn createChar (species : string, level : int, speciesType : int, passive : string) : characterInfo

    var foe : characterInfo := cEmpty

    foe.speed := 3 % Default
    if species = "Cube" then
	foe.level := level
	foe.speed := 4
	foe.tempSpeed := 4
	if speciesType = 0 then
	    foe.name := "Caustric Square"
	    foe.rank := 0
	    foe.health := level * (1500)
	    foe.armor := level * (1000)
	    foe.attack := level * (266)
	    foe.tempHealth := foe.health
	    foe.tempArmor := foe.armor * (0.2)
	elsif speciesType = 1 then
	    foe.name := "Caustric Cube"
	    foe.rank := 1
	    foe.health := level * (1755)
	    foe.armor := level * (1200)
	    foe.attack := level * (344)
	    foe.tempHealth := foe.health
	    foe.tempArmor := foe.armor * (0.2)
	elsif speciesType = 2 then
	    foe.name := "Caustric Hex"
	    foe.rank := 2
	    foe.health := level * (1920)
	    foe.armor := level * (1400)
	    foe.attack := level * (436)
	    foe.tempHealth := foe.health
	    foe.tempArmor := foe.armor * (0.3)
	elsif speciesType = 3 then
	    foe.name := "Caustric Fractal"
	    foe.rank := 3
	    foe.health := level * (2403)
	    foe.armor := level * (1600)
	    foe.attack := level * (571)
	    foe.tempHealth := foe.health
	    foe.tempArmor := foe.armor * (0.4)
	end if
    elsif species = "Pyramid" then
    elsif species = "Sphere" then
    elsif species = "Cleo" then
	foe.name := "Cleo Sephastas"
	foe.rank := 3
	foe.health := level * (2403)
	foe.armor := level * (1600)
	foe.attack := level * (571)
	foe.speed := 4
	foe.tempSpeed := 6
	foe.tempHealth := foe.health
	foe.tempArmor := foe.armor * (0.4)
	foe.sprite := CleoSprite
	foe.avatar := CleoSprite
    elsif species = "Sillness" then
	foe.name := "Sillness Furlenstorn"
	foe.rank := 3
	foe.health := level * (2403)
	foe.armor := level * (1600)
	foe.attack := level * (571)
	foe.speed := 3
	foe.tempSpeed := 3
	foe.tempHealth := foe.health
	foe.tempArmor := foe.armor * (0.4)
	foe.sprite := SillnessSprite
	foe.avatar := SillnessSprite
    elsif species = "Seira" then
	foe.name := "Seira Von Calpheon"
	foe.rank := 3
	foe.health := level * (2403)
	foe.armor := level * (1600)
	foe.attack := level * (571)
	foe.speed := 4
	foe.tempSpeed := 4
	foe.tempHealth := foe.health
	foe.tempArmor := foe.armor * (0.4)
	foe.sprite := SeiraSprite
	foe.avatar := SeiraSprite
    else
    end if

    if passive = "Counter" then         % 0 = nothing
	foe.passive.pName := "Counter"
	foe.passive.pRank := speciesType
	foe.passive.pDesc := "Counter damage taken with 1 diamond"
	foe.passive.pRange := 5 % percent
	foe.passive.pMultiplier := (foe.attack * 0.7) + (0.04 * foe.passive.pRank)
	if foe.passive.pRank > 2 then
	    foe.passive.pCooldown := 0
	else
	    foe.passive.pCooldown := 1
	end if
    elsif passive = "Turtle" then             % 0 = nothing
	foe.passive.pName := passive
	foe.passive.pRank := speciesType
	foe.passive.pDesc := "Summon a protective shield for 2 turns"
	foe.passive.pRange := 0 % percent
	foe.passive.pMultiplier := 0
	foe.passive.pCooldown := 2
    end if

    % Default
    %foe.tempSpeed := foe.speed
    foe.tempHealth := foe.health
    result foe

end createChar
