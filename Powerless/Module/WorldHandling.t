var subPosX : int := 114
var subPosY : int := 77

proc Subtitle (sub : string)
    Font.Draw (sub, subPosX, subPosY, FontM12, 20)
end Subtitle

fcn RankConversion (r : int) : string
    var s : string := "C"
    if r = 0 then
	s := "C"
    elsif r = 1 then
	s := "B"
    elsif r = 2 then
	s := "A"
    elsif r = 3 then
	s := "S"
    elsif r = 4 then
	s := "EX"
    end if
    result s
end RankConversion

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
    if Mb = 0 then
	MouseReady := true
    end if
end MouseRestriction

proc SlideMapHorizontal
    % Adjust Horizontal slider
    if Mb = 1 & My > 98 then
	if My < 719 then     %% 719, as restriction sets to 720
	    MovedX += Mx - StoredX
	end if
    end if
    % Restriction
    if MovedX > 0 then
	MovedX := 0
    elsif MovedX < (-1720) then
	MovedX := -1720
    end if
    if MovedX <= -50 then % Left side
	Draw.Line (4, 356 + 49, 4, 364 + 49, 31)
	Draw.Line (3, 358 + 49, 3, 362 + 49, 31)
	Draw.Line (2, 360 + 49, 2, 360 + 49, 31)
    end if
    if MovedX >= -1659 then % Right side
	Draw.Line (1280 - 5, 356 + 49, 1280 - 5, 364 + 49, 31)
	Draw.Line (1280 - 4, 358 + 49, 1280 - 4, 362 + 49, 31)
	Draw.Line (1280 - 3, 360 + 49, 1280 - 3, 360 + 49, 31)
    end if
    StoredX := Mx
end SlideMapHorizontal

proc SlideChallengeVertical
    if Mb = 1 & Mx >= 41 & Mx <= 638 & My >= 197 and My <= 609 then
	MovedY += My - StoredY
    else
    end if
    if MovedY <= 0 then
	MovedY := 0
    elsif MovedY >= 950 then
	MovedY := 950
    end if

    StoredY := My
end SlideChallengeVertical

fcn ScrollTriangle (aX, aY, bX, bY, cX, cY : int) : boolean
    %%%%%%%%%%%%% A B C is Clockwise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ((Mx - aX) * (bY - aY)) - ((bX - aX) * (My - aY)) > 0 and
	    (Mx - bX) * (cY - bY) - (cX - bX) * (My - bY) > 0 and
	    (Mx - cX) * (aY - cY) - (aX - cX) * (My - cY) > 0 then
	result true
    else
	result false
    end if
    result false
end ScrollTriangle

proc DrawTriangle (aX, aY, bX, bY, cX, cY, cL : int)
    Draw.Line (aX, aY, bX, bY, cL)
    Draw.Line (aX, aY, cX, cY, cL)
    Draw.Line (cX, cY, bX, bY, cL)
end DrawTriangle

fcn CalcDiamond (aX, aY, bX, bY, cX, cY : int) : boolean
    %%%%%%%%%%%%% A B C is Clockwise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if ((Mx - aX) * (bY - aY)) - ((bX - aX) * (My - aY)) > 0 and
	    (Mx - bX) * (cY - bY) - (cX - bX) * (My - bY) > 0 and
	    (Mx - cX) * (aY - cY) - (aX - cX) * (My - cY) > 0 then
	result true
    else
	result false
    end if
    result false
end CalcDiamond

fcn DetectDiamond (sX, sY, radius : int) : boolean
    if CalcDiamond (sX - radius - 1, sY, sX - 1, sY + radius, sX - 1, sY - radius + 1)| % Port Triangle
	    CalcDiamond (sX + radius, sY, sX, sY - radius, sX, sY + radius + 1)|  % Starboard
	    CalcDiamond (sX + radius, sY, sX, sY - radius, sX, sY + radius + 1)|  % Top
	    CalcDiamond (sX + radius, sY, sX, sY - radius, sX, sY + radius + 1)|  % Bottom
	    (((sX - 1) = Mx| (sX = Mx)) & My > sY - radius & My < sY + radius) then  %% Midlane, assuming 2x width
	result true
    end if
    result false
end DetectDiamond

fcn DetectCircle (sX, sY, radius : int) : boolean
    if ((Mx - sX) ** 2 + (My - sY) ** 2) < (radius * radius) then
	result true
    end if
    result false
end DetectCircle

proc DrawSBorder (sX, sY, radius, sColour : int)
    %DrawTriangle (sX - radius - 1, sY, sX - 1, sY + radius, sX - 1, sY - radius + 1, sColour)
    %DrawTriangle (sX + radius, sY, sX, sY - radius, sX, sY + radius + 1, sColour)
    Draw.Line (sX - (radius + 5), sY + (radius + 5), sX - (radius - 1), sY + (radius + 5), sColour) % Horizontal TL
    Draw.Line (sX + (radius + 5), sY + (radius + 5), sX + (radius - 1), sY + (radius + 5), sColour) % TR
    Draw.Line (sX - (radius + 5), sY - (radius + 5), sX - (radius - 1), sY - (radius + 5), sColour) % Horizontal Low Left
    Draw.Line (sX + (radius + 5), sY - (radius + 5), sX + (radius - 1), sY - (radius + 5), sColour) % LR
    Draw.Line (sX - (radius + 5), sY + (radius + 5), sX - (radius + 5), sY + (radius - 1), sColour) % Vertical TL
    Draw.Line (sX + (radius + 5), sY + (radius + 5), sX + (radius + 5), sY + (radius - 1), sColour) % TR
    Draw.Line (sX - (radius + 5), sY - (radius + 5), sX - (radius + 5), sY - (radius - 1), sColour) % LL
    Draw.Line (sX + (radius + 5), sY - (radius + 5), sX + (radius + 5), sY - (radius - 1), sColour) % LR
end DrawSBorder

proc DrawParGram (x, y, hpaDisFromCentX : int, percentBar : real, isUp : boolean) %% Override 
    %var dpgColor : int := HealthRed
    %var dpgY1 : int := -12
    %var dpgY2 : int := -11
    if isUp then
	Draw.FillBox (x + 6, y - 12, x + hpaDisFromCentX + round (percentBar), y - 10, HealthRed)
	Draw.FillBox (x + hpaDisFromCentX + round (percentBar), y - 12, x + hpaDisFromCentX + round (percentBar) + 1, y - 11, HealthRed)
	Draw.Dot (x + hpaDisFromCentX + round (percentBar) + 2, y - 12, HealthRed)
    else
	Draw.FillBox (x + 6, y - 21, x + hpaDisFromCentX + round (percentBar), y - 19, ArmorTan)
	Draw.FillBox (x + hpaDisFromCentX + round (percentBar), y - 20, x + hpaDisFromCentX + round (percentBar) + 1, y - 19, ArmorTan)
	Draw.Dot (x + hpaDisFromCentX + round (percentBar) + 2, y - 19, ArmorTan)
    end if
end DrawParGram

proc DrawHPA (tempHp, maxHp, tempA, maxA : real, x, y : int, isAlly : boolean, tSpeed : int, tName : string)
    % Draw
    var hpaDisFromCentX : int := 6
    var iconDistanceFromCenter : int := 24
    var boxWidth : int := 100 % Width of HP Bar
    var boxAWidth : int := 100 %round (maxA / maxHp * boxWidth)
    var percentHealth : real := 0
    var percentArmor : real := 0
    percentHealth := (tempHp / maxHp) * boxWidth
    percentArmor := (tempA / maxA) * boxAWidth

    Pic.Draw (hpaUnderlay, x - 32, y - 30, picMerge)
    % ---- Draw the HP Bar
    % Draw.FillBox (x + 5, y - 20, x + 5 + boxWidth, y - 3, BarGrey)
    DrawParGram (x, y, hpaDisFromCentX, percentHealth, true)
    %Draw.FillBox (x + 6, y - 12, x + hpaDisFromCentX + round (percentHealth), y - 10, HealthRed)
    %Draw.FillBox (x + hpaDisFromCentX + round (percentHealth), y - 12, x + hpaDisFromCentX + round (percentHealth) + 1, y - 11, HealthRed)
	% Draw.Box (x + 5, y - 3, x + 5 + boxWidth, y - 10, FoeRed)
    % ---- Draw the Armor Bar.
    % Draw.FillBox (x + 5, y - 28, x + 5 + boxWidth, y - 23, BarGrey)
    DrawParGram (x, y, hpaDisFromCentX, percentArmor, false)
    %Draw.FillBox (x + 6, y - 21, x + hpaDisFromCentX + round (percentArmor), y - 19, ArmorTan)
    %Draw.FillBox (x + hpaDisFromCentX + round (percentArmor), y - 20, x + hpaDisFromCentX + round (percentArmor) + 1, y - 19, ArmorTan)
    % Draw.Box (x + 5, y - 11, x + 5 + boxAWidth, y - 15, Gold)

    Pic.Draw (hpaOverlay, x - 32, y - 30, picMerge)
    if isAlly then
	if tName = "Dragon" then
	    Pic.Draw (classIconDragon, x - iconDistanceFromCenter, y - 30, picMerge)
	elsif tName = "Blue" then
	    Pic.Draw (classIconBlue, x - iconDistanceFromCenter, y - 30, picMerge)
	elsif tName = "July" then
	    Pic.Draw (classIconJuly, x - iconDistanceFromCenter, y - 30, picMerge)
	end if
    else
	Font.Draw (intstr (tSpeed), x - 13, y - 20, FontLSN12, 21)
	Font.Draw (intstr (tSpeed), x - 15, y - 20, FontLSN12, 21)
	Font.Draw (intstr (tSpeed), x - 14, y - 21, FontLSN12, 21)
	Font.Draw (intstr (tSpeed), x - 14, y - 20, FontLSN12, 31)
    end if
end DrawHPA
