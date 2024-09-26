MinBound = 0x0407
MaxBound = 0x0408
PlanePosX = 0x1F 
PlanePosY = 0x20 
BSize = 2
function ShowBounds()
	mx = emu.read(MaxBound, emu.memType.snesMemory, false)
	mn = emu.read(MinBound, emu.memType.snesMemory, false)
	emu.drawLine(mn, 0, mn, 213, 0x00FF00, 1, 0)
	emu.drawLine(mx, 0, mx, 213, 0xFF0000, 1, 0)
	emu.drawRectangle(emu.read(PlanePosX, emu.memType.snesMemory, false), 262-emu.read(PlanePosY, emu.memType.snesMemory, false), BSize, BSize, false, 0, 1)
	emu.drawString(0, 8, "min: "..mn, 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 16, "max: "..mx, 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 24, "xpos: "..emu.read(PlanePosX, emu.memType.snesMemory, false), 0xFFFFFF, 0, 128, 1)
end

emu.addEventCallback(ShowBounds, emu.eventType.endFrame)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")