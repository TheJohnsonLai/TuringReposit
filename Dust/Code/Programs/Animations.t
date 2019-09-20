% Animations for buttons etc.
% Has the potential for fighting animation

proc AerialExplosion
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 78 - Explode, 45, 78 + Explode, purple)
	Draw.Line (45 - Aerial, 78, 45 + Aerial, 78, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion
proc AerialExplosion2
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 58 - Explode, 45, 58 + Explode, purple)
	Draw.Line (45 - Aerial, 58, 45 + Aerial, 58, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion2
proc AerialExplosion3
    Explode := 0
    Aerial := 0
    loop
	Draw.Line (45, 38 - Explode, 45, 38 + Explode, purple)
	Draw.Line (45 - Aerial, 38, 45 + Aerial, 38, purple)
	Explode += 2
	Aerial += 1
	exit when Explode >= 8
	delay (30)
    end loop
end AerialExplosion3

proc LightMovement
    Light := 0
    Poke := 0
    loop
	Draw.Line (89 - Light, 503, 106 + Light, 503, 0)
	Draw.FillBox (89, 500, 106, 502, 0)
	Draw.Line (98, 500 - Poke, 98, 501 + Poke, 0)
	Light += 1
	exit when Light = 69
	if Light = 20 or Light = 40 or Light = 60 then
	    Poke += 1
	else
	end if
	delay (1)
    end loop
end LightMovement
proc LightMovement2
    Light := 0
    Poke := 0
    loop
	Draw.Line (347 - Light, 503, 357 + Light, 503, 0)
	Draw.FillBox (347, 500, 357, 502, 0)
	Draw.Line (352, 500 - Poke, 352, 501 + Poke, 0)
	Light += 1
	exit when Light = 28
	if Light = 8 or Light = 16 or Light = 24 then
	    Poke += 1
	else
	end if
	delay (5)
    end loop
end LightMovement2
proc LightMovement3
    Light := 0
    Poke := 0
    loop
	Draw.Line (607 - Light, 503, 619 + Light, 503, 0)
	Draw.FillBox (607, 500, 619, 502, 0)
	Draw.Line (613, 500 - Poke, 613, 501 + Poke, 0)
	Light += 1
	exit when Light = 25
	if Light = 7 or Light = 14 or Light = 21 then
	    Poke += 1
	else
	end if
	delay (5)
    end loop
end LightMovement3
