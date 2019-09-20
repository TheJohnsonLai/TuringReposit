%% Debugging

var StartPC : int := 0 %% start stream once
var PressReady : boolean := true %% Print one line
var ExcursionCount : int := 0

proc Debug
    Font.Draw ("| mx: " + intstr (Mx) + " | my: " + intstr (My) + " | MOVEX: " + intstr (MovedX) + " | MOVEY" + intstr (MovedY), 12, 16, FontM12, 19)
end Debug

proc DebugBattle
    Font.Draw ("| mx: " + intstr (Mx) + " | my: " + intstr (My) + 
    " | MOVEX: " + intstr (MovedX) + " | MOVEY" 
    + intstr (MovedY), 200, 700, FontM12, 16)
end DebugBattle

proc PrintCoordinates
    var SaveName : string := "CoordSubStory.txt"
    if StartPC = 0 then
	open : stream, SaveName, put
	StartPC := 1
    end if
    if Pressed (' ') & PressReady & StartPC = 1 then
	var eName : string := "subStoryN (" + intstr (ExcursionCount) + ") := '" + intstr (ExcursionCount) + ". Name'"
	var eDesc : string := "subStoryD (" + intstr (ExcursionCount) + ") := 'Sub Story Description Here'"
	var CoordX : string := "subStoryC (" + intstr (ExcursionCount) + ", 0) := " + intstr (-1 * MovedX + Mx)
	var CoordY : string := "subStoryC (" + intstr (ExcursionCount) + ", 1) := " + intstr (My)
	put : stream, eName
	put : stream, eDesc
	put : stream, CoordX
	put : stream, CoordY
	ExcursionCount += 1
	PressReady := false
    elsif Pressed (KEY_ENTER) & StartPC = 1 then
	var Coords : string := ":: :: :: :: END :: :: :: ::"
	put : stream, Coords
	StartPC := 2
	close : stream
    end if
    if Pressed (' ') = false then
	PressReady := true
    end if
end PrintCoordinates
