C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\GameGFX.png -t bin\gfx\GameGFX.bin -p bin\gfx\pal\GamePal.bin --no-remap
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\GameSprites.png -t bin\gfx\GameSprites.bin -p bin\gfx\pal\GameSpritesPal.bin --no-remap
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 2 -i res\img\Bgs\BG-1-L3.png -t bin\gfx\BG-1-L3.bin -p bin\gfx\pal\BG-1-L3-Pal.bin -m bin\gfx\tilemap\BG-1-L3.bin --tile-base-offset 202 -v
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\Bgs\BG-1-L2.png -t bin\gfx\BG-1-L2.bin -p bin\gfx\pal\BG-1-L2-Pal.bin -m bin\gfx\tilemap\BG-1-L2.bin --tile-base-offset 185 --palette-base-offset 1 -v
C:\Users\david\Documents\Tools\SuperFamiconv\superfamiconv.exe -B 4 -i res\img\Bgs\BG1-Grad.png -p bin\gfx\pal\BG-1-L3-Grad.bin


C:\Users\david\Documents\Tools\ASAR-Assembler\asar.exe --no-title-check --symbols=wla --symbols-path=tempout.sym Main.asm SpaceInv.sfc
