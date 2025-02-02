﻿MinBound = 0x04E7
MaxBound = 0x04E8
FloorBound = 0x04E9
PlanePosX = 0x20 
PlanePosY = 0x21 
BSize = 2
function ShowBounds()
	mx = emu.read(MaxBound, emu.memType.snesMemory, false)
	mn = emu.read(MinBound, emu.memType.snesMemory, false)
	fn = emu.read(FloorBound, emu.memType.snesMemory, false)
	emu.drawLine(mn, 0, mn, 213, 0x00FF00, 1, 0)
	emu.drawLine(mx, 0, mx, 213, 0xFF0000, 1, 0)
	emu.drawLine(0, 262-fn, 256, 262-fn, 0x0000FF, 1, 0)
	emu.drawRectangle(emu.read(PlanePosX, emu.memType.snesMemory, false), 262-emu.read(PlanePosY, emu.memType.snesMemory, false), BSize, BSize, false, 0, 1)
	emu.drawString(0, 8, "min: "..mn, 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 16, "max: "..mx, 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 32, "xpos: "..emu.read(PlanePosX, emu.memType.snesMemory, false), 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 40, "ypos: "..emu.read(PlanePosY, emu.memType.snesMemory, false), 0xFFFFFF, 0, 128, 1)
	emu.drawString(0, 24, "floor: "..fn, 0xFFFFFF, 0, 128, 1)
end

emu.addEventCallback(ShowBounds, emu.eventType.endFrame)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")