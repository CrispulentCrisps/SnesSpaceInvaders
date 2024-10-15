
function DisplayRNGResult()
	emu.drawString(0, 12, "RNG Result: "..emu.read(0x0341, emu.memType.snesMemory, false))
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(DisplayRNGResult, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")