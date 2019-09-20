% Variables, picture creation, etc

% Main Images (png)
var IntroBMP : int := Pic.FileNew ("Images\\LF_Intro.bmp")
var MainMenuBMP : int := Pic.FileNew ("Images\\LF_MainMenu.bmp") %% Start
var LF_LOAD_Menu : int := Pic.FileNew ("Images\\LF_LOAD_Menu.bmp")
var LF_LOAD_Selected : int := Pic.FileNew ("Images\\LF_LOAD_Selected.bmp")
var MapBMP : int := Pic.FileNew ("Images\\Map.bmp")
var PinkSpirit : int := Pic.FileNew ("Images\\Pink Spirit.bmp")
var BlackSpirit : int := Pic.FileNew ("Images\\Black Spirit.bmp")
var VictoryScene : int := Pic.FileNew ("Images\\VictoryScene.bmp")
var FailureScene : int := Pic.FileNew ("Images\\FailureScene.bmp") %% Start

%%%% Music
var RightArrow : int := Pic.FileNew ("Images\\RightArrowSound.bmp")
var LeftArrow : int := Pic.FileNew ("Images\\LeftArrowSound.bmp")
var MusicImage_LostForest : int := Pic.FileNew ("Images\\Music Images\\MusicImage_LostForest.bmp")
var MusicImage_Koibumi : int := Pic.FileNew ("Images\\Music Images\\MusicImage_Koibumi.bmp")
var MusicImage_KOTOKO : int := Pic.FileNew ("Images\\Music Images\\MusicImage_KOTOKO.bmp")
var MusicImage_Meteor : int := Pic.FileNew ("Images\\Music Images\\MusicImage_Meteor.bmp")
var MusicImage_Shelter : int := Pic.FileNew ("Images\\Music Images\\MusicImage_Shelter.bmp")

% Overlays
var BattleMenuSettings : int := Pic.FileNew ("Images\\BattleMenuSettings.bmp")
var Border : int := Pic.FileNew ("Images\\Border.bmp")
var Chat_BottomRight : int := Pic.FileNew ("Images\\Chat_BottomRight.bmp")
var Chat_TopLeft : int := Pic.FileNew ("Images\\Chat_TopLeft.bmp")
var ExitButton : int := Pic.FileNew ("Images\\Exit.bmp")
var GUIBossInfo : int := Pic.FileNew ("Images\\GUI_bosshppoweravatar.bmp")
var GUIFoeInfo : int := Pic.FileNew ("Images\\GUI_foehppoweravatar.bmp")
var GUIPartyInfo : int := Pic.FileNew ("Images\\GUI_hppoweravatar.bmp")
%var GUI_BottomScreen : int := Pic.FileNew ("Images\\GUI_screen.bmp")
%var GUI_TopScreen : int := Pic.FileNew ("Images\\GUI_topscreen.bmp")
var MainMenuFileIO : int := Pic.FileNew ("Images\\mmFileIO.bmp")
var MainMenuFileIOSave : int := Pic.FileNew ("Images\\mmFileIOSave.bmp")
var MainMenuFileIOLoad : int := Pic.FileNew ("Images\\mmFileIOLoad.bmp")
var MainMenuFileIOSaveHighlight : int := Pic.FileNew ("Images\\mmFileIOSaveHighlight.bmp")
var MainMenuFileIOLoadHighlight : int := Pic.FileNew ("Images\\mmFileIOLoadHighlight.bmp")
var MainMenuParty : int := Pic.FileNew ("Images\\mmParty.bmp")
var MainMenuPartyUnlocked : int := Pic.FileNew ("Images\\mmPartyUnlocked.bmp")
var MainMenuInventory : int := Pic.FileNew ("Images\\mmInventory.bmp")
var MainMenuInventoryUnlocked : int := Pic.FileNew ("Images\\mmInventoryUnlocked.bmp")
var MainMenuSettings : int := Pic.FileNew ("Images\\mmSettings.bmp")
var MainMenuSettingsUnlocked : int := Pic.FileNew ("Images\\mmSettingsUnlocked.bmp")
var MainMenuSettingsInstructions : int := Pic.FileNew ("Images\\mmSettingsInstructions.bmp")
var MainMenuSettingsSounds : int := Pic.FileNew ("Images\\mmSettingsSounds.bmp")
var MapOverlay : int := Pic.FileNew ("Images\\MapScreenSmall.bmp")
var MidscreenMessage : int := Pic.FileNew ("Images\\msmessage.bmp")

var MainMenuNew : int := Pic.FileNew ("Images\\MainMenuNew.bmp") %% Highlight button mm
var MainMenuLoad : int := Pic.FileNew ("Images\\MainMenuLoad.bmp")
var MainMenuQuit : int := Pic.FileNew ("Images\\MainMenuQuit.bmp")

%var MainMenuQuit : int := Pic.FileNew ("Images\\MainMenuQuit.bmp")

%Cities
var City_Buttons_Market : int := Pic.FileNew ("Images\\City_Buttons_Market.bmp")
var City_Buttons_Practice : int := Pic.FileNew ("Images\\City_Buttons_Practice.bmp")
var City_Buttons_Missions : int := Pic.FileNew ("Images\\City_Buttons_Missions.bmp")
var City_Market : int := Pic.FileNew ("Images\\City_Market.bmp")
var City_Velia : int := Pic.FileNew ("Images\\City_Velia.bmp")
% Battle Scenes
var PreBattleBackground : int := Pic.FileNew ("Images\\PreBattleMenu.bmp")
var PreBattleBackgroundReady : int := Pic.FileNew ("Images\\PreBattleMenuReady.bmp")
var BattleScene_Marsh : int := Pic.FileNew ("Images\\BattleScene_Marsh.bmp")
var BattleScene_Balenos : int := Pic.FileNew ("Images\\BattleScene_Balenos.bmp")
var BattleScene_Bridgeway : int := Pic.FileNew ("Images\\BattleScene_Bridgeway.bmp")
var BattleScene_CronCastle : int := Pic.FileNew ("Images\\BattleScene_CronCastle.bmp")
var BattleScene_ElricShrine : int := Pic.FileNew ("Images\\BattleScene_ElricShrine.bmp")
var BattleScene_Mausoleum : int := Pic.FileNew ("Images\\BattleScene_Mausoleum.bmp")
var BattleScene_Raceway : int := Pic.FileNew ("Images\\BattleScene_Raceway.bmp")
var BattleScene_Sausans : int := Pic.FileNew ("Images\\BattleScene_Sausans.bmp")

% Background images
var BG_SansTsukoLibrary : int := Pic.FileNew ("Images\\Background\\BG_SansTsukoLibrary.bmp")
var BG_SansTsukoCorner : int := Pic.FileNew ("Images\\Background\\BG_SansTsukoCorner.bmp")
var BG_SansTsuko : int := Pic.FileNew ("Images\\Background\\BG_SansTsuko.bmp")
var BG_Herain : int := Pic.FileNew ("Images\\Background\\BG_Herain.bmp")
var BG_Ichennie : int := Pic.FileNew ("Images\\Background\\BG_Ichennie.bmp")
var BG_RuinsOfAmerica : int := Pic.FileNew ("Images\\Background\\BG_RuinsOfAmerica.bmp")
var BG_Balenos : int := Pic.FileNew ("Images\\Background\\BG_Balenos.bmp")
var BG_Velia : int := Pic.FileNew ("Images\\BG_Velia.bmp")

% Settings :: Music Video Images
var Vid_LoveLetter : int := Pic.FileNew ("Images\\MusicImage_Koibumi.bmp")

% Inventory Objects
var Shard_Attack : int := Pic.FileNew ("Images\\Inventory\\Shard_Attack.bmp")
var Shard_Critical : int := Pic.FileNew ("Images\\Inventory\\Shard_Critical.bmp")
var Shard_Health : int := Pic.FileNew ("Images\\Inventory\\Shard_Health.bmp")
var Shard_Defense : int := Pic.FileNew ("Images\\Inventory\\Shard_Defense.bmp")
var Shard_Power : int := Pic.FileNew ("Images\\Inventory\\Shard_Power.bmp")
var Shard_Speed : int := Pic.FileNew ("Images\\Inventory\\Shard_Speed.bmp")

% Game Objects
var TurnPointer : int := Pic.FileNew ("Images\\TurnPointer2.bmp")
var bodyshadow : int := Pic.FileNew ("Images\\bodyshadow.bmp")

% Character Bodies
var CB_Aeron : int := Pic.FileNew ("Images\\Characters\\Char_Aeron_Body.bmp") %%%%%
var CB_Cleo : int := Pic.FileNew ("Images\\Characters\\Char_Cleo_Body.bmp") %%%%%
var CB_Cosseus : int := Pic.FileNew ("Images\\Characters\\Char_Cosseus_Body.bmp")
var CB_Drin : int := Pic.FileNew ("Images\\Characters\\Char_D_Rin_Body.bmp")
var CB_Rage : int := Pic.FileNew ("Images\\Characters\\Char_Rage_Body.bmp") %%%%%
var CB_Ravness : int := Pic.FileNew ("Images\\Characters\\Char_Ravness_Body.bmp")
var CB_Seira : int := Pic.FileNew ("Images\\Characters\\Char_Seira_Body.bmp")
var CB_Sillness : int := Pic.FileNew ("Images\\Characters\\Char_Sillness2_Body.bmp")
var CB_Wolfe : int := Pic.FileNew ("Images\\Characters\\Char_Wolfe_Body.bmp")
var CB_Zefan : int := Pic.FileNew ("Images\\Characters\\Char_Zefan_Body.bmp")

% Avatars
var AV_Aeron : int := Pic.FileNew ("Images\\Characters\\Avatar_Aeron.bmp")
var AV_Cleo : int := Pic.FileNew ("Images\\Characters\\Avatar_Cleo.bmp")
var AV_Cosseus : int := Pic.FileNew ("Images\\Characters\\Avatar_cosseus.bmp")
var AV_Drin : int := Pic.FileNew ("Images\\Characters\\Avatar_drin.bmp")
var AV_Rage : int := Pic.FileNew ("Images\\Characters\\Avatar_Rage.bmp")
var AV_Ravness : int := Pic.FileNew ("Images\\Characters\\Avatar_ravness.bmp")
var AV_Seira : int := Pic.FileNew ("Images\\Characters\\Avatar_Seira.bmp")
var AV_Sillness : int := Pic.FileNew ("Images\\Characters\\Avatar_sillness2.bmp")
var AV_Wolfe : int := Pic.FileNew ("Images\\Characters\\Avatar_Wolfe.bmp")
var AV_Zefan : int := Pic.FileNew ("Images\\Characters\\Avatar_zefan.bmp")

% Unlock Character Images : unlocked bodies
var UB_Aeron : int := Pic.FileNew ("Images\\Characters\\Unlocked_Aeron.bmp")
var UB_Cleo : int := Pic.FileNew ("Images\\Characters\\Unlocked_Cleo.bmp")
var UB_Cosseus : int := Pic.FileNew ("Images\\Characters\\Unlocked_Cosseus.bmp")
var UB_Drin : int := Pic.FileNew ("Images\\Characters\\Unlocked_Drin.bmp")
var UB_Rage : int := Pic.FileNew ("Images\\Characters\\Unlocked_Rage.bmp")
var UB_Ravness : int := Pic.FileNew ("Images\\Characters\\Unlocked_Ravness.bmp")
var UB_Seira : int := Pic.FileNew ("Images\\Characters\\Unlocked_Seira.bmp")
var UB_Sillness : int := Pic.FileNew ("Images\\Characters\\Unlocked_Sillness.bmp")
var UB_Wolfe : int := Pic.FileNew ("Images\\Characters\\Unlocked_Wolfe.bmp")
var UB_Zefan : int := Pic.FileNew ("Images\\Characters\\Unlocked_Zefan.bmp")

%%%%%%%%%%%%%%%%%%%%%%% Animation
%%% Sillness - Strike
var AnimationSillness : array 1 .. 10 of int
AnimationSillness (1) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation.bmp")
AnimationSillness (2) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation2.bmp")
AnimationSillness (3) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation3.bmp")
AnimationSillness (4) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation4.bmp")
AnimationSillness (5) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation5.bmp")
AnimationSillness (6) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation6.bmp")
AnimationSillness (7) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation7.bmp")
AnimationSillness (8) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation8.bmp")
AnimationSillness (9) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation9.bmp")
AnimationSillness (10) := Pic.FileNew ("Images\\Animation\\Sillness_Strike_Animation10.bmp")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1
%Skills %%%%%%%%%%%%%%%%%%%%% 4 = Basic ()()() ///  4 Special per person
var Skill_CrescentSlash : int := Pic.FileNew ("Images\\Skills\\Skill_CrescentSlash.bmp") %1 Power regen
var Skill_HeartWrench : int := Pic.FileNew ("Images\\Skills\\Skill_HeartWrench.bmp") %2 Leech
var Skill_NebulaBurst : int := Pic.FileNew ("Images\\Skills\\Skill_NebulaBurst.bmp") %3 Damage
var Skill_PhantomBurst : int := Pic.FileNew ("Images\\Skills\\Skill_PhantomBurst.bmp") %4 Damage
%%%% Regen
var Skill_Concentration := Pic.FileNew ("Images\\Skills\\Skill_Concentration.bmp") % Concentration
var Skill_SingleShot := Pic.FileNew ("Images\\Skills\\Skill_SingleShot.bmp") % Single shot
var Skill_FeatherStrike := Pic.FileNew ("Images\\Skills\\Skill_FeatherStrike.bmp") % Feather strike
var Skill_QuickStrike := Pic.FileNew ("Images\\Skills\\Skill_QuickStrike.bmp") % Quick Strike
%%%% 5
% Sillness
var Skill_Cloak : int := Pic.FileNew ("Images\\Skills\\Skill_Cloak.bmp") %5 Defense +
var Skill_DoubleImpact : int := Pic.FileNew ("Images\\Skills\\Skill_DoubleImpact.bmp") %6 Hits twice (x2) crescent slash
var Skill_QuickStep : int := Pic.FileNew ("Images\\Skills\\Skill_QuickStep.bmp") %7 Speed +
var Skill_SlowStep : int := Pic.FileNew ("Images\\Skills\\Skill_SlowStep.bmp") %8 Rejuvenate
var Skill_LightningPierce : int := Pic.FileNew ("Images\\Skills\\Skill_LightningPierce.bmp") %5 Defense +
var Skill_ShadowLotus : int := Pic.FileNew ("Images\\Skills\\Skill_ShadowLotus.bmp") %6 Hits twice (x2) crescent slash
var Skill_LightningRend : int := Pic.FileNew ("Images\\Skills\\Skill_LightningRend.bmp") %7 Speed +
var Skill_RainbowNuke : int := Pic.FileNew ("Images\\Skills\\Skill_RainbowNuke.bmp") %8 Rejuvenate
%%%% Ravness
var Skill_HalberdSlam : int := Pic.FileNew ("Images\\Skills\\Skill_HalberdSlam.bmp") % Halberd Slam
var Skill_SwingingCarve : int := Pic.FileNew ("Images\\Skills\\Skill_SwingingCarve.bmp") % Swinging Carve
var Skill_PoleBash : int := Pic.FileNew ("Images\\Skills\\Skill_PoleBash.bmp") % Pole Bash
var Skill_NeckPenetration : int := Pic.FileNew ("Images\\Skills\\Skill_NeckPenetration.bmp") % Neck Penetration
var Skill_Earthquake : int := Pic.FileNew ("Images\\Skills\\Skill_Earthquake.bmp") % Halberd Slam
var Skill_ArmoredDestruction : int := Pic.FileNew ("Images\\Skills\\Skill_ArmoredDestruction.bmp") % Swinging Carve
var Skill_Typhoon : int := Pic.FileNew ("Images\\Skills\\Skill_Typhoon.bmp") % Pole Bash
var Skill_Resurrect : int := Pic.FileNew ("Images\\Skills\\Skill_Resurrect.bmp") % Neck Penetration
%%%% Cosseus
var Skill_DivineArmor : int := Pic.FileNew ("Images\\Skills\\Skill_DivineArmor.bmp") % Divine Armor
var Skill_CrushingRoar : int := Pic.FileNew ("Images\\Skills\\Skill_CrushingRoar.bmp") % Aggro
var Skill_MultiLaser : int := Pic.FileNew ("Images\\Skills\\Skill_MultiLaser.bmp") % Multi-Laser
var Skill_BodySlam : int := Pic.FileNew ("Images\\Skills\\Skill_BodySlam.bmp") % Body Slam
var Skill_ShieldBlast : int := Pic.FileNew ("Images\\Skills\\Skill_ShieldBlast.bmp") % Divine Armor
var Skill_MaserCannon : int := Pic.FileNew ("Images\\Skills\\Skill_MaserCannon.bmp") % Aggro
var Skill_Quasar : int := Pic.FileNew ("Images\\Skills\\Skill_Quasar.bmp") % Multi-Laser
% Resurrect
%%%% Drin
var Skill_DualShot : int := Pic.FileNew ("Images\\Skills\\Skill_DualShot.bmp") % Dual Shot
var Skill_HeadShot : int := Pic.FileNew ("Images\\Skills\\Skill_HeadShot.bmp") % Headshot
var Skill_Spinfire : int := Pic.FileNew ("Images\\Skills\\Skill_Spinfire.bmp") % Spinfire
var Skill_CriticalShot : int := Pic.FileNew ("Images\\Skills\\Skill_CriticalShot.bmp") % Critical Shot
var Skill_RestrainShot : int := Pic.FileNew ("Images\\Skills\\Skill_RestrainShot.bmp") % Critical Shot
var Skill_VirusShot : int := Pic.FileNew ("Images\\Skills\\Skill_VirusShot.bmp") % Critical Shot
%var Skill_HandsBlazin : int := Pic.FileNew ("Images\\Skills\\Skill_HandsBlazin.bmp") % Zero Energy
%var Skill_Thief : int := Pic.FileNew ("Images\\Skills\\Skill_Thief.bmp") % Zero Energy
%%% 9
% Wolfe
var Skill_ClaweStrike : int := Pic.FileNew ("Images\\Skills\\Skill_ClaweStrike.bmp") %9 Hits 2 people, one and one on top 50%
var Skill_Ferenspirr : int := Pic.FileNew ("Images\\Skills\\Skill_Ferenspirr.bmp") %10 Hits 1, damage increases if their turn is closer
var Skill_SilentShadow : int := Pic.FileNew ("Images\\Skills\\Skill_SilentShadow.bmp") % Silent Shadow (Speed ++ Att++)
var Skill_HunterOfTheNight : int := Pic.FileNew ("Images\\Skills\\Skill_HunterOfTheNight.bmp") % Hunter of the night (Based on ownspeed + 5%max)
var Skill_SearingPalms : int := Pic.FileNew ("Images\\Skills\\Skill_SearingPalms.bmp") %9 Hits 2 people, one and one on top 50%
var Skill_Roundhauser : int := Pic.FileNew ("Images\\Skills\\Skill_RoundhouseKick.bmp") %10 Hits 1, damage increases if their turn is closer
var Skill_BusterJam : int := Pic.FileNew ("Images\\Skills\\Skill_BusterJam.bmp") % Silent Shadow (Speed ++ Att++)
var Skill_FivePointStrike : int := Pic.FileNew ("Images\\Skills\\Skill_FivePointStrike.bmp")
%%%% Rage
%%var Skill_Cloak : int := Pic.FileNew ("Images\\Skills\\Skill_Spinfire.bmp") % Spinfire
var Skill_Electrocute : int := Pic.FileNew ("Images\\Skills\\Skill_Electrocute.bmp") % Electrocute
var Skill_BackhandShot : int := Pic.FileNew ("Images\\Skills\\Skill_BackhandShot.bmp") % Backhand shot
var Skill_ZeroEnergy : int := Pic.FileNew ("Images\\Skills\\Skill_ZeroEnergy.bmp") % Zero Energy
var Skill_ElectricVortex : int := Pic.FileNew ("Images\\Skills\\Skill_ElectricVortex.bmp") % Zero Energy
var Skill_HandsBlazin : int := Pic.FileNew ("Images\\Skills\\Skill_HandsBlazin.bmp") % Zero Energy
var Skill_Thief : int := Pic.FileNew ("Images\\Skills\\Skill_Thief.bmp") % Zero Energy
% 6 = Head
% 7 = Regenea
% 8 = shot
% 9 = drinone
% 10 = Money boost? = thief
%%%
% Seira
var Skill_KatanaDualWield : int := Pic.FileNew ("Images\\Skills\\Skill_KatanaDualWield.bmp") %11 Stun 1turn (Speed +Total)
var Skill_KatanaFlash : int := Pic.FileNew ("Images\\Skills\\Skill_KatanaFlash.bmp") %12 Heavy damage multiplier
var Skill_Singularity : int := Pic.FileNew ("Images\\Skills\\Skill_Singularity.bmp") %13 Deals damage using teammates
var Skill_ThousandSlashes : int := Pic.FileNew ("Images\\Skills\\Skill_ThousandSlashes.bmp") %14 Hits 2 people, 60% damage multiple times
var Skill_GodHand : int := Pic.FileNew ("Images\\Skills\\Skill_GodHand.bmp") %11 Stun 1turn (Speed +Total)
var Skill_Focus : int := Pic.FileNew ("Images\\Skills\\Skill_Focus.bmp") %12 Heavy damage multiplier
var Skill_LonelySpirit : int := Pic.FileNew ("Images\\Skills\\Skill_LonelySpirit.bmp") %13 Deals damage using teammates
var Skill_Parry : int := Pic.FileNew ("Images\\Skills\\Skill_Parry.bmp")
%% 15
% Zefan
var Skill_GyroBurn : int := Pic.FileNew ("Images\\Skills\\Skill_GyroBurn.bmp") %15 Damage
var Skill_PhotonBlaze : int := Pic.FileNew ("Images\\Skills\\Skill_PhotonBlaze.bmp") %16 Damage + increase their speed by 5
var Skill_PillarofLight : int := Pic.FileNew ("Images\\Skills\\Skill_PillarofLight.bmp") %17 Hits 3-5 enemies, + shape
var Skill_SplitLaser : int := Pic.FileNew ("Images\\Skills\\Skill_SplitLasers.bmp") %18 Hits all enemies at 40% damage
var Skill_Regenerate : int := Pic.FileNew ("Images\\Skills\\Skill_Regenerate.bmp") %15 Passive Regen
var Skill_MeteorShower : int := Pic.FileNew ("Images\\Skills\\Skill_MeteorShower.bmp") %16 Damage + increase their speed by 5
var Skill_PhotonVortex : int := Pic.FileNew ("Images\\Skills\\Skill_PhotonVortex.bmp") %17 Hits 3-5 enemies, + shape
var Skill_PhotonExplosion : int := Pic.FileNew ("Images\\Skills\\Skill_PhotonExplosion.bmp") %18 Hits all enemies at 40% damage
%%% 19
% Cleo
var Skill_WorldEdit : int := Pic.FileNew ("Images\\Skills\\Skill_WorldEdit.bmp") %19 Removes 12-20%% hp
var Skill_BloodOust : int := Pic.FileNew ("Images\\Skills\\Skill_BloodOust.bmp") % Blood Oust (Heal)
var Skill_DemonCall : int := Pic.FileNew ("Images\\Skills\\Skill_DemonCall.bmp") % Demon Call (2% + dmg)
var Skill_Signify : int := Pic.FileNew ("Images\\Skills\\Skill_Signify.bmp") % Signify (Damage, -own hp)
var Skill_PowerOust : int := Pic.FileNew ("Images\\Skills\\Skill_PowerOust.bmp") %19 Removes 12-20%% hp
var Skill_ChainedLinks : int := Pic.FileNew ("Images\\Skills\\Skill_ChainedLinks.bmp") % Blood Oust (Heal)
var Skill_DestroyNature : int := Pic.FileNew ("Images\\Skills\\Skill_DestroyNature.bmp") % Demon Call (2% + dmg)
var Skill_DragonCall : int := Pic.FileNew ("Images\\Skills\\Skill_DragonCall.bmp") % Signify (Damage, -own hp)
%%%% Aeron
var Skill_CenterFocus : int := Pic.FileNew ("Images\\Skills\\Skill_CenterFocus.bmp") % Center Focus (Regen team focus)
var Skill_KingOfSpades : int := Pic.FileNew ("Images\\Skills\\Skill_KingOfSpades.bmp") % King of Spades (Moderate Dmg)
var Skill_QueensMercy : int := Pic.FileNew ("Images\\Skills\\Skill_QueensMercy.bmp") % Queen's Mercy (Enemy - focus)
var Skill_HiddenAce : int := Pic.FileNew ("Images\\Skills\\Skill_HiddenAce.bmp") % Hidden Ace (High Damage)
var Skill_Wise : int := Pic.FileNew ("Images\\Skills\\Skill_Wise.bmp") %  EXP Boost
var Skill_OrbOfThePast : int := Pic.FileNew ("Images\\Skills\\Skill_OrbOfThePast.bmp") %  EXP Boost
var Skill_AllUp : int := Pic.FileNew ("Images\\Skills\\Skill_AllUp.bmp") %  Statboost
% Regen
% Character Stats
