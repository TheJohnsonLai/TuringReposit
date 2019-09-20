procedure tiltSquare (x1, y1, size, angle, clr : int)
    % Compute 4 constants to help compute corners.
    const a := round (size * cosd (angle))
    const b := round (size * sind (angle))
    const c := round (size * sqrt (2) * cosd (45 + angle))
    const d := round (size * sqrt (2) * sind (45 + angle))
    % Compute corners.
    const x2 := x1 + a
    const y2 := y1 + b
    const x3 := x1 + c
    const y3 := y1 + d
    const x4 := x1 - b
    const y4 := y1 + a
    % Draw square.
    Draw.Line (x1, y1, x2, y2, clr)
    Draw.Line (x2, y2, x3, y3, clr)
    Draw.Line (x3, y3, x4, y4, clr)
    Draw.Line (x4, y4, x1, y1, clr)
end tiltSquare

tiltSquare (maxx div 2, maxy div 2, maxy div 4, 30, green)
