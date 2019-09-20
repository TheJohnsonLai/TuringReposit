% Results from battles

proc Congratulations
    cls
    Pic.Draw (Congratulation, 0, 0, picXor)
end Congratulations

proc Failed
put "You've died.. prepare to respawn in the Transtelon."
Teleport := true
end Failed
