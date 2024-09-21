BulletColTile = 0x23
BulletX = 0x0403
BulletY = 0x0404

function DisplayBulletCollisionTileIndex()
	emu.drawString(0, 12, "Bullet X: "..emu.read(BulletX, emu.memType.snesMemory, false))
	emu.drawString(0, 24, "Bullet Y: "..emu.read(BulletY, emu.memType.snesMemory, false))
	emu.drawString(0, 36, "Bullet Col Tile: "..emu.read(BulletColTile, emu.memType.snesMemory, false))
end

emu.addEventCallback(DisplayBulletCollisionTileIndex, emu.eventType.endFrame)

--Display a startup message
emu.displayMessage("Script", "Example Lua script loaded.")