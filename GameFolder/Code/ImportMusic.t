var MusicSize : int := 25
var MusicTrack : array 1 .. MusicSize of string
var MusicName : array 1 .. MusicSize of string
var MusicID : array 1 .. MusicSize of int
var TrackPlaying : array 1 .. MusicSize of boolean
var CurrentMusic : int := 10

%%%%% BDO
MusicTrack (1) := "Music\\BDO - Agris.mp3"
MusicTrack (2) := "Music\\BDO - Altinova.mp3"
MusicTrack (3) := "Music\\BDO - Behr.mp3"
MusicTrack (4) := "Music\\BDO - Calpheon.mp3"
MusicTrack (5) := "Music\\BDO - Creo.mp3"
MusicTrack (6) := "Music\\BDO - Glish.mp3"
MusicTrack (7) := "Music\\BDO - Hiedel.mp3"
MusicTrack (8) := "Music\\BDO - Keplan.mp3"
MusicTrack (9) := "Music\\BDO - Olvia.mp3"
MusicTrack (10) := "Music\\BDO - Title.mp3"
MusicTrack (11) := "Music\\BDO - Valencia BOSS.mp3"
MusicTrack (12) := "Music\\BDO - Valencia COMBAT.mp3"
MusicTrack (13) := "Music\\BDO - Velia.mp3"
%%%%%% Futuristic
MusicTrack (14) := "Music\\Koibumi - HDL.mp3"
MusicTrack (15) := "Music\\Personalizer - Taishi.mp3"
MusicTrack (16) := "Music\\Trust Youre Truth - KOTOKO.mp3"
MusicTrack (17) := "Music\\VOCALOID2 - Meteor.mp3"
MusicTrack (18) := "Music\\Kiznaiver - LAY YOUR HANDS ON ME.mp3"
MusicTrack (19) := "Music\\Kiznaiver - ED.mp3"
MusicTrack (20) := "Music\\Aimer and Chelly - ninelie.mp3"
MusicTrack (21) := "Music\\Porter Robinson & Madeon - Shelter.mp3"
MusicTrack (22) := "Music\\Porter Robinson - Goodbye To A World.mp3"
MusicTrack (23) := "Music\\Porter Robinson - Language.mp3"
MusicTrack (24) := "Music\\Porter Robinson - Sad Machine.mp3"
MusicTrack (25) := "Music\\Subarashiki Hibi - Yoru no Himawari.mp3"

for DT : 1 .. MusicSize
    MusicID (DT) := MusicImage_LostForest
end for
MusicID (14) := MusicImage_Koibumi
MusicID (16) := MusicImage_KOTOKO
MusicID (17) := MusicImage_Meteor
MusicID (21) := MusicImage_Shelter

process PlayMusic (Chosen : int)
    Music.PlayFileStop
    for M : 1 .. MusicSize
	if M not= Chosen then
	    TrackPlaying (M) := false
	else
	    TrackPlaying (M) := true
	    CurrentMusic := M
	end if
    end for
    %  loop
    Music.PlayFileLoop (MusicTrack (Chosen))
    %    View.Update
    %     exit when TrackPlaying (MusicList) = false
    % end loop
end PlayMusic

fork PlayMusic (10)
