
function ShowEnemyFiringIndex()
	ind = emu.read(0x040F, emu.memType.snesMemory, false)
	xpos = emu.read(0x040D, emu.memType.snesMemory, false)
	ypos = emu.read(0x040E, emu.memType.snesMemory, false)
	emu.drawString(0,12,"Index: "..ind)
	emu.drawRectangle(xpos,ypos,16,16,0xFF0000,false,1,0)
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(ShowEnemyFiringIndex, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")