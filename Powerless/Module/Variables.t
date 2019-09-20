% Global Variables (Input, Font, Colour)

% Story
var storyChapter : int := 0

% Input variables
var Mx, My, Mb : int % Mouse
var StoredX, StoredY : int := 0 % Previous X
var MovedX, MovedY : int := 0 % Total difference
var Pressed : array char of boolean % keyboard
var MouseReady : boolean := true % Mb = 0
var stream : int % File
var Filex : string % File name
var Exit : boolean := false %% ?

%%%%% Colours
var Gold : int := 1
var BorderBlue : int := 2
var BGBlue : int := 3
var BasicText : int := 4
var FoeRed : int := 5
var Orange : int := 6
var BasicBlue : int := 7
var Bronze : int := 8
var HealthBlue2 : int := 9
var PowerWhite : int := 10
var MelGreen : int := 11
var HealthPink : int := 12
var GlowAqua : int := 13
var SearingRed : int := 14
var GlowPurple : int := 251
var ChatGrey : int := 255
var PSOWhite : int := 254
var PSOBlue : int := 253
var PSODarkBlue : int := 252
var HealthBlue : int := 250
var ArmorTan : int := 249
var BarGrey : int := 248
var HealthRed : int := 247
var ArmorGold : int := 246
RGB.SetColor (Gold, 247 / 255, 219 / 255, 144 / 255) % (Colour Index / 255 = 0.-)
RGB.SetColor (BorderBlue, 53 / 255, 62 / 255, 69 / 255) % 
RGB.SetColor (BGBlue, 3 / 255, 10 / 255, 12 / 255) % 
RGB.SetColor (BasicText, 201 / 255, 208 / 255, 224 / 255) % 
RGB.SetColor (FoeRed, 198 / 255, 0.00, 33 / 255) %
RGB.SetColor (SearingRed, 91 / 255, 15 / 255, 19 / 255) %
RGB.SetColor (Orange, 255 / 255, 89 / 255, 0.00) % 
RGB.SetColor (BasicBlue, 119 / 255, 185 / 255, 1.00) % 
RGB.SetColor (Bronze, 129 / 255, 107 / 255, 92 / 255) % 
RGB.SetColor (HealthBlue2, 65 / 255, 161 / 255, 234 / 255) % 
RGB.SetColor (PowerWhite, 203 / 255, 242 / 255, 230 / 255) % 
RGB.SetColor (MelGreen, 75 / 255, 193 / 255, 81 / 255) % 
RGB.SetColor (HealthPink, 168 / 255, 42 / 255, 193 / 255) % 
RGB.SetColor (GlowAqua, 25 / 255, 130 / 255, 157 / 255) %
RGB.SetColor (ChatGrey, 230 / 255, 237 / 255, 248 / 255) % 
RGB.SetColor (PSOWhite, 200 / 255, 222 / 255, 233 / 255) % PSO
RGB.SetColor (PSOBlue, 56 / 255, 139 / 255, 173 / 255) %PSO
RGB.SetColor (PSODarkBlue, 19 / 255, 40 / 255, 53 / 255) % PSO
RGB.SetColor (GlowPurple, 71 / 255, 30 / 255, 122 / 255) % PSO
RGB.SetColor (HealthBlue, 153 / 255, 184 / 255, 196 / 255) % 
RGB.SetColor (ArmorTan, 211 / 255, 192 / 255, 182 / 255) % 
RGB.SetColor (BarGrey, 170 / 255, 170 / 255, 180 / 255) % 
RGB.SetColor (HealthRed, 255 / 255, 43 / 255, 64 / 255) % 
RGB.SetColor (ArmorGold, 170 / 255, 170 / 255, 180 / 255) % 


% Fonts
var FontM10 := Font.New ("Marcellus:10")
var FontM12 := Font.New ("Marcellus:12")
var FontM14 := Font.New ("Marcellus:14")
var FontSH12 := Font.New ("DFP Sc Sans Heue30_103:12")
var FontSH14 := Font.New ("DFP Sc Sans Heue30_103:14")
var FontKT12 := Font.New ("Kravitz Thermal:12")
var FontMA12 := Font.New ("Mamelon:12")
var FontLSN12 := Font.New ("Liberation Sans Narrow:12")

% fontchat CAP = 14.5p x
% fontchat Lower = 11p x
% fontchat number = 12.5p x
% fontchat space = 5p x



