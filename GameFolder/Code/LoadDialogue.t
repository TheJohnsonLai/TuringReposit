%%%% Chat formatting
%%% Load Dialogue
var ChatString : array 1 .. 10 of string
var InputChat : string

proc MidscreenInput (Message : string)

    Font.Draw (Message, maxx div 2 - Font.Width (Message, FontChat) div 2, maxy div 2 - 8, FontChat, ChatGrey)

end MidscreenInput

proc StoryChat (Speaker : ID, Dialogue : string, ChatRightSide : boolean)

    % 740 x 100 (15) =    60 letters Horizontal, 100,120,140,160
    var FormatX, FormatY : int
    var ChatLetterArray : array 1 .. 280 of string
    var LastWordPosition : int := 70
    var LastWordPosition2 : int := 140
    var LastWordPosition3 : int := 210
    if ChatRightSide = true then
	Pic.Draw (Chat_BottomRight, 0, 0, picMerge)
	FormatX := 465
	FormatY := 215
	Pic.Draw (Speaker.Avatar, 938, 720 - 480, picMerge)
	Draw.Text (Speaker.Name + ", Lv." + intstr (Speaker.TotalLevel), 990, 246, FontChatName, PSOWhite)
    elsif ChatRightSide = false then
	Pic.Draw (Chat_TopLeft, 0, 0, picMerge)
	FormatX := 40
	FormatY := 555
	Pic.Draw (Speaker.Avatar, 18, 720 - 143, picMerge)
	Draw.Text (Speaker.Name + ", Lv." + intstr (Speaker.TotalLevel), 68, 720 - 137, FontChatName, PSOWhite)
    end if

    for StoreLetter : 1 .. length (Dialogue)
	ChatLetterArray (StoreLetter) := Dialogue (StoreLetter)
    end for

    if length (Dialogue) <= 70 then
	Font.Draw (Dialogue (1 .. *), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
    elsif length (Dialogue) <= 140 then
	for DetectSpace : 1 .. 69
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition := DetectSpace
	    end if
	end for
	%%if Dialogue (71) = " " then
	%    Font.Draw (Dialogue (1 .. 70), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
	%    Font.Draw (Dialogue (72 .. *), FormatX, FormatY - (30 * 2), FontChat, ChatGrey)
	%else
	Font.Draw (Dialogue (1 .. LastWordPosition), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
	Font.Draw (Dialogue (LastWordPosition + 1 .. *), FormatX, FormatY - (30 * 2), FontChat, ChatGrey)
	%end if
    elsif length (Dialogue) <= 210 then
	for DetectSpace : 1 .. 69
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition := DetectSpace
	    end if
	end for
	Font.Draw (Dialogue (1 .. LastWordPosition), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
	for DetectSpace : LastWordPosition .. 139
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition2 := DetectSpace
	    end if
	end for
	Font.Draw (Dialogue (LastWordPosition + 1 .. LastWordPosition2), FormatX, FormatY - (30 * 2), FontChat, ChatGrey)
	Font.Draw (Dialogue (LastWordPosition2 + 1 .. *), FormatX, FormatY - (30 * 3), FontChat, ChatGrey)
    elsif length (Dialogue) <= 280 then %% Max letters, ~= 28 words.
	for DetectSpace : 1 .. 69
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition := DetectSpace
	    end if
	end for
	Font.Draw (Dialogue (1 .. LastWordPosition), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
	for DetectSpace : LastWordPosition .. 139
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition2 := DetectSpace
	    end if
	end for
	Font.Draw (Dialogue (LastWordPosition + 1 .. LastWordPosition2), FormatX, FormatY - (30 * 2), FontChat, ChatGrey)
	for DetectSpace : LastWordPosition2 .. 209
	    if Dialogue (DetectSpace) = " " then
		LastWordPosition3 := DetectSpace
	    end if
	end for
	Font.Draw (Dialogue (LastWordPosition2 + 1 .. LastWordPosition3), FormatX, FormatY - (30 * 3), FontChat, ChatGrey)
	Font.Draw (Dialogue (LastWordPosition3 + 1 .. *), FormatX, FormatY - (30 * 4), FontChat, ChatGrey)


	%Font.Draw (Dialogue (1 .. 70), FormatX, FormatY - (30 * 1), FontChat, ChatGrey)
	%Font.Draw (Dialogue (71 .. 140), FormatX, FormatY - (30 * 2), FontChat, ChatGrey)
	%Font.Draw (Dialogue (141 .. 210), FormatX, FormatY - (30 * 3), FontChat, ChatGrey)
	%Font.Draw (Dialogue (211 .. *), FormatX, FormatY - (30 * 4), FontChat, ChatGrey)
    end if
    Pic.Draw (Border, 0, 0, picMerge)
end StoryChat

proc StoryProgress (Speaker : ID, ChatRightSide : boolean)
    %Input.KeyDown (Pressed)
    Input.KeyDown (Pressed)
    if Pressed (' ') then
	Chapter += 1
	delay (250)
    elsif Pressed (KEY_DOWN_ARROW) then
	if Chapter mod 10 = 0 then
	else
	    if ChatRightSide = true then %% Ensure only 1 skip per spacebar, instead of 2.
		Chapter += 1
	    end if
	    delay (150)
	end if
    elsif Pressed (KEY_UP_ARROW) then
	if Chapter mod 10 = 0 then
	else
	    if ChatRightSide = true then
		Chapter -= 1
	    end if
	    delay (150)
	end if
    end if

    StoryChat (Speaker, InputChat, ChatRightSide)

    if My >= (720 - 678) and My <= (720 - 652) then
	if Mx >= 513 and Mx <= 664 then
	    Draw.Dot (508, 720 - 665, GlowAqua)
	    if Mb = 1 then
		Chapter += 1
		delay (150)
	    end if
	elsif Mx >= 799 and Mx <= 825 then
	    Draw.Dot (794, 720 - 665, GlowAqua)
	    if Mb = 1 then
		if Chapter - 1 = 0 then
		elsif Chapter - 1 = -101 then
		else
		    Chapter -= 1
		    delay (150)
		end if
	    end if
	elsif Mx >= 899 and Mx <= 925 then
	    Draw.Dot (894, 720 - 665, GlowAqua)
	    if Mb = 1 then
		Chapter += 1
		delay (150)
	    end if
	elsif Mx >= 1043 and Mx <= 1069 then
	    Draw.Dot (1038, 720 - 665, GlowAqua)
	end if
    end if
end StoryProgress
