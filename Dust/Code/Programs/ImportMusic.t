% ImportMusic
% Starts Music loading


var MusicControl : array 1 .. 8 of boolean
for m : 1 .. 8
    MusicControl (m) := true
end for

process playstuffWhy
    loop
	Music.PlayFile ("Music\\Why.mp3")
	exit when MusicControl (1) = false
    end loop
end playstuffWhy

process playstuffSaya
    loop
	Music.PlayFile ("Music\\Saya.mp3")
	exit when MusicControl (2) = false
    end loop
end playstuffSaya

process playstuffFireworks
    loop
	Music.PlayFile ("Music\\Fireworks.mp3")
	exit when MusicControl (3) = false
    end loop
end playstuffFireworks

process playstuffSequoyah
    loop
	Music.PlayFile ("Music\\Sequoyah.mp3")
	exit when MusicControl (4) = false
    end loop
end playstuffSequoyah


process playstuffNostalgia
    loop
	Music.PlayFile ("Music\\Nostalgia.mp3")
	exit when MusicControl (5) = false
    end loop
end playstuffNostalgia

process playstuffSoldier
    loop
	Music.PlayFile ("Music\\Soldier.mp3")
	exit when MusicControl (6) = false
    end loop
end playstuffSoldier

process playstuffLegend
    loop
	Music.PlayFile ("Music\\Legend of the Few Miles.mp3")
	exit when MusicControl (7) = false
    end loop
end playstuffLegend

process playstuffDays
    loop
	Music.PlayFile ("Music\\Days of Dash.mp3")
	exit when MusicControl (8) = false
    end loop
end playstuffDays
