% Global Variables.

% Input Control
var Mx, My, Mb : int
var Pressed : array char of boolean
var Pass : boolean := false
var Message : string

% game pieces
var pRedBMP : int := Pic.FileNew ("Images\\Piece_Red.bmp")
var pGreyBMP : int := Pic.FileNew ("Images\\Piece_Grey.bmp")
var pBlueBMP : int := Pic.FileNew ("Images\\Piece_Blue.bmp")
var pBlackBMP : int := Pic.FileNew ("Images\\Piece_Black.bmp")
var die1 : int := Pic.FileNew ("Images\\Die_1.bmp")
var die2 : int := Pic.FileNew ("Images\\Die_2.bmp")
var die3 : int := Pic.FileNew ("Images\\Die_3.bmp")
var die4 : int := Pic.FileNew ("Images\\Die_4.bmp")
var die5 : int := Pic.FileNew ("Images\\Die_5.bmp")
var die6 : int := Pic.FileNew ("Images\\Die_6.bmp")
var die7 : int := Pic.FileNew ("Images\\Die_7.bmp")
var die8 : int := Pic.FileNew ("Images\\Die_8.bmp")
type pieceComposition :
    record
	pID : string
	pX : int
	pY : int
	pCondition : boolean %% Finished or not
	pP : int % piece Position
    end record

% Teams (To be Added)
type teamComposition :
    record
	name : string
	id : int
	player : int
	turn : int
	piece : array 1 .. 7 of pieceComposition
       % pTotal : int % Sum of pieces
	totalRoll : int
	Avatar : int
	Name : string
    end record

var teamNo : int := 2
var Team : array 0 .. teamNo of teamComposition

for i : 0 .. 1
    Team (i).name := "Player " + intstr (i + 1)
    Team (i).id := i
    Team (i).player := i
    Team (i).turn := 100
    Team (i).totalRoll := 0
    for s : 1 .. 7
	Team (i).piece (s).pID := "red"
	Team (i).piece (s).pX := 0
	Team (i).piece (s).pY := 0
	Team (i).piece (s).pCondition := false
	Team (i).piece (s).pP := -s
    end for
    %Team (i).pTotal := 0
end for

% Fonts
var Font1 := Font.New ("Marcellus:7")
var Font2 := Font.New ("Marcellus:13")
var Font3 := Font.New ("Marcellus:20")
var FontName := Font.New ("Marcellus:15")

% Colours
var Bronze : int := 1
var Gold : int := 2
var Sparkle : int := 3
var Brown : int := 4
RGB.SetColor (Bronze, 118 / 255, 93 / 255, 64 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (Gold, 166 / 255, 125 / 255, 75 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (Sparkle, 225 / 255, 200 / 255, 140 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (Brown, 61 / 255, 53 / 255, 31 / 255) % (Colour Index / 255 = 0.-)

% Characters 
% Avatar size = 134 x 134
var aLeopard : int := Pic.FileNew ("Images\\Avatar_Leopard.bmp")
var aWolf : int := Pic.FileNew ("Images\\Avatar_Wold.bmp")
var aOwl : int := Pic.FileNew ("Images\\Avatar_Owl.bmp")
var aCobra : int := Pic.FileNew ("Images\\Avatar_Cobra.bmp")
% Name Character Limit = 14
Team (0).Avatar := aLeopard
Team (0).Name := "Leopard"
Team (1).Avatar := aOwl
Team (1).Name := "Owl"

% Images
var introBMP : int := Pic.FileNew ("Images\\introUR.bmp")
var postScreenBMP : int := Pic.FileNew ("Images\\PostScreen.bmp")
var mainMenuBMP : int := Pic.FileNew ("Images\\mainMenuUR.bmp")
var mmPlayBMP : int := Pic.FileNew ("Images\\mmPlay.bmp")
var mmRulesBMP : int := Pic.FileNew ("Images\\mmRules.bmp")
var mmQuitBMP : int := Pic.FileNew ("Images\\mmQuit.bmp")
var mmRulesPageBMP : int := Pic.FileNew ("Images\\mmRulesPage.bmp")
var urBMP : int := Pic.FileNew ("Images\\UR_BG.bmp")
var pDestroyed : int := Pic.FileNew ("Images\\Destroyed.bmp")
