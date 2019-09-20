%%% ANimations

%% Animation MOdules
proc Animation (AUser, ASkill : int)
    var SkillName : int := ASkill
    if Character (AUser).Name = "Sillness" then
	if ASkill <= 110 then
	    for AnimateStrike : 1 .. 10
		%SkillName := "" + intstr (AnimateStrike)
		Pic.Draw (AnimationSillness (AnimateStrike),-90,90,picMerge)
		View.Update
	    end for
	end if
    else
    end if
end Animation
