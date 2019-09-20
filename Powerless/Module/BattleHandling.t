%%%%%%%%% Battle restriction %%%%%%%%%%%%
proc MaintainStat
    % Maintain overflow of HP/TotalHp - Battle.t
end MaintainStat

proc DisplayTempStats (xChar : characterInfo, isAlly : boolean)
    var disHP : real := xChar.tempHealth
    var disA : real := xChar.tempArmor

    if isAlly then % Right
	Draw.FillBox (Mx, My, Mx + 250, My + 130, 16)
	Font.Draw ("HEALTH: " + realstr (round (disHP), 2), Mx + 25, My + 90, FontM12, 31)
	Font.Draw ("Armor: " + realstr (round (disA), 2), Mx + 25, My + 70, FontM12, 31)
    else % To left
	Draw.FillBox (Mx, My, Mx - 250, My + 130, 16)
	Font.Draw ("HEALTH: " + realstr (round (disHP), 2), Mx - 225, My + 90, FontM12, 31)
	Font.Draw ("Armor: " + realstr (round (disA), 2), Mx - 225, My + 70, FontM12, 31)
    end if
end DisplayTempStats
