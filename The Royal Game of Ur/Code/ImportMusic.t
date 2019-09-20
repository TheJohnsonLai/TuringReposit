% Imports Music from the Music folder

var MusicSize : int := 1

var MusicTrack : array 0 .. MusicSize of string
var MusicID : array 0 .. MusicSize of int

var TrackPlaying : array 0 .. MusicSize of boolean
var CurrentMusic : int := 0

MusicTrack (0) := "Music\\Journey.mp3"
MusicTrack (1) := "Music\\Rameses B - Spaceship.mp3"
%MusicTrack (2) := "Music\\Insert Name.mp3"

process PlayMusic (Chosen : int)
    Music.PlayFileStop
    for M : 0 .. MusicSize
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
