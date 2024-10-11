C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\GameGFX.png -t bin\gfx\GameGFX.bin -p bin\gfx\pal\GamePal.bin --no-remap
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\GameSprites.png -t bin\gfx\GameSprites.bin -p bin\gfx\pal\GameSpritesPal.bin --no-remap
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 2 -i res\img\Bgs\BG-1-L3.png -t bin\gfx\BG-1-L3.bin -p bin\gfx\pal\BG-1-L3-Pal.bin --no-remap -m bin\gfx\tilemap\BG-1-L3.bin --tile-base-offset 202 -v --color-zero #181833
C:\Users\david\Documents\Tools\ASAR-Assembler\asar.exe --no-title-check --symbols=wla --symbols-path=tempout.sym Main.asm output.sfc
