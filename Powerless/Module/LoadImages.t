% Variables, picture creation, etc

% Main Menu
var introBMP : int := Pic.FileNew ("Image\\introBMP.bmp")
var introMenuBMP : int := Pic.FileNew ("Image\\introMenuBMP.bmp")
var iM1Hover : int := Pic.FileNew ("Image\\introNewBMP.bmp")
var iM2Hover : int := Pic.FileNew ("Image\\introLoadBMP.bmp")
var iM3Hover : int := Pic.FileNew ("Image\\introGuideBMP.bmp")

% General
var ExitFalse : int := Pic.FileNew ("Image\\ExitFalse5.bmp") % 1,2,3,4,5
var ExitTrue : int := Pic.FileNew ("Image\\ExitTrue5.bmp")
var AngelFalse : int := Pic.FileNew ("Image\\AngelFalse.bmp")
var AngelFalseHover : int := Pic.FileNew ("Image\\AngelFalseHover.bmp")

% Lobby
var outline : int := Pic.FileNew ("Image\\outlineBMP2.bmp") % ,2
var lobbyInterface : int := Pic.FileNew ("Image\\lobbyInterfaceBMP4.bmp") % ,2,3,4 Lobby Options 
var lobbyMap : int := Pic.FileNew ("Image\\lobbyMapBMPBG2.bmp") % 1,2,3,White,BG1
var lobbyHover := Pic.FileNew ("Image\\LobbyUnderHoverFull.bmp")
var lobbyHoverRed := Pic.FileNew ("Image\\LobbyHoverRed.bmp")
% Lobbay - Challenge
var ScrollUpHover : int := Pic.FileNew ("Image\\ScrollUpHover.bmp") %
var ScrollDownHover : int := Pic.FileNew ("Image\\ScrollDownHover.bmp") %
var lobbyChallenge : int := Pic.FileNew ("Image\\lobbyChallenge.bmp") % Challenge
var lobbyChallengeOverlay : int := Pic.FileNew ("Image\\lobbyChallengeOverlay.bmp") %
% Lobby - Character
var lobbyCharacter : int := Pic.FileNew ("Image\\lobbyCharacter3.bmp") % Customize Screen 1,2,3
var CharacterHoverDragon : int := Pic.FileNew ("Image\\CharacterHoverDragon.bmp") %
var CharacterHoverBlue : int := Pic.FileNew ("Image\\CharacterHoverBlue.bmp") %
var CharacterHoverJuly : int := Pic.FileNew ("Image\\CharacterHoverJuly.bmp") %
var lobbyCharacterCustomize : int := Pic.FileNew ("Image\\lobbyCharacterCustomize.bmp") %
% Lobby - System
var lobbySystem : int := Pic.FileNew ("Image\\lobbySystem.bmp") % LARGE BG
var lobbySystemSave : int := Pic.FileNew ("Image\\lobbySystemSave.bmp") % SAVE + RIGHT CLEAR
var lobbySystemLoad : int := Pic.FileNew ("Image\\lobbySystemLoad.bmp") % LOAD + LEFT CLEAR
var SystemProfileHover : int := Pic.FileNew ("Image\\SystemHover.bmp") % HOVER HIGHLIGHT PROFILES
var SystemSaveHover : int := Pic.FileNew ("Image\\SystemSaveHover2.bmp") % 1,2
var SystemLoadHover : int := Pic.FileNew ("Image\\SystemLoadHover2.bmp") % 1,2
% Confirm - Yes No / 3 segments (2 per) + Yes No Hover
var SystemConfirmLoad : int := Pic.FileNew ("Image\\SystemConfirmLoad.bmp")
var SystemConfirmSave : int := Pic.FileNew ("Image\\SystemConfirmSave.bmp")
var SystemConfirmYesNo : int := Pic.FileNew ("Image\\SystemConfirmYesNo.bmp") % Bottom half
var SystemHoverYes : int := Pic.FileNew ("Image\\SystemHoverYes.bmp")
var SystemHoverNo : int := Pic.FileNew ("Image\\SystemHoverNo.bmp")


%var lobbyHover : array 0 .. 4 of int
%lobbyHover (0) := Pic.FileNew ("Image\\Lobby_Hover_1.bmp")
%lobbyHover (1) := Pic.FileNew ("Image\\Lobby_Hover_2.bmp")
%lobbyHover (2) := Pic.FileNew ("Image\\Lobby_Hover_3.bmp")
%lobbyHover (3) := Pic.FileNew ("Image\\Lobby_Hover_4.bmp")
%lobbyHover (4) := Pic.FileNew ("Image\\Lobby_Hover_5.bmp")

% Handling
var hpaOverlay : int  := Pic.FileNew ("Image\\HUD_HPA_Overlay.bmp") 
var hpaUnderlay : int  := Pic.FileNew ("Image\\HUD_HPA_Underlay2.bmp") 
var classIconDragon : int := Pic.FileNew ("Image\\ClassIconDragon.bmp")
var classIconBlue : int := Pic.FileNew ("Image\\ClassIconBlue.bmp")
var classIconJuly : int := Pic.FileNew ("Image\\ClassIconJuly.bmp")
% Battle - BG
var bgMausoleum : int := Pic.FileNew ("Image\\BattleScene_Mausoleum.bmp")
var bgCity : int := Pic.FileNew ("Image\\BattleScene_City.bmp")
var bgPlains : int := Pic.FileNew ("Image\\bgPlains.bmp")
% Action & Battle
var battleDesc : int := Pic.FileNew ("Image\\battleDescTopBMP.bmp")
var outlineBattle : int := Pic.FileNew ("Image\\outlineBattleBMP.bmp")
var BattleDesign : int := Pic.FileNew ("Image\\BattleDesign4.bmp")

var dDragon : int := Pic.FileNew ("Image\\BlockDragon3.bmp") % ,4
var dBlue : int := Pic.FileNew ("Image\\BlockBlue3.bmp")
var dJuly : int := Pic.FileNew ("Image\\BlockJuly3.bmp")
var dDragonGlance : int := Pic.FileNew ("Image\\BlockDragonGlance2.bmp") % 2,3, Glance
var dBlueGlance : int := Pic.FileNew ("Image\\BlockBlueGlance2.bmp")
var dJulyGlance : int := Pic.FileNew ("Image\\BlockJulyGlance2.bmp")
var dDragonHover : int := Pic.FileNew ("Image\\BlockDragonPress.bmp") % Hover 
var dBlueHover : int := Pic.FileNew ("Image\\BlockBluePress.bmp")
var dJulyHover : int := Pic.FileNew ("Image\\BlockJulyPress.bmp")
% Sprites
var DragonSprite : int := Pic.FileNew ("Image\\IG_DragonBMP.bmp")
var BlueSprite : int := Pic.FileNew ("Image\\IG_WolfeBMP.bmp")
var JulySprite : int := Pic.FileNew ("Image\\IG_JulyBMP.bmp")
var SillnessSprite : int := Pic.FileNew ("Image\\Char_Sillness2_Body.bmp")
var CleoSprite : int := Pic.FileNew ("Image\\Char_Cleo_Body.bmp")
var SeiraSprite : int := Pic.FileNew ("Image\\Char_Seira_Body.bmp")
% Avatar
var DragonAvatar : int := Pic.FileNew ("Image\\Char_Dragon_Avatar.bmp")
var BlueAvatar : int := Pic.FileNew ("Image\\Char_Blue_Avatar.bmp")
var JulyAvatar : int := Pic.FileNew ("Image\\Char_July_Avatar.bmp")

var TurnPointer : int := Pic.FileNew ("Image\\TurnPointer2.bmp")
