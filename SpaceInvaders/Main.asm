;|==============================|
;|                              |
;|   SNES Space Invaders Clone  |
;|                              |
;|          23/06/2024          |
;|                              |
;|==============================|

hirom                           ;Sets the SNES mapping mode to HIROM

incsrc "hardware.asm"           ;Include namespace HW which contains names for each memory and register addr in the SNES
incsrc "Macros.asm"             ;Include ZP shit

arch 65816                      ;sets the architecture to the 65816 CPU on the SNES

org !GFXBank
;---------------;
;  Characters   ;
;---------------;
;

;   Main game GFX   ;
GameGfx:
    incbin "bin/gfx/GameGFX.bin"
GameGfxEnd:

GameSpr:
    incbin "bin/gfx/GameSprites.bin"
GameSprEnd:

Invaders:
    incbin "bin/gfx/Invaders.bin"
EndInvaders:

;   Background 1    ;
BG1_L2:
    incbin "bin/gfx/BG-1-L2.bin"
BG1_L2_End:

BG1_L3:
    incbin "bin/gfx/BG-1-L3.bin"
BG1_L3_End:

;   Background 2    ;
BG2_L2:
    incbin "bin/gfx/BG-2-L2.bin"
BG2_L2_End:

BG2_L3:
    incbin "bin/gfx/BG-2-L3.bin"
BG2_L3_End:

;   Background 3    ;
BG3_L2:
    incbin "bin/gfx/BG-3-L2.bin"
BG3_L2_End:

BG3_L3:
    incbin "bin/gfx/BG-3-L3.bin"
BG3_L3_End:

BG3_OBJ:
    incbin "bin/gfx/SpaceyCharacters.bin"
BG3_OBJ_End:
org !GfxBank2
;   Background 4    ;
BG4_L2:
    incbin "bin/gfx/BG-4-L2.bin"
BG4_L2_End:

BG4_L3:
    incbin "bin/gfx/BG-4-L3.bin"
BG4_L3_End:

BG4_OBJ:
    incbin "bin/gfx/Surfboard.bin"
BG4_OBJ_End:
;       Title       ;
Title_L1:
    incbin "bin/gfx/Title-BG-L1.bin"
Title_L1_End:

Title_L2:
    incbin "bin/gfx/Title-BG-L2.bin"
Title_L2_End:

;   Sprite font 1    ;  5x5
SPRFont:
    incbin "bin/gfx/SprFont.bin"
SPRFont_End:
;   Options screen graphics
OptionsBG:
    incbin "bin/gfx/OptionsBG.bin"
    incbin "bin/gfx/OptionsBG2.bin"
OptionsBG_End:

;   Sprite font 2    ;  5x5
SPRFont2BPP:
    incbin "bin/gfx/SprFont2BPP.bin"
SPRFont2BPP_End:

;   Arrow sprite for pointing
ArrowSpr:
    incbin "bin/gfx/Arrow.bin"
ArrowSpr_End:

OptionsSpr:
    incbin "bin/gfx/Stars.bin"
    incbin "bin/gfx/SmallUFO.bin"
    incbin "bin/gfx/PlanetSprites.bin"
OptionsSprEnd:

org !GfxBank3

HScoreBG:
    incbin "bin/gfx/HScoreFont.bin"
HScoreFontEnd:
    incbin "bin/gfx/HighscoreL1.bin"
    incbin "bin/gfx/HighscoreL2.bin"
HScoreBGEnd:

HScoreSpr:
    incbin "bin/gfx/Twinkle.bin"
    incbin "bin/gfx/SpiralGalaxy.bin"
    incbin "bin/gfx/SpiralGalaxyCore.bin"
    incbin "bin/gfx/HScoreCursor.bin"
HScoreSprEnd:

org !GfxBank4

BG5Gfx:
    incbin "bin/gfx/BG-5-L2.bin"
    incbin "bin/gfx/BG-5-L3.bin"
BG5GfxEnd:

BG6Gfx:
    incbin "bin/gfx/BG-6-L2.bin"
BG6GfxL1End:
    incbin "bin/gfx/BG-6-L3.bin"
BG6GfxEnd:

BG6_OBJ:
    incbin "bin/gfx/Rain.bin"
    incbin "bin/gfx/Boat.bin"
BG6_OBJ_End:

BG7Gfx:
    incbin "bin/gfx/BG-7-L2.bin"
BG7GfxEnd:

BG7Gfx_L3:
    incbin "bin/gfx/BG-7-L3.bin"
BG7Gfx_L3End:

BG8Gfx:
    incbin "bin/gfx/BG-8-L2.bin"
BG8GfxEnd:

BG8Spr:
    incbin "bin/gfx/BG8Sprite.bin"
BG8SprEnd:

CloudGfx:
    incbin "bin/gfx/Clouds.bin"
CloudGfxEnd:

org !GfxBank5

StageTextSpr:
    incbin "bin/gfx/StageText.bin"
StageTextSprEnd:

IntroPanel1:
	incbin "bin/gfx/IntroPanel1.bin"
IntroPanel1End:

IntroPanel2:
	incbin "bin/gfx/IntroPanel2.bin"
IntroPanel2End:

IntroPanel3:
	incbin "bin/gfx/IntroPanel3.bin"
IntroPanel3End:

IntroPanel4:
	incbin "bin/gfx/IntroPanel4.bin"
IntroPanel4End:

IntroPanel5:
	incbin "bin/gfx/IntroPanel5.bin"
IntroPanel5End:

IntroPanel6:
	incbin "bin/gfx/IntroPanel6.bin"
IntroPanel6End:

IntroPanel7:
	incbin "bin/gfx/IntroPanel7.bin"
IntroPanel7End:

IntroPanel8:
	incbin "bin/gfx/IntroPanel8.bin"
IntroPanel8End:

IntroPanel9:
	incbin "bin/gfx/IntroPanel9.bin"
IntroPanel9End:

IntroPanel10:
	incbin "bin/gfx/IntroPanel10.bin"
IntroPanel10End:

IntroPanel11:
	incbin "bin/gfx/IntroPanel11.bin"
IntroPanel11End:

org !GfxBank6

GameOverSpr:
    incbin "bin/gfx/GameOverText.bin"
GameOverSprEnd:

GameOverBG:
    incbin "bin/gfx/GameOverL1.bin"
GameOverBGEnd:

org !TilemapBank

;---------------;
;   Tilemaps    ;
;---------------;
;
BG1_L2_TM:
    incbin "bin/gfx/tilemap/BG-1-L2.bin"
BG1_L2_TM_End:

BG1_L3_TM:
    incbin "bin/gfx/tilemap/BG-1-L3.bin"
BG1_L3_TM_End:

BG2_L2_TM:
    incbin "bin/gfx/tilemap/BG-2-L2.bin"
BG2_L2_TM_End:

BG2_L3_TM:
    incbin "bin/gfx/tilemap/BG-2-L3.bin"
BG2_L3_TM_End:

BG3_L2_TM:
    incbin "bin/gfx/tilemap/BG-3-L2.bin"
BG3_L2_TM_End:

BG3_L3_TM:
    incbin "bin/gfx/tilemap/BG-3-L3.bin"
BG3_L3_TM_End:

BG4_L2_TM:
    incbin "bin/gfx/tilemap/BG-4-L2.bin"
BG4_L2_TM_End:

BG4_L3_TM:
    incbin "bin/gfx/tilemap/BG-4-L3.bin"
BG4_L3_TM_End:

BG5_L2_TM:
    incbin "bin/gfx/tilemap/BG-5-L2.bin"
BG5_L2_TM_End:
BG5_L3_TM:
    incbin "bin/gfx/tilemap/BG-5-L3.bin"
BG5_L3_TM_End:

BG6_TM:
    incbin "bin/gfx/tilemap/BG-6-L2.bin"
BG6_L3_TM:
    incbin "bin/gfx/tilemap/BG-6-L3-Prio.bin"
BG6_TM_End:

BG7_TM:
    incbin "bin/gfx/tilemap/BG-7-L2.bin"
    incbin "bin/gfx/tilemap/BG-7-L3.bin"
BG7_TM_End:

BG8_TM:
    incbin "bin/gfx/tilemap/BG-8-L2.bin"
BG8_TM_End:

org !TilemapBank2

Title_TM:
    incbin "bin/gfx/tilemap/Title-BG-L1.bin"
Title1_TM_End:
    incbin "bin/gfx/tilemap/Title-BG-L2.bin"
Title2_TM_End:

Options_TM:
    incbin "bin/gfx/tilemap/OptionsBG.bin"
Options_TM_End:
    incbin "bin/gfx/tilemap/OptionsBG2.bin"
Options2_TM_End:

IntroPanel1TM:
	incbin "bin/gfx/tilemap/IntroPanel1.bin"
IntroPanel1TMEnd:

IntroPanel2TM:
	incbin "bin/gfx/tilemap/IntroPanel2.bin"
IntroPanel2TMEnd:

IntroPanel3TM:
	incbin "bin/gfx/tilemap/IntroPanel3.bin"
IntroPanel3TMEnd:

IntroPanel4TM:
	incbin "bin/gfx/tilemap/IntroPanel4.bin"
IntroPanel4TMEnd:

IntroPanel5TM:
	incbin "bin/gfx/tilemap/IntroPanel5.bin"
IntroPanel5TMEnd:

IntroPanel6TM:
	incbin "bin/gfx/tilemap/IntroPanel6.bin"
IntroPanel6TMEnd:

IntroPanel7TM:
	incbin "bin/gfx/tilemap/IntroPanel7.bin"
IntroPanel7TMEnd:

IntroPanel8TM:
	incbin "bin/gfx/tilemap/IntroPanel8.bin"
IntroPanel8TMEnd:

IntroPanel9TM:
	incbin "bin/gfx/tilemap/IntroPanel9.bin"
IntroPanel9TMEnd:

IntroPanel10TM:
	incbin "bin/gfx/tilemap/IntroPanel10.bin"
IntroPanel10TMEnd:

IntroPanel11TM:
	incbin "bin/gfx/tilemap/IntroPanel11.bin"
IntroPanel11TMEnd:

org !TilemapBank3

HScoreBG_TM:
    incbin "bin/gfx/tilemap/HighscoreL1.bin"
HScoreBG_TM_2:
    incbin "bin/gfx/tilemap/HighscoreL2.bin"
HScoreBG_TM_End:

GameOverTM:
    incbin "bin/gfx/tilemap/GameOverL1.bin"
GameOverTMEnd:

org !PalBank
;---------------;
;   Palette's   ;
;---------------;
;
;   Main game GFX   ;
GamePal:
    incbin "bin/gfx/pal/GamePal.bin"
GamePalEnd:

GameSprPal:
    incbin "bin/gfx/pal/GameSpritesPal.bin"
GameSprPalEnd:

StageTextPal:
    incbin "bin/gfx/pal/StageTextPal.bin"
StageTextPalEnd:

SPRFont_Pal:
    incbin "bin/gfx/pal/SprFont-Pal.bin"
SPRFont_Pal_End:

SPRFont2BPP_Pal:
    incbin "bin/gfx/pal/SprFont2BPP-Pal.bin"
SPRFont2BPP_Pal_End:

InvadersPal:
    incbin "bin/gfx/pal/InvadersPal.bin"
InvadersPalEnd:

StarsPal:
    incbin "bin/gfx/pal/StarsPal.bin"
StarsPalEnd:

OptionPlanetPal:
    incbin "bin/gfx/pal/PlanetSprites.bin"
OptionPlanetPalEnd:

SmallUFOPal:
    incbin "bin/gfx/pal/SmallUFO-Pal.bin"
SmallUFOPalEnd:
;       Title       ;
Title_L1_Pal:
    incbin "bin/gfx/pal/Title-BG-L1-Pal.bin"
Title_L1_Pal_End:

Title_L2_Pal:
    incbin "bin/gfx/pal/Title-BG-L2-Pal.bin"
Title_L2_Pal_End:

;   Background 1    ;
BG1_L2_Pal:
    incbin "bin/gfx/pal/BG-1-L2-Pal.bin"
BG1_L2_Pal_End:

BG1_L3_Pal:
    incbin "bin/gfx/pal/BG-1-L3-Pal.bin"
BG1_L3_Pal_End:

;   Background 2    ;
BG2_L3_Pal:
    incbin "bin/gfx/pal/BG-2-L3-Pal.bin"
BG2_L3_Pal_End:

BG2_L2_Pal:
    incbin "bin/gfx/pal/BG-2-L2-Pal.bin"
BG2_L2_Pal_End:

;   Background 3    ;
BG3_L3_Pal:
    incbin "bin/gfx/pal/BG-3-L3-Pal.bin"
BG3_L3_Pal_End:

BG3_L2_Pal:
    incbin "bin/gfx/pal/BG-3-L2-Pal.bin"
BG3_L2_Pal_End:

BG3_OBJ_Pal:
    incbin "bin/gfx/pal/SpaceyCharacters-Pal.bin"
BG3_OBJ_Pal_End:

;   Background 4    ;
BG4_L3_Pal:
    incbin "bin/gfx/pal/BG-4-L3-Pal.bin"
BG4_L3_Pal_End:

BG4_L2_Pal:
    incbin "bin/gfx/pal/BG-4-L2-Pal.bin"
BG4_L2_Pal_End:

BG5_L2_Pal:
    incbin "bin/gfx/pal/BG-5-L2-Pal.bin"
BG5_L2_Pal_End:

BG5_L3_Pal:
    incbin "bin/gfx/pal/BG-5-L3-Pal.bin"
BG5_L3_Pal_End:

BG6_L2_Pal:
    incbin "bin/gfx/pal/BG-6-L2-Pal.bin"
BG6_L2_Pal_End:

BG6_L3_Pal:
    incbin "bin/gfx/pal/BG-6-L3-Pal.bin"
BG6_L3_Pal_End:

BG7_L2_Pal:
    incbin "bin/gfx/pal/BG-7-L2-Pal.bin"
BG7_L2_Pal_End:

BG7_L3_Pal:
    incbin "bin/gfx/pal/BG-7-L3-Pal.bin"
BG7_L3_Pal_End:

BG8_L2_Pal:
    incbin "bin/gfx/pal/BG-8-L2-Pal.bin"
BG8_L2_Pal_End:
BG8SprPal:
    incbin "bin/gfx/pal/BG8Sprite-Pal.bin"
BG8SprPalEnd:

Surfboard_Pal:
    incbin "bin/gfx/pal/Surfboard-Pal.bin"
Surfboard_Pal_End:

OceanRocks_Pal:
    incbin "bin/gfx/pal/OceanRocks-Pal.bin"
OceanRocks_Pal_End:

CloudsPal:
    incbin "bin/gfx/pal/Clouds-Pal.bin"
CloudsPalEnd:

BG6RainPal:
    incbin "bin/gfx/pal/Rain-Pal.bin"
BG6RainPalEnd:

BG6BoatPal:
    incbin "bin/gfx/pal/Boat-Pal.bin"
BG6BoatPalEnd:

;   Options screen graphics
OptionsBG_Pal:
    incbin "bin/gfx/pal/OptionsBG.bin"
    incbin "bin/gfx/pal/OptionsBG2.bin"
OptionsBG_Pal_End:

;   Options screen Gradient
OptionsGrad:
    incbin "bin/gfx/pal/OptionsBGGalaxyGrad.bin"
OptionsGrad_End:

BG1Grad:
    incbin "bin/gfx/pal/BG1-Grad.bin"

BG2Grad:
    incbin "bin/gfx/pal/BG2-Grad.bin"

BG3Grad:
    incbin "bin/gfx/pal/BG3-Grad.bin"

BG4Grad:
    incbin "bin/gfx/pal/BG4-Grad.bin"
    
BG5Grad:
    incbin "bin/gfx/pal/BG5Grad.bin"

BG6Grad:
    incbin "bin/gfx/pal/BG6-Grad.bin"
    
BG7Grad:
    incbin "bin/gfx/pal/BG7-Grad.bin"

BG8Grad:
    incbin "bin/gfx/pal/BG8-Grad.bin"

;   Arrow Sprite Palette
ArrowSpr_Pal:
    incbin "bin/gfx/pal/Arrow.bin"
ArrowSpr_Pal_End:

HScoreBGL1_Pal:
    incbin "bin/gfx/pal/HighscoreL1Pal.bin"
HScoreBGL1_Pal_End:
HScoreBGL2_Pal:
    incbin "bin/gfx/pal/HighscoreL2Pal.bin"
HScoreBGL2_Pal_End:
HScoreTextPal:
    incbin "bin/gfx/pal/HScoreFont-Pal.bin"
HScoreTextPalEnd:
TwinklePal:
    incbin "bin/gfx/pal/Twinkle-Pal.bin"
TwinklePalEnd:
SpiralBlackHole:
    incbin "bin/gfx/pal/SpiralGalaxyCore-Pal.bin"
SpiralBlackHoleEnd:

GameOverPal:
    incbin "bin/gfx/pal/GameOverL1Pal.bin"
GameOverPalEnd:

HScoreSpr_Pal:
    incbin "bin/gfx/pal/SpiralGalaxy-Pal.bin"
HScoreSpr_PalEnd:

IntroPanelPal:
	incbin "bin/gfx/pal/IntroPanel1Pal.bin"
	incbin "bin/gfx/pal/IntroPanel2Pal.bin"
	incbin "bin/gfx/pal/IntroPanel3Pal.bin"
	incbin "bin/gfx/pal/IntroPanel4Pal.bin"
	incbin "bin/gfx/pal/IntroPanel5Pal.bin"
	incbin "bin/gfx/pal/IntroPanel6Pal.bin"
	incbin "bin/gfx/pal/IntroPanel7Pal.bin"
	incbin "bin/gfx/pal/IntroPanel8Pal.bin"
	incbin "bin/gfx/pal/IntroPanel9Pal.bin"
	incbin "bin/gfx/pal/IntroPanel10Pal.bin"
	incbin "bin/gfx/pal/IntroPanel11Pal.bin"

org !CodeBank

ZVal:
    dw $0000

Reset:
    ;Now we initialise the SNES itself, since we've written the ROM header
    sei                             ;Disable interrupt registers
    stz.w HW_NMITIMEN               ;Store 0 in HW_NMITIMEN
    stz.w HW_HDMAEN                 ;Store 0 in HW_HDMAEN
    clc                             ;Clears carry flag to 0
    xce                             ;Take the 0 in clc and shove into emulation flag, thus exiting 6502 mode
    rep #%00011000                  ;Turn off decimal mode and we set the X register to 16 bits
    sep #%00100000                  ;Set the M flag to 8 bit, used for accumulator and memory instructions
    ldx.w #$01FF                    ;Set stack over to db 1FFF
    txs                             ;Send X register to stack
    pea.w 0                         ;Writes 2 0bytes to the stack [no # needed as every value is a direct load]
    pld                             ;Take value from stack and shove to D
    lda.b #1                        ;Load 1 into A
    sta.w HW_MEMSEL                 ;Write A value to HW_MEMSEL, mainly to speed up the CPU code
    jml $800000+(.ResetOffset&$FFFF);Jump to $80 in terms of memory X axis

.ResetOffset
    phk                         ;Push to stack
    plb                         ;Pull B    
    ;Clear all memory
    stz.w HW_WMADDL
    stz.w HW_WMADDM
    stz.w HW_WMADDH
    lda.b #$08
    sta.w HW_DMAP0
    lda.b #HW_WMDATA&$FF
    sta.w HW_BBAD0
    ldx.w #ZVal
    stx.w HW_A1T0L
    lda.b #(!CodeBank>>16)&$FF
    stz.w HW_A1B0
    stz.w HW_DAS0L
    stz.w HW_DAS0H
    lda.b #$01
    sta.w HW_MDMAEN
    ;Grab RNG seed from rubbish memory
    lda.w HW_WMDATA
    sta.w RNGSeed
    lda.w HW_WMDATA
    sta.w RNGSeed+1
    lda.b #$01
    sta.w HW_MDMAEN
    
    ;Reset PPU registers
    lda.b #$00
    ldy.w #$211F
    -
    sta.w HW_INIDISP, Y
    sta.w HW_INIDISP, Y
    dey
    bne -
    
    lda.b #$80                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.w HW_CGADD              ;Reset CGRAM addr

    ;Setup window to prevent player seeing rubbish
    lda.b #$CC
    sta.w WOBJSELMirror
    sta.w W12SELMirror
    sta.w W34SELMirror
    lda.b #$FF
    sta.w TMWMirror
    sta.w WH3Mirror
    stz.w TSWMirror
    stz.w WH2Mirror

    lda.b #$55
    sta.w WBGLOGMirror
    lda.b #$55
    sta.w WOBJLOGMirror
    
    lda.b #$AA
    sta.w CGWSELMirror

    ldx.w #$0000
    stx.w HW_VMADDL             ;Set VRAM address to $0000
    lda.b #$80
    sta.w HW_VMAIN              ;Set VMAIN to increment
    lda.b #%00001001            ;Set DMAP to do fixed addressing 
    sta.w HW_DMAP0              ;Setup DMAP0
    lda.b #HW_VMDATAL&$FF       ;Grab Video mem data lo addr
    sta.w HW_BBAD0              ;Set bus addr
    
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    ldx.w #$0000                ;Set to fill 64k of vram
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    sep #%00100000              ;Enter Memory mode
    lda.b #$70
    sta.w HW_BG1SC              ;Set Layer 1 values
    lda.b #$78
    sta.w HW_BG2SC              ;Set Layer 2 values
    lda.b #$7C
    sta.w HW_BG3SC              ;Set Layer 3 values
    lda.b #$7C
    sta.w HW_BG4SC              ;Set Layer 4 values
    stz.w HW_MOSAIC             ;Reset BG mosaic
    lda.b #$00                  ;Load BG Mode
    sta.w HW_BGMODE             ;Set BG mode
    stz.w HW_BG12NBA            ;Reset bg character DAD
    stz.w HW_BG34NBA            ;Reset bg character DAD
    lda.b #$FF
    sta.w HW_TM
    lda.b #$00
    sta.w HW_OBSEL
    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    lda.b #$1F
    sta.w INIDSPMirror
    rep #$20
    lda.w #OAMCopy
    sta.w HW_OAMADDL
    sep #$20

	ldx.w #HighscoreValuesInitEnd-HighscoreValuesInit
	-
	lda.w HighscoreValuesInit, X
	sta.w HScoreEntries, X
	dex
	bpl -

    stz.b ZP.R0
    stz.b ZP.R1
    stz.b ZP.R2
    stz.b ZP.R3
    stz.b ZP.R4
    stz.b ZP.R5
    stz.b ZP.R6
    stz.b ZP.R7
    stz.b ZP.NMIDone
    stz.b ZP.NMIDone+1

    stz.w HW_BG2HOFS            ;Apply scroll
    stz.w HW_BG2HOFS            ;Apply scroll
    stz.w HW_BG2VOFS            ;Apply scroll
    stz.w HW_BG2VOFS            ;Apply scroll

    lda.b #$05
    sta.b ZP.SceneIndex         ;Set starting scene
    lda.b #$07
    sta.w BGIndex
    lda.b #$01
    sta.b ZP.ChangeScene        ;Set load flag
    lda.b #$04
    sta.w HW_SETINI
    lda.b #$81
    sta.w HW_NMITIMEN           ;NMI Enabled
    rep #%00100000              ;Set A to 16 bit mode

MainLoop:
    stz.b ZP.NMIDone
    lda.w #VrDmaPtr
    sta.w ZP.VrDmaListPtr

    sep #$20
    lda.b ZP.SceneIndex
    cmp.b #!GameScene
    bne +
    jsr GameLoop_HandlePause
    +
    rep #$20

    ;lda.w #OAMCopy
    stz.b ZP.OAMPtr

    ldy.w #$0220
    lda.w #$0000
    -
    sta.w OAMCopy, Y
    dey
    dey
    bpl -

    lda.w #$0000
    ldy.w #$0040
    -
    sta.w VrDmaPtr, Y
    dey
    dey
    bpl -    
    sep #%00110000              ;Set X width to 8
    lda.b ZP.SceneIndex         ;Load our scene in
    asl
    tax
    rep #%00110000              ;Set CPU to 16 bit mode
    jsr (SelectScene, X)        ;Go to correct subroutine logic in jumptable
    
    tdc
    lda.w TransitionFlag
    and.w #$00FF
    beq +
    jsr DrawTransition
    +

    jsr HandlePaletteFade
    sep #$20
    lda.w ShowStageText
    beq +
    jsl FadeGradientTable
    +
    rep #$20
    lda.w #$FFFF
    sta.b ZP.NMIDone
    -                           ;Infinite loop to
    lda.b ZP.NMIDone
    bpl MainLoop
    bra -                       ;Prevent the code going into random memory

SelectScene:
    dw TitleScene
    dw GameScene
    dw HighscoreScene
    dw OptionsScene
    dw ContinueScene
    dw IntroScene

NMIHandler:
    rep #%00110000      ;Reset X + M flags to set X to 16 bit mode
    cld
    inc.b ZP.NMIDone
    beq .SkipNMIJump
    jmp .SkipNMI
    .SkipNMIJump:
    pha                 ;Store to stack to prevent clobbering
    phx                 ;Store to stack to prevent clobbering
    phy                 ;Store to stack to prevent clobbering
    phb                 ;Store to stack to prevent clobbering
    phd                 ;Store to stack to prevent clobbering
    
    sep #$20
    lda.w INIDSPMirror
    ora #$80
    sta.w HW_INIDISP
    rep #$20
    ;------------------;
    ;   OAM Transfer   ;
    ;------------------;

    ldx.w #OAMCopy
    stx.w HW_OAMADDL
    sep #%00100000
    lda.b #$02
    sta.w HW_DMAP0
    ldx.w #OAMCopy              ;Grab source addr
    stx.w HW_A1T0L
    lda.b #$80                  ;Load into bank 80
    sta.w HW_A1B0
    lda.b #HW_OAMDATA&$FF       ;Destination addr
    sta.w HW_BBAD0
    rep #%00100000
    ldx.w #$220                ;Bytes to write
    stx.w HW_DAS0L
    sep #%00100000
    lda.b #$01                  ;Enable DMA 0
    sta.w HW_MDMAEN
    rep #%00100000

    ;---------------;
    ;   DMA Queue   ;
    ;---------------;
    lda.w #VrDmaPtr
    sta.b ZP.VrDmaListPtr    
    .VrDMALoop:
    ldy.w #$0003
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b (ZP.VrDmaListPtr), Y                  ;Load dma ptr flag
    beq .FinishDMALoop                          ;Check for 0 for end flag
    rep #%00100000                              ;Exit 8bit mode for A
    lda.w #HW_VMDATAL
    sta.w HW_BBAD7                              ;Shove in DMA destination
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b #%000000001                           ;Set transfer to be word length
    sta.w HW_DMAP7
    rep #%00100000                              ;Exit 8bit mode for A
    ldy.w #$0000
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_A1T7L                              ;Shove in first 2 bytes of source pointer
    sep #%00100000                              ;Enter 8bit mode for A
    ldy.w #$0002
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_A1B7                               ;Shove in first 3rd byte of source pointer [bank]
    rep #%00100000                              ;Exit 8bit mode for A
    ldy.w #$0004
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_VMADDL                             ;Set VRAM addr from DMA pointer
    ldy.w #$0006
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_DAS7L                              ;Shove byte amount to enter
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b #$80
    sta.w HW_MDMAEN                             ;Enable DMA
    rep #$20
    lda.w ZP.VrDmaListPtr
    clc
    adc.w #$0008
    sta.w ZP.VrDmaListPtr
    jmp .VrDMALoop      ;Keep looping until we find an END flag entry
    .FinishDMALoop:

    ;-----------------------;
    ;   PPU Mirror write    ;
    ;-----------------------;
    tdc
    sep #$20
    lda.w TMMirror
    sta.w HW_TM
    lda.w TSMirror
    sta.w HW_TS
    lda.w CGWSELMirror
    sta.w HW_CGWSEL
    lda.w CGADSUBMirror
    sta.w HW_CGADSUB
    lda.w COLDATAMirror
    sta.w HW_COLDATA
    lda.w COLDATAMirror+1
    sta.w HW_COLDATA
    lda.w WH0Mirror
    sta.w HW_WH0
    lda.w WH1Mirror
    sta.w HW_WH1
    lda.w WH2Mirror
    sta.w HW_WH2
    lda.w WH3Mirror
    sta.w HW_WH3
    lda.w W12SELMirror
    sta.w HW_W12SEL
    lda.w W34SELMirror
    sta.w HW_W34SEL
    lda.w WOBJSELMirror
    sta.w HW_WOBJSEL
    lda.w WBGLOGMirror
    sta.w HW_WBGLOG
    lda.w WOBJLOGMirror
    sta.w HW_WOBJLOG
    lda.w TMWMirror
    sta.w HW_TMW
    lda.w TSWMirror
    sta.w HW_TSW

    ;BG 1
    lda.w BG1HOffMirror
    sta.w HW_BG1HOFS
    lda.w BG1HOffMirror+1
    sta.w HW_BG1HOFS
    lda.w BG1VOffMirror
    sta.w HW_BG1VOFS
    lda.w BG1VOffMirror+1
    sta.w HW_BG1VOFS

    ;BG 2
    lda.w BG2HOffMirror
    sta.w HW_BG2HOFS
    lda.w BG2HOffMirror+1
    sta.w HW_BG2HOFS
    lda.w BG2VOffMirror
    sta.w HW_BG2VOFS
    lda.w BG2VOffMirror+1
    sta.w HW_BG2VOFS
    
    ;BG 3
    lda.w BG3HOffMirror
    sta.w HW_BG3HOFS
    lda.w BG3HOffMirror+1
    sta.w HW_BG3HOFS
    lda.w BG3VOffMirror
    sta.w HW_BG3VOFS
    lda.w BG3VOffMirror+1
    sta.w HW_BG3VOFS

    ;BG 4
    lda.w BG3HOffMirror
    sta.w HW_BG4HOFS
    lda.w BG4HOffMirror+1
    sta.w HW_BG4HOFS
    lda.w BG4VOffMirror
    sta.w HW_BG4VOFS
    lda.w BG4VOffMirror+1
    sta.w HW_BG4VOFS
    
    lda.w M7AMirror
    sta.w HW_M7A
    lda.w M7AMirror+1
    sta.w HW_M7A
    lda.w M7BMirror
    sta.w HW_M7B
    lda.w M7BMirror+1
    sta.w HW_M7B
    lda.w M7CMirror
    sta.w HW_M7C
    lda.w M7CMirror+1
    sta.w HW_M7C
    lda.w M7DMirror
    sta.w HW_M7D
    lda.w M7DMirror+1
    sta.w HW_M7D
    lda.w M7XMirror
    sta.w HW_M7X
    lda.w M7XMirror+1
    sta.w HW_M7X
    lda.w M7YMirror
    sta.w HW_M7Y
    lda.w M7YMirror+1
    sta.w HW_M7Y
    ;Update palette entries
    stz.w HW_CGADD
    lda.b #$02
    sta.w HW_DMAP0
    ldx.w #PalOut               ;Grab source addr
    stx.w HW_A1T0L
    lda.b #$80                  ;Load into bank 80
    sta.w HW_A1B0
    lda.b #HW_CGDATA&$FF        ;Destination addr
    sta.w HW_BBAD0
    rep #%00100000
    ldx.w #$200                 ;Bytes to write
    stx.w HW_DAS0L
    sep #%00100000
    lda.b #$01                  ;Enable DMA 0
    sta.w HW_MDMAEN
    
    ;---------------;
    ;  HDMA Writes  ;
    ;---------------;
    .HDMALoop:
    ldy.w #$0000
    ldx.w #$0000
    tdc
    sep #$20
    lda.w HDMAMirror+1
    beq +
    lda.w HDMAMirror
    sta.w HW_DMAP0
    lda.w HDMAMirror+1
    sta.w HW_BBAD0
    rep #$20
    lda.w HDMAMirror+2
    sta.w HW_A1T0L
    tdc
    sep #$20
    lda.w HDMAMirror+4
    sta.w HW_A1B0
    inx                     ;X being used as our bitfield for HDMA
    +

    lda.w HDMAMirror1+1
    beq +
    lda.w HDMAMirror1
    sta.w HW_DMAP1
    lda.w HDMAMirror1+1
    sta.w HW_BBAD1
    rep #$20
    lda.w HDMAMirror1+2
    sta.w HW_A1T1L
    tdc
    sep #$20
    lda.w HDMAMirror1+4
    sta.w HW_A1B1
    txa
    clc
    adc.b #$02                     ;X being used as our bitfield for HDMA
    tax
    +
    
    lda.w HDMAMirror2+1
    beq +
    lda.w HDMAMirror2
    sta.w HW_DMAP2
    lda.w HDMAMirror2+1
    sta.w HW_BBAD2
    rep #$20
    lda.w HDMAMirror2+2
    sta.w HW_A1T2L
    tdc
    sep #$20
    lda.w HDMAMirror2+4
    sta.w HW_A1B2
    txa
    clc
    adc.b #$04                     ;X being used as our bitfield for HDMA
    tax
    +
    lda.w HDMAMirror3+1
    beq +
    lda.w HDMAMirror3
    sta.w HW_DMAP3
    lda.w HDMAMirror3+1
    sta.w HW_BBAD3
    rep #$20
    lda.w HDMAMirror3+2
    sta.w HW_A1T3L
    tdc
    sep #$20
    lda.w HDMAMirror3+4
    sta.w HW_A1B3
    txa
    clc
    adc.b #$08                     ;X being used as our bitfield for HDMA
    tax
    +    
    lda.w HDMAMirror4+1
    beq +
    lda.w HDMAMirror4
    sta.w HW_DMAP4
    lda.w HDMAMirror4+1
    sta.w HW_BBAD4
    rep #$20
    lda.w HDMAMirror4+2
    sta.w HW_A1T4L
    tdc
    sep #$20
    lda.w HDMAMirror4+4
    sta.w HW_A1B4
    txa
    clc
    adc.b #$10                     ;X being used as our bitfield for HDMA
    tax
    +
    
    lda.w HDMAMirror5+1
    beq +
    lda.w HDMAMirror5
    sta.w HW_DMAP5
    lda.w HDMAMirror5+1
    sta.w HW_BBAD5
    rep #$20
    lda.w HDMAMirror5+2
    sta.w HW_A1T5L
    tdc
    sep #$20
    lda.w HDMAMirror5+4
    sta.w HW_A1B5
    txa
    clc
    adc.b #$20                     ;X being used as our bitfield for HDMA
    tax
    +

    stx.w HW_HDMAEN
    ;----------------------;
    ;   Controller Input   ;
    ;----------------------;
    rep #$20                              ;Exit 8bit mode for A
    lda.w HW_JOY1L
    sta.b ZP.Controller
    bne +
    stz.b ZP.InputFlag
    +

    sep #$20
    lda.w INIDSPMirror
    and #$7F
    sta.w HW_INIDISP
    rep #$20

    rep #%00100000      ;Set A to 8 bit mode
    pld                 ;Grab pre-clobbered stack values
    plb                 ;Grab pre-clobbered stack values
    ply                 ;Grab pre-clobbered stack values
    plx                 ;Grab pre-clobbered stack values
    pla                 ;Grab pre-clobbered stack values
    .SkipNMI:
    rti                 ;Return from interrupt

TitleScene:
    sep #$20
    lda.b ZP.ChangeScene
    bne .LoadTitle
    jmp .SkipTitleLoad
    .LoadTitle:
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    jsr TransitionIn
    lda.b #$FF
    sta.w TMMirror
    stz.w HW_HDMAEN
    stz.w HW_OBSEL
    
    jsl ClearHDMA

	jsr ClearLTileVram

    lda.w W12SELMirror
    and.b #$CC
    sta.w W12SELMirror
    lda.w WOBJSELMirror
    and.b #$CC
    sta.w WOBJSELMirror
    
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.w WBGLOGMirror
    stz.w WOBJLOGMirror
    lda.b #$00
    sta.w CGWSELMirror
    lda.b #$00
    sta.w CGADSUBMirror
    ;Transfer Title graphics
    ldx.w #$0000
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #SPRFont&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #SPRFont>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #SPRFont_End-SPRFont
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #(HW_VMDATAL)&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #Title_L1&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #Title_L1>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Title_L1_End-Title_L1
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #Title_L2&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #Title_L2>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Title_L2_End-Title_L2
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ;Transfer tilemap data
    ldx.w #L1Ram
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #Title_TM&$FFFF    ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #Title_TM>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Title1_TM_End-Title_TM
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    ldx.w #L2Ram
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #Title1_TM_End&$FFFF    ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #Title1_TM_End>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Title2_TM_End-Title1_TM_End
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    ldx.w #SPRFont_Pal_End-SPRFont_Pal
    -
    lda.l SPRFont_Pal, X
    sta.w PalMirror+256, X
    dex
    bpl -

    ldx.w #Title_L2_Pal_End-Title_L2_Pal
    -
    lda.l Title_L2_Pal, X
    sta.w PalMirror, X
    dex
    bpl -

    ldx.w #Title_L1_Pal_End-Title_L1_Pal
    -
    lda.l Title_L1_Pal, X
    sta.w PalMirror+$20, X
    dex
    bpl -

    ldy.w #EndTitleTextPosX-TitleTextPosX
    -
    lda.w TitleTextPosX, Y
    sta.w SPRTextPosX, Y
    lda.w TitleTextPosY, Y
    sta.w SPRTextPosY, Y
    dey
    bpl -

    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipTitleLoad:
    rep #$20
    stz.b ZP.PalFadeStart
    stz.b ZP.PalFadeEnd

    tdc
    sep #$20
    lda.b ZP.ExitScene
    beq .SkipTitleChange
    stz.b ZP.ExitScene
    lda.w ZP.SceneGoto
    sta.w ZP.SceneIndex
    lda.b #$01
    sta.b ZP.ChangeScene
    .SkipTitleChange:

    ;Controls
    lda.b ZP.Controller+1
    and #$10                    ;Check START
    beq .SkipChange
    lda.b ZP.InputFlag
    bne .SkipChange
    tdc
    sep #$20
    lda.w OptionIndex
    cmp #$03
    bne +
    lda.b #$02
    +
    inc
    sta.b ZP.SceneGoto
    stz.b ZP.ExitScene
    jsr TransitionOut
    .SkipChange:
    lda.b ZP.Controller+1
    and #$04                    ;Check UP
    beq .SkipUp
    lda.b ZP.InputFlag
    bne .SkipUp
    lda.b #$01
    sta.b ZP.InputFlag
    inc.w OptionIndex
    .SkipUp:
    lda.b ZP.Controller+1
    and #$08                    ;Check DOWN
    beq .SkipDown
    lda.b ZP.InputFlag
    bne .SkipDown
    lda.b #$01
    sta.b ZP.InputFlag
    dec.w OptionIndex
    .SkipDown:
    ldy.w #$0000
    sep #$10
    lda.w OptionIndex
    and #$03
    sta.w OptionIndex
    ldy.w OptionIndex
    rep #$10

    lda.b #!ArrowX
    sta.b ZP.AddSprX
    lda.w ArrowTitleYPos, Y
    sta.b ZP.AddSprY
    lda.b #!ArrowChar
    sta.b ZP.AddSprTile
    lda.b #!SprFont1Attr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    rep #$10
    ldx.w #StartText
    stx.b ZP.MemPointer
    ldx.w #EndOptionsText-StartText
    stx.b ZP.R1
    ;Draw sprite text
    jsr DrawSpriteText

    sep #$10
    ldy.w SinePtr
    rep #$10
    lda.w BGScrollOff+2
    inc
    sta.w BGScrollOff+2
    and #$04
    beq +
    stz.w BGScrollOff+2
    ;BG
    ldy.w #$0024
    tdc
    lda.b #$0C
    sta.b ZP.R4
    jsr PalCycle
    +

    sep #$20
    ldx.w #HDMAScrollBuffer2
    stx.w HW_WMADDL
    lda.b #$7E
    sta.w HW_WMADDH
    inc.w SinePtr
    inc.w SinePtr

    ldx.w #$0000
    ldy.w #$0000
    sep #$10
    ldx.b #$80
    ldy.w SinePtr
    -
    lda.b #$01
    sta.w HW_WMDATA
    lda.w UnSineTable, Y
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    lda.b #$01
    sta.w HW_WMDATA
    lda.w UnSineTable, Y
    lsr
    lsr
    lsr
    lsr
    lsr
    eor.b #$FF
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    dex
    bne -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    
    lda.w BGScrollOff
    inc
    bit #$02
    beq +
    inc.w BGScrollVal
    lda.b #$00
    +
    sta.w BGScrollOff
    rep #$10
    lda.b #$02
    ;sta.w HDMAMirror
    ;lda.b #(HW_BG1HOFS)&$FF
    ;sta.w HDMAMirror+1
    ;ldx.w #HDMAScrollBuffer2
    ;stx.w HDMAMirror+2
    ;lda.b #$7E
    ;sta.w HDMAMirror+4
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG1HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror1+2
    lda.b #$7E
    sta.w HDMAMirror1+4

    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG2VOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror2+2
    lda.b #$7E
    sta.w HDMAMirror2+4
    
    rep #$20
    rts

GameScene:
    sep #%00100000              ;Set A to 8 bit mode
    lda.b ZP.ChangeScene
    bne .DoLoad
    jmp .SkipLoad
    .DoLoad:
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    stz.w HW_VMADDL
    stz.w HW_VMADDH
    lda.b #HW_VMDATAL&$FF        ;Grab Video mem data lo addr
    sta.w HW_BBAD0              ;Set bus addr
    stz.w HW_HDMAEN
    stz.w HW_MDMAEN
    jsr TransitionIn
    stz.w GameOverTransFlag
    lda.b #$02
    sta.w HW_OBSEL

    lda.b #$72
    sta.w HW_BG1SC              ;Set Layer 1 values

    ldx.w #!SprVram
    stx.w HW_VMADDL             ;Set VRAM address to Sprite VRAM
    
    ;Load Game BG palettes
    lda.b #$02
    sta.w HW_DMAP1              ;Setup DMAP1
    ldx.w #GamePal&$FFFF        ;Grab palette addr
    stx.w HW_A1T1L              ;Shove lo+mid addr byte
    lda.b #GamePal>>16&$FF
    sta.w HW_A1B1               ;Store bank
    ldx.w #GamePalEnd-GamePal
    stx.w HW_DAS1L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_CGDATA&$FF        ;Grab Video mem data lo addr
    sta.w HW_BBAD1              ;Set bus addr

    ;Load Game BG characters
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #GameGfx&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #GameGfx>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #GameGfxEnd-GameGfx
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$03
    sta.w HW_MDMAEN             ;Enable DMA channel 0 + 1

    ;Load Game Sprites
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #GameSpr&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #GameSpr>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #GameSprEnd-GameSpr
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #!SprTextVram
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #StageTextSpr&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #StageTextSpr>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #StageTextSprEnd-StageTextSpr
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #$0000
    stx.b ZP.R0
    jsl LoadEnemyGFX

    ldx.w #$0000
    -
    lda.l GamePal, X
    sta.w PalMirror, X
    lda.l InvadersPal, X
    lda.l GameSprPal, X
    sta.w PalMirror+384, X
    inx
    cpx.w #$0100
    bne -
    
    ldx.w #StageTextPalEnd-StageTextPal
    -
    lda.l StageTextPal, X
    sta.w PalMirror+$140, X
    dex
    bpl -

    ;Clear tilemap 1
    ldx.w #L1Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr
    
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$0800                ;Set to fill 400 words
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    lda.b #!StartMaxBGCount
    sta.w BGChange
    lda.b #$01                  ;Set BG Mode 1
    sta.w HW_BGMODE
    lda.b #!BGCountInitVal
    sta.w BGCount
    ;Reset Player
    lda.b #$70
    sta.w Player.X
    lda.b #$03
    sta.w ZP.Lives

    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod7
    sep #$20
    beq +
    tdc
    lda.b #$01
    sta.w ZP.Lives
    +

    ;Reset Bullets
    lda.b #$F0
    sta.w Bullet[0].X
    sta.w Bullet[0].Y
    stz.w Bullet[0].Frame
    lda.b #$00
    sta.w Bullet[0].Enabled

    lda.b #!WaveInit
    sta.b ZP.EnemyWaveCount
    lda.b #!EnemyMoveL
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    sta.w EPlaneTop
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer

    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod5
    sep #$20
    beq +
    tdc
    lda.b #$41
    sta.w HW_MOSAIC
    +
    
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod9
    sep #$20
    beq +
    tdc
    lda.b ZP.EnemyPlanePosY
    sec
    sbc.b #$20
    sta.b ZP.EnemyPlanePosY
    sta.w EPlaneTop
    +
    tdc
    ;Set RNG up for enemy timers
    ldy.w #!EBulLoopCount
    -
    jsr Rand
    xba
    and #$7F
    sta.w EnemyShootTimer, Y
    lda.b #$00
    sta.w EnemyBulletActive, Y
    dey
    bpl -

    ldy.w #$000F
    -
    lda.b #$FF
    sta.w OBJXPos, Y
    sta.w OBJYPos, Y
    dey
    bpl -
    ldx.w #$0000
    stx.b ZP.Score

    ;Setup UFO
    rep #$20
    lda.w #!UFOResetTime
    sta.w UFOTimer
    sep #$20
    stz.w UFOActive

    ;Reset explosion sprites
    ldy #!MaxEplW-1
    -
    lda.b #$00
    sta.w ExplosionTimer, Y
    lda.b #$F0
    sta.w ExplosionX, Y
    sta.w ExplosionY, Y
    dey
    bpl -

    ;Setup Shields
    ldy.w #$0003
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!ModA
    sep #$20
    beq +
    tdc
    --
    lda.b #$01
    sta.w ShieldHealth, Y
    lda.b #$00
    sta.w ShieldBlinkTimer, Y
    dey
    bpl --
    bra .LoadTilemaps
    +
    -
    lda.b #!ShieldStartHP
    sta.w ShieldHealth, Y
    lda.b #$00
    sta.w ShieldBlinkTimer, Y    
    dey
    bpl -
    
    ;Reset shield positions
    lda.b #$10
    sta.w ShieldXPos
    lda.b #$50
    sta.w ShieldXPos+1
    lda.b #$90
    sta.w ShieldXPos+2
    lda.b #$D0
    sta.w ShieldXPos+3
    .LoadTilemaps:
    ;-------------------;
    ;   Load tilemaps   ;
    ;-------------------;
    jsr GameLoop_LoadBG

    ldx.w #$0000
    stx.w BG2VOffMirror
    stx.w BG1VOffMirror
    ;Write enemy entries into Enemy struct array
    jsr GameLoop_UpdateEnemyArray
    jsl GameLoop_DrawEnemies
    jsr GameLoop_FindMaxRowBounds
    lda.b #!GameState_Play
    sta.w GameState
    ;lda.b #$01
    ;sta.w HW_BGMODE
    sep #$20
    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    
    lda.b #$00
    sta.b ZP.PalFadeInd
    ldx.w #$0000
    stx.b ZP.PalFadeStart
    ldx.w #$0000
    stx.b ZP.PalFadeEnd
    
    jsl ClearHDMAGameScene

    lda.b #$03
    sta.w HDMAMirror
    lda.b #(HW_CGADD)&$FF
    sta.w HDMAMirror+1
    ldx.w #HDMAColTableOut
    stx.w HDMAMirror+2
    lda.b #$80
    sta.w HDMAMirror+4
    
    .SkipLoad:

    jsr GameLoop_DrawScore

    ;-----------------------;
    ;   Background Logic    ;
    ;-----------------------;
    jsr GameLoop_UpdateBG

    ;-------------------;
    ;   Player Logic    ;
    ;-------------------;    
    lda.w GameState
    cmp.b #!GameState_Dead
    beq .SkipLeftInput
    lda.w GameState
    cmp.b #!GameState_Over
    beq .SkipLeftInput
    lda.b ZP.Controller+1
    and #$01                    ;Check Right DPAD
    beq .SkipRightInput
    lda.w Player.X
    adc.b #!PlayerSpeed
    cmp #$F0
    bcs .SkipRightInput
    sta.w Player.X
    .SkipRightInput:
    
    lda.b ZP.Controller+1
    and #$02                    ;Check Left DPAD
    beq .SkipLeftInput
    lda.w Player.X
    sec
    sbc.b #!PlayerSpeed
    bcc .SkipLeftInput
    sta.w Player.X
    .SkipLeftInput:

    lda.w Player.FTime
    beq +
    dec.w Player.FTime
    +

    lda.w GameState
    cmp.b #!GameState_Dead
    beq .SkipShoot
    cmp.b #!GameState_Over
    beq .SkipShoot
    lda.w Player.FTime
    bne .SkipShoot
    lda.b ZP.Controller+1
    and #$40                    ;Check A button
    beq .SkipShoot
    lda.w Bullet.Enabled
    bne .SkipShoot
    ;Enable bullet
    lda.b #$01
    sta.w Bullet.Enabled
    lda.b #!PlayerFTimeReset
    sta.w Player.FTime
    ;Set Bullet position to the player's
    lda.w Player.X
    clc
    adc.b #$04
    sta.w Bullet.X
    lda.b #!PlayerY
    sta.w Bullet.Y
    ;Set bullet direction
    stz.w Bullet.Dir
    lda.b ZP.Controller
    and #$10                ;Check L
    beq .SkipL
    lda.b #!BulletHSpeed
    sta.w Bullet.Dir
    .SkipL:
    lda.b ZP.Controller
    and #$20                ;Check R
    beq .SkipR
    lda.b #$00
    sec
    sbc.b #!BulletHSpeed
    sta.w Bullet.Dir
    .SkipR:
    .SkipShoot:

    sep #$20
    inc.w Player.Frame
    lda.w Player.Frame
    cmp.b #$03
    bne +
    stz.w Player.Frame
    inc.w Player.State
    lda.w Player.State
    and.b #$03
    sta.w Player.State
    +

    jsr HandleStageText
    jsr HandleEBulletCollisions
    jsr HandleBulletCollisions
    ;------------------------------;
    ;   Player Drawing Commands    ;
    ;------------------------------;
    ;Player will take the first 4 spots of OAM
    lda.w GameState
    cmp.b #!GameState_Over
    beq +
    lda.w Player.Dead
    beq .DrawPlayer
    +
    jmp .SkipPlayerDraw
    .DrawPlayer:
    lda.w Player.X
    sta.b ZP.AddSprX
    lda.b #!PlayerY
    sta.b ZP.AddSprY
    sep #$10
    ldy.w Player.State
    lda.w PlayerFrames, Y
    rep #$10
    sta.b ZP.AddSprTile
    lda.b #!PlayerAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    .SkipPlayerDraw:

    ;-------------------;
    ;   Bullet Logic    ;
    ;-------------------;
    ;Check if the bullet is on screen
    lda.w Bullet.Enabled
    bne .SkipBulletJmp
    jmp .SkipBullet0Logic
    .SkipBulletJmp:
    ;Grab the bullet Y
    lda.w Bullet.Y
    ;Decrement position by speed
    sec
    sbc.b #!BulletSpeed
    bcs .SkipDisable0
    stz.w Bullet.Enabled
    lda.b #$FF
    sta.w Bullet.X
    sta.w Bullet.Y
    stz.w Bullet.Dir
    .SkipDisable0:
    sta.w Bullet.Y
    
    lda.w Bullet.X
    clc
    adc.w Bullet.Dir
    sta.w Bullet.X
    
    lda.w GameState
    cmp.b #!GameState_Stop
    bne +
    jmp .SkipBullet0Logic
    +
    ;Collision code
    lda.b #$FF
    sta.b ZP.BulletColTile      ;Reset collided tile index
    lda.w Bullet.X
    clc
    adc.b #!BulletColOff
    sta.b ZP.R0
    lda.w Bullet.Y
    clc
    adc.b #!BulletColOff
    sta.b ZP.R1
    ;Xpos
    lda.b #$00
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R2
    lda.b ZP.R0             ;Center X
    sec
    sbc.b ZP.R2
    lsr
    lsr
    lsr                     ;X position floored by 8
    sta.w HW_WRDIVL
    stz.w HW_WRDIVH
    lda.b #$03
    sta.w HW_WRDIVB         ;Divide by 3
    ;Ypos
    lda.b #$00
    sec
    sbc.b ZP.EnemyPlanePosY ;(256 - Y)
    sta.b ZP.R3
    lda.b ZP.R1             ;Center Y
    sec
    sbc.b ZP.R3
    lsr
    lsr
    lsr                     ;Y position floored by 8
    sta.b ZP.R2
    
    lda.w HW_RDDIVL         ;Grab division
    cmp #$08
    bmi +
    jmp .SkipBullet0Logic   ;Exit if we're out of bounds of the tile X index
    +
    sta.b ZP.R4
    lda.w HW_RDMPYL         ;Grab remainder of division
    sta.b ZP.R5
    
    lda.b ZP.R2
    sta.w HW_WRDIVL
    stz.w HW_WRDIVH
    lda.b #$03
    sta.w HW_WRDIVB       ;Divide by 3
    jml +                 ;Waste 12 cycles while division is processing
    +
    jml +
    +
    jml +
    +
    jml +
    +    
    lda.w HW_RDDIVL         ;Grab division
    cmp #$05
    bmi .SkipExitBullet
    jmp .SkipBullet0Logic   ;Exit if we're out of bounds of the tile Y index
    .SkipExitBullet:
    sta.b ZP.R6
    lda.w HW_RDMPYL         ;Grab remainder of division
    sta.b ZP.R7

    lda.b ZP.R5             ;X remainder
    cmp #2
    bne +
    jmp .SkipBullet0Logic   ;Skip if we've hit the empty tile next to the enemy
    +
    lda.b ZP.R7             ;Y remainder
    cmp #2
    beq .SkipBullet0Logic   ;Skip if we've hit the empty tile next to the enemy
    tdc
    lda.b ZP.R6             ;Y Division output
    asl
    asl
    asl
    clc
    adc.b ZP.R4
    sta.b ZP.BulletColTile  ;Store collided tiles

    ;Bullet collision logic
    ldy.w #$0000
    lda.b ZP.BulletColTile  ;Grab enemy index
    tay                     ;Shove into Y index
    lda.w EnemyHealth, Y    ;Grab current enemie's alive state
    bne .SkipEHJmp
    jmp .SkipEnemyHurt      ;If it's 0 then we don't do anything
    .SkipEHJmp:
    dec
    bne +
    pha
    ;Add score
    phy
    lda.w EnemyType, Y      ;Save enemy type for scoring
    tay
    lda.b ZP.Score
    sed
    clc
    adc.w EnemyScoreTable, Y
    bcc ++
    pha
    clc
    lda.b ZP.Score+1
    clc
    adc.b #$01
    sta.b ZP.Score+1
        bcc +++
        clc
        lda.b ZP.Score+2
        clc
        adc.b #$01
        sta.b ZP.Score+2
        +++
    pla
    ++
    sta.b ZP.Score
    cld
    ply
    lda.b #$00
    sta.w EnemyType, Y      ;Set enemy type to 0 to prevent null enemy collisions
    phy
    tdc
    lda.b ZP.BulletColTile  ;Grab enemy index
    asl                     ;Mult by 2 since each entry into the pixel pos table is word sized
    tay
    lda.w EnemyPixelPos, Y
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R0
    iny
    lda.w EnemyPixelPos, Y
    clc
    sbc.b ZP.EnemyPlanePosY
    sta.b ZP.R1
    jsr SpawnExplosive
    jsr GameLoop_FindMaxRowBounds
    ply
    pla
    +
    sta.w EnemyHealth, Y
    stz.w Bullet[0].Enabled
    lda.b #$FF
    sta.w Bullet[0].X
    sta.b ZP.BulletColTile
    lda.b #!EnemyHurtTimer
    sta.w EnemyHurtTable, Y
    inc.b ZP.DrawEnemyFlag
    .SkipEnemyHurt:

    .SkipBullet0Logic:

    ;---------------------;
    ;   Bullet Drawing    ;
    ;---------------------;
    stz.b ZP.AddSprX+1
    lda.w Bullet.X
    sta.b ZP.AddSprX
    lda.w Bullet.Y
    sta.b ZP.AddSprY
    lda.b #!BulletF1
    sta.b ZP.AddSprTile
    lda.b #!BulletAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    sep #$20
    inc.w BulletFCount
    lda.w BulletFCount
    bit #$04
    beq .SkipBulletChange
    stz.w BulletFCount
    ;Player bullet pal cycle
    sep #$20
    inc Bullet.Frame
    lda.w Bullet.Frame
    bit #$04
    beq +
    stz.w Bullet.Frame
    ldy.w #$0162
    tdc
    lda.b #$02
    sta.b ZP.R4
    jsr PalCycle
    ;Enemy Bullet
    ldy.w #$0166
    tdc
    lda.b #$02
    sta.b ZP.R4
    jsr PalCycle
    +
    inc.w EnemyBulletFrame
    lda.w EnemyBulletFrame
    and #$03
    sta.w EnemyBulletFrame
    .SkipBulletChange:
    ;-----------------------;
    ;   Enemy Bullet logic  ;
    ;-----------------------;
    tdc
    sep #$20
    lda.w EnemyShootIndex
    inc
    sta.w EnemyShootIndex
    cmp.b #$28
    bmi +
    stz.w EnemyShootIndex
    +
    lda.w GameState
    cmp.b #!GameState_Stop
    beq +
    cmp.b #!GameState_Over
    beq +
    jsr GameLoop_HandleEnemyTimers
    +
    sep #$20
    ;Handle bullet logic
    lda.w GameState
    cmp.b #!GameState_Over
    beq +
    jsr GameLoop_EBulletLogic
    +
    ;-------------------------------;
    ;   Enemy Bullet Drawing logic  ;
    ;-------------------------------;
    jsr GameLoop_EBulletDraw
    ldy.w #$0000

    ;-----------------;
    ;   Enemy Logic   ;
    ;-----------------;
    ;Check game state
    lda.w GameState
    cmp.b #!GameState_Dead
    bne .SkipWaveReset
    ;If the player has died then we execute the enemy resetting
    ;Move enemies up if the reset flag is set
    lda.w EnemyResetFlag
    beq +
    lda.w EPlaneTop
    sta.b ZP.EnemyPlanePosY
    stz.w EnemyResetFlag
    stz.w EnemyResetMove
    lda.b #!GameState_Play
    sta.w GameState
    jsr GameLoop_ResetPlayer
    jmp .SkipFloor
    +
    lda.w EnemyResetMove
    beq .SkipEnemyResetMove
    ;Check if we've hit the starting Y posiiton
    lda.b ZP.EnemyPlanePosY
    cmp.w EPlaneTop
    bne ++
    ;If we have then set the reset flag to reset the wave
    inc.w EnemyResetFlag
    ++
    ;Add speed offset
    inc.b ZP.EnemyPlanePosY
    .SkipEnemyResetMove:
    +

    dec.w PlayerDeathTimer
    bne +
    ;TRIGGER PLAYER DEATH
    jsr GameLoop_KillPlayer
    +
    jmp .SkipFloor
    .SkipWaveReset:
    lda.w GameState
    cmp.b #!GameState_Play
    beq .DoPlay
    jmp .SkipEnemy
    .DoPlay:
    lda.w GameState
    cmp.b #!GameState_Dead
    bne .DoEnemy
    jmp .SkipFloor
    .DoEnemy:
    ;Check enemy count and set enemy speed to amount of enemies on screen
    sep #$20
    stz.b ZP.EnemyWait
    ldy.w #$0000
    -
    lda.w EnemyHealth, Y
    beq +
    inc.b ZP.EnemyWait
    +
    lda.w EnemyHurtTable, Y
    beq +
    dec
    bne ++
    sta.w EnemyHurtTable, Y
    inc.b ZP.DrawEnemyFlag
    ++
    sta.w EnemyHurtTable, Y
    +
    iny
    cpy.w #$0028
    bne -
    
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod1
    sep #$20
    beq +
    tdc
    lda.b ZP.EnemyWait
    lsr
    beq +
    sta.b ZP.EnemyWait
    +
    ;Adjust speed and then apply
    tdc
    lda.b ZP.EnemyWait
    beq .SetStateWait               ;No enemies means the wave has been beaten
    bne +
    lda.b #$01
    +
    sta.b ZP.EnemyWait
    bra .SkipState
    ;Set the game state to Stop and initialise game timer
    .SetStateWait
    lda.b #$01
    sta.w EnemyTransSetup
    lda.b #!GameState_Stop
    sta.w GameState
    stz.w SendWave
    .SkipState:
    tdc
    lda.b ZP.EnemyTimer
    beq .SkipMoveJmp
    jmp .SkipMove
    .SkipMoveJmp:
    sep #$20
    lda.b ZP.EnemyFrame
    inc
    and #$07
    sta.b ZP.EnemyFrame
    lda.w GameState
    ;Downward movement code
    lda.b ZP.EnemyDir
    cmp #!EnemyMoveD
    bne .SkipDown
    lda.b ZP.EnemyDownCount
    bne .SkipDownReset
    lda.b ZP.EnemySide
    sta.b ZP.EnemyDir
    .SkipDownReset:
    dec.b ZP.EnemyDownCount
    dec.b ZP.EnemyPlanePosY
    jmp .ApplyMove
    .SkipDown:
    lda.b ZP.EnemyDir
    cmp #!EnemyMoveR
    bne .Neg
    ;Check enemy right boundary
    lda.w EnemyMin
    cmp.w ZP.EnemyPlanePosX
    bne .ApplyMove
    lda.b #!EnemyMoveD
    sta.b ZP.EnemyDir
    lda.b #!EnemyMoveL
    sta.b ZP.EnemySide
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    jmp .ApplyMove
    .Neg:
    ;Check enemy left boundary
    lda.w EnemyMax
    cmp.w ZP.EnemyPlanePosX
    bne .ApplyMove
    lda.b #!EnemyMoveD
    sta.b ZP.EnemyDir
    lda.b #!EnemyMoveR
    sta.b ZP.EnemySide
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    .ApplyMove:
    
    ;Offset enemy positions [must be after boundary comparisons to avoid jamming]
    lda.b ZP.EnemyDir
    cmp #!EnemyMoveD
    beq .SkipLR
    lda.b ZP.EnemyDir
    cmp #!EnemyMoveR
    beq .SkipRight
    lda.b ZP.EnemyPlanePosX
    sec
    sbc #!EnemySpeed
    sta.b ZP.EnemyPlanePosX
    bra .SkipLR
    .SkipRight
    ;Move enemy right
    lda.b ZP.EnemyPlanePosX
    clc
    adc #!EnemySpeed
    sta.b ZP.EnemyPlanePosX
    .SkipLR:

    ;Check if enemies are at the floor
    lda.b ZP.EnemyPlanePosY
    cmp.w EnemyFloor
    bcs .SkipFloor
    lda.b #!GameState_Dead
    sta.w GameState
    lda.b #!PlayerDieReset
    sta.w PlayerDeathTimer
    .SkipFloor:
    lda.b ZP.EnemyPlanePosX
    sta.w BG1HOffMirror
    stz.w BG1HOffMirror+1
    lda.b ZP.EnemyPlanePosY
    sta.w BG1VOffMirror
    lda.b #$01
    sta.w BG1VOffMirror+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    jsl GameLoop_DrawEnemies_FrameDecider
    .SkipMove:
    dec.b ZP.EnemyTimer
    .SkipEnemy

    ;-------------------;
    ;    Handle UFO     ;
    ;-------------------;
    
    jsr GameLoop_HandleUFO    
    jsr GameLoop_HandleUFOParticles

    ;------------------------;
    ;    Handle Explosions   ;
    ;------------------------;
    ldy.w #!EnemyHurtPalInd*2+1
    tdc
    lda.b #$0F
    sta.b ZP.R4
    jsr PalCycle
    jsr UpdateExplosives

    ;Update explosion positions by speed
    ldy.w #!MaxEplW-1
    -
    ;Add coarse speed
    lda.w ExplosionX, Y
    clc
    adc.w ExplosionXVal, Y
    sta.w ExplosionX, Y
    lda.w ExplosionFineX, Y
    clc
    adc.w ExplosionFineXVal, Y
    bcc +
    pha
    lda.w ExplosionX, Y
    inc
    sta.w ExplosionX, Y
    pla
    +
    sta.w ExplosionFineX, Y
    
    lda.w ExplosionY, Y
    clc
    adc.w ExplosionYVal, Y
    sta.w ExplosionY, Y
    lda.w ExplosionFineY, Y
    clc
    adc.w ExplosionFineYVal, Y
    bcc +
    pha
    lda.w ExplosionY, Y
    inc
    sta.w ExplosionY, Y
    pla
    +
    sta.w ExplosionFineY, Y
    dey
    bpl -
    
    ;------------------------;
    ;    Handle Game State   ;
    ;------------------------;
    sep #$20
    lda.w SendWave
    beq .SkipSend
    lda.b #!GameState_Play
    sta.w GameState
    jsr GameLoop_SendWave
    stz.w SendWave
    .SkipSend:
    sep #$20
    lda.w GameState
    cmp.b #!GameState_Stop
    bne +
    jsr GameLoop_EnemyTransition
    +

    sep #$20
    lda.w GameState
    cmp.b #!GameState_Over
    bne .SkipGOLogic
    dec.w GameOverTimer
    lda.w GameOverTimer
    bne .SkipGOLogic
    lda.w GameOverTransFlag
    bne +
    inc.w GameOverTransFlag
    stz.b ZP.ChangeScene
    lda.b #$04
    stz.b ZP.ExitScene
    sta.b ZP.SceneGoto
    jsr TransitionOut
    +
    .SkipGOLogic:
    sep #$20
    lda.b ZP.ExitScene
    beq +
    stz.b ZP.ExitScene
    lda.w ZP.SceneGoto
    sta.w ZP.SceneIndex
    lda.b #$01
    sta.b ZP.ChangeScene
    +
    ;-----------------------;
    ;    Handle Shields     ;
    ;-----------------------;

    ;Handle shield blinks
    lda.w Bullet.X
    sta.b ZP.R0
    lda.w Bullet.Y
    sta.b ZP.R1
    jsr Gameloop_ShieldCollision
    lda.b ZP.R2
    beq +
    stz.w Bullet.Enabled
    lda.b #$FF
    sta.w Bullet.X
    lda.b #$F0
    sta.w Bullet.Y
    stz.b ZP.R2
    +
    tdc
    ldy.w #!EBulLoopCount
    -
    lda.w EnemyBulletXPos, Y
    sta.b ZP.R0
    lda.w EnemyBulletYPos, Y
    sta.b ZP.R1
    jsr Gameloop_ShieldCollision
    
    lda.b ZP.R2
    beq +
    lda.b #$00
    sta.w EnemyBulletActive, Y
    lda.b #$FF
    sta.w EnemyBulletXPos, Y
    lda.b #$F0
    sta.w EnemyBulletYPos, Y
    stz.b ZP.R2
    +
    dey
    bpl -

    ldy.w #$0003
    -
    bit #$04
    bne +
    lda.w ShieldHealth, Y
    lda.b #!ShieldStartHP
    sec
    sbc.w ShieldHealth, Y
    asl
    asl
    asl
    clc
    sta.b ZP.R0
    lda.w ShieldBlinkTimer, Y
    clc
    adc.b ZP.R0
    sta.w ShieldBlinkTimer, Y
    +
    dey
    bpl -

    rep #$20
    lda.b ZP.Modifiers
    bit.w #!ModB
    sep #$20
    beq .SkipShieldMove    
    tdc
    ;Reset shield positions
    lda.b #$10
    sta.w ShieldXPos
    lda.b #$50
    sta.w ShieldXPos+1
    lda.b #$90
    sta.w ShieldXPos+2
    lda.b #$D0
    sta.w ShieldXPos+3
    sep #$10
    inc.w ShieldSinPtr
    inc.w ShieldSinPtr
    inc.w ShieldSinPtr
    ldx.w ShieldSinPtr
    ldy.b #$03
    -
    lda.w UnSineTable, X
    lsr
    lsr
    lsr
    lsr
    clc
    sbc.b #$08
    adc.w ShieldXPos, Y
    sta.w ShieldXPos, Y
    txa
    adc.b #$10
    tax
    dey
    bpl -
    rep #$10
    .SkipShieldMove:

    ;Must be placed after game state handling to prevent incorrect collisions
    sep #$20
    lda.b #!ShieldYPos
    sta.b ZP.R1
    jsr Gameloop_FindAlienRow
    lda.b ZP.R0
    cmp.b #$05                  ;Skip over row counts larger than actual table
    bpl +
    jsr Gameloop_AlienShieldCollision
    +
    lda.b #!PlayerY
    sta.b ZP.R1
    jsr Gameloop_FindAlienRow
    lda.b ZP.R0
    cmp.b #$05                  ;Skip over row counts larger than actual table
    bpl +
    jsr Gameloop_AlienPlayerCollision
    +

    lda.b ZP.DrawEnemyFlag
    beq .SkipRedraw    
    jsl GameLoop_DrawEnemies
    jsr GameLoop_FindMaxRowBounds
    .SkipRedraw
    stz.b ZP.DrawEnemyFlag

    jsr Gameloop_DrawShields

    jsr GameLoop_UpdateBG_OBJ

    ;-----------------------;
    ;   END OF GAME SCENE   ;
    ;-----------------------;
    rep #$20
    rts

    ;---------------------------;
    ;   Draw Score to Screen    ;
    ;---------------------------;
    ;
    ;   Usage:
    ;
    ;   Clobberlist
    ;
GameLoop_DrawScore:
    pha
    phy
    phx
    php    
    tdc
    sep #$20
    stz.b ZP.AddSprBigFlag
    ldx.w #$0006
    stx.b ZP.AddSprX
    sta.b ZP.AddSprY
    lda.b #!UIAttr
    sta.b ZP.AddSprAttr
    lda.b #!ScoreUI
    sta.b ZP.AddSprTile
    jsr AddSprite
    lda.b #!ScoreTextAttr
    sta.b ZP.AddSprAttr
    lda.b ZP.AddSprX
    adc.b #$06
    sta.b ZP.AddSprX
    ldy.w #$0002
    -
    lda.b ZP.AddSprX
    adc.b #$04
    sta.b ZP.AddSprX
    lda.w ZP.Score, Y
    and.b #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite
    lda.b ZP.AddSprX
    adc.b #$04
    sta.b ZP.AddSprX
    lda.w ZP.Score, Y
    and.b #$0F
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite
    dey
    bpl -

    lda.b #$06
    sta.b ZP.AddSprX
    lda.b #$0C
    sta.b ZP.AddSprY
    lda.b #!UIAttr
    sta.b ZP.AddSprAttr
    lda.b #!LivesUI
    sta.b ZP.AddSprTile
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    lda.b #!ScoreTextAttr
    sta.b ZP.AddSprAttr
    lda.b ZP.AddSprX
    adc.b #$0A
    sta.b ZP.AddSprX
    lda.b ZP.Lives
    and.b #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite
    lda.b ZP.AddSprX
    adc.b #$04
    sta.b ZP.AddSprX
    lda.b ZP.Lives
    and.b #$0F
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite

    lda.b #$06
    sta.b ZP.AddSprX
    lda.b #$18
    sta.b ZP.AddSprY
    lda.b #!UIAttr
    sta.b ZP.AddSprAttr
    lda.b #!WaveUI
    sta.b ZP.AddSprTile
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    lda.b #!ScoreTextAttr
    sta.b ZP.AddSprAttr
    lda.b ZP.AddSprX
    adc.b #$0A
    sta.b ZP.AddSprX
    lda.b ZP.EnemyWaveCount
    and.b #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite
    lda.b ZP.AddSprX
    adc.b #$04
    sta.b ZP.AddSprX
    lda.b ZP.EnemyWaveCount
    and.b #$0F
    inc
    sta.b ZP.AddSprTile
    jsr AddSprite
    plp
    plx
    ply
    pla
    rts

GameLoop_HandlePause:
    pha
    php
    sep #$20
    lda.w PauseFlag
    bne .HandlePauseOn
    ;Else check if game is to be paused
    lda.b ZP.InputFlag
    bne .SkipPause
    lda.b ZP.Controller+1
    bit.b #$10
    beq .SkipPause          ;Skip pause if start not pressed
    ;If so then create 2 new sprites for the pause menu
    lda.b #$01
    sta.b ZP.InputFlag
    sta.w PauseFlag

    ldx.w #$01F8
    stx.b ZP.OAMPtr

    ;Pause graphics
    lda.b #$70
    sta.b ZP.AddSprX
    lda.b #$60
    sta.b ZP.AddSprY
    lda.b #!PauseTile1
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    
    lda.b #$80
    sta.b ZP.AddSprX
    lda.b #$60
    sta.b ZP.AddSprY
    lda.b #!PauseTile2
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    .HandlePauseOn:
    ;Wait loop for pausing
    -

    ldx.w #$FFFF
    stx.b ZP.NMIDone
    lda.b ZP.InputFlag
    bne .SkipUnpause
    lda.b ZP.Controller+1
    bit.b #$10
    beq .SkipUnpause          ;Skip Unpause if start not pressed
    ;If so then create 2 new sprites for the pause menu
    lda.b #$01
    sta.b ZP.InputFlag
    stz.w PauseFlag
    .SkipUnpause:

    lda.w PauseFlag
    bne -
    .SkipPause:
    plp
    pla
    rts

    ;
    ;   ZP.R0 for X
    ;   ZP.R1 for Y
    ;   ZP.R2 enable flag
    ;
Gameloop_ShieldCollision:
    pha
    phx
    phy
    php
    ldy.w #$0003
    ldx.w #$0000
    -
    lda.w ShieldHealth, Y
    beq .SkipPlayerBulletCheck
    tya
    asl
    asl
    tax
    ;Check player bullet
    ;(ShieldY - BulletX) <= 8
    lda.b #!ShieldYPos
    sec
    sbc.b ZP.R1
    clc
    adc.b #$04
    cmp.b #$08                  ;Check if bullet calculation <= 8
    bcs .SkipPlayerBulletCheck
    lda.w ShieldXPos, Y
    sec
    sbc.b #$04
    cmp.b ZP.R0
    bcs .SkipPlayerBulletCheck
    lda.w ShieldXPos, Y
    clc
    adc.b #$1C
    cmp.b ZP.R0
    bcc .SkipPlayerBulletCheck
    ;Assume the bullet has hit the shield
    lda.w ShieldHealth, Y
    dec
    sta.w ShieldHealth, Y
    ;enable disable flag
    lda.b #$01
    sta.w ZP.R2
    .SkipPlayerBulletCheck:
    dey
    bpl -
    plp
    ply
    plx
    pla
    rts

    ;
    ;   Input ZP.R1   |   Comparitive Y position
    ;   Output ZP.R0  |   Current row
    ;
    ;   1) rowpixelpos = 256 - enemypos
    ;   2) distance = (!ShieldYPos - rowpixelpos)
    ;   3) index = distance / 24
    ;
Gameloop_FindAlienRow:
    pha
    phx
    phy
    php
    rep #$10
    sep #$20
    lda.b #$F8
    sec
    sbc.b ZP.EnemyPlanePosY
    sta.b ZP.R0                 ;Row pixel pos Y
    lda.b ZP.R1
    sec
    sbc.b ZP.R0
    sta.w HW_WRDIVL             ;Distance
    stz.w HW_WRDIVH
    lda.b #$18
    sta.w HW_WRDIVB
    ;Waste 16 cycles for division
    jml +
    +
    jml +
    +
    jml +
    +
    jml +
    +
    lda.w HW_RDDIVL             ;index
    sta.b ZP.R0
    plp
    ply
    plx
    pla
    rts

    ;ZP.R0  |   Row index
    ;ZP.R1  \
    ;ZP.R2  |   General memory
    ;ZP.R3  |
    ;ZP.R4  /
    ;
Gameloop_AlienShieldCollision:
    pha
    phx
    phy
    php
    tdc
    sep #$20
    stz.b ZP.R5
    lda.b #$08
    sta.w HW_M7A
    stz.w HW_M7A
    lda.b ZP.R0
    sta.w HW_M7B
    lda.w HW_MPYL           ;Row index
    clc
    adc.b #$07
    tay                     ;Current enemy index
    lda.b #$07
    sta.b ZP.R3
    .EnemyColCheck:
    lda.w EnemyType, Y
    beq .SkipEnemyCheck     ;Skip dead enemies    
    ;Check each shield
    lda.b #$00
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R2             ;Corrected enemy plane xpos
    ldx.w #$0003
    .ShieldColLoop:
    phx
    phy
    lda.w ShieldHealth, X
    beq .SkipShield
    tya
    asl                     ;Align Y to word sized
    tay
    ;(EnemyPixelPos + (256-ZP.EnemyPlanePosX) - 16) > ShieldXPos
    lda.w EnemyPixelPos, Y
    clc
    adc.b ZP.R2
    clc
    adc.b #$10
    cmp.w ShieldXPos, X
    bcc .SkipShield
    ;(EnemyPixelPos + (256-ZP.EnemyPlanePosX) - 16) < ShieldXPos + 32
    lda.w EnemyPixelPos, Y
    clc
    adc.b ZP.R2
    sec
    sbc.b #$20
    bpl +
    lda.b #$00
    +
    cmp.w ShieldXPos, X
    bcs .SkipShield
    lda.b ZP.R0
    sta.b ZP.R4
    ;Assume the enemy has hit the current shield
    phx
    tya
    lsr
    tax
    lda.w EnemyHealth, X
    sta.b ZP.R2
    lda.b #$00
    sta.w EnemyHealth, X
    sta.w EnemyType, X
    plx
    lda.w ShieldHealth, X
    sec
    sbc.b ZP.R2             ;Damage shiled by enemy health value
    bpl +
    lda.b #$00
    +
    sta.w ShieldHealth, X    
    lda.w EnemyPixelPos, Y
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R0
    lda.w EnemyPixelPos+1, Y
    sec
    sbc.b ZP.EnemyPlanePosY
    sta.b ZP.R1
    jsr SpawnExplosive
    
    lda.b ZP.R4
    sta.b ZP.R0
    inc.w ZP.DrawEnemyFlag
    ;Skip shield and check loop
    .SkipShield:
    ply
    plx
    dex
    bpl .ShieldColLoop
    .SkipEnemyCheck:
    dey
    dec.b ZP.R3
    bmi +
    jmp .EnemyColCheck
    +
    plp
    ply
    plx
    pla
    rts

    ;ZP.R0  |   Row index
    ;ZP.R1  \
    ;ZP.R2  |   General memory
    ;ZP.R3  |
    ;ZP.R4  /
    ;
Gameloop_AlienPlayerCollision:
    pha
    phx
    phy
    php
    tdc
    sep #$20
    stz.b ZP.R5
    lda.b #$08
    sta.w HW_M7A
    stz.w HW_M7A
    lda.b ZP.R0
    sta.w HW_M7B
    lda.w HW_MPYL           ;Row index
    clc
    adc.b #$07
    tay                     ;Current enemy index
    lda.b #$07
    sta.b ZP.R3
    .EnemyColCheck:
    lda.w EnemyType, Y
    beq .SkipEnemyCheck     ;Skip dead enemies    
    ;Check each shield
    lda.b #$00
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R2             ;Corrected enemy plane xpos
    .ShieldColLoop:
    tya
    asl                     ;Align X to word sized
    tax
    ;(EnemyPixelPos + (256-ZP.EnemyPlanePosX) - 16) > PlayerXPos
    lda.w EnemyPixelPos, X
    clc
    adc.b ZP.R2
    clc
    adc.b #$10
    cmp.w Player.X
    bcc .SkipEnemyCheck
    ;(EnemyPixelPos + (256-ZP.EnemyPlanePosX) - 16) < PlayerXPos + 16
    lda.w EnemyPixelPos, X
    clc
    adc.b ZP.R2
    sec
    sbc.b #$10
    bpl +
    lda.b #$00
    +
    cmp.w Player.X
    bcs .SkipEnemyCheck
    lda.b ZP.R0
    sta.b ZP.R4
    ;Assume the enemy has hit the current shield
    lda.b #$00
    sta.w EnemyHealth, Y
    sta.w EnemyType, Y
    jsr GameLoop_KillPlayer

    ;Spawn explosion   
    lda.w EnemyPixelPos, X
    sec
    sbc.b ZP.EnemyPlanePosX
    sta.b ZP.R0
    lda.w EnemyPixelPos+1, X
    sec
    sbc.b ZP.EnemyPlanePosY
    sta.b ZP.R1
    jsr SpawnExplosive
    
    lda.b ZP.R4
    sta.b ZP.R0
    inc.w ZP.DrawEnemyFlag
    ;Skip shield and check loop
    .SkipPlayer:
    .SkipEnemyCheck:
    dey
    dec.b ZP.R3
    bmi +
    jmp .EnemyColCheck
    +
    plp
    ply
    plx
    pla
    rts

Gameloop_DrawShields:
    pha
    phx
    phy
    php
    ldy.w #$0003
    tdc
    .ShieldDrawLoop
    ldx.w #$0000
    tdc
    lda.w ShieldHealth, Y
    beq .SkipBlink
    asl
    asl
    tax
    sep #$20
    lda.b #!ShieldAttr1
    sta.b ZP.R0
    lda.b #!ShieldAttr2
    sta.b ZP.R1
    lda.w ShieldBlinkTimer, Y
    cmp #$60
    bmi .DrawShieldSpr
    lda.b #$00
    sta.w ShieldBlinkTimer, Y
    jmp .SkipDraw
    .SkipBlink:

    
    lda.w ShieldHealth, Y
    bne .DrawShieldSpr
    jmp .SkipDraw
    .DrawShieldSpr:
    lda.w ShieldXPos, Y
    sta.b ZP.AddSprX
    lda.b #!ShieldYPos
    sta.b ZP.AddSprY
    lda.w ShieldTileTable, X
    sta.b ZP.AddSprTile
    lda.b ZP.R0
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.w ShieldXPos, Y
    clc
    adc.b #$08
    sta.b ZP.AddSprX
    lda.b #!ShieldYPos
    sta.b ZP.AddSprY
    lda.w ShieldTileTable, X
    sta.b ZP.AddSprTile
    lda.b ZP.R1
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.w ShieldXPos, Y
    clc
    adc.b #$10
    sta.b ZP.AddSprX
    lda.b #!ShieldYPos
    sta.b ZP.AddSprY
    lda.w ShieldTileTable, X
    sta.b ZP.AddSprTile
    lda.b ZP.R0
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.w ShieldXPos, Y
    clc
    adc.b #$18
    sta.b ZP.AddSprX
    lda.b #!ShieldYPos
    sta.b ZP.AddSprY
    lda.w ShieldTileTable, X
    sta.b ZP.AddSprTile
    lda.b ZP.R1
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20    
    .SkipDraw:
    dey
    bmi +
    jmp .ShieldDrawLoop
    +
    plp
    ply
    plx
    pla
    rts

    ;---------------------------------;
    ;   Updating enemy array table    ;
    ;---------------------------------;
    ;
    ;   Usage:
    ;       Call function and the table will automatically be updated [SET A INTO 8 BIT MODE BEFOREHAND]
    ;
    ;   Clobber list
    ;       ZP.MemPointer
    ;
    ;
GameLoop_UpdateEnemyArray:
    pha
    phy
    tdc
    ldx.w #$0000
    lda.b ZP.EnemyWaveCount
    asl
    tax
    rep #$20
    lda.w EnemyWaveLookup, X
    tax
    tdc
    sep #$20
    ldy.w #$0000
    -
    lda.b 0, X
    sta.w EnemyType, Y
    phx
    tax
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod0
    sep #$20
    beq +
    tdc
    lda.w EnemyHealthTable, X
    asl
    bra .SetEHealth
    +
    lda.w EnemyHealthTable, X
    .SetEHealth:
    sta.w EnemyHealth, Y
    tdc
    plx
    inx
    iny
    cpy.w #!EnemyStructWr
    bne -
    pla
    ply
    rts

    ;---------------------------;
    ;   Find max row boundaries ;
    ;---------------------------;
    ;   Input:
    ;       N/A
    ;
    ;   Output:
    ;       ZP.R0
    ;       ZP.R1
    ;
    ;   Clobberlist
    ;       ZP.R0
    ;       ZP.R1
    ;       ZP.R2
    ;       ZP.R3
    ;       ZP.R4
    ;       X
    ;       Y
    ;
GameLoop_FindMaxRowBounds:
    pha
    phx
    phy
    php
    tdc
    ldy.w #$0000    ;Column index
    ldx.w #$0000    ;Row index
    lda.b #$0F
    sta.b ZP.R0     ;Min alive enemy
    stz.b ZP.R1     ;Max alive enemy
    lda.b #$00
    sta.b ZP.R2     ;Lowest alive enemy
    stz.b ZP.R3     ;Inc lowest flag
    stz.b ZP.R4     ;Lowest counter
    sep #$30
    .RowLoop:
    ;Min/Max find
    lda.w EnemyType, Y
    beq .SkipBoundary
    lda.b #$01
    sta.b ZP.R3
    cpx.b ZP.R0
    bpl .MinX
    stx.b ZP.R0
    .MinX:
    cpx.b ZP.R1
    bmi .MaxX
    stx.b ZP.R1
    .MaxX:
    .SkipBoundary:
    ;Column counter
    inx
    txa
    and.b #$07
    pha
    bne .SkipInc
    inc.b ZP.R4
    lda.b ZP.R3
    beq .SkipInc
    lda.b ZP.R4
    sta.b ZP.R2
    stz.b ZP.R3
    .SkipInc:
    pla
    tax
    ;Loop Increment and check
    iny
    cpy #!EnemyCols*!EnemyRows
    bne .RowLoop
    ;Set boundaries
    ldy.b ZP.R0
    lda.w EnemyRowPos, Y
    sta.w EnemyMin
    ldy.b ZP.R1
    iny
    lda.w EnemyRowPos, Y
    sta.w EnemyMax
    ldy.b ZP.R2
    iny
    lda.w EnemyRowPos, Y
    clc
    adc.b #!FloorOff        ;Consider floor offset
    sta.w EnemyFloor
    rep #$30
    plp
    ply
    plx
    pla
    rts

GameLoop_SendWave:
    sep #$20
    inc.b ZP.EnemyWaveCount
    tdc
    lda.w BGCount
    inc
    sta.w BGCount
    cmp.w BGChange
    bne +
    stz.w BGCount
    inc.w BGIndex
    lda.w BGIndex
    cmp.b #!MaxBG
    bne ++
    stz.w BGIndex
    ++
    ;Shield health bonus
    sed
    sep #$10
    ldy.b #$03
    -
    ldx.w ShieldHealth, Y
    lda.b ZP.Score
    clc
    adc.w ShieldBonus, X
    bcc ++
    inc.b ZP.Score+1
    ++
    sta.b ZP.Score
    dey
    bpl -
    rep #$10
    cld
    ;Restore shields
    ldy.w #$0003
    lda.b #!ShieldStartHP
    -
    sta.w ShieldHealth, Y
    dey
    bpl -
    lda.b #$01
    sta.w ShowStageTextOut
    jsr GameLoop_LoadBG
    +
    
    ;Skip shield restore if weak shield modifier is off
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!ModA
    sep #$20
    bne .SkipRestore
    tdc
    ;Add shield health after every wave
    ldy.w #$0003
    .ShieldHRestore:
    lda.w ShieldHealth, Y
    clc
    adc.b #$03
    cmp.b #!ShieldStartHP+1
    bmi +
    lda.b #!ShieldStartHP
    +
    sta.w ShieldHealth, Y
    dey
    bpl .ShieldHRestore

    .SkipRestore:
    tdc
    lda.b #!EnemyMoveL
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    sta.b BG1HOffMirror
    stz.b BG1HOffMirror+1
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    sta.b BG1VOffMirror
    stz.b BG1VOffMirror+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    lda.b #!GameState_Play
    sta.w GameState

    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod9
    sep #$20
    beq +
    lda.b ZP.EnemyPlanePosY
    sec
    sbc.b #$20
    sta.b ZP.EnemyPlanePosY
    +
    tdc
    ;Set RNG up for enemy timers
    ldy.w #!EBulLoopCount
    -
    jsr Rand
    xba
    and #$7F
    sta.w EnemyShootTimer, Y
    dey
    bpl -
    
    lda.b #$00
    ldy.w #$0028
    -
    sta.w EnemyHurtTable, Y
    dey
    bpl -
    
    jsr GameLoop_UpdateEnemyArray
    jsr GameLoop_FindMaxRowBounds
    rts

GameLoop_Spawn_Enemy_Bullet:
    pha
    phx
    phy
    php    
    ;Store enemy XY offset in temp memory
    ldy.w #$0000
    sep #$30
    ldy.w EnemyShootIndex       ;Grab current enemy to fire
    lda.w EnemyType, Y
    beq .SkipShoot              ;Skip shooting if enemy is dead
    tax
    lda.w EnemyShootTypes, X
    beq .SkipShoot              ;Skip shooting if enemy cannot shoot
    ;If we CAN shoot
    sta.b ZP.R0
    ;Check for first inactive bullet
    ldx.b #$00
    -
    lda.w EnemyBulletActive, X  ;Don't fire if the current enemy bullet is active
    beq .InactiveBulletFound
    inx
    cpx.b #(!EBulLoopCount)&$FF ;Break if no enemy bullets found to be active
    bne -
    bra .SkipShoot
    .InactiveBulletFound:

    ;Otherwise we do the firing code
    tdc
    lda.w EnemyShootIndex       ;Grab current enemy to fire
    asl
    tay
    ;Set active
    lda.b #$01
    sta.w EnemyBulletActive, X
    lda.b #$00
    sta.w EnemyBulletSine, X
    ;Set position
    lda.w EnemyPixelPos, Y
    sec
    sbc.b ZP.EnemyPlanePosX
    clc
    adc.b #$04
    sta.w EnemyBulletXPos, X
    sta.w EnemyBulletCenter, X
    sta.w EnemyShootDebug
    lda.w EnemyPixelPos+1, Y
    sec
    sbc.b ZP.EnemyPlanePosY
    sta.w EnemyBulletYPos, X
    sta.w EnemyBulletCentY, X
    sta.w EnemyShootDebug+1
    ldy.w EnemyShootIndex       ;Grab current enemy to fire
    lda.w EnemyType, Y
    tay
    lda.w BulletTypesTable, Y
    sta.w EnemyBulletType, X
    .SkipShoot
    plp
    ply
    plx
    pla
    rts

GameLoop_HandleEnemyTimers:
    pha
    phx
    phy
    php    
    ;Handle Enemy shooting timers
    ldy.w #!EBulLoopCount
    .EBTimerLoop:
    lda.w EnemyBulletActive, Y
    bne .SkipETimer
    lda.w EnemyShootTimer, Y
    dec
    sta.w EnemyShootTimer, Y
    bne .SkipETimer
    jsr GameLoop_Spawn_Enemy_Bullet
    jsr Rand
    xba
    and #$7F
    sta.w EnemyShootTimer, Y
    .SkipETimer:
    dey
    bpl .EBTimerLoop
    plp
    ply
    plx
    pla
    rts

GameLoop_EBulletLogic:
    pha
    phx
    phy
    php
    ldy.w #!EBulLoopCount
    .EBLogicLoop:
    rep #$20
    lda.b ZP.Modifiers
    bit.w #!Mod4        ;Homing modifier
    sep #$20
    beq .SkipHoming
    tdc
    lda.w Player.X
    cmp.w EnemyBulletXPos, Y
    bcc ++
    lda.w EnemyBulletCenter, Y
    inc
    bra .SetXPos
    ++
    lda.w EnemyBulletCenter, Y
    dec
    .SetXPos:
    sta.w EnemyBulletCenter, Y
    .SkipHoming:
    lda.w EnemyBulletActive, Y
    beq .InactiveBullet
    lda.w EnemyBulletCenter, Y
    sta.w EnemyBulletXPos, Y

    ;Specific bullet logic code
    lda.w EnemyBulletType, Y
    ldx.w #$0000
    asl
    tax
    jsr (SpecialBulletTable, X)
    .InactiveBullet:
    dey
    bpl .EBLogicLoop
    plp
    ply
    plx
    pla
    rts

SpecialBulletTable:
    dw EBulletT1
    dw EBulletT2
    dw EBulletT3
    dw EBulletT4

EBulletT1:
    lda.w EnemyBulletYPos, Y
    clc
    adc.b #!EnemyBulletSpeed
    sta.w EnemyBulletYPos, Y
    cmp #!BFloor+$0C
    bcc +
    jsr EBulletDeactivate
    +
    rts

EBulletT2:
    lda.w EnemyBulletYPos, Y
    clc
    adc.b #!EnemyBulletSpeed/2
    sta.w EnemyBulletYPos, Y
    cmp #!BFloor+$0C
    bcc +
    jsr EBulletDeactivate
    +
    rts

EBulletT3:
    lda.w EnemyBulletYPos, Y
    clc
    adc.b #!EnemyBulletSpeed/2
    sta.w EnemyBulletYPos, Y
    cmp #!BFloor+$0C
    bcc +
    jsr EBulletDeactivate
    +
    lda.w EnemyBulletSine, Y
    inc
    sta.w EnemyBulletSine, Y
    tax
    lda.w EnemyBulletCenter, Y
    adc.w EnemyBullet3Wave, X
    sta.w EnemyBulletXPos, Y
    rts

EBulletT4:
    sep #$10
    
    lda.w EnemyBulletCentY, Y
    clc
    adc.b #!EnemyBulletSpeed/2
    sta.w EnemyBulletCentY, Y

    lda.w EnemyBulletSine, Y
    inc
    sta.w EnemyBulletSine, Y
    tax
    lda.w EnemyBulletCentY, Y
    adc.w EnemyBullet4Wave, X
    sta.w EnemyBulletYPos, Y
    rep #$10
    
    lda.w EnemyBulletYPos, Y
    cmp #!BFloor+$0C
    bcc +
    jsr EBulletDeactivate
    +

    rts

EBulletDeactivate:
    lda.b #$FF
    sta.w EnemyBulletXPos, Y
    sta.w EnemyBulletCenter, Y
    lda.b #$F0
    sta.w EnemyBulletYPos, Y
    lda.b #$00
    sta.w EnemyBulletActive, Y
    rts

GameLoop_EBulletDraw:
    pha
    phx
    phy
    php
    ldy.w #!EBulLoopCount
    .EBDrawLoop:
    sep #$20
    lda.w EnemyBulletActive, Y
    beq .SkipEBulletDraw
    ;stz.b ZP.R0
    ;lda.w EnemyBulletType, Y
    ;cmp.b #$02
    ;bne +
    ;ldx.w #$0000
    ;lda.w EnemyBulletSine, Y
    ;inc
    ;inc
    ;sta.w EnemyBulletSine, Y
    ;tax
    ;lda.w EnemyBullet3Wave, X
    ;sta.b ZP.R0
    ;+
    lda.w EnemyBulletXPos, Y
    ;clc
    ;adc.b ZP.R0
    sta.b ZP.AddSprX
    lda.w EnemyBulletYPos, Y
    sta.b ZP.AddSprY
    ldx.w #$0000
    lda.w EnemyBulletType, Y
    asl
    asl
    clc
    adc.w EnemyBulletFrame
    tax
    lda.w BulletTypeTiles, X
    sta.b ZP.AddSprTile
    lda.w EnemyBulletType, Y
    bne +
    lda.b #!BulletAttr
    sta.b ZP.AddSprAttr
    bra .SetSprite
    +
    lda.b #!EBull2Attr
    sta.b ZP.AddSprAttr
    .SetSprite:
    jsr AddSprite
    .SkipEBulletDraw:
    dey
    bpl .EBDrawLoop

    plp
    ply
    plx
    pla
    rts

GameLoop_ResetPlayer:
    pha
    phx
    phy
    php
    sep #$20
    tdc
    ;Reset explosion speeds
    ldy.w #!MaxEplW-1
    lda.b #$00
    .WriteExplData:
    ;Fine
    sta.w ExplosionFineXVal, Y
    sta.w ExplosionFineYVal, Y
    ;Coarse
    sta.w ExplosionXVal, Y
    sta.w ExplosionYVal, Y
    dey
    bpl .WriteExplData
    stz.w Player.Dead
    lda.b #$01
    sec
    dec.b ZP.Lives
    bne .SkipGameOver
    ;GAMEOVER code
    lda.b #!GameState_Over
    sta.w GameState
    lda.b #!GameOverWait
    sta.w GameOverTimer
    .SkipGameOver:
    plp
    ply
    plx
    pla
    rts

HandleEBulletCollisions:
    ldy.w #!EBulLoopCount
    .ColLoop:
    ;if enemy bullet is active
    lda.w EnemyBulletActive, Y
    beq .SkipCol
    ;BulletX >= Player.X
    lda.w Player.X
    sec
    sbc.w EnemyBulletXPos, Y
    bcs .SkipCol
    ;BulletX <= Player.X + 16
    lda.w Player.X
    clc
    adc.b #$10
    sec
    sbc.w EnemyBulletXPos, Y
    bcc .SkipCol
    ;BulletY >= Player.Y
    lda.b #!PlayerY
    sec
    sbc.b #$10
    sec
    sbc.w EnemyBulletYPos, Y
    bcs .SkipCol
    ;if GameState != Dead
    lda.w GameState
    cmp.b #!GameState_Dead
    beq .SkipCol
    jsr GameLoop_KillPlayer
    lda.b #$00
    ldy.w #!EBulLoopCount
    -
    sta.w EnemyBulletActive, Y
    dey
    bpl -
    .SkipCol:
    dey
    bpl .ColLoop
    rts

HandleBulletCollisions:
    ldy.w #!EBulLoopCount
    -
    lda.w EnemyBulletActive, Y
    beq .SkipCol
    lda.w Bullet.Y
    sec
    sbc.b #$08
    sec
    sbc.w EnemyBulletYPos, Y
    bcs .SkipCol
    lda.w Bullet.Y
    sec
    sbc.w EnemyBulletYPos, Y
    bcc .SkipCol
    lda.w EnemyBulletXPos, Y
    sec
    sbc.b #$04
    sec
    sbc.w Bullet.X
    bcs .SkipCol
    lda.w EnemyBulletXPos, Y
    clc
    adc.b #$04
    sec
    sbc.w Bullet.X
    bcc .SkipCol
    lda.w EnemyBulletType, Y
    bne +
    lda.b #$00
    sta.w EnemyBulletActive, Y
    +
    stz.w Bullet.Enabled
    lda.b #$F0
    sta.w Bullet.X
    sta.w Bullet.Y
    .SkipCol:
    dey
    bpl -
    rts

HandleStageText:
    pha
    phx
    phy
    php
    sep #$20
    lda.w ShowStageText
    bne +
    jmp .SkipText
    +
    ldx.w #$0038
    stx.b ZP.R0
    ldy.w #$0005
    ldx.w #$000A
    ;Handle movement
    -
    rep #$20
    lda.b ZP.R0
    sta.w StageTextX, X
    clc
    adc.w #$0010
    sta.b ZP.R0
    sep #$20
    lda.b #$58
    sta.w StageTextY, Y
    dex
    dex
    dey
    bpl -
    
    sep #$20
    lda.w ShowStageTextOut
    bne .Out
    lda.w StageTextTransInd
    clc
    adc.b #$02
    cmp.b #$82
    bpl .SkipInd
    bra .SetInd
    .Out:
    lda.w StageTextTransInd
    clc
    adc.b #$02
    bcc +
    stz.w ShowStageText
    +
    .SetInd:
    sta.w StageTextTransInd
    .SkipInd:
    tdc
    lda.w StageTextTransInd
    rep #$20
    asl
    tax
    lda.w StageTextXOff, X
    sta.b ZP.R0
    ldy.w #$0004
    ldx.w #$0008
    ;Draw characters
    -
    ;Top half
    rep #$20
    lda.w StageTextX, X
    clc
    adc.b ZP.R0
    sta.b ZP.AddSprX
    sep #$20
    lda.w StageTextY, Y
    sta.b ZP.AddSprY
    lda.w StageTextChar, X
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.w ZP.AddSprAttr
    sta.w ZP.AddSprBigFlag
    jsr AddSprite

    ;Bottom half
    rep #$20
    lda.w StageTextX, X
    sec
    sbc.b ZP.R0
    sta.b ZP.AddSprX
    sep #$20
    lda.w StageTextY, Y
    clc
    adc.b #$10
    sta.b ZP.AddSprY
    lda.w StageTextChar+1, X
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.w ZP.AddSprAttr
    sta.w ZP.AddSprBigFlag
    jsr AddSprite
    dex
    dex
    dey
    bpl -
    
    ;Top index
    ldx.w #$0000
    ldy.w #$0000
    rep #$20
    lda.w StageTextX, X
    clc
    adc.w #$0018
    clc
    adc.b ZP.R0
    sta.b ZP.AddSprX
    sep #$20
    lda.w StageTextY, Y
    sta.b ZP.AddSprY
    tdc
    lda.w StageTextIndex
    asl
    tax
    lda.w StageTextIndChar, X
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.w ZP.AddSprAttr
    sta.w ZP.AddSprBigFlag
    jsr AddSprite
    ldx.w #$0000
    ldy.w #$0000
    rep #$20
    lda.w StageTextX, X
    clc
    adc.w #$0018
    sec
    sbc.b ZP.R0
    sta.b ZP.AddSprX
    sep #$20
    lda.w StageTextY, Y
    clc
    adc.b #$10
    sta.b ZP.AddSprY
    tdc
    lda.w StageTextIndex
    asl
    tax
    lda.w StageTextIndChar+1, X
    sta.b ZP.AddSprTile
    lda.b #!StageTextAttr
    sta.w ZP.AddSprAttr
    sta.w ZP.AddSprBigFlag
    jsr AddSprite
    ;Index character
    .SkipText:
    plp
    ply
    plx
    pla
    rts
    ;
GameLoop_KillPlayer:
    pha
    phx
    phy    
    php
    sep #$20
    lda.b #!GameState_Dead
    sta.w GameState
    lda.b #$FF
    sta.w PlayerDeathTimer
    sta.w EnemyResetMove
    sta.w Player.Dead
    stz.w EnemyResetFlag
    ldy.w #$0004
    .WriteExplData:
    ;Fine
    lda.w PlayerExplosionSpeedFineX, Y
    sta.w ExplosionFineXVal, Y
    lda.w PlayerExplosionSpeedFineY, Y
    sta.w ExplosionFineYVal, Y
    ;Coarse
    lda.w PlayerExplosionSpeedX, Y
    sta.w ExplosionXVal, Y
    lda.w PlayerExplosionSpeedY, Y
    sta.w ExplosionYVal, Y
    dey
    bpl .WriteExplData

    ;Reset timers to show explosions
    ldy.w #!MaxEplW-1
    -
    lda.b #!ExplosionStart
    sta.w ExplosionTimer, Y
    lda.w Player.X
    sta.w ExplosionX, Y
    lda.b #!PlayerY
    sta.w ExplosionY, Y
    dey
    bpl -
    ;lda.w OAMCopy+512             ;Player X 9th bit
    ;ora.b #%01010101
    ;sta.w OAMCopy+512             ;Player X 9th bit
    lda.b #$01
    sta.w EnemyResetMove
    plp
    ply
    plx
    pla
    rts

OptionsScene:
    sep #$20
    lda.b ZP.ChangeScene
    bne .LoadOptions
    jmp .SkipOptionsLoad
    .LoadOptions:
    
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    lda.b #$09
    sta.w HW_BGMODE
    stz.w HW_HDMAEN

    jsr TransitionIn
    
    sep #$20
    ldy.w #HDMAMirror2-HDMAMirror
    lda.b #$00
    -
    sta.w HDMAMirror, Y
    dey
    bpl -

    ldx.w #$0010
    stx.w HW_VMADDL
    stz.w HW_HDMAEN
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #SPRFont2BPP&$FFFF    ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #SPRFont2BPP>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #SPRFont2BPP_End-SPRFont2BPP
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #(OptionsBG)&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #(OptionsBG>>16)&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #OptionsBG_End-OptionsBG
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    lda.b #$02
    sta.w HW_OBSEL
    stz.w BG2HOffMirror
    stz.w BG2HOffMirror+1
    stz.w BG2VOffMirror
    stz.w BG2VOffMirror+1
    ldx.w #!SprVram+$10
    stx.w HW_VMADDL             ;Set VRAM address to Sprite VRAM
    
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #ArrowSpr&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #ArrowSpr>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #ArrowSpr_End-ArrowSpr
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #(OptionsSpr)&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #(OptionsSpr>>16)&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #OptionsSprEnd-OptionsSpr
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ;Clear tilemap 1
    ldx.w #L1Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr
    
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$0800                ;Set to fill 400 words
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    ;Transfer tilemap data, holds the data for layer 1 and 2 respectively
    ldx.w #L1Ram
    stx.w HW_VMADDL
    tdc
    sep #$20
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #(Options_TM)&$FFFF   ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #(Options_TM>>16)&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Options_TM_End-Options_TM
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #L2Ram
    stx.w HW_VMADDL
    tdc
    sep #$20
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #(Options_TM_End)&$FFFF   ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #(Options_TM_End>>16)&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Options2_TM_End-Options_TM_End
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #OptionsBG_Pal_End-OptionsBG_Pal
    -
    lda.l OptionsBG_Pal, X
    sta.w PalMirror+32, X
    dex
    bpl -

    ldx.w #SPRFont2BPP_Pal_End-SPRFont2BPP_Pal
    -
    lda.l SPRFont2BPP_Pal, X
    sta.w PalMirror, X
    dex
    bpl -

    ldx.w #ArrowSpr_Pal_End-ArrowSpr_Pal
    -
    lda.l ArrowSpr_Pal, X
    sta.w PalMirror+$0100, X
    dex
    bpl -
    
    ldx.w #StarsPalEnd-StarsPal
    -
    lda.l StarsPal, X
    sta.w PalMirror+$0120, X
    
    lda.l SmallUFOPal, X
    sta.w PalMirror+$0140, X

    lda.l OptionPlanetPal, X
    sta.w PalMirror+$0160, X
    dex
    bpl -
    
    ldx.w #StarsPalEnd-StarsPal
    -
    lda.l StarsPal, X
    sta.w PalMirror+$0120, X
    
    lda.l SmallUFOPal, X
    sta.w PalMirror+$0140, X
    
    lda.l OptionPlanetPal, X
    sta.w PalMirror+$0160, X
    dey
    bpl -
    
    ldy.w #(HDMAScrollBuffer2-HDMAScrollBuffer)*2
    ldx.w #(HDMAScrollBuffer)&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH
    -
    stz.w HW_WMDATA
    dey
    bpl -

    sep #$20
    stz.w OptionIndex
    stz.w SubOptionIndex
    stz.w SubOptionIndex2
    stz.w SubOptionIndex3

    ldy.w #$001F
    ldx.w #$003E
    -
    jsr Rand
    and.b #$07
    lsr
    sta.w SParticleState, Y
    
    tya
    asl
    asl
    sta.w SParticleY, Y

    jsr Rand
    rep #$20
    xba
    and.w #$01FF
    sta.w SParticleX, X
    sep #$20
    dex
    dex
    dey
    bpl -

    jsr Rand
    xba
    rep #$20
    and.w #$01FF
    sta.w OBJXPos+2
    jsr Rand
    xba
    rep #$20
    and.w #$01FF
    sta.w OBJXPos+4
    jsr Rand
    xba
    rep #$20
    and.w #$01FF
    sta.w OBJXPos+6

    sep #$20
    lda.b #$14
    sta.w OBJYPos+1
    lda.b #$55
    sta.w OBJYPos+2
    lda.b #$29
    sta.w OBJYPos+3

    jsr OptionsScreen_DrawUI
    lda.b #$0F                  ;Set master brightness to 15 & stop blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipOptionsLoad

    tdc
    sep #$20
    lda.b ZP.ExitScene
    beq .SkipTitleChange
    stz.b ZP.ExitScene
    lda.w ZP.SceneGoto
    sta.w ZP.SceneIndex
    lda.b #$01
    sta.b ZP.ChangeScene
    .SkipTitleChange:
    
    rep #$10
    lda.w OptionIndex
    bne .SkipSelect
    lda.b ZP.InputFlag
    bne .SkipSelect
    lda.b ZP.Controller+1   ;Right
    bit #$01
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w SubOptionIndex
    inc
    and #$0F
    sta.w SubOptionIndex
    +
    lda.b ZP.Controller+1   ;Left
    bit #$02
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w SubOptionIndex
    dec
    and #$0F
    sta.w SubOptionIndex
    +
    
    lda.b ZP.Controller     ;A
    bit #$80
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    ldy.w #$0000
    lda.w SubOptionIndex
    asl
    tay
    rep #$20
    lda.b ZP.Modifiers
    eor.w WBitmask, Y
    sta.b ZP.Modifiers
    sep #$20
    +
    .SkipSelect:
    
    lda.b ZP.Controller+1
    and #$04                    ;Check UP
    beq .SkipUpOpt
    lda.b ZP.InputFlag
    bne .SkipUpOpt
    lda.b #$01
    sta.b ZP.InputFlag
    inc.w OptionIndex
    .SkipUpOpt:
    lda.b ZP.Controller+1
    and #$08                    ;Check DOWN
    beq .SkipDownOpt
    lda.b ZP.InputFlag
    bne .SkipDownOpt
    lda.b #$01
    sta.b ZP.InputFlag
    dec.w OptionIndex
    .SkipDownOpt:

    sep #$20
    lda.w OptionIndex
    cmp #$01
    bne .SkipSfxSelect
    lda.b ZP.InputFlag
    bne .SkipSfxSelect
    lda.b ZP.Controller+1   ;Right
    bit #$01
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w SubOptionIndex2
    inc
    and #$FF
    sta.w SubOptionIndex2
    +
    lda.b ZP.Controller+1   ;Left
    bit #$02
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w SubOptionIndex2
    dec
    and #$FF
    sta.w SubOptionIndex2
    +
    .SkipSfxSelect:

    lda.w OptionIndex
    cmp #$02
    bne .SkipMSXOptions
    lda.b ZP.InputFlag
    bne .SkipMSXOptions
    lda.b ZP.Controller+1   ;Right
    bit #$01
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w MusicSettings
    inc
    and #$03
    sta.w MusicSettings
    +
    lda.b ZP.Controller+1   ;Left
    bit #$02
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.w MusicSettings
    dec
    and #$03
    sta.w MusicSettings
    +
    .SkipMSXOptions:

    lda.b ZP.Controller+1
    and #$10                    ;Check START
    beq .SkipExit
    lda.w OptionIndex
    cmp #$04
    bne .SkipExit
    lda.b #$01
    sta.b ZP.InputFlag
    stz.b ZP.ExitScene
    lda.b #$00
    sta.b ZP.ChangeScene
    stz.b ZP.SceneGoto
    jsr TransitionOut
    .SkipExit:
    
    lda.w OptionIndex
    cmp #$05
    bcc +
    stz.w OptionIndex
    +

    rep #$10
    ldy.w #$0000
    sep #$10
    ldy.w OptionIndex
    lda.b #$1E
    sta.b ZP.AddSprX
    lda.w OptionsArrowPos, Y
    rep #$10
    clc
    adc.b ZP.R2
    sta.b ZP.AddSprY
    lda.b #!ArrowChar2
    sta.b ZP.AddSprTile
    lda.b #!Arrow2Attr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    lda.b #!Cross
    sta.b ZP.R5
    rep #$10
    ldy.w #$0000
    sep #$10
    lda.w SubOptionIndex
    asl
    tay
    rep #$20
    lda.w WBitmask, Y
    sta.b ZP.R3
    lda.b ZP.Modifiers
    bit.b ZP.R3
    beq +
    sep #$20
    lda.b #!Tick
    sta.b ZP.R5
    +

    sep #$20
    inc.w OBJTimers+1
    lda.w OBJTimers+1
    cmp #$50
    bne +
    stz.w OBJTimers+1
    rep #$20
    dec.w OBJXPos+2
    sep #$20
    +
    inc.w OBJTimers+2
    lda.w OBJTimers+2
    cmp #$30
    bne +
    stz.w OBJTimers+2
    rep #$20
    dec.w OBJXPos+4
    sep #$20
    +
    inc.w OBJTimers+3
    lda.w OBJTimers+3
    cmp #$22
    bne +
    stz.w OBJTimers+3
    rep #$20
    dec.w OBJXPos+6
    sep #$20
    +
    sep #$20
    lda.b #$D8
    sta.b ZP.AddSprX
    lda.b #$3E
    sta.b ZP.AddSprY
    lda.b ZP.R5
    sta.b ZP.AddSprTile
    lda.b #!Arrow2Attr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    ;Circle Planet
    rep #$20
    lda.w OBJXPos+2
    sta.b ZP.AddSprX
    sep #$20
    lda.w OBJYPos+1
    sta.b ZP.AddSprY
    lda.b #!Planet0
    sta.b ZP.AddSprTile
    lda.b #!PlanetsAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite

    ;Box Planet
    rep #$20
    lda.w OBJXPos+4
    sta.b ZP.AddSprX
    sep #$20
    lda.w OBJYPos+2
    sta.b ZP.AddSprY
    lda.b #!Planet1
    sta.b ZP.AddSprTile
    lda.b #!PlanetsAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite

    ;Triangle Planet
    rep #$20
    lda.w OBJXPos+6
    sta.b ZP.AddSprX
    sep #$20
    lda.w OBJYPos+3
    sta.b ZP.AddSprY
    lda.b #!Planet2
    sta.b ZP.AddSprTile
    lda.b #!PlanetsHiAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite

    ;UFO
    sep #$20
    inc.w OBJTimers
    lda.w OBJTimers
    bit #$04
    beq +
    lda.w OBJFrame
    eor.b #$01
    sta.w OBJFrame
    stz.w OBJTimers
    +
    tdc
    rep #$20
    lda.w OBJXPos
    inc
    sta.w OBJXPos
    sta.b ZP.AddSprX
    sep #$20
    lda.b #$08
    sta.b ZP.AddSprY
    lda.b #$24
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #$04
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    rep #$10
    ldy.w #$001F
    ldx.w #SParticleX
    stx.b ZP.MemPointer
    sep #$10
    -
    lda.w SParticleState, Y
    tax
    lda.w SParticleVelX, Y
    clc
    adc.w StarParticleSpeed, X
    bcc +
    rep #$20
    lda.b (ZP.MemPointer)
    dec
    sta.b (ZP.MemPointer)
    sep #$20
    lda.b #$00
    sta.w SParticleVelX, Y
    +
    sta.w SParticleVelX, Y
    rep #$20
    lda.b (ZP.MemPointer)
    and.w #$01FF
    sta.b ZP.AddSprX
    sep #$20
    lda.w SParticleY, Y
    sta.b ZP.AddSprY
    lda.w StarParticleSize, X
    sta.b ZP.AddSprTile
    lda.b #$02
    ora.w StarPrio, X
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    rep #$20
    inc.b ZP.MemPointer
    inc.b ZP.MemPointer
    sep #$20
    dey
    bpl -

    rep #$10
    inc.w BGScrollOff+0
    lda.w BGScrollOff+0
    bit #$04
    beq +
    stz.w BGScrollOff+0
    inc.w BGScrollVal+0
    +
    inc.w BGScrollOff+1
    lda.w BGScrollOff+1
    bit #$08
    beq +
    stz.w BGScrollOff+1
    inc.w BGScrollVal+1
    +
    inc.w BGScrollOff+2
    lda.w BGScrollOff+2
    bit #$10
    beq +
    stz.w BGScrollOff+2
    inc.w BGScrollVal+2
    +
    inc.w BGScrollOff+3
    lda.w BGScrollOff+3
    bit #$20
    beq +
    stz.w BGScrollOff+3
    inc.w BGScrollVal+3
    +
    inc.w BGScrollOff+4
    lda.w BGScrollOff+4
    bit #$40
    beq +
    stz.w BGScrollOff+4
    inc.w BGScrollVal+4
    +
    inc.w BGScrollOff+5
    lda.w BGScrollOff+5
    bit #$80
    beq +
    stz.w BGScrollOff+5
    inc.w BGScrollVal+5
    +
    ;Construct HDMA table in WRAM
    ldx.w #(HDMAScrollBuffer)&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH
    lda.b #$48          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    lda.b #$42          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$06          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$0E          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$0D          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$15          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$01          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+0 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    stz.w HW_WMDATA     ;\  End flag
    
    sep #$20
    lda.b #$02
    sta.w HDMAMirror
    lda.b #(HW_BG1HOFS)&$FF
    sta.w HDMAMirror+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror+4

    inc.w BGScrollOff+6
    lda.w BGScrollOff+6
    bit #$08
    beq +
    stz.w BGScrollOff+6
    inc.w BGScrollVal+6
    +

    inc.w BGScrollOff+7
    lda.w BGScrollOff+7
    cmp.b #$8C
    bne +
    stz.w BGScrollOff+7
    inc.w BG2HOffMirror
    +
    ldy.w #$0000
    ldx.w #$0000
    tdc
    sep #$20
    lda.w BGScrollVal+6
    and.b #$0F
    tax
    lda.w OptionGradOff, X
    tax
    rep #$20
    ldy.w #$0036
    -
    lda.w OptionGrad1, X
    sta.w PalMirror, Y
    inx
    inx
    dey
    dey
    cpy.w #$002A
    bne -
    
    jsr OptionsScreen_DrawUI

    rep #$20
    rts

OptionsScreen_DrawUI:
    pha
    phx
    phy
    php
    sep #$20
    ldx.w #TextDispBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(TextDispBuffer>>16)&$FF
    sta.w HW_WMADDH
    ldy.w #$0000
    tdc
    ;Load Modifiers text
    ldx.w #ModText
    stx.b ZP.MemPointer
    ldy.w #ModTextEnd-ModText
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -
    ;Spacing between text
    ldy.w #$0031
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    lda.w SubOptionIndex
    asl
    tay
    rep #$20
    lda.w GameModifiers, Y
    sta.b ZP.MemPointer
    ldx.w #$002C
    sep #$20
    ;Load text for current option
    -
    tdc
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dex
    dex
    bne -
    ;Space between SFX test and mod text
    ldy.w #$0049
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    ;Load SFX test text
    ldx.w #SFXText
    stx.b ZP.MemPointer
    ldy.w #SFXTextEnd-SFXText
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -
    ;Space between text
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    tdc
    lda.w SubOptionIndex2
    and #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    lda.w SubOptionIndex2
    and #$0F
    inc
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA

    ldy.w #$0052
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    ;Load Exit text
    ldx.w #MusicOptionsText
    stx.b ZP.MemPointer
    ldy.w #$0014
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -

    ldy.w #$002C
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bne -

    ;Load Music options text
    ldy.w #$0000
    lda.w MusicSettings
    asl
    tay
    rep #$20
    lda.w MSXMod, Y
    sta.b ZP.MemPointer
    sep #$20
    ldy.w #$0014
    tdc
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -
    
    ldy.w #$004B
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    ;Load Exit text
    ldx.w #StageRandomText
    stx.b ZP.MemPointer
    ldy.w #$0013
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -

    ;Spacing between text
    ldy.w #$004C
    -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    ;Load Exit text
    ldx.w #ExitText
    stx.b ZP.MemPointer
    ldy.w #ExitTextEnd-ExitText
    -
    lda.b (ZP.MemPointer)
    inc
    inc
    sta.w HW_WMDATA
    lda.b #!OptionsTextAttr
    sta.w HW_WMDATA
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    dey
    bne -

    sep #$20
    ldy.w #$0000
    lda.w SinePtr
    clc
    adc.b #$08
    sta.w SinePtr
    tay
    lda.w UnSineTable, Y
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.R2

    sep #$20
    ldy.w #$0000
    lda.b #(TextDispBuffer)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(TextDispBuffer>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(TextDispBuffer>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!OptionsTMapAddr
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #$0410
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc.w #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    plp
    ply
    plx
    pla
    rts

ContinueScene:
    sep #$20
    lda.b ZP.ChangeScene
    bne .LoadTitle
    jmp .SkipContLoad
    .LoadTitle:
    sep #$20
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag

    jsr TransitionIn
    jsl ClearHDMA

    lda.b #$04
    sta.w HW_BGMODE
    lda.b #$FF
    sta.w TMMirror

    stz.w HW_HDMAEN

    ldx.w #$0000
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #(GameOverBG)&$FFFF       ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #(GameOverBG>>16)&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #GameOverBGEnd-GameOverBG
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #L2Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr  
    lda.b #(ZVal>>16)&$FF
	stz.w HW_A1B7
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$0800                ;Set to fill 400 words
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    stz.w BG1HOffMirror
    stz.w BG1HOffMirror+1
    stz.w BG1VOffMirror
    stz.w BG1VOffMirror+1

    stz.w BG2HOffMirror
    stz.w BG2HOffMirror+1
    stz.w BG2VOffMirror
    stz.w BG2VOffMirror+1

    ldx.w #L1Ram
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #GameOverTM&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #(GameOverTM>>16)&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #GameOverTMEnd-GameOverTM
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    ldx.w #!Spr2Vram
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #GameOverSpr&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #GameOverSpr>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #GameOverSprEnd-GameOverSpr
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7



    ldx.w #GameOverPalEnd-GameOverPal
    -
    lda.l GameOverPal, X
    sta.w PalMirror, X
    dex
    bpl -
    
    ldx.w #StageTextPalEnd-StageTextPal
    -
    lda.l StageTextPal, X
    sta.w PalMirror+$1E0, X
    dex
    bpl -

    lda.b #$09
    sta.w ContinueCount

    lda.b #!GameOverTextTime
    sta.w ContinueTimer
    
    lda.b #$C2
    sta.w HW_OBSEL

    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipContLoad:

    sep #$20
    ldy.w #$0000
    ldx.w #$0018
    stx.b ZP.R0
    -
    rep #$20
    lda.b ZP.R0
    adc.w #$0012
    sta.w ZP.R0
    sta.b ZP.AddSprX
    sep #$20
    lda.b #$30
    sta.b ZP.AddSprY
    lda.w GameOverTextChar, Y
    sta.b ZP.AddSprTile
    lda.b #!GameOverTextAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    iny
    cpy.w #$0004
    bne +
    rep #$20
    lda.b ZP.R0
    adc.w #$0012
    sta.w ZP.R0
    sep #$20
    +
    cpy.w #$0008
    bne -

    ;Continue
    sep #$20
    ldy.w #$0000
    ldx.w #$0018
    stx.b ZP.R0
    -
    rep #$20
    lda.b ZP.R0
    adc.w #$0012
    sta.w ZP.R0
    sta.b ZP.AddSprX
    sep #$20    
    lda.b #$60
    sta.b ZP.AddSprY
    lda.w ContinueTextChar, Y
    sta.b ZP.AddSprTile
    lda.b #!GameOverTextAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    iny
    cpy.w #$0009
    bne -

    ldy.w #$0000
    ldy.w ContinueCount
    rep #$20
    lda.w #$0074
    sta.w ZP.AddSprX
    sep #$20
    lda.b #$90
    sta.b ZP.AddSprY
    lda.w ContinueTextInd, Y
    sta.b ZP.AddSprTile
    lda.b #!GameOverTextAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    sep #$20
    dec.w ContinueTimer
    lda.w ContinueTimer
    bne +
    lda.w ContinueCount
    beq +
    dec.w ContinueCount
    lda.b #!GameOverTextTime
    sta.w ContinueTimer
    +

    rep #$20
    rts

IntroScene:
    sep #%00100000              ;Set A to 8 bit mode
    lda.b ZP.ChangeScene
    bne .DoIntroLoad
    jmp .SkipIntroLoad
    .DoIntroLoad:
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    stz.w HW_VMADDL
    stz.w HW_VMADDH
    lda.b #HW_VMDATAL&$FF        ;Grab Video mem data lo addr
    sta.w HW_BBAD0              ;Set bus addr
    stz.w HW_HDMAEN
    stz.w HW_MDMAEN
    lda.b #$04
    sta.w HW_BGMODE
    ;jsr TransitionIn
        
    ldx.w #$0020
    stx.b ZP.PalFadeStart
    ldx.w #$0200
    stx.b ZP.PalFadeEnd

    lda.b #$10
    sta.w CGWSELMirror
    lda.b #$41
    sta.w CGADSUBMirror
    lda.b #$20
    sta.w WOBJSELMirror

    ldx.w #$0455
    stx.w WBGLOGMirror

    lda.b #$02
    sta.w HW_OBSEL

    ldx.w #$0010
    stx.w HW_VMADDL

    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreBG&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #HScoreBG>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreFontEnd-HScoreBG
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7
        
    ;Load BG characters
    ldx.w #!IntroPanelVram
    stx.w HW_VMADDL
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #IntroPanel1&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #IntroPanel1>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #IntroPanel1End-IntroPanel1
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    lda.b #$FF
    sta.w TMMirror
    
    ldx.w #HScoreTextPalEnd-HScoreTextPal
    -
    lda.l HScoreTextPal, X
    sta.w PalMirror, x
    dex
    bpl -

    lda.b #$01
    sta.w HW_INIDISP
    
    lda.b #$00
    sta.w IntroTextInd
    jsr Intro_DrawText
    jsr IntroLoadNewPanel

    rep #$20
    sep #$20
    lda.b #$1F
    sta.b ZP.PalFadeInd

    stz.w IntroStart
    
    lda.b #$01
    sta.w HDMAMirror3
    lda.b #(HW_WH0)&$FF
    sta.w HDMAMirror3+1
    ldx.w #IntroWindow&$FFFF
    stx.w HDMAMirror3+2
    lda.b #(IntroWindow>>16)&$FF
    sta.w HDMAMirror3+4

    lda.b #$30
    sta.w W12SELMirror

    ldx.w #$0000+!IntroBG2Restart
    stx.w BG2VOffMirror

	.SkipIntroLoad:

    rep #$20
    inc.w IntroTimer
    ;Handling initial fade in
    sep #$20
    lda.w IntroStart
    bne .SkipIntroFade
    rep #$20
    inc.w IntroTimer
    lda.w IntroTimer
    bit.w #$0008
    beq ++
    stz.w IntroTimer
    sep #$20
    dec.b ZP.PalFadeInd
    ++
    lda.b ZP.PalFadeInd
    bne +
    inc.w IntroStart
    +
    .SkipIntroFade:

    sep #$20
    lda.b ZP.Controller+1
    and #$10                    ;Check START
    beq .SkipExit
    lda.b ZP.InputFlag
    bne .SkipExit
    tdc
    sep #$20
    lda.w BG2VOffMirror
    bne .SkipExit
    stz.b ZP.SceneGoto
    inc.w BG2VOffMirror
    inc.w BG2VOffMirror
    lda.b #!MaxPanel-1
    sta.w IntroTextInd
    inc.w IntoMoveFlag
    .SkipExit:
    
    lda.b ZP.Controller+1
    and #$40                    ;Check A button
    beq .SkipNewText
    lda.b ZP.InputFlag
    bne .SkipNewText
    lda.w BG2VOffMirror
    bne .SkipNewText
    rep #$20
    lda.w #!TextTime
    sta.w IntroTimer
    sep #$20
    lda.b #$01
    sta.b ZP.InputFlag
    .SkipNewText:

    lda.w BG2VOffMirror
    beq .SKipBG2Move
    clc
    adc.b #$02
    sta.w BG2VOffMirror
    .SKipBG2Move:

    lda.w BG2VOffMirror
    cmp.b #!Intro2MaxY
    bne .SkipBG2Reset
    lda.b #!IntroBG2Restart
    sta.w BG2VOffMirror
    inc.w IntroTextInd
    jsr Intro_DrawText
    
    lda.b ZP.ChangeScene
    bne +
    jsr IntroLoadNewPanel
    +

    stz.w IntoMoveFlag
    .SkipBG2Reset:

    rep #$20
    lda.w IntroTimer
    cmp.w #!TextTime
    bne .SkipChange
    sep #$20
    lda.w IntoMoveFlag
    bne .SkipChange
    lda.b #$01 
    sta.w IntoMoveFlag
    inc.w BG2VOffMirror
    inc.w BG2VOffMirror
    rep #$20
    stz.w IntroTimer
    .SkipChange:

    sep #$20
    lda.w IntoMoveFlag
    beq .SkipFadeOut
    inc.b ZP.PalFadeInd
    bra .ExitFadeHandle
    .SkipFadeOut:
    dec.b ZP.PalFadeInd
    .ExitFadeHandle:


    lda.b ZP.PalFadeInd
    bpl .SkipLoClamp
    stz.b ZP.PalFadeInd
    .SkipLoClamp:

    lda.b ZP.PalFadeInd
    bit.b #$E0
    beq +
    lda.b #$1F
    sta.b ZP.PalFadeInd
    +

    rep #$20
	rts

Intro_DrawText:
    pha
    phx
    phy
    php
    tdc
    sep #$20
    lda.w IntroTextInd
    cmp.b #!MaxPanel
    bne .SkipTitleJump
    lda.b #$00
    sta.b ZP.SceneIndex
    lda.b #$01
    sta.b ZP.ChangeScene
    .SkipTitleJump:
    lda.b #$8F
    sta.w HW_INIDISP
    ldx.w #$0000
    lda.w IntroTextInd
    asl
    tax
    rep #$20
    lda.w IntroText, X
    sta.b ZP.MemPointer
    ldx.w #!IntroL2Start
    stx.w HW_VMADDL
    stx.b ZP.R0
    ldx.w #$0007
    .OuterTextLoop:
    ldy.w #$001B
    .InnerTextLoop:
    sep #$20
    lda.b #$20
    xba
    lda.b (ZP.MemPointer)
    inc
    inc
    rep #$20
    sta.w HW_VMDATAL
    inc.w ZP.MemPointer
    dey
    bpl .InnerTextLoop
    lda.b ZP.R0
    clc
    adc.w #$0020
    sta.b ZP.R0
    sta.w HW_VMADDL
    dex
    bpl .OuterTextLoop
    sep #$20
    lda.b #$0F
    sta.w HW_INIDISP
    plp
    ply
    plx
    pla
    rts

IntroLoadNewPanel:
    ldx.w #!IntroPanelVram
    stx.w HW_VMADDL
    sep #$20
    lda.b #$80
    sta.w HW_INIDISP

    tdc
    ldx.w #$0000
    ldy.w #$0000
    lda.w IntroTextInd
    asl
    tay                     ;Word addressing
    lsr
    sta.w HW_M7A
    stz.w HW_M7A
    lda.b #$03
    sta.w HW_M7B
    lda.w HW_MPYL           ;Long address index
    tax

    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    rep #$20
    lda.w IntroPanelGfx, X
    sta.w HW_A1T7L              ;Shove lo+mid addr byte
    sep #$20
    lda.w IntroPanelGfx+2, X
    sta.w HW_A1B7               ;Store bank
    rep #$20
    lda.w IntroPanelGfxSize, Y
    sta.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    sep #$20
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7
    
    rep #$20
    lda.w #L1Ram
    sta.w HW_VMADDL
    sep #$20
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    rep #$20
    lda.w IntroPanelTM, X
    sta.w HW_A1T7L              ;Shove lo+mid addr byte
    sep #$20
    lda.w IntroPanelTM+2, X
    sta.w HW_A1B7               ;Store bank
    rep #$20
    lda.w IntroPanelTMSize, Y
    sta.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    sep #$20
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    sep #$20
    tdc
    ldx.w #$0000
    ldy.w #$0000
    lda.w IntroTextInd
    asl
    xba
    rep #$20
    clc
    adc.w #$00FF
    tax
    sep #$20
    ldy.w #$00FF
    -
    lda.l IntroPanelPal, X
    sta.w PalMirror, Y
    dex
    dey
    bpl -

    ldx.w #HScoreTextPalEnd-HScoreTextPal
    -
    lda.l HScoreTextPal, X
    sta.w PalMirror, X
    dex
    bpl -

    lda.b #$0F
    sta.w HW_INIDISP
    rts

IntroPanelGfx:
    dl IntroPanel1
    dl IntroPanel2
    dl IntroPanel3
    dl IntroPanel4
    dl IntroPanel5
    dl IntroPanel6
    dl IntroPanel7
    dl IntroPanel8
    dl IntroPanel9
    dl IntroPanel10
    dl IntroPanel11

IntroPanelGfxSize:
    dw IntroPanel1End-IntroPanel1
    dw IntroPanel2End-IntroPanel2
    dw IntroPanel3End-IntroPanel3
    dw IntroPanel4End-IntroPanel4
    dw IntroPanel5End-IntroPanel5
    dw IntroPanel6End-IntroPanel6
    dw IntroPanel7End-IntroPanel7
    dw IntroPanel8End-IntroPanel8
    dw IntroPanel9End-IntroPanel9
    dw IntroPanel10End-IntroPanel10
    dw IntroPanel11End-IntroPanel11

IntroPanelTM:
    dl IntroPanel1TM
    dl IntroPanel2TM
    dl IntroPanel3TM
    dl IntroPanel4TM
    dl IntroPanel5TM
    dl IntroPanel6TM
    dl IntroPanel7TM
    dl IntroPanel8TM
    dl IntroPanel9TM
    dl IntroPanel10TM
    dl IntroPanel11TM
    
IntroPanelTMSize:
    dw IntroPanel1TMEnd-IntroPanel1TM
    dw IntroPanel2TMEnd-IntroPanel2TM
    dw IntroPanel3TMEnd-IntroPanel3TM
    dw IntroPanel4TMEnd-IntroPanel4TM
    dw IntroPanel5TMEnd-IntroPanel5TM
    dw IntroPanel6TMEnd-IntroPanel6TM
    dw IntroPanel7TMEnd-IntroPanel7TM
    dw IntroPanel8TMEnd-IntroPanel8TM
    dw IntroPanel9TMEnd-IntroPanel9TM
    dw IntroPanel10TMEnd-IntroPanel10TM
    dw IntroPanel11TMEnd-IntroPanel11TM

HighscoreScene:
    sep #$20
    lda.b ZP.ChangeScene
    bne .LoadHighscore
    jmp .SkipHighscoreLoad
    .LoadHighscore:
    
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    lda.b #$09
    sta.w HW_BGMODE

    stz.w HW_HDMAEN
    jsr TransitionIn
    
    jsl ClearHDMA

    lda.b #$00
    ldy.w #$000F
    -
    sta.w VrDmaPtr, Y
    dey
    bpl -
    ldx.w #$1440
    stx.w COLDATAMirror
    lda.b #$80
    sta.w WH1Mirror
    lda.b #$10
    sta.w CGWSELMirror
    lda.b #$73
    sta.w CGADSUBMirror
    lda.b #$20
    sta.w WOBJSELMirror
    lda.b #$35
    sta.w WOBJLOGMirror
    ldx.w #$0000
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7

    ldx.w #$0000
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreBG&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #HScoreBG>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreBGEnd-HScoreBG
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7
    
    ldx.w #!SprVram
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreSpr&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #HScoreSpr>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreSprEnd-HScoreSpr
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    ldx.w #L1Ram
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreBG_TM&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #HScoreBG_TM>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreBG_TM_2-HScoreBG_TM
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    ldx.w #L2Ram
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreBG_TM_2&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #(HScoreBG_TM_2>>16)&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreBG_TM_End-HScoreBG_TM_2
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7

    ldx.w #HScoreBGL1_Pal_End-HScoreBGL1_Pal
    -
    lda.l HScoreTextPal, X
    sta.w PalMirror, X
    lda.l HScoreBGL1_Pal, X
    sta.w PalMirror+$20, X
    lda.l HScoreBGL2_Pal, X
    sta.w PalMirror+$40, X
    lda.l HScoreBGL2_Pal, X
    sta.w PalMirror+$00C0, X
    lda.l SpiralBlackHole, X
    sta.w PalMirror+$01E0, X
    lda.l TwinklePal, X
    sta.w PalMirror+$0120, X
    lda.l HScoreSpr_Pal, X
    sta.w PalMirror+$0100, X
    dex
    bpl -

    sep #$20
    ldx.w #L3Ram+$43
    stx.w HW_VMADDL
    ldx.w #$0000
    ldy.w #$0000
    rep #$20
    -
    lda.w #!HText1st
    ora.w HighscoreHeader, Y
    sta.w HW_VMDATAL
    iny
    iny
    cpy.w #HighscoreUnderline-HighscoreHeader
    bne -
	
	stz.w HScorePlace
    stz.w HScoreTextCursor
	
    jsr Highscore_EvaluatePlayerScorePosition
	jsr Highscore_ConstructHighscore

    stz.w BG3VOffMirror
    stz.w BG3VOffMirror+1

    sep #$20
    lda.b #$FF
    sta.w HW_M7SEL
    lda.b #$FF
    sta.w TMMirror
    rep #$20
    
    tdc
    sep #$20
    lda.b #$02
    sta.w HW_OBSEL

    sep #$20
    ldy.w #HDMAMirror2-HDMAMirror
    lda.b #$00
    -
    sta.w HDMAMirror, Y
    dey
    bpl -
    
    ldx.w #$4055
    stx.w WBGLOGMirror

    jsr TransitionIn

    ;Set up sine ptrs
    ldy.w #!SpiralBCount
    lda.b #$00
    -
    sta.w SpiralTimer, Y
    clc
    adc.b #($0100/!SpiralArmCount)+!SpiralArmOffset
    dey
    bpl -

    lda.b #$0F                  ;Set master brightness to 15 & stop blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipHighscoreLoad:
    sep #$20
    ;just pretend @ is theta
    ;A = Cos  @
    ;B = Sin  @
    ;C = -Sin @
    ;D = Cos  @
    ;rep #$20
    ;lda.w Sin16, Y
    ;sta.w M7BMirror
    ;eor.w #$FFFF
    ;sta.w M7CMirror
    ;lda.w Cos16, Y
    ;sta.w M7DMirror
    ;sta.w M7AMirror

	lda.w HScorePlace
	cmp.b #$0A
	beq +
    jsr Highscore_HandleEntryInput
	+

    ;Update sine ptrs
    sep #$20
    tdc
    inc.w BGScrollOff
    lda.w BGScrollOff
    bit.b #$08
    beq +
    ldy.w #$01E2
    tdc
    lda.b #$0A
    sta.b ZP.R4
    jsr PalCycle
    stz.w BGScrollOff
    +

    inc.w BGScrollOff+1
    lda.w BGScrollOff+1
    bit.b #$08
    beq +
    ;Cycle BG
    ldy.w #$0042
    tdc
    lda.b #$0E
    sta.b ZP.R4
    jsr PalCycle
    stz.w BGScrollOff+1
    inc.w BG2HOffMirror
    +
    
    inc.w BGScrollOff+3
    lda.w BGScrollOff+3
    bit.b #$04
    beq +
    ;Cycle Stars
    ldy.w #$0022
    tdc
    lda.b #$0E
    sta.b ZP.R4
    jsr PalCycle
    stz.w BGScrollOff+3
    +

    ;Black hole Animation
    inc.w BHoleTimer
    lda.w BHoleTimer
    cmp.b #$06
    bne +
    lda.w BHoleFrame
    inc
    cmp.b #$20
    bne ++
    lda.b #$00
    ++
    sta.w BHoleFrame
    stz.w BHoleTimer
    inc.w BG1HOffMirror
    inc.w BG1VOffMirror
    +

    inc.w SinePtr
    ldy.w #$0000
    sep #$10
    ldy.b #!SpiralBCount
    -
    lda.w SpiralTimer, Y
    inc
    sta.w SpiralTimer, Y
    dey
    bpl -

    rep #$30
    ldx.w #SpiralTimer+!SpiralBCount
    stx.b ZP.MemPointer
    ldx.w #$0000
    sep #$10
    ldx.b #!SpiralWCount
    rep #$10
    -
    rep #$20
    lda.w GalRingSinePtr, X
    sta.b ZP.MemPointer2
    tdc
    sep #$20
    lda.b (ZP.MemPointer)
    rep #$20
    asl
    tay
    lda.b (ZP.MemPointer2), Y
    ;sta.w HW_M7A
    ;stz.w HW_M7A
    ;tdc
    ;txa
    ;lsr
    ;tay
    ;lda.w SpiralScale, Y
    ;sta.w HW_M7B
    ;rep #$20
    ;lda.w HW_MPYL
    ;lsr
    ;lsr
    ;lsr
    ;lsr
    clc
    adc.w #!CX
    sta.w SpiralGalX, X
    dec.b ZP.MemPointer
    dex
    dex
    bpl -

    rep #$30
    ldx.w #SpiralTimer+!SpiralBCount
    stx.b ZP.MemPointer
    sep #$30
    ldy.b #!SpiralBCount
    rep #$30
    -
    tya
    asl
    tax
    rep #$20
    lda.w GalRingSinePtr, X
    sta.b ZP.MemPointer2
    tdc
    sep #$20
    lda.b (ZP.MemPointer)
    adc.b #$40
    rep #$20
    asl
    phy
    tay
    lda.b (ZP.MemPointer2), Y
    lsr
    and.w #$00FF
    ply
    sep #$20
    ;sta.w HW_M7A
    ;stz.w HW_M7A
    ;lda.w SpiralScale, Y
    ;sta.w HW_M7B
    ;rep #$20
    ;lda.w HW_MPYL
    ;lsr
    ;lsr
    ;lsr
    ;lsr
    ;sep #$20
    clc
    adc.b #!CY
    sta.w SpiralGalY, Y

    rep #$20
    lda.w SpiralTimer, Y
    and.w #$00FF
    tax
    sep #$20
    lda.w Cos8Sign, X
    lsr
    lsr
    and.b #$FE
    sta.w SpiralGalZ, Y
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    dey
    bpl -
    sep #$30

    ldy.b #!SpiralBCount
    ldx.b #!SpiralWCount
    lda.b #!SpiralBCount/2
    sta.w ZP.R0
    rep #$10
    .SpiralLoop:
    sep #$20
    lda.b ZP.R0
    bne .SkipBlackHole
    phy
    ldy.w #$0000
    lda.w BHoleFrame
    tay
    lda.w BHoleXPos, Y
    sta.b ZP.AddSprX
    lda.b #!BHoleY
    sta.b ZP.AddSprY
    lda.w BHoleFrameTable, Y
    sta.b ZP.AddSprTile
    lda.w BHoleFrameAttr, Y
    sta.b ZP.AddSprAttr
    lda.b #$01
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    
    lda.w BHoleXPos2, Y
    sta.b ZP.AddSprX
    lda.b #!BHoleY
    sta.b ZP.AddSprY
    lda.w BHoleFrameTable, Y
    inc
    inc
    sta.b ZP.AddSprTile
    lda.w BHoleFrameAttr, Y
    sta.b ZP.AddSprAttr
    lda.b #$01
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    
    ply
    .SkipBlackHole:
    dec.b ZP.R0
    rep #$20
    lda.w SpiralGalX, X
    sta.b ZP.AddSprX
    sep #$20
    lda.w SpiralGalY, Y
    sta.b ZP.AddSprY
    lda.w SpiralGalZ, Y
    phy
    lsr
    lsr
    tay
    and.b #$FE
    clc
    adc.b #$10
    sta.b ZP.AddSprTile
    lda.b #!SpiralGalAttrP1
    sta.b ZP.AddSprAttr
    lda.b #$01
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    ply
    dex
    dex
    dey
    bpl .SpiralLoop

    rep #$10
    sep #$20
    inc.w BGScrollOff+2
    bit #$08
    beq +
    inc.w BGScrollVal+2
    +
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    stx.w HW_WMADDH

    ldy.w #$0000
    ldx.w #$0000
    sep #$10
    lda.b #$FF
    sta.w HW_WMDATA
    ldx.b #$7F
    ldy.b #$00
    inc.w SinePtr2
    lda.w SinePtr2
    tay
    .SquishLoop:
    lda.w SineTable, Y
    adc.w BGScrollVal+2
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    dex
    bne .SquishLoop

    lda.b #$F0
    sta.w HW_WMDATA
    ldx.b #$70
    .SquishLoop2:
    ;tya
    ;eor.b #$FF
    ;tay
    lda.w SineTable, Y
    adc.w BGScrollVal+2
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    dex
    bne .SquishLoop2

    stz.w HW_WMDATA

    rep #$10
    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG2VOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror2+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror2+4

    lda.b #$01
    sta.w HDMAMirror3
    lda.b #(HW_WH0)&$FF
    sta.w HDMAMirror3+1
    ldx.w #HScoreWindow&$FFFF
    stx.w HDMAMirror3+2
    lda.b #(HScoreWindow>>16)&$FF
    sta.w HDMAMirror3+4

    ldy.w #$0010
    ldx.w #$0020
    .TwinkleLoop:
    sep #$20
    lda.w OBJTimers, Y
    inc
    sta.w OBJTimers, Y
    bit #$40
    beq +
    rep #$20
    jsr Rand
    cmp.w #$01F2
    bmi ++
    sec
    sbc.w #$01F2
    ++
    clc
    adc.w #$0018
    sta.w OBJXPos, Y
    jsr Rand
    and.w #$000F
    sec
    sbc.w #$0008
    +
    dey
    bpl .TwinkleLoop

    sep #$20
    lda.b ZP.InputFlag
    bne +
    lda.b ZP.Controller+1       ;Start
    bit #$10
    beq +
    lda.b #$01
    sta.b ZP.InputFlag
    lda.b #$00
    sta.b ZP.ChangeScene
    stz.b ZP.ExitScene
    stz.b ZP.SceneGoto
    jsr TransitionOut
    +

    sep #$20
    lda.b ZP.ExitScene
    beq +
    stz.b ZP.ExitScene
    lda.w ZP.SceneGoto
    sta.w ZP.SceneIndex
    lda.b #$01
    sta.b ZP.ChangeScene
    +
    rep #$20
    rts

Highscore_HandleEntryInput:
    pha
    phx
    phy
    php
	sep #$20

    lda.b ZP.InputFlag
    beq +
	jmp .SkipSelect
	+ 
	
	lda.b ZP.Controller+1
    and.b #$08                    ;Check Down
	beq .SkipDown
	lda.b #$01
    sta.b ZP.InputFlag
	lda.w HScoreCursorChar
	inc
	sta.w HScoreCursorChar
	cmp.b #!HScoreCursorMax
	bmi +
	lda.b #$00
	+
	sta.w HScoreCursorChar
	.SkipDown:

	lda.b ZP.Controller+1
    and.b #$04                    ;Check UP
	beq .SkipUp
	lda.b #$01
    sta.b ZP.InputFlag
	lda.w HScoreCursorChar
	dec
	bpl +
	lda.b #!HScoreCursorMax-1
	+
	sta.w HScoreCursorChar
	.SkipUp:
	
	lda.b ZP.Controller+1
    and.b #$02                    ;Check LEFT
	beq .SkipL
	lda.b #$01
    sta.b ZP.InputFlag
	lda.w HScoreTextCursor
	dec
    bpl .SkipMinX
    lda.b #!HScoreCursorXMax-1
    .SkipMinX:
	sta.w HScoreTextCursor
	and.b #$0F
	tdc
	ldx.w #$0000
	lda.w HScorePlace
	asl
	asl
	asl
	asl
	clc
	adc.w HScoreTextCursor
	tax
	lda.w HScoreEntries, X
	sta.w HScoreCursorChar
	.SkipL:

	lda.b ZP.Controller+1
    and.b #$01                    ;Check RIGHT
	beq .SkipR
	lda.b #$01
    sta.b ZP.InputFlag
	lda.w HScoreTextCursor
	inc
    cmp.b #!HScoreCursorXMax
    bne .SkipMax
    lda.b #$00
    .SkipMax:
	sta.w HScoreTextCursor
	tdc
	ldx.w #$0000
	lda.w HScorePlace
	asl
	asl
	asl
	asl
	clc
	adc.w HScoreTextCursor
	tax
	lda.w HScoreEntries, X
	sta.w HScoreCursorChar
	.SkipR:

	lda.b ZP.Controller
    and.b #$40                    ;Check A
	beq .SkipSelect
	lda.b #$01
    sta.b ZP.InputFlag
	inc.w HScoreTextCursor
	.SkipSelect:

    lda.b ZP.InputFlag
    beq .SkipTextUpdate
	tdc
	ldx.w #$0000
	lda.w HScorePlace
	asl
	asl
	asl
	asl
	clc
	adc.w HScoreTextCursor
	tax
	lda.w HScoreCursorChar
	sta.w HScoreEntries, X
	jsr Highscore_ConstructHighscore
	.SkipTextUpdate:

	;Cursor sprite
    tdc
	ldx.w #$0000
	ldy.w #$0000
	lda.w HScoreCursorTimer
	inc
	bit.b #$04
	beq +
	lda.w HScoreCursorFrame
	inc
	cmp.b #$07
	bne ++
	lda.b #$00
	++
	sta.w HScoreCursorFrame
	lda.b #$00
	+
	sta.w HScoreCursorTimer
	lda.w HScoreTextCursor
	tax
	lda.w HscoreCursorX, X
	sta.b ZP.AddSprX
	lda.w HScorePlace
	tax
	lda.w HscoreCursorY, X
	sta.b ZP.AddSprY
	lda.b #!HScoreCursorSpr
	clc
	adc.w HScoreCursorFrame
	sta.b ZP.AddSprTile
	lda.b #!HScoreCursorAttr
	sta.b ZP.AddSprAttr
	stz.b ZP.AddSprBigFlag
	jsr AddSprite


    plp
    ply
    plx
    pla
    rts

Highscore_ConstructHighscore:
	pha
	phx
	phy
	php
    sep #$20
    ldx.w #L3Ram+$63
    stx.w HW_VMADDL
    ldx.w #$0000
    ldy.w #$0000
	lda.b #$0C
	sta.b ZP.R1			;Text colour decider
    rep #$20
    -
    lda.w #!HText1st
    ora.w HighscoreUnderline, Y
    sta.w HW_VMDATAL
    iny
    iny
    cpy #HighscoreUnderline-HighscoreHeader
    bne -

    stz.w WH0Mirror
    stz.w WH1Mirror
    sep #$20
    ldx.w #L3Ram+$C3
    stx.w HW_VMADDL
	stx.w HW_WMADDL
    ldx.w #$0000
    ldy.w #$0000
    lda.b #$03
    sta.b ZP.R0			;Trophy index
    .TextEntryLoop:
	;Upper char
	tdc
	sep #$20
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba	
	txa
	clc
	sed
	adc.b #$00
	cld
	and.b #$F0
	lsr
	lsr
	lsr
	lsr
	inc
	rep #$20
	sta.w HW_VMDATAL
	sep #$20
	;Lower char
	tdc
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba	
	txa
	clc
	inc
	inc
	and.b #$0F
	rep #$20
	sta.w HW_VMDATAL
	
	;Colon
	sep #$20
	tdc
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba
	lda.b #$28			; ":"
	rep #$20
	sta.w HW_VMDATAL
	;Space
	stz.w HW_VMDATAL

	;Name
	sep #$20
	lda.b #$0C
	sta.b ZP.R0
	.NameLoop:
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba
	lda.w HScoreEntries, Y
	rep #$20
	sta.w HW_VMDATAL
	sep #$20
	iny
	dec.b ZP.R0
	bpl .NameLoop
	
	;Space
	rep #$20
	stz.w HW_VMDATAL
	
	;Score
	sep #$20
	lda.b #$02
	sta.b ZP.R0
	iny
	iny
	.ScoreLoop:
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba
	lda.w HScoreEntries, Y
	and.b #$F0
	lsr
	lsr
	lsr
	lsr
	inc
	rep #$20
	sta.w HW_VMDATAL
	sep #$20

	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba
	lda.w HScoreEntries, Y
	and.b #$0F
	inc
	rep #$20
	sta.w HW_VMDATAL
	sep #$20
	dey
	dec.b ZP.R0
	bpl .ScoreLoop
	iny
	iny
	iny
	iny

	sep #$20
	lda.b ZP.R1
	beq .SkipTrophy
	tdc
	lda.b ZP.R1
	phx
	lsr
	lsr
	tax
	lda.b #!HTextNormal
	clc
	adc.b ZP.R1
	xba
	lda.w TrophyChar, X
	rep #$20
	sta.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	plx
	bra .CheckLoop
	.SkipTrophy:
	;Spaces
	rep #$20
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	stz.w HW_VMDATAL
	.CheckLoop:
	sep #$20
	lda.b ZP.R1
	sec
	sbc.b #$04
	bmi +
	sta.b ZP.R1
	+
	inx
	cpx.w #$000A
    beq +
	jmp .TextEntryLoop
	+
	plp
	ply
	plx
	pla
	rts

    ;
    ;   Finds position to put player highscore
    ;
    ;
Highscore_EvaluatePlayerScorePosition:
    pha
    phx
    phy
    php
	sep #$20
	stz.w HScorePlace
    sep #$20
	lda.b #$40
	sta.b ZP.Score
	lda.b #$10
	sta.b ZP.Score+1
	lda.b #$04
	sta.b ZP.Score+2
    ldy.w #$000E
	ldx.w #$0009
	.EvalLoop:
	rep #$20
    sed
    lda.w HScoreEntries, Y
	dey
    sec
    sbc.b ZP.Score+1
    bcs .SkipLoCheck
    lda.w HScoreEntries, Y
	dey
    sec
    sbc.b ZP.Score
    bcc .NewHscore      ;Jump out if the hi byte currently checked is higher than the score hi byte
	.SkipLoCheck:
	sep #$20
	cld
	tdc
	tya
	clc
	adc.b #$11
	tay
	inc.w HScorePlace
	dex
	bpl .EvalLoop
	.NewHscore:
	;Shift every score below the found position if one has been found
	cld
	tdc
	sep #$20
    lda.w HScorePlace
	cmp.b #$0A
	beq .SkipShuffle
	lda.w HScorePlace
	asl
	asl
	asl
	asl
	sta.b ZP.R0
	lda.b #$A0
	sec
	sbc.b ZP.R0
	sta.b ZP.R0
	rep #$20
	clc
	lda.w #HScoreEntries+$A0
	tay
	sec
	sbc.w #$0010
	tax
	sep #$20
	tdc
	lda.b ZP.R0
	mvp $00, $00

	;Erase current entry for new highscore
	tdc
	lda.b #$AF
	sec
	sbc.b ZP.R0
	rep #$20
	tax
	sep #$20
	lda.b #$0F
	sta.b ZP.R1
	lda.b #$00
	.EraseCurrent:
	sta.w HScoreEntries, X
	dex
	dec.b ZP.R1
	bpl .EraseCurrent
	txa
	adc.b #$0D
	tax
	lda.b ZP.Score
	sta.w HScoreEntries, X
	inx
	lda.b ZP.Score+1
	sta.w HScoreEntries, X
	inx
	lda.b ZP.Score+2
	sta.w HScoreEntries, X
	inx
	.SkipShuffle:
    plp
    ply
    plx
    pla
    rts

    ;-------------------;
    ;   Palette cycler  ;
    ;-------------------;
    ;
    ;   Usage:
    ;       Takes a given palette address and cycles the first 15 colours of it
    ;   Input:
    ;       Y [Palette index]
    ;       ZP.R4 [Range]
    ;   Output:
    ;       Cycle'd palette by 1 entry
    ;
PalCycle:
    pha
    phy
    rep #$20
    ;First, grab the last palette of the selected zone
    lda.w PalMirror, Y
    sta.b ZP.R0
    stz.b ZP.R2
    ;Next we loop over the palette entries
    -
    rep #$20
    lda.w PalMirror+2, Y
    sta.w PalMirror, Y
    iny
    iny
    inc.b ZP.R2
    sep #$20
    lda.b ZP.R2
    cmp.b ZP.R4
    bne -
    ;Then we apply the last colour back to the start of the palette [past the transparent first colour]
    rep #$20
    lda.b ZP.R0
    sta.w PalMirror-2, Y
    sep #$20
    ply
    pla
    rts

    ;----------------------------;
    ;   Random Number Generator  ;
    ;----------------------------;
    ;
    ;   Usage:
    ;       Executes an RNG routine and returns the value in the A register
    ;       Generation is based off of 16 bit XORShift
    ;   Input:
    ;       N/A 
    ;   Output:
    ;       RNG value in RNGSeed
    ;
    ;   Clobberlist
    ;       ZP.R6
    ;
Rand:
    phy
    phx
    php
    rep #$20    
    lda.w RNGSeed       ;Grab seed value
    ;x ^= x << 7
    asl
    asl
    asl
    asl
    asl
    asl
    asl
    sta.w ZP.R6         ;Store value to be XOR'd
    lda.w RNGSeed       ;Grab seed value
    eor.b ZP.R6
    sta.w RNGSeed
    ;x ^= x >> 9
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.w ZP.R6
    lda.w RNGSeed
    eor.b ZP.R6
    sta.w RNGSeed
    ;x ^= x << 8
    asl
    asl
    asl
    asl
    asl
    asl
    asl
    asl
    sta.w ZP.R6
    lda.w RNGSeed
    eor.b ZP.R6
    sta.w RNGSeed
    plp
    plx
    ply
    rts

    ;-------------------;
    ;   SpawnExplosive  ;
    ;-------------------;
    ;
    ;   Usage:
    ;       Finds the first available empty spot in OAM and creates an explosion sprite in said spot
    ;
    ;   Input:
    ;       ZP.R0   X position
    ;       ZP.R1   Y position
    ;   
    ;   Clobberlist
    ;
SpawnExplosive:
    pha
    phy
    tdc
    sep #$20
    ldy.w #!MaxEplW-1
    -
    lda.w ExplosionTimer, Y
    beq .BreakLoop
    dey
    bpl -
    jmp .ReturnNull
    ;Assuming we've found an empty spot
    .BreakLoop:
    lda.b #!ExplosionStart
    sta.w ExplosionTimer, Y
    lda.b ZP.R0
    sta.w ExplosionX, Y
    lda.b ZP.R1
    sta.w ExplosionY, Y
    ;Assuming we've not found an empty spot
    .ReturnNull:
    ply
    pla
    rts

GameLoop_HandleUFO:
    rep #$20
    lda.w UFOTimer
    dec
    sta.w UFOTimer
    sep #$20
    bne +
    lda.w UFOActive 
    bne .SkipUFOInit
    ;Activate UFO if we've reached the timer and it's not currently active
    rep #$20
    lda.w #!UFOStartX
    sta.w UFOXPos
    sep #$20
    lda.b #$01
    sta.w UFOActive
    stz.w UFODeleteFlag
    .SkipUFOInit:
    +
    lda.w UFOActive
    bne ++
    jmp .SkipUFOCol
    ++
    ;Check UFO bounds
    sep #$20
    lda.w Bullet.Y
    cmp.b #$10          ;BulletY < 16
    bcc +
    jmp .SkipUFOCol
    +
    rep #$20
    lda.w UFOXPos
    sta.b ZP.R0
    bit.w #$0100
    beq .SkipSignExt
    ora.w #$FF00
    sta.b ZP.R0
    .SkipSignExt:
    lda.b ZP.R0
    sec
    sbc.w #$0008        ;Adjust to occasional bullet misses
    cmp.w Bullet.X
    bmi +               ;BulletX > UFOX
    jmp .SkipUFOCol
    +
    lda.b ZP.R0
    adc.w #$001F
    cmp.w Bullet.X      ;&& BulletX <= UFOX+31
    bpl +
    jmp .SkipUFOCol
    +
    
    rep #$20
    lda.b ZP.Score
    sed
    clc
    adc.w #!UFOScore
    bcc ++
    pha
    sep #$20
    clc
    lda.b ZP.Score+1
    clc
    adc.b #$01
    sta.b ZP.Score+1
        bcc +++
        clc
        lda.b ZP.Score+2
        clc
        adc.b #$01
        sta.b ZP.Score+2
        +++
    rep #$20
    pla
    ++
    sta.b ZP.Score
    cld
    ;Top
    ldy.w #$0006
    ldx.w #$0003
    rep #$20
    lda.w UFOXPos
    -
    pha
    sep #$20
    lda.b #!UFOYPos
    sta.w UFOPartY, X
    lda.b #$01
    sta.w UFOPartEnabled, X
    rep #$20
    lda.w #$0000
    sta.w UFOPartYVel, Y
    pla
    sta.w UFOPartX, Y
    clc
    adc.w #$0008
    dex
    dey
    dey
    bpl -

    ;Bottom
    ldy.w #$0006
    ldx.w #$0003
    rep #$20
    lda.w UFOXPos
    -
    pha
    sep #$20
    lda.b #!UFOYPosB
    sta.w UFOPartY+4, X
    lda.b #$01
    sta.w UFOPartEnabled+4, X
    rep #$20
    lda.w #$0000
    sta.w UFOPartYVel+8, Y
    pla
    sta.w UFOPartX+8, Y
    clc
    adc.w #$0008
    dex
    dey
    dey
    bpl -

    sep #$20
    lda.b #$FF
    sta.w UFOPartFlip
    rep #$20
    lda.w #!UFOResetTime
    sta.w UFOTimer
    sep #$20
    stz.w UFOActive
    stz.w Bullet.Enabled
    lda.b #$FF
    sta.w Bullet.X
    sta.w Bullet.Y
    lda.w UFOXPos
    sta.b ZP.R0
    stz.b ZP.R1
    jsr SpawnExplosive
    lda.w UFOXPos
    clc
    adc.b #$10
    sta.b ZP.R0
    stz.b ZP.R1
    jsr SpawnExplosive
    rep #$20
    lda.w #$01FF
    sta.w UFOXPos
    sep #$20
    .SkipUFOCol:
    
    sep #$20
    ;Update if UFO active
    lda.w UFOActive
    beq .InactiveUFO
    rep #$20
    
    lda.w UFOXPos
    sec
    sbc.w #!UFOSpeed
    sta.w UFOXPos
    bcs +
    sep #$20
    lda.b #$01
    sta.w UFODeleteFlag
    rep #$20
    lda.w UFOXPos
    and.w #$01FF
    sta.w UFOXPos
    +
    lda.w UFOXPos
    ;make UFO inactive if we've went too far over
    cmp.w #$1D0
    bne +
    lda.w UFODeleteFlag
    beq +
    rep #$20
    lda.w #!UFOResetTime
    sta.w UFOTimer
    sep #$20
    stz.w UFOActive
    +
    jsr GameLoop_DrawUFO
    .InactiveUFO:

    ;Handle UFO animations
    lda.w UFOFrameTimer
    inc
    sta.w UFOFrameTimer
    bit #$04
    beq +
    lda.w UFOFrame
    eor #$04
    sta.w UFOFrame
    stz.w UFOFrameTimer
    +
    rts

GameLoop_DrawUFO:
    ;Left
    sep #$20
    ldx.w #$0000
    ldx.w UFOXPos
    stx.b ZP.AddSprX
    lda.b #!UFOYPos
    sta.b ZP.AddSprY
    lda.b #!UFOTile0
    clc
    adc.w UFOFrame
    sta.b ZP.AddSprTile
    lda.b #!UFOAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    
    ;Top mid
    tdc
    rep #$20
    lda.w UFOXPos
    adc.w #$0010
    sta.b ZP.AddSprX
    sep #$20
    lda.b #!UFOYPos
    sta.b ZP.AddSprY
    lda.b #!UFOTile1
    clc
    adc.w UFOFrame
    sta.b ZP.AddSprTile
    lda.b #!UFOAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    rts

UpdateExplosives:
    ;Update Timers
    ldy.w #$0000
    ldy.w #!MaxEplW-1
    tdc
    sep #$20
    -
    ;Write explosion entry into OAM
    stz.b ZP.R2

    lda.w ExplosionTimer, Y
    beq .SkipExplo
    lda.w ExplosionX, Y
    sta.b ZP.AddSprX
    lda.w ExplosionY, Y
    sta.b ZP.AddSprY
    ;(Timer/Frames)
    lda.w ExplosionTimer, Y
    lsr
    lsr
    asl
    sta.b ZP.R0
    lda.b #!ExplosionTile+$10
    sec
    sbc.b ZP.R0
    cmp.b #!ExplosionTile+$10
    bne +
    lda.b #!ExplosionTile+$0E
    +
    sta.b ZP.AddSprTile
    lda.b #!ExplosionAttr
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    .SkipExplo:

    ;Make sure explosions don't die when player is dead
    lda.w GameState
    cmp.b #!GameState_Dead
    bne +
    lda.w ExplosionTimer, Y
    dec
    sta.w ExplosionTimer, Y
    bne .SkipExploDisable
    lda.b #!ExplosionStart   ;Grab the max timer since we want to _increment_ through the frame list
    sta.w ExplosionTimer, Y
    +    
    lda.w ExplosionTimer, Y
    beq .SkipExploDisable
    dec
    sta.w ExplosionTimer, Y
    bne .SkipExploDisable
    .SkipTimerDec:
    tdc
    lda.b #$F0
    sta.w ExplosionX, Y
    sta.w ExplosionY, Y
    .SkipExploDisable:
    dey
    bpl -
    rts


    ;Loads background tilemap data to layer 2 and 3 via DMA 0
GameLoop_LoadBG:
    php
    pha
    phx
    phy
    sep #$20
    stz.w HW_HDMAEN
    ldy.w #$0020
    lda.b #$00
    -
    sta.w BGScrollVal, Y
    dey
    bpl -
    jsl ClearHDMAGameScene
    ldx.w #$0000
    tdc
    lda.w BGIndex
    asl
    tax
    jsr (BGLoad, X)
    ply
    plx
    pla
    plp
    rts

BGLoad:
    dw BG_City          ;BG-1
    dw BG_Mountains     ;BG-2
    dw BG_Computer      ;BG-3
    dw BG_Surfboard     ;BG-4
    dw BG_Desert        ;BG-5
    dw BG_Wetlands      ;BG-6
    dw BG_Tundra      	;BG-7
    dw BG_Cliff      	;BG-8
    dw BG_Alien      	;BG-9

BG_City:
    ;Setup video display
    stz.w HDMAMirror2
    stz.w HDMAMirror2+1
    stz.w HDMAMirror2+2
    stz.w HDMAMirror2+3
    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror

    stz.w BG2HOffMirror
    stz.w BG2HOffMirror+1
    stz.w BG2VOffMirror
    stz.w BG2VOffMirror+1

    stz.w HW_BG12NBA
    stz.w HW_BG34NBA
	stz.w BG3VOffMirror
	stz.w BG3VOffMirror+1
    ;Load Graphics
    ldy.w #$0000
    lda.b #(BG1_L2)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L2>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L2>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!BGTileDest
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG1_L3_End-BG1_L2
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    ;Load Tilemaps
    ldy.w #$0000
    lda.b #(BG1_L2_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L2_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L2_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L2Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG1_L2_TM_End-BG1_L2_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    
    ;Layer 3
    ldy.w #$0000
    lda.b #(BG1_L3_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L3_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG1_L3_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L3Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG1_L3_TM_End-BG1_L3_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    ;Transfer palette data
    ldx.w #BG1_L2_Pal_End-BG1_L2_Pal
    -
    lda.l BG1_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    ldx.w #BG1_L3_Pal_End-BG1_L3_Pal
    -
    lda.l BG1_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    
    sep #$20
    ldx.w #((BG1Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG1Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG1ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable
    rts

BG_Mountains:
    ;Setup Video info
    tdc
    lda.b #$09
    sta.w HW_BGMODE
    lda.b #$FB
    sta.w TMMirror
    lda.b #$04
    sta.w TSMirror
    lda.b #$AA
    sta.w CGWSELMirror
    lda.b #$7F
    sta.w CGADSUBMirror
    lda.b #$E0
    sta.w COLDATAMirror
    sta.w COLDATAMirror+1
    lda.b #$40
    sta.w WH0Mirror
    lda.b #$FF
    sta.w WH1Mirror

    lda.b #$00
    sta.w WH2Mirror
    lda.b #$FF
    sta.w WH3Mirror

    lda.b #$1F
    sta.w TMWMirror
    lda.b #$04
    sta.w TSWMirror

    stz.w HW_BG12NBA
    lda.b #$01
    sta.w HW_BG34NBA

    ;Load Graphics
    ldy.w #$0000
    lda.b #(BG2_L2)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L2>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L2>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!BGTileDest
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG2_L3_End-BG2_L2
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    ;Load Tilemaps
    ldy.w #$0000
    lda.b #(BG2_L2_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L2_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L2_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L2Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG2_L2_TM_End-BG2_L2_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    
    ;Layer 3
    ldy.w #$0000
    lda.b #(BG2_L3_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L3_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG2_L3_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L3Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG2_L3_TM_End-BG2_L3_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    ;Transfer palette data
    ldx.w #BG2_L2_Pal_End-BG2_L2_Pal
    -
    lda.l BG2_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    
    ldx.w #BG2_L3_Pal_End-BG2_L3_Pal
    -
    lda.l BG2_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -    
    stz.w BG3VOffMirror
    stz.w BG3VOffMirror+1

    ldx.w #((BG2Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG2Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG2ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable

    rts
BG_Computer:
    stz.w HDMAMirror2
    stz.w HDMAMirror2+1
    stz.w HDMAMirror2+2
    stz.w HDMAMirror2+3
    ;Setup video display
    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror
    ;Load Graphics
    ldy.w #$0000
    lda.b #(BG3_L2)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L2>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L2>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!BGTileDest
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG3_L3_End-BG3_L2
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    stz.w HW_BG12NBA
    stz.w HW_BG34NBA

    ;Load Tilemaps
    ldy.w #$0000
    lda.b #(BG3_L2_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L2_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L2_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L2Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG3_L2_TM_End-BG3_L2_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    
    ;Layer 3
    ldy.w #$0000
    lda.b #(BG3_L3_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L3_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_L3_TM>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L3Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG3_L3_TM_End-BG3_L3_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y


    ldy.w #$0000
    lda.b #(BG3_OBJ)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_OBJ>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG3_OBJ>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!SprVram+$C00
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #BG3_OBJ_End-BG3_OBJ
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    stz.w BG3VOffMirror
    stz.w BG3VOffMirror+1

    tdc
    sep #$20
    lda.b #$08
    ldy.w #$000F
    ldx.w #$001E
    -
    lda.w BG3StartY, Y
    sta.w OBJYPos, Y
    rep #$20
    lda.w BG3StartX, X
    sta.w OBJXPos, X
    sep #$20
    dex
    dex
    dey
    bpl -

    ;Transfer palette data
    ldx.w #BG3_L2_Pal_End-BG3_L2_Pal
    -
    lda.l BG3_L2_Pal, X
    sta.w PalMirror+$20, X
    dex
    bne -
    ldx.w #BG3_L3_Pal_End-BG3_L3_Pal
    -
    lda.l BG3_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    
    ldx.w #BG3_OBJ_Pal_End-BG3_OBJ_Pal
    -
    lda.l BG3_OBJ_Pal, X
    sta.w PalMirror+$0100, X
    dex
    bne -
    
    
    ldx.w #((BG3Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG3Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG3ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable
    rts

BG_Surfboard:
    stz.w HDMAMirror2
    stz.w HDMAMirror2+1
    stz.w HDMAMirror2+2
    stz.w HDMAMirror2+3
    ;Setup video display
    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror
    
    stz.w HW_BG12NBA
    stz.w HW_BG34NBA

    ;Load Graphics
    
    ldy.w #$0000
    rep #$20
    lda.w #(BG4_L2)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG4_L2>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BGTileDest
    sta.b ZP.DMAQDest
    lda.w #BG4_L3_End-BG4_L2
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    ;Load Tilemaps
    lda.w #(BG4_L2_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG4_L2_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L2Ram
    sta.b ZP.DMAQDest
    lda.w #BG4_L2_TM_End-BG4_L2_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    lda.w #(BG4_L3_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG4_L3_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L3Ram
    sta.b ZP.DMAQDest
    lda.w #BG4_L3_TM_End-BG4_L3_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA

    ;Load Objects    
    lda.w #(BG4_OBJ)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG4_OBJ>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!SprVram+$C00
    sta.b ZP.DMAQDest
    lda.w #BG4_OBJ_End-BG4_OBJ
    sta.b ZP.DMAQLength
    jsl QueueDMA

    sep #$20
    stz.w BG3VOffMirror
    stz.w BG3VOffMirror+1
    ;Transfer palette data
    ldx.w #BG4_L2_Pal_End-BG4_L2_Pal
    -
    lda.l BG4_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    ldx.w #BG4_L3_Pal_End-BG4_L3_Pal
    -
    lda.l BG4_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    ldx.w #Surfboard_Pal_End-Surfboard_Pal
    -
    lda.l Surfboard_Pal, X
    sta.w PalMirror+(144*2), X
    dex
    bne -
    
    ldx.w #((BG4Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG4Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG4ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable
    rts

BG_Desert:
    php
    stz.w HDMAMirror2
    stz.w HDMAMirror2+1
    stz.w HDMAMirror2+2
    stz.w HDMAMirror2+3
    ;Setup video display
    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror
    
    stz.w HW_BG12NBA
    stz.w HW_BG34NBA

    ;Load Graphics    
    ldy.w #$0000
    rep #$20
    lda.w #(BG5Gfx)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG5Gfx>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BGTileDest
    sta.b ZP.DMAQDest
    lda.w #BG5GfxEnd-BG5Gfx
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    ;Load Tilemaps
    lda.w #(BG5_L2_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG5_L2_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L2Ram
    sta.b ZP.DMAQDest
    lda.w #BG5_L2_TM_End-BG5_L2_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    lda.w #(BG5_L3_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG5_L3_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L3Ram
    sta.b ZP.DMAQDest
    lda.w #BG5_L3_TM_End-BG5_L3_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    lda.w #(CloudGfx)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(CloudGfx>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!SprVram+$C00
    sta.b ZP.DMAQDest
    lda.w #CloudGfxEnd-CloudGfx
    sta.b ZP.DMAQLength
    jsl QueueDMA

    
    sep #$20
    ;Transfer palette data
    ldx.w #BG5_L2_Pal_End-BG5_L2_Pal
    -
    lda.l BG5_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    ldx.w #BG5_L3_Pal_End-BG5_L3_Pal
    -
    lda.l BG5_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    ldx.w #CloudsPalEnd-CloudsPal
    -
    lda.l CloudsPal, X
    sta.w PalMirror+$0100, X
    dex
    bne -

    ldx.w #((BG5Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG5Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG5ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable

    
    ldx.w #!MaxClouds*2
    rep #$20
    .CloudInit:
    txa
    asl
    asl
    asl
    sta.b ZP.R0
    asl
    asl
    clc
    adc.b ZP.R0
    and.w #$00FF
    sta.w SParticleX, X
    dex
    dex
    bpl .CloudInit

    plp
    rts

BG_Wetlands:
    ;Setup video display
    stz.w HDMAMirror2
    stz.w HDMAMirror2+1
    stz.w HDMAMirror2+2
    stz.w HDMAMirror2+3
    lda.b #$01
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror

    stz.w HW_BG12NBA
    lda.b #$02
    sta.w HW_BG34NBA

    ;Load Graphics
    ldy.w #$0000
    rep #$20
    lda.w #(BG6Gfx)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG6Gfx>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BGTileDest
    sta.b ZP.DMAQDest
    lda.w #BG6GfxL1End-BG6Gfx
    sta.b ZP.DMAQLength
    jsl QueueDMA

    lda.w #(BG6GfxL1End)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG6GfxL1End>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BG3TileDest
    sta.b ZP.DMAQDest
    lda.w #BG6GfxEnd-BG6GfxL1End
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    lda.w #(BG6_OBJ)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG6_OBJ>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!SprVram+$C00
    sta.b ZP.DMAQDest
    lda.w #BG6_OBJ_End-BG6_OBJ
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    ;Load Tilemaps
    lda.w #(BG6_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG6_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L2Ram
    sta.b ZP.DMAQDest
    lda.w #BG6_TM_End-BG6_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    sep #$20

    ;Transfer palette data
    ldx.w #BG6_L2_Pal_End-BG6_L2_Pal
    -
    lda.l BG6_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    ldx.w #BG6_L3_Pal_End-BG6_L3_Pal
    -
    lda.l BG6_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    ldx.w #BG6RainPalEnd-BG6RainPal
    -
    lda.l BG6RainPal, X
    sta.w PalMirror+$0100, X
    dex
    bne -
    ldx.w #BG6BoatPalEnd-BG6BoatPal
    -
    lda.l BG6BoatPal, X
    sta.w PalMirror+$0120, X
    dex
    bne -
    
    
    ldy.w #!RainCount
    ldx.w #!RainCount*2
    .RainInit:
    sep #$20
    jsr Rand
    xba
    sta.w SParticleY, Y
    tya
    and.b #$03
    sta.w SParticleState, Y

    jsr Rand
    rep #$20
    xba
    and.w #$01FF
    sta.w SParticleX, X
    dex
    dex
    dey
    bpl .RainInit

    sep #$20
    ldx.w #((BG6Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG6Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG6ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable

    rts

BG_Tundra:
    ;Setup Video info
	sep #$20
    tdc
    lda.b #$09
    sta.w HW_BGMODE
    lda.b #$FB
    sta.w TMMirror
    lda.b #$04
    sta.w TSMirror
    lda.b #$AA
    sta.w CGWSELMirror
    lda.b #$7F
    sta.w CGADSUBMirror
    lda.b #$E0
    sta.w COLDATAMirror
    sta.w COLDATAMirror+1
    lda.b #$40
    sta.w WH0Mirror
    lda.b #$FF
    sta.w WH1Mirror

    lda.b #$00
    sta.w WH2Mirror
    lda.b #$FF
    sta.w WH3Mirror

    lda.b #$1F
    sta.w TMWMirror
    lda.b #$04
    sta.w TSWMirror

    stz.w HW_BG12NBA
    lda.b #$02
    sta.w HW_BG34NBA

	sep #$20
	tdc
	ldx.w #$0009
	.ScrollClear:
	stz.w BGScrollOff, X
	stz.w BGScrollVal, X
	dex
	bpl .ScrollClear
    ;Load Graphics
    ldy.w #$0000
    rep #$20
    lda.w #(BG7Gfx)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG7Gfx>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BGTileDest
    sta.b ZP.DMAQDest
    lda.w #BG7GfxEnd-BG7Gfx
    sta.b ZP.DMAQLength
    jsl QueueDMA

    lda.w #(BG7Gfx_L3)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG7Gfx_L3>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BG3TileDest
    sta.b ZP.DMAQDest
    lda.w #BG7Gfx_L3End-BG7Gfx_L3
    sta.b ZP.DMAQLength
    jsl QueueDMA

    ;Load Tilemaps
    lda.w #(BG7_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG7_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L2Ram
    sta.b ZP.DMAQDest
    lda.w #BG7_TM_End-BG7_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    sep #$20

    ;Transfer palette data
    ldx.w #BG7_L2_Pal_End-BG7_L2_Pal
    -
    lda.l BG7_L2_Pal, X
    sta.w PalMirror+32, X
    dex
    bne -
    ldx.w #BG7_L3_Pal_End-BG7_L3_Pal
    -
    lda.l BG7_L3_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    
    sep #$20
    ldx.w #((BG7Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG7Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG7ColTable
    stx.w ZP.MemPointer2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable
	rts

BG_Cliff:
    ;Setup video display
    sep #$20
    lda.b #$02
    sta.w HW_BGMODE
    lda.b #$1F
    sta.w TMMirror
    sta.w TSMirror
    sta.w TMWMirror
    sta.w TSWMirror
    lda.b #$A8
    sta.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror    

    stz.w HW_BG12NBA
    ;lda.b #$02
    stz.w HW_BG34NBA

    rep #$20
    stz.w BG1VOffMirror
    stz.w BG1VOffMirror
    stz.w BG1HOffMirror
    stz.w BG1HOffMirror
    stz.w BG2VOffMirror
    stz.w BG2VOffMirror
    stz.w BG2HOffMirror
    stz.w BG2HOffMirror
    stz.w BG3VOffMirror
    stz.w BG3VOffMirror
    stz.w BG3HOffMirror
    stz.w BG3HOffMirror

    ;Load Graphics
    ldy.w #$0000
    rep #$20
    lda.w #(BG8Gfx)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG8Gfx>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!BGTileDest
    sta.b ZP.DMAQDest
    lda.w #BG8GfxEnd-BG8Gfx
    sta.b ZP.DMAQLength
    jsl QueueDMA

    lda.w #(BG8Spr)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG8Spr>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!SprVram+$C40
    sta.b ZP.DMAQDest
    lda.w #BG8SprEnd-BG8Spr
    sta.b ZP.DMAQLength
    jsl QueueDMA

    ;Load Tilemaps
    lda.w #(BG8_TM)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG8_TM>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L2Ram
    sta.b ZP.DMAQDest
    lda.w #BG8_TM_End-BG8_TM
    sta.b ZP.DMAQLength
    jsl QueueDMA
    
    ;Load Objects    
    lda.w #(BG4_OBJ)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(BG4_OBJ>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!SprVram+(GameSprEnd-GameSpr)
    sta.b ZP.DMAQDest
    lda.w #BG4_OBJ_End-BG4_OBJ
    sta.b ZP.DMAQLength
    jsl QueueDMA

    sep #$20
    ;Transfer palette data
    ldx.w #BG8_L2_Pal_End-BG8_L2_Pal
    -
    lda.l BG8_L2_Pal, X
    sta.w PalMirror, X
    dex
    bne -
    ldx.w #BG8SprPalEnd-BG8SprPal
    -
    lda.l BG8SprPal, X
    sta.w PalMirror+$0100, X
    dex
    bne -
    
    ldx.w #Surfboard_Pal_End-Surfboard_Pal
    -
    lda.l Surfboard_Pal, X
    sta.w PalMirror+$0120, X
    dex
    bne -
    
    sep #$20
    ldx.w #((BG8Grad)&$FFFF)+$02
    stx.b ZP.MemPointer
    lda.b #(BG8Grad>>16)&$FF
    sta.b ZP.MemPointer+2
    ldx.w #BG8ColTable
    stx.w ZP.MemPointer2
    stz.w ZP.MemPointer2+2
    lda.b #52*2
    sta.b ZP.R0
    stz.b ZP.R1
    jsl ConstructGradientTable
    lda.b #$01
    ldx.w #!CliffRockCountW
    ldy.w #!CliffRockCountW*2
    -
    sep #$20
    lda.b #$01
    sta.w OBJActive, X
    jsr Rand
    xba
    sta.w OBJXPos, X
    rep #$20
    jsr Rand
    sta.w OBJYVel, X
    dex
    bpl -
    jsr ClearL3Vram
    sep #$20
    rts

BG_Alien:
    rts

GameLoop_UpdateBG:
    php
    pha
    phx
    phy
    lda.w GameState
    cmp.b #!GameState_Stop
    bne .SkipFade
    lda.w BGCount
    inc
    cmp.w BGChange
    bne .SkipFade
    lda.b ZP.PalFadeInd
    cmp #$1F
    beq .SkipFade
    lda.b #$01
    sta.w ShowStageText
    lda.w BGIndex
    inc
    sta.w StageTextIndex
    rep #$20
    stz.b ZP.PalFadeStart
    lda.w #$0060
    sta.b ZP.PalFadeEnd
    sep #$20
    inc.b ZP.PalFadeInd
    bra .GotoBGUpdate
    .SkipFade:
    lda.w BGCount
    bne .GotoBGUpdate
    lda.b ZP.PalFadeInd
    beq .GotoBGUpdate
    dec.b ZP.PalFadeInd
    beq +
    bra .GotoBGUpdate
    +
    rep #$20
    stz.b ZP.PalFadeStart
    stz.b ZP.PalFadeEnd 
    sep #$20

    .GotoBGUpdate:
    ldx.w #$0000
    tdc
    lda.w BGIndex
    asl
    tax
    jsr (BGList, X)
    ply
    plx
    pla
    plp
    rts

BGList:
    dw UPD_BG_City
    dw UPD_BG_Mountains
    dw UPD_BG_Computer
    dw UPD_BG_Surfboard
    dw UPD_BG_Desert
    dw UPD_BG_Wetlands
    dw UPD_BG_Tundra
    dw UPD_BG_Cliff
    dw UPD_BG_Alien

UPD_BG_City:
    tdc
    sep #$20

    ;Main city view
    lda.w BGScrollOff
    inc
    sta.w BGScrollOff
    bit #$08
    beq +
    stz.w BGScrollOff
    inc.w BGScrollVal
    +
    ;Main Road
    lda.w BGScrollVal+1
    clc
    adc.b #$05
    and.b #$FF
    sta.w BGScrollVal+1


    ;Stars
    lda.w BGScrollOff+8
    inc
    sta.w BGScrollOff+8
    bit #$40
    beq +
    stz.w BGScrollOff+8
    inc.w BGScrollVal+2
    +
    ;Cloud 1
    lda.w BGScrollOff+9
    inc
    sta.w BGScrollOff+9
    bit #$20
    beq +
    stz.w BGScrollOff+9
    inc.w BGScrollVal+3
    +
    ;Cloud 2
    lda.w BGScrollOff+10
    inc
    sta.w BGScrollOff+10
    bit #$10
    beq +
    stz.w BGScrollOff+10
    inc.w BGScrollVal+4
    +
    ;Upper stars
    lda.w BGScrollOff+11
    inc
    sta.w BGScrollOff+11
    bit #$80
    beq +
    stz.w BGScrollOff+11
    inc.w BGScrollVal+5
    +

    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH
    ;Construct HDMA table in WRAM
    ;Buildings
    lda.b #$7F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal   ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    lda.b #$41          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal   ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    ;Road
    lda.b #$16          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    ;BG3 scroll
    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HW_WMADDH

    ;Construct HDMA table in WRAM
    ;Buildings
    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$28          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$23          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$04          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    stz.w HW_WMDATA     ;End flag

    sep #$20
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror1+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror1+4
    
    tdc
    sep #$20
    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HDMAMirror2+2
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HDMAMirror2+4
    
    rts

UPD_BG_Mountains:
    ;Clouds 1
    inc.w BGScrollVal
    ;Cloud 2
    lda.w BGScrollOff+1
    inc
    sta.w BGScrollOff+1
    bit #$04
    beq +
    stz.w BGScrollOff+1
    inc.w BGScrollVal+1
    +
    ;Cloud 3
    lda.w BGScrollOff+2
    inc
    sta.w BGScrollOff+2
    bit #$10
    beq +
    stz.w BGScrollOff+2
    inc.w BGScrollVal+2
    +

    ;Mountain 1
    lda.w BGScrollOff+3
    inc
    sta.w BGScrollOff+3
    bit #$20
    beq +
    stz.w BGScrollOff+3
    inc.w BGScrollVal+3
    +

    ;Mountain 2
    lda.w BGScrollOff+4
    inc
    sta.w BGScrollOff+4
    bit #$08
    beq +
    stz.w BGScrollOff+4
    inc.w BGScrollVal+4
    +

    ;Mountain 3
    lda.w BGScrollOff+5
    inc
    sta.w BGScrollOff+5
    bit #$04
    beq +
    stz.w BGScrollOff+5
    inc.w BGScrollVal+5
    +

    ;Mountain 4
    lda.w BGScrollOff+6
    inc
    sta.w BGScrollOff+6
    bit #$02
    beq +
    stz.w BGScrollOff+6
    inc.w BGScrollVal+6
    +

    ;Cliffside
    lda.w BGScrollVal+10
    clc
    adc.b #$02
    sta.w BGScrollVal+10
    
    ;Ground
    lda.w BGScrollVal+11
    clc
    adc.b #$05
    sta.w BGScrollVal+11


    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH
    ;Construct HDMA table in WRAM
    ;Cloud1
    lda.b #$0D          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal   ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Cloud2
    lda.b #$07          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Cloud3
    lda.b #$07          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    lda.b #$23          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$23          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+6 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+10;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+11;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+15;\
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    stz.w HW_WMDATA     ;End flag

    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HW_WMADDH
    tdc 
    inc.w SinePtr
    lda.w BGScrollVal+12
    inc
    sta.w BGScrollVal+12
    bit #$04
    beq +
    stz.w BGScrollVal+12
    inc.w BG3HOffMirror
    +
    sep #$10
    ldy.w SinePtr
    ldx.b #$E0
    -
    lda.b #$01          ;Scanline counter
    sta.w HW_WMDATA
    lda.w FogOffset, Y
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w BG3HOffMirror
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    dex
    bne -
    stz.w HW_WMDATA

    rep #$10
    sep #$20
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror1+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror1+4
    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HDMAMirror2+2
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HDMAMirror2+4
    rts

UPD_BG_Computer:
    lda.w BGScrollOff+$0F
    inc
    sta.w BGScrollOff+$0F
    cmp.b #$05
    bne +
    stz.w BGScrollOff+$0F
    ;Forewires
    ldy.w #$0036
    tdc
    lda.b #$05
    sta.b ZP.R4
    jsr PalCycle
    ;Sprites
    ldy.w #$0116
    tdc
    lda.b #$05
    sta.b ZP.R4
    jsr PalCycle
    +

    sep #$20
    lda.w BGScrollOff
    inc
    sta.w BGScrollOff
    bit #$40
    beq +
    stz.w BGScrollOff
    inc.w BG3HOffMirror
    stz.w BG3HOffMirror+1
    +
    
    ;Pyramids
    lda.w BGScrollOff+4
    inc
    sta.w BGScrollOff+4
    bit #$08
    beq +
    stz.w BGScrollOff+4
    inc.w BGScrollVal+4
    +
    ;Hexagons
    lda.w BGScrollOff+1
    inc
    sta.w BGScrollOff+1
    bit #$04
    beq +
    stz.w BGScrollOff+1
    inc.w BGScrollVal+1
    +

    ;Floor
    lda.w BGScrollVal+2
    clc
    adc.b #$05
    sta.w BGScrollVal+2
    ;Floor2
    lda.w BGScrollVal+3
    clc
    adc.b #$07
    sta.w BGScrollVal+3

    ;Hexagons L3-1
    lda.w BGScrollOff+5
    inc
    sta.w BGScrollOff+5
    bit #$10
    beq +
    stz.w BGScrollOff+5
    inc.w BGScrollVal+5
    +
    ;Hexagons L3-2
    lda.w BGScrollOff+6
    inc
    sta.w BGScrollOff+6
    bit #$20
    beq +
    stz.w BGScrollOff+6
    inc.w BGScrollVal+6
    +
    ;Hexagons L3-3
    lda.w BGScrollOff+7
    inc
    sta.w BGScrollOff+7
    bit #$40
    beq +
    stz.w BGScrollOff+7
    inc.w BGScrollVal+7
    +
    ;Hexagons L3-4
    lda.w BGScrollOff+8
    inc
    sta.w BGScrollOff+8
    bit #$80
    beq +
    stz.w BGScrollOff+8
    inc.w BGScrollVal+8
    +

    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH

    lda.b #$7F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Hexagons
    lda.b #$50          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Floor
    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Floor2
    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    stz.w HW_WMDATA     ;End

    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HW_WMADDH

    lda.b #$40          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+8 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+7 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$1C          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+6 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    stz.w HW_WMDATA     ;End

    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror1+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror1+4

    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HDMAMirror2+2
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HDMAMirror2+4

    rts

UPD_BG_Surfboard:
    ;Ocean
    lda.w BGScrollOff
    inc
    sta.w BGScrollOff
    bit #$04
    beq +
    stz.w BGScrollOff
    ldy.w #$0022
    tdc
    lda.b #$06
    sta.b ZP.R4
    jsr PalCycle
    +
    
    ;BG3 
    lda.w BGScrollOff+1
    inc
    sta.w BGScrollOff+1
    bit #$10
    beq +
    stz.w BGScrollOff+1
    inc.w BGScrollVal+1
    +
    
    lda.w BGScrollOff+2
    inc
    sta.w BGScrollOff+2
    bit #$20
    beq +
    stz.w BGScrollOff+2
    inc.w BGScrollVal+2
    +
    
    lda.w BGScrollOff+3
    inc
    sta.w BGScrollOff+3
    bit #$40
    beq +
    stz.w BGScrollOff+3
    inc.w BGScrollVal+3
    +
    
    ;BG2
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH

    lda.w BGScrollOff+6
    inc
    sta.w BGScrollOff+6
    bit #$08
    beq +
    stz.w BGScrollOff+6
    inc.w BGScrollVal+6
    +

    lda.b #$3F          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$41          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+6
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    sep #$20
    tdc
    lda.w BGScrollVal+5
    inc
    sta.w BGScrollVal+5
    bit #$04
    beq +
    inc.w BGScrollVal+4
    +
    inc.w BGScrollVal+4

    tdc
    lda.b #$F0          ;Scanline
    sta.w HW_WMDATA
    ;Skew water
    inc.w SinePtr
    ldx.w #$0000
    lda.w SinePtr
    tax
    ldy.w #$0000
    -
    lda.w BGScrollVal+4
    adc.w SkewTable, Y
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    inx
    iny
    cpy.w #$0070
    bne -

    stz.w HW_WMDATA

    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HW_WMADDH

    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$0F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/    
    stz.w HW_WMDATA     ;End

    sep #$20
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HDMAMirror1+2
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HDMAMirror1+4
    
    tdc
    sep #$20
    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HDMAMirror2+2
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HDMAMirror2+4

    ;Surfboard frames
    lda.w OBJTimers+15
    inc
    sta.w OBJTimers+15
    bit #$08
    beq +
    lda.w OBJFrame
    eor #$02
    sta.w OBJFrame
    stz.w OBJTimers+15
    +

    ;Surfboard, takes 2 OAM entries
    lda.w Player.X
    sta.b ZP.AddSprX
    lda.b #!PlayerY
    clc
    adc.b #$0E
    sta.b ZP.AddSprY
    lda.b #!SurfboardT0
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #!SurfboardAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    lda.w Player.X
    adc.b #$08
    sta.b ZP.AddSprX
    lda.b #!PlayerY
    clc
    adc.b #$0E
    sta.b ZP.AddSprY
    lda.b #!SurfboardT1
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #!SurfboardAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    rts

UPD_BG_Desert:
    php
    sep #$20
    ldx.w #HDMAScrollBuffer2
    stx.w HW_WMADDL
    lda.b #$7E
    sta.w HW_WMADDH
    inc.w SinePtr
    inc.w SinePtr

    ldx.w #$0000
    ldy.w #$0000
    sep #$10
    ldx.b #$80
    ldy.w SinePtr
    -
    lda.b #$01
    sta.w HW_WMDATA
    lda.w HeatDist, Y
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    lda.b #$01
    sta.w HW_WMDATA
    lda.w HeatDist, Y
    eor.b #$FF
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    dex
    bne -
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    rep #$10

    inc.w BGScrollOff
    lda.w BGScrollOff
    cmp.b #$20
    bne +
    inc.w BGScrollVal
    stz.w BGScrollOff
    +
    
    inc.w BGScrollOff+1
    lda.w BGScrollOff+1
    cmp.b #$10
    bne +
    inc.w BGScrollVal+1
    stz.w BGScrollOff+1
    +
    
    inc.w BGScrollOff+2
    lda.w BGScrollOff+2
    cmp.b #$0B
    bne +
    inc.w BGScrollVal+2
    stz.w BGScrollOff+2
    +

    inc.w BGScrollOff+3
    lda.w BGScrollOff+3
    cmp.b #$09
    bne +
    inc.w BGScrollVal+3
    stz.w BGScrollOff+3
    +
    
    inc.w BGScrollOff+4
    lda.w BGScrollOff+4
    cmp.b #$06
    bne +
    inc.w BGScrollVal+4
    stz.w BGScrollOff+4
    +

    inc.w BGScrollOff+5
    lda.w BGScrollOff+5
    cmp.b #$02
    bne +
    inc.w BGScrollVal+5
    stz.w BGScrollOff+5
    +

    inc.w BGScrollOff+6
    
    inc.w BGScrollVal+7
    inc.w BGScrollVal+7
    inc.w BGScrollVal+7

    sep #$20
    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH
    lda.b #$17          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$7F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal   ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$15          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    stz.w HW_WMDATA     ;End
    
    ldx.w #HDMAScrollBuffer3&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer3>>16)&$FF
    sta.w HW_WMADDH
    lda.b #$4F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$33          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$14          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$09          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$09          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$0C          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$0C          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+6 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$2F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+7 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    stz.w HW_WMDATA     ;End


    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG2VOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror2+2
    lda.b #$7E
    sta.w HDMAMirror2+4

    lda.b #$02
    sta.w HDMAMirror3
    lda.b #(HW_BG3VOFS)&$FF
    sta.w HDMAMirror3+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror3+2
    lda.b #$7E
    sta.w HDMAMirror3+4
    
    lda.b #$02
    sta.w HDMAMirror4
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror4+1
    ldx.w #HDMAScrollBuffer
    stx.w HDMAMirror4+2
    lda.b #$7E
    sta.w HDMAMirror4+4
    
    lda.b #$02
    sta.w HDMAMirror5
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror5+1
    ldx.w #HDMAScrollBuffer3
    stx.w HDMAMirror5+2
    lda.b #$7E
    sta.w HDMAMirror5+4
    plp
    rts

UPD_BG_Wetlands:
    sep #$20
    ;Pillars
    inc.w BGScrollOff
    lda.w BGScrollOff
    bit #$80
    beq +
    inc.w BGScrollVal
    stz.w BGScrollOff
    +
    ;Water
    inc.w BGScrollOff+1
    lda.w BGScrollOff+1
    bit #$08
    beq +
    inc.w BGScrollVal+1
    stz.w BGScrollOff+1
    +
    ;Grass1
    inc.w BGScrollVal+2
    ;Grass2
    inc.w BGScrollVal+3
    inc.w BGScrollVal+3
    ;Mud
    inc.w BGScrollVal+9
    inc.w BGScrollVal+9
    inc.w BGScrollVal+9


    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH

    inc.w SinePtr

    rep #$10
    lda.b #$7F
    sta.w HW_WMDATA
    lda.w BGScrollVal+1
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    lda.b #$B0
    sta.w HW_WMDATA
    ldy.w #$0017
    sep #$30
    ldx.w SinePtr
    -
    inx
    lda.w WaterDist, X
    clc
    adc.w BGScrollVal+1
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    inx
    lda.w WaterDist, X
    eor.b #$FF
    clc
    adc.w BGScrollVal+1
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    dey
    bpl -

    lda.b #$10
    sta.w HW_WMDATA
    lda.w BGScrollVal+2
    sta.w HW_WMDATA
    stz.w HW_WMDATA

    lda.b #$10
    sta.w HW_WMDATA
    lda.w BGScrollVal+3
    sta.w HW_WMDATA
    stz.w HW_WMDATA

    lda.b #$0C
    sta.w HW_WMDATA
    lda.w BGScrollVal+9
    sta.w HW_WMDATA
    stz.w HW_WMDATA

    stz.w HW_WMDATA

    rep #$10
    ;BG3 Grass 1
    inc.w BGScrollOff+4
    lda.w BGScrollOff+4
    cmp #$78
    bne +
    inc.w BGScrollVal+4
    stz.w BGScrollOff+4
    +
    ;BG3 Grass 2
    inc.w BGScrollOff+5
    lda.w BGScrollOff+5
    cmp #$60
    bne +
    inc.w BGScrollVal+5
    stz.w BGScrollOff+5
    +
    ;BG3 Grass 3
    inc.w BGScrollOff+6
    lda.w BGScrollOff+6
    cmp #$40
    bne +
    inc.w BGScrollVal+6
    stz.w BGScrollOff+6
    +
    ;BG3 Grass 4
    inc.w BGScrollOff+7
    lda.w BGScrollOff+7
    cmp #$30
    bne +
    inc.w BGScrollVal+7
    stz.w BGScrollOff+7
    +
    ;BG3 Grass 5
    inc.w BGScrollOff+8
    lda.w BGScrollOff+8
    cmp #$20
    bne +
    inc.w BGScrollVal+8
    stz.w BGScrollOff+8
    +

    ldx.w #HDMAScrollBuffer2&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer2>>16)&$FF
    sta.w HW_WMADDH

    lda.b #$52
    sta.w HW_WMDATA
    lda.w BGScrollVal+4
    sta.w HW_WMDATA
    stz.w HW_WMDATA

    lda.b #$0D
    sta.w HW_WMDATA
    lda.w BGScrollVal+5
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    
    lda.b #$08
    sta.w HW_WMDATA
    lda.w BGScrollVal+6
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    
    lda.b #$08
    sta.w HW_WMDATA
    lda.w BGScrollVal+7
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    
    lda.b #$01
    sta.w HW_WMDATA
    lda.w BGScrollVal+8
    sta.w HW_WMDATA
    stz.w HW_WMDATA

    stz.w HW_WMDATA

    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer
    stx.w HDMAMirror1+2
    lda.b #$7E
    sta.w HDMAMirror1+4
    
    lda.b #$02
    sta.w HDMAMirror2
    lda.b #(HW_BG3HOFS)&$FF
    sta.w HDMAMirror2+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror2+2
    lda.b #$7E
    sta.w HDMAMirror2+4
    rts

UPD_BG_Tundra:
	rep #$20
	lda.w BG3HOffMirror
	clc
	adc.w #$0008
	sta.w BG3HOffMirror
	lda.w BG3VOffMirror
	clc
	adc.w #$FFFC
	sta.w BG3VOffMirror

	ldx.w #HDMAScrollBuffer2
	stx.w HW_WMADDL
	lda.b #(HDMAScrollBuffer2>>16)
	sta.w HW_WMADDH

	sep #$20
	tdc
	ldx.w #$0006
	.TundraScroll:
	lda.w BGScrollOff, X
	inc
	sta.w BGScrollOff, X
	cmp.w BG7ScrollDiv, X
	bne .SkipMov
	txa
	beq .SkipRegular
	inc.w BGScrollVal, X
	stz.w BGScrollOff, X
	bra .SkipMov
	.SkipRegular:
	lda.w BGScrollVal, X
	clc
	adc.b #$03
	sta.w BGScrollVal, X
	stz.w BGScrollOff, X
	.SkipMov:
	lda.w BG7ScrollScan, X
	sta.w HW_WMDATA
	lda.w BGScrollVal, X
	sta.w HW_WMDATA
	stz.w HW_WMDATA
	dex
	bpl .TundraScroll
	stz.w HW_WMDATA
	
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG2HOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror1+2
    lda.b #$7E
    sta.w HDMAMirror1+4
	rts

UPD_BG_Cliff:
    sep #$20
    tdc
    lda.w BG2VOffMirror
    clc
    adc.b #$04
    sta.w BG2VOffMirror

    ldx.w #$0004
    -
    inc.w BGScrollVal, X
    inc.w BGScrollVal, X
    inc.w BGScrollOff, X
    lda.w BGScrollOff, X
    cmp.w BG8ScrollDiv, X
    bne .SkipBGMove
    inc.w BGScrollVal, X
    stz.w BGScrollOff, X
    .SkipBGMove:
    dex
    bpl -

    ldx.w #L3Ram+$21
    stx.w HW_VMADDL
    sep #$10
    ldx.b #$04
    lda.b #$40          ;Choose BG2 to vertically scroll
    xba
    ;-
    ;lda.w BGScrollVal, X
    ;rep #$20
    ;sta.w HW_VMDATAL
    ;cpx.b #$03
    ;bmi +
    ;sta.w HW_VMDATAL
    ;+
    ;sep #$20
    ;dex
    ;bpl -
    for t = 0..2
        sep #$20
        lda.w BGScrollVal+(4-!t)
        rep #$20
        sta.w HW_VMDATAL
        sta.w HW_VMDATAL
    endfor    
    for i = 2..4
        sep #$20
        lda.w BGScrollVal+(4-!i)
        rep #$20
        sta.w HW_VMDATAL
    endfor

    inc.w SinePtr
    inc.w SinePtr
    ldx.w SinePtr

    rep #$20
    lda.w #$4000
    for t = 0..16
        sep #$20
        lda.w UnSineTable, X
        lsr
        lsr
        lsr
        lsr
        lsr
        lsr
        rep #$20
        sta.w HW_VMDATAL
        sep #$20
        txa
        clc
        adc.b #$20
        tax
    endfor

    rep #$10
    ldx.w #L3Ram+$37
    stx.w HW_VMADDL
    sep #$30
    ldx.b #$00
    lda.b #$40          ;Choose BG2 to vertically scroll
    xba
    
    for t = 0..2
        sep #$20
        lda.w BGScrollVal+!t
        rep #$20
        sta.w HW_VMDATAL
    endfor    
    for i = 2..4
        sep #$20
        lda.w BGScrollVal+!i
        rep #$20
        sta.w HW_VMDATAL
        sta.w HW_VMDATAL
    endfor
    sep #$20
    ;-
    ;lda.w BGScrollVal, X
    ;rep #$20
    ;sta.w HW_VMDATAL
    ;cpx.b #$03
    ;bpl +
    ;sta.w HW_VMDATAL
    ;+
    ;sep #$20
    ;inx
    ;cpx.b #$05
    ;bmi -
    rep #$10
   	rts

UPD_BG_Alien:
	rts

GameLoop_UpdateBG_OBJ:
    pha
    phx
    phy
    php
    ldx.w #$0000
    tdc
    lda.w BGIndex
    asl
    tax
    jsr (BGOBJList, X)
    plp
    ply
    plx
    pla
    rts

BGOBJList:
    dw OBJ_City         ;BG-1
    dw OBJ_Mountains    ;BG-2
    dw OBJ_Computer     ;BG-3
    dw OBJ_Surfboard    ;BG-4
    dw OBJ_Desert       ;BG-5
    dw OBJ_Wetlands     ;BG-6
    dw OBJ_Tundra     	;BG-7
    dw OBJ_Cliff        ;BG-8
    dw OBJ_Alien        ;BG-9

OBJ_City:
    rts

OBJ_Mountains:
    rts

OBJ_Computer:
    ldy.w #$000F
    ldx.w #$001E
    .OBJMov:
    sep #$20
    lda.w OBJTimers, Y
    inc
    sta.w OBJTimers, Y
    cmp.w BG3OBJSpeed, Y
    bne +
    rep #$20
    dec.w OBJXPos, X
    sep #$20
    lda.b #$00
    sta.w OBJTimers, Y
    +
    dex
    dex
    dey
    bpl .OBJMov

    ldy.w #$000F
    ldx.w #$001E
    .CharLoop:
    rep #$20
    lda.w OBJXPos, X
    sta.b ZP.AddSprX
    sep #$20
    lda.w OBJYPos, Y
    sta.b ZP.AddSprY
    lda.w BG3CharTiles, Y
    sta.b ZP.AddSprTile
    lda.w BG3CharAttr, Y
    sta.b ZP.AddSprAttr
    lda.b #$01
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    dex
    dex
    dey
    bpl .CharLoop
    rts

OBJ_Surfboard:
    rts

OBJ_Desert:
    ldx.w #!MaxClouds*2
    ldy.w #!MaxClouds
    .CloudLoop:
    sep #$20
    lda.w SParticleTimer, Y
    inc
    cmp.w CloudWait, Y
    bne +
    rep #$20
    dec.w SParticleX, X
    lda.w SParticleX, X
    and.w #$01FF
    cmp.w #$01E0
    bne ++
    lda.w #$0100
    sta.w SParticleX, X
    ++
    sep #$20
    lda.b #$00
    +
    sta.w SParticleTimer, Y
    rep #$20
    lda.w SParticleX, X
    sta.b ZP.AddSprX
    sep #$20
    lda.w CloudYPos, Y
    sta.b ZP.AddSprY
    lda.w CloudTileList, X
    sta.b ZP.AddSprTile
    lda.b #!CloudAttrHi
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    
    rep #$20
    lda.w SParticleX, X
    clc
    adc.w #$0010
    sta.b ZP.AddSprX
    sep #$20
    lda.w CloudYPos, Y
    sta.b ZP.AddSprY
    lda.w CloudTileList+1, X
    sta.b ZP.AddSprTile
    lda.b #!CloudAttrHi
    sta.b ZP.AddSprAttr
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    dex
    dex
    dey
    bpl .CloudLoop
    rts

OBJ_Wetlands:
    ldy.w #!RainCount
    sep #$20
    .RainLoop:
    lda.w SParticleX, Y
    sec
    sbc.b #$03
    sta.w SParticleX, Y
    sta.b ZP.AddSprX
    lda.w SParticleY, Y
    adc.b #$07
    sta.w SParticleY, Y
    sta.b ZP.AddSprY
    lda.b #$C0
    clc
    adc.w SParticleState, Y
    sta.b ZP.AddSprTile
    lda.b #!RainAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    dey
    bpl .RainLoop

    sep #$20
    inc.w OBJTimers
    lda.w OBJTimers
    bit.b #$20
    beq +
    stz.w OBJTimers
    lda.w OBJFrame
    eor.b #$01
    sta.w OBJFrame
    +

    inc.w OBJTimers+1
    lda.w OBJTimers+1
    bit.b #$10
    beq .SkipBoatMove
    stz.w OBJTimers+1
    rep #$20
    dec.w OBJXPos
    lda.w OBJXPos
    and.w #$01FF
    cmp.w #$01F0
    bne +
    lda.w #$0100
    sta.w OBJXPos
    +
    .SkipBoatMove:
    rep #$20
    lda.w OBJXPos
    sta.b ZP.AddSprX
    sep #$20
    lda.b #$40
    sta.b ZP.AddSprY
    lda.b #!BoatTile
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #!BoatAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    rts
	
OBJ_Tundra:
	rts

OBJ_Cliff:
    sep #$20   
    ;Surfboard frames
    lda.w OBJTimers+15
    inc
    sta.w OBJTimers+15
    bit #$08
    beq +
    lda.w OBJFrame
    eor #$02
    sta.w OBJFrame
    stz.w OBJTimers+15
    +

    ;Surfboard, takes 2 OAM entries
    lda.w Player.X
    sta.b ZP.AddSprX
    lda.b #!PlayerY
    clc
    adc.b #$0E
    sta.b ZP.AddSprY
    lda.b #!SurfboardT0
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #!SurfboardAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    lda.w Player.X
    adc.b #$08
    sta.b ZP.AddSprX
    lda.b #!PlayerY
    clc
    adc.b #$0E
    sta.b ZP.AddSprY
    lda.b #!SurfboardT1
    clc
    adc.w OBJFrame
    sta.b ZP.AddSprTile
    lda.b #!SurfboardAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    
    sep #$10
    ldx.b #!CliffRockCount
    ldy.b #!CliffRockCount*2
    .RockMoveLoop:
    rep #$20
    lda.w OBJYVel, Y
    clc
    adc.w BG8RocksSpeed, Y
    sta.w OBJYVel, Y
    sep #$20
    xba
    cmp.b #$F0
    bne +
    jsr Rand
    xba
    sta.w OBJXPos, X
    lda.b #$F0
    +
    sta.w OBJYPos, X
    dey
    dey
    dex
    bpl .RockMoveLoop

    sep #$20
    ;Drawing rocks if active
    ldx.b #!CliffRockCount
    .RockDrawLoop:
    lda.w OBJActive, X
    beq .SkipSprite
    lda.w OBJXPos, X
    sta.b ZP.AddSprX
    lda.w OBJYPos, X
    sta.b ZP.AddSprY
    lda.w BG8RockTiles, X
    sta.b ZP.AddSprTile
    lda.w BG8RockAttr, X
    sta.b ZP.AddSprAttr
    lda.w BG8RockBigFlag, X
    sta.b ZP.AddSprBigFlag
    jsr AddSprite
    .SkipSprite:
    dey
    dey
    dex
    bpl .RockDrawLoop
    rep #$10

   ;Decorative moon
    lda.b #!BG8MoonX
    sta.b ZP.AddSprX
    lda.b #!BG8MoonY
    sta.b ZP.AddSprY
    lda.b #!BG8MoonTile
    sta.b ZP.AddSprTile
    lda.b #!BG8MoonAttr
    sta.b ZP.AddSprAttr
    lda.b #$01
    sta.b ZP.AddSprBigFlag
    jsr AddSprite

    rep #$20
    rts

OBJ_Alien:
    rts

GameLoop_HandleUFOParticles:
    pha
    phx
    phy
    php
    sep #$20
    lda.w UFOPartFlip
    eor.b #$FF
    sta.w UFOPartFlip
    ldy.w #$0007        ;Byte index
    ldx.w #$000E        ;Word index
    -
    lda.w UFOPartEnabled, Y
    beq +
    ;Check if we've went out of bounds
    sep #$20
    lda.w UFOPartY, Y
    cmp.b #$E0
    bcc ++
    lda.b #$00
    sta.w UFOPartEnabled, Y
    bra +
    ++
    rep #$20
    ;Handle movement
    ;X velocity
    tdc
    lda.w UFOPartXSpeed, Y
    and.w #$00FF
    clc
    adc.w UFOPartX, X
    sta.w UFOPartX, X
    
    rep #$20
    ;Y movement
    lda.w UFOPartYVel, X
    sec
    sbc.w UFOPartYSpeed, X
    sta.w UFOPartYVel, X
    sep #$20
    lda.w UFOPartY, Y
    sec
    sbc.w UFOPartYVel+1, X
    sta.w UFOPartY, Y
    ;Draw sprites
    rep #$20
    lda.w UFOPartX, X
    sta.b ZP.AddSprX
    sep #$20
    lda.w UFOPartY, Y
    sta.b ZP.AddSprY
    sep #$20
    lda.w UFOPartTiles, Y
    and.w UFOPartFlip
    sta.b ZP.AddSprTile
    lda.b #!UFOAttr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite
    +
    dex
    dex
    dey
    bpl -
    plp
    ply
    plx
    pla
    rts

GameLoop_EnemyTransition:
    pha
    phx
    phy
    php
    tdc
    sep #$20
    ldx.w #$0000
    lda.w EnemyTransInd
    asl
    tax
    jsr (ETransList, X)
    plp
    ply
    plx
    pla
    rts

ETransList:
    dw Enemy_Descend
    dw Enemy_Draw
    dw Enemy_Lines
    dw Enemy_Interlace

Enemy_Descend:
    php
    sep #$20
    lda.w EnemyTransSetup
    beq +
    stz.w ShowStageTextOut
    stz.w ShowStageText
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    ldx.w #$0080
    stx.w BG1VOffMirror
    ldx.w #$0100
    stx.w BG1HOffMirror
    rep #$20
    lda.w EPlaneTop
    ora.w #$0100
    sta.w EPlaneTopW
    sep #$20
    inc.b ZP.EnemyWaveCount
    ldy.w #$0028
    lda.b #$00
    -
    sta.w EnemyHurtTable, Y
    dey
    bpl -
    jsr GameLoop_UpdateEnemyArray
    inc.b ZP.DrawEnemyFlag
    dec.b ZP.EnemyWaveCount
    stz.w EnemyTransSetup    
    +
    rep #$20
    lda.w BG1VOffMirror
    and #$01FF
    cmp.w EPlaneTopW
    beq +
    dec.w BG1VOffMirror
    bra .Exit
    +
    inc.w SendWave
    .Exit:
    plp
    rts
Enemy_Draw:
    rts
Enemy_Lines:
    rts
Enemy_Interlace:
    rts

    ;   ZP.MemPointer   | Text addr
    ;
    ;   ZP.R1           \
    ;   ZP.R2           /   Character amount to write
DrawSpriteText:
    pha
    phx
    phy
    php
    ldy.w #$0000
    sep #$20
    -
    lda.b (ZP.MemPointer)   ;Grab character
    bne .DrawCharacter      ;Skip if space character
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    bra .IncLoop
    .DrawCharacter:
    ;X
    lda.w SPRTextPosX, Y
    sta.b ZP.AddSprX
    ;Y
    lda.w SPRTextPosY, Y
    sta.b ZP.AddSprY
    ;Tile
    lda.b (ZP.MemPointer)       ;Grab character
    sta.b ZP.AddSprTile
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
    ;Attr
    lda.b #!SprFont1Attr
    sta.b ZP.AddSprAttr
    stz.b ZP.AddSprBigFlag
    jsr AddSprite

    ;lda.w SPRTextPosX, Y
    ;sta.b (ZP.OAMPtr)
    ;rep #$20
    ;inc.b ZP.OAMPtr
    ;sep #$20
    ;;Y
    ;lda.w SPRTextPosY, Y
    ;sta.b (ZP.OAMPtr)
    ;rep #$20
    ;inc.b ZP.OAMPtr
    ;sep #$20
    ;;Tile
    ;lda.b (ZP.MemPointer)       ;Grab character
    ;sta.b (ZP.OAMPtr)
    ;rep #$20
    ;inc.b ZP.OAMPtr
    ;sep #$20
    ;;Attr
    ;lda.b #!SprFont1Attr
    ;sta.b (ZP.OAMPtr)
    ;rep #$20
    ;inc.b ZP.OAMPtr
    ;sep #$20
    ;;Move onto next character
    ;rep #$20
    ;inc.b ZP.MemPointer
    ;sep #$20
    .IncLoop:
    iny
    cpy.b ZP.R1
    bne -
    plp
    ply
    plx
    pla
    rts

DrawTransition:
    pha
    phx
    phy
    php 
    sep #$20
    ;Check if we're actually transitioning
    lda.w TransitionState
    bne ++
    jmp .FinishSubroutine
    ++
    cmp.b #$01
    bne +
    lda.w TransitionIndex
    sec
    sbc.b #!TransSpeed
    sta.w TransitionIndex
    bra .SetupWindow
    +
    lda.w TransitionState
    cmp.b #$02
    bne +
    lda.w TransitionIndex
    clc
    adc.b #!TransSpeed
    sta.w TransitionIndex
    bra .SetupWindow
    +
    
    .SetupWindow:
    ;Set window 2 up
    lda.b #$CC
    ora.w W12SELMirror
    sta.w W12SELMirror
    lda.b #$CC
    ora.w W34SELMirror
    sta.w W34SELMirror
    lda.b #$CC
    ora.w WOBJSELMirror
    sta.w WOBJSELMirror
    lda.b #$FF
    sta.w TMWMirror
    stz.w TSWMirror

    ;Move window positions
    ldy.w #$0000
    sep #$10
    ldy.w TransitionIndex
    lda.w Sigmoid, Y
    sta.w WH2Mirror
    lda.b #$FF
    sec
    sbc.w Sigmoid, Y
    sta.w WH3Mirror
    lda.w TransitionIndex
    cmp #!TransSpeed-1
    bne +
    stz.w TransitionFlag
    stz.w TransitionState
    bra .SkipTrans
    +
    cmp #(255-!TransSpeed)+2
    bne +
    stz.w TransitionFlag
    stz.w TransitionState
    lda.b #$01
    sta.b ZP.ExitScene
    bra .SkipTrans
    +
    bra .FinishSubroutine
    .SkipTrans:
    .FinishSubroutine:
    plp
    ply
    plx
    pla
    rts

TransitionIn:
    pha
    php
    lda.b #$01
    sta.w TransitionFlag
    sta.w TransitionState
    lda.b #$FF
    sta.w TransitionIndex
    plp
    pla
    rts

TransitionOut:
    pha
    php
    lda.b #$01
    sta.w TransitionFlag
    lda.b #$02
    sta.w TransitionState
    lda.b #$01
    sta.w TransitionIndex
    plp
    pla
    rts

    ; ZP.AddSprX       |   X
    ; ZP.AddSprY       |   Y
    ; ZP.AddSprTile    |   Tile
    ; ZP.AddSprAttr    |   Attr
    ; ZP.AddSprBigFlag |   Big/Small
    ; ZP.AddSprPtr     |   Bullshit second table
AddSprite:
    pha
    phx
    phy
    php
    rep #$30
    lda.b ZP.OAMPtr
    lsr
    lsr
    and.w #$0003
    tay
    ;Find second table position
    lda.b ZP.OAMPtr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.AddSprPtr
    ldx.b ZP.OAMPtr
    sep #$20
    lda.b ZP.AddSprX
    sta.w OAMCopy, X
    inx
    lda.b ZP.AddSprY
    sta.w OAMCopy, X
    inx
    rep #$20
    lda.b ZP.AddSprTile
    sta.w OAMCopy, X
    inx
    inx
    stx.b ZP.OAMPtr
    sep #$20
    lda.b ZP.AddSprBigFlag
    beq +
    ldx.b ZP.AddSprPtr
    lda.w OAMCopy+$0200, X
    ora.w SpriteTableMask, Y
    sta.w OAMCopy+$0200, X
    +
    rep #$20
    lda.b ZP.AddSprX
    and.w #$0100
    beq +
    stz.b ZP.AddSprX
    sep #$20
    ldx.b ZP.AddSprPtr
    lda.w OAMCopy+$0200, X
    ora.w SpriteTablePosMask, Y
    sta.w OAMCopy+$0200, X
    +
    plp
    ply
    plx
    pla
    rts

    ;
    ;   Processes the PalMirror with the fade mask to output the data to PalOut
    ;
    ;   Clobberlist
    ;       ZP.R0
    ;       ZP.R1
    
ClearL3Vram:
	php
	rep #$10
	sep #$20    				;Clear tilemap 3
    lda.b #$8F
    sta.w HW_INIDISP
    ldx.w #L3Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr  
    lda.b #(ZVal>>16)&$FF
	stz.w HW_A1B7
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$1000                ;Set to fill 400 words
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    lda.b #$0F
    sta.w HW_INIDISP
	plp
	rts

ClearL2Vram:
	php
	rep #$10
	sep #$20    				;Clear tilemap 3
    lda.b #$8F
    sta.w HW_INIDISP
    ldx.w #L2Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr  
    lda.b #(ZVal>>16)&$FF
	stz.w HW_A1B7
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$1000                ;Set to fill 400 words
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    lda.b #$0F
    sta.w HW_INIDISP
	plp
	rts

ClearLTileVram:
	php
	rep #$10
	sep #$20    				;Clear tilemap 1
    lda.b #$80
    sta.w HW_INIDISP
    ldx.w #L1Ram
    stx.w HW_VMADDL             ;Set VRAM address to L1RAM
    lda.b #$09
    sta.w HW_DMAP7              ;Setup DMAP0
    lda.b #$18                  ;Grab Video mem data lo addr
    sta.w HW_BBAD7              ;Set bus addr    
    lda.b #(ZVal>>16)&$FF
	sta.w HW_A1B7
    ldx.w #ZVal                 ;Grab 0 val data to clear vram
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    ldx.w #$1FFF
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM [0 just means all of vram]
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    lda.b #$0F
    sta.w HW_INIDISP
	plp
	rts

HandlePaletteFade:
    php
    ldy.w #$0200
    sep #$20
    lda.b ZP.PalFadeEnd
    bne .SkipTransfer
    rep #$20
    ldy.w #PalOut
    ldx.w #PalMirror
    lda.w #$0200
    mvn !CodeBank, !CodeBank
    .SkipTransfer:
    rep #$20
    lda.b ZP.PalFadeEnd
    beq .SkipFade
    tdc
    ldy.w #$0000
    ldx.w #$0000
    sep #$20
    lda.b ZP.PalFadeInd
    and.b #$1F
    asl
    tax
    rep #$20
    lda.b ZP.PalFadeEnd
    tay
    .FadeLoop:
    lda.w PalMirror, Y
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    sta.b ZP.R2
    lda.b ZP.R0
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    asl
    asl
    asl
    asl
    asl
    ora.b ZP.R2
    sta.b ZP.R2
    lda.b ZP.R0
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    xba
    asl
    asl
    ora.b ZP.R2
    sta.w PalOut, Y
    dey
    dey
    cpy.b ZP.PalFadeStart
    bne .FadeLoop
    .SkipFade:
    plp
    rts

;|------------------|
;|   IN GAME TEXT   |
;|------------------|
HighscoreHeader:
    dw ">@~ THE HALL OF FAME ~@>"
HighscoreUnderline:
    dw "''''''''''''''''''''''''"

HighscoreValuesInit:
	db "HIGHSCORE N01"		;13 bytes
	dl $100000				;03 bytes
	db "HIGHSCORE N02"		;13 bytes
	dl $090000				;03 bytes
	db "HIGHSCORE N03"		;13 bytes
	dl $080000				;03 bytes
	db "HIGHSCORE N04"		;13 bytes
	dl $070000				;03 bytes
	db "HIGHSCORE N05"		;13 bytes
	dl $060000				;03 bytes
	db "HIGHSCORE N06"		;13 bytes
	dl $050000				;03 bytes
	db "HIGHSCORE N07"		;13 bytes
	dl $040000				;03 bytes
	db "HIGHSCORE N08"		;13 bytes
	dl $030000				;03 bytes
	db "HIGHSCORE N09"		;13 bytes
	dl $020000				;03 bytes
	db "HIGHSCORE N10"		;13 bytes
	dl $010000				;03 bytes
HighscoreValuesInitEnd:

StartText:
    db "START GAME"
StartTextEnd:

HighScoreText:
    db "HIGH SCORES"
EndHighScoreText:

OptionsText:
    db "OPTIONS"
EndOptionsText:

ModText:
    db "GAME MODIFIERS"
ModTextEnd:

SFXText:
    db "SOUND TEST"
SFXTextEnd:

ExitText:
    db "EXIT"
ExitTextEnd:

IntroText:
	dw Intro1_1
	dw Intro1_2
	dw Intro1_3
	dw Intro1_4
	dw Intro1_5
	dw Intro1_6
	dw Intro2_1
	dw Intro2_2
	dw Intro2_3
	dw Intro2_4
	dw Intro2_5

;Intro text, each line is 28 characters long, text is padded by one row/column for the X and Y axis
;Each intro text entry has 8 lines of text to work with, 2 lines for padding
;Each section is E0 bytes large
Intro1_1:
	db "                            "
	db " FOR A THOUSAND YEARS A SET "
	db " OF ALIEN SPECIES HAVE BEEN "
	db " AT WAR. THIS WAS           "
	db " FOR POWER! FOR GLORY! FOR  "
	db " TOTAL. ABSOLUTE. VICTORY!  "
	db " HOWEVER IT WAS NOT FATE... "
	db "                            "
Intro1_2:
	db "                            "
	db " EVENTUALLY AFTER MUCH TALK "
	db " AND DELEGATION A PEACEFUL  "
	db " RESOLUTION WAS MADE.       "
	db " NO MORE FIGHTING. NO MORE  "
	db " BLOODSHED.                 "
	db " A NEW AGE WAS DELCARED!    "
	db "                            "
Intro1_3:
	db "                            "
	db " A GRAND COLLABERATION WAS  "
	db " ESTABLISHED TO MAINTAIN A  "
	db " EVERLASTING AND PROSPEROUS "
	db " STATE OF PLENTY AND BLISS. "
	db " SUCH PEACE WAS SURE TO     "
	db " LAST FOR CENTURIES!        "
	db "                            "
Intro1_4:
	db "                            "
	db " ONE WEEK LATER AND THE     "
	db " ALIENS ARE NOW BORED.      "
	db " TOO MUCH FREE TIME HAS LET "
	db " THEM GROW WEARY AND        "
	db " AIMLESS. NOW WITH NO FIGHT "
	db " THERE IS SIMPLY NO FUN.    "
	db "                            "
Intro1_5:
	db "                            "
	db " ONE ALIEN HAS AN IDEA...   "
	db "                            "
	db "  |WHAT ABOUT A NEW WAR?    "
	db "  WITH A STUPIDER SPECIES?| "
	db "                            "
	db " WITH NO ALTERNATIVE THE    "
	db " OTHER ALIENS AGREE.        "
	db "                            "	
Intro1_6:
	db "                            "
	db " WITH NO TARGET IN MIND THE "
	db " ALIENS AGREE TO INVADE     "
	db " WHATEVER PLANET THEY SEE.  "
	db "                            "
	db " THEY OPEN A PORTAL AND GO  "
	db " THROUGH TO FIND A TARGET.  "
	db "                            "	
Intro2_1:                               ;Panel 7
	db "                            "
	db " PRESENT DAY EARTH WAS NOT  "
	db " PREPARED TO MEET THE ALIEN "
	db " THREAT. WITH NO TIME TO    "
	db " SPARE EVERY GOVERNMENT NOW "
	db " CALLS FOR A HERO TO SAVE   "
	db " THE EARTH ITSELF...        "
	db "                            "
Intro2_2:
	db "                            "
	db " |ANYONE HERE WHO STEPS UP  "
	db " AND DESTROYS THE ALIEN     "
	db " THREAT WILL BE REWARDED A  "
	db " MASSIVE SUM OF MONEY...    "
	db "                            "
	db "        5 POUNDS!|          "
	db "                            "
Intro2_3:
	db "                            "
	db " |WOW! 5 WHOLE POUNDS!      "
	db " I CAN BUY A SWEET BAG WITH "
	db " THAT MUCH MONEY!|          "
	db "                            "
	db " AND SO OUR HERO JOINS THE  "
	db " FIGHT!!!                   "
	db "                            "
Intro2_4:
	db "                            "
	db " OFF THEY GO INTO DANGER    "
	db " SO THAT THEY MAY GET THEIR "
	db " GRAND PRIZE. WITH A HARD   "
	db " HEAD AND A WILL OF IRON    "
	db " ONLY EMBOLDENED BY THEIR   "
	db " TANTALISING OFFER!         "
	db "                            "
Intro2_5:
	db "                            "
	db "                            "
	db "''''''''''''''''''''''''''''"
	db "                            "
	db " GO FORTH YOU PLUCKY HUMAN! "
	db "                            "
	db "''''''''''''''''''''''''''''"
	db "                            "

;Game modifiers
Op0Text:
    db "00: 2X HEALTH ENEMIES "     ;2x enemy health
Op1Text:
    db "01: 2X SPEED ENEMIES  "     ;1/2 time to make enemies move
Op2Text:
    db "02: SLOW TANK BULLETS "     ;Player bullets move at half speed
Op3Text:
    db "03: FAST ALIEN BULLETS"     ;Enemy bullets move at 2x speed
Op4Text:
    db "04: HOMING BULLETS    "     ;Enemy bullets home in on the player
Op5Text:
    db "05: RETRO VISION      "     ;Mosaic applied to layer 1
Op6Text:
    db "06: SLOW SHIP         "     ;Ship moves half as fast
Op7Text:
    db "07: NO-LIFER          "     ;1 life for a given session
Op8Text:
    db "08: RANDOM WAVES      "     ;Randomize what wave to go to
Op9Text:
    db "09: NO PERSONAL SPACE "     ;Waves start lower
OpAText:
    db "10: WEAK SHIELDS      "     ;Shields have 1 health
OpBText:
    db "11: MOVING SHIELDS    "     ;Moving shields
OpCText:
    db "12: SHADOW ALIENS     "     ;Alien palette is set to black so only outlines are seen
OpDText:
    db "13: NA                "     ;To be made
OpEText:
    db "14: CONFUSED ENEMIES  "     ;Enemy Bullets have a random direction
OpFText:
    db "15: DANGEROUS UFO     "     ;UFO fires bullets at the player
ModEnd:

GameModifiers:
    dw Op0Text                       ;$0000
    dw Op1Text                       ;$0001
    dw Op2Text                       ;$0002
    dw Op3Text                       ;$0004
    dw Op4Text                       ;$0008
    dw Op5Text                       ;$0010
    dw Op6Text                       ;$0020
    dw Op7Text                       ;$0040
    dw Op8Text                       ;$0080
    dw Op9Text                       ;$0100
    dw OpAText                       ;$0200
    dw OpBText                       ;$0400
    dw OpCText                       ;$0800
    dw OpDText                       ;$1000
    dw OpEText                       ;$2000
    dw OpFText                       ;$4000
EndGameModifiers:

MusicOptionsText:
    db "MUSIC OPTIONS       "
MSXNormal:
    db "LINEAR SELECTION    "
MSXTheme:
    db "THEME FOR EACH STAGE"
MSXRand:
    db "RANDOMIZE TRACKS    "
MSXSad:
    db "NO MUSIC D:         "

MSXMod:
    dw MSXNormal
    dw MSXTheme
    dw MSXRand
    dw MSXSad
MSXModEnd:

StageRandomText:
    db "RANDOMIZE STAGES: "

OptionsArrowPos:
    db $3C
    db $54
    db $7C
    db $94
    db $AC

TitleTextPosX:
    ;Start Game
    db $58      
    db $58+(6*1)
    db $58+(6*2)
    db $58+(6*3)
    db $58+(6*4)
    db $58+(6*5)
    db $58+(6*6)
    db $58+(6*7)
    db $58+(6*8)
    db $58+(6*9)
    ;Highscores
    db $58      
    db $58+(6*1)
    db $58+(6*2)
    db $58+(6*3)
    db $58+(6*4)
    db $58+(6*5)
    db $58+(6*6)
    db $58+(6*7)
    db $58+(6*8)
    db $58+(6*9)
    db $58+(6*10)
    ;Options
    db $58      
    db $58+(6*1)
    db $58+(6*2)
    db $58+(6*3)
    db $58+(6*4)
    db $58+(6*5)
    db $58+(6*6)
EndTitleTextPosX:

TitleTextPosY:
    ;Start Game
    db $90
    db $90
    db $90
    db $90
    db $90
    db $90
    db $90
    db $90
    db $90
    db $90
    ;Highscores
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    db $98
    ;Options
    db $A0
    db $A0
    db $A0
    db $A0
    db $A0
    db $A0
    db $A0
    db $A0
EndTitleTextPosY:

ArrowTitleYPos:
    db $90
    db $98
    db $A0
    db $A0

EnemyTypesPal:
    db $00<<2           ;Empty
    db !EnemyPal2       ;Basic Squelcher
    db !EnemyPal3       ;Metal Rocketeer
    db !EnemyPal2       ;Boxy Greenback
    db $05<<2           ;Mind Cake
    db $00<<2           ;Sophisticated mimic
    db $05<<2           ;Purple Mook
    db !EnemyPal3       ;Multi Arm
    db !EnemyPal2       ;Tough Guy

EnemyTypesTile:
    db $00              ;Empty
    db $2D              ;Basic Squelcher
    db $2F              ;Metal Rocketeer
    db $31              ;Boxy Greenback
    db $33              ;Mind Cake
    db $3D              ;Sophisticated mimic
    db $3F              ;Purple Mook
    db $41              ;MultiArm
    db $43              ;Tough Guy

EnemyDrawTop:
    ;Empty/Dead
    dw $0000            
    dw $0000

    ;Basic Squelcher
    db $60
    db !EnemyPal1
    db $60
    db (!EnemyPal1)+$40

    ;Metal Rocketeer
    db $61
    db !EnemyPal2
    db $61
    db (!EnemyPal2)+$40

    ;Boxy Greenback
    db $62
    db !EnemyPal1
    db $62
    db (!EnemyPal1)+$40

    ;Mind Cake
    db $63
    db !EnemyPal3
    db $63
    db (!EnemyPal3)+$40

    ;Sophisticated mimic
    db $64
    db !EnemyPal4
    db $64
    db (!EnemyPal4)+$40

    ;Purple Mook
    db $65
    db !EnemyPal3
    db $65
    db (!EnemyPal3)+$40

    ;MultiArm
    db $66
    db !EnemyPal2
    db $66
    db (!EnemyPal2)+$40

    ;Tough Guy
    db $67
    db !EnemyPal1
    db $67
    db (!EnemyPal1)+$40

EnemyDrawBot:
    ;Empty/Dead
    db $00
    db $00<<2
    db $00
    db $00<<2

    ;Basic Squelcher
    db $70
    db !EnemyPal1
    db $70
    db (!EnemyPal1)+$40

    ;Metal Rocketeer
    db $71
    db !EnemyPal2
    db $71
    db (!EnemyPal2)+$40

    ;Boxy Greenback
    db $72
    db !EnemyPal1
    db $72
    db (!EnemyPal1)+$40

    ;Mind Cake
    db $73
    db !EnemyPal3
    db $73
    db (!EnemyPal3)+$40

    ;Sophisticated mimic
    db $74
    db !EnemyPal4
    db $74
    db (!EnemyPal4)+$40

    ;Purple Mook
    db $75
    db !EnemyPal3
    db $75
    db (!EnemyPal3)+$40

    ;MultiArm
    db $76
    db !EnemyPal2
    db $76
    db (!EnemyPal2)+$40

    ;Tough Guy
    db $77
    db !EnemyPal1
    db $77
    db (!EnemyPal1)+$40

EnemyHealthTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $02              ;Metal Rocketeer
    db $01              ;Boxy Greenback
    db $01              ;Mind Cake
    db $02              ;Sophisticated mimic
    db $03              ;Purple Mook
    db $02              ;MultiArm
    db $04              ;Tough Guy
    
EnemyScoreTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $02              ;Metal Rocketeer
    db $02              ;Boxy Greenback
    db $01              ;Mind Cake
    db $01              ;Sophisticated mimic
    db $03              ;Purple Mook
    db $04              ;MultiArm
    db $08              ;Tough Guy

ShieldBonus:
    db $05
    db $10
    db $20
    db $25
    db $30
    db $35
    db $40
    db $45
    db $50

;List of enemy waves
EnemyWaveLookup:
    dw EnemyWave00
    dw EnemyWave01
    dw EnemyWave02
    dw EnemyWave03
    dw EnemyWave04
    dw EnemyWave05
    dw EnemyWave06
    dw EnemyWave07
    dw EnemyWave08
    dw EnemyWave09
    dw EnemyWave0A
    dw EnemyWave0B
    dw EnemyWave0C
    dw EnemyWave0D
    dw EnemyWave0E
    dw EnemyWave0F
    dw EnemyWave10
    dw EnemyWave11
    dw EnemyWave12
    dw EnemyWave13
    dw EnemyWave14
    dw EnemyWave15
    dw EnemyWave16
    dw EnemyWave17
    dw EnemyWave18
    dw EnemyWave19
    dw EnemyWave1A
    dw EnemyWave1B
    dw EnemyWave1C
    dw EnemyWave1D
    dw EnemyWave1E
    dw EnemyWave1F
    dw EnemyWave20
    dw EnemyWave21
    dw EnemyWave22
    dw EnemyWave23
    dw EnemyWave24
    dw EnemyWave25
    dw EnemyWave26
    dw EnemyWave27
    dw EnemyWave28
    dw EnemyWave29
    dw EnemyWave2A
    dw EnemyWave2B
    dw EnemyWave2C
    dw EnemyWave2D
    dw EnemyWave2E
    dw EnemyWave2F
    dw EnemyWave30
    dw EnemyWave31
    dw EnemyWave32
    dw EnemyWave33
    dw EnemyWave34
    dw EnemyWave35

;Enemy wave definitions
EnemyWave00:
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave01:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave02:
    db $06,$06,$02,$02,$02,$02,$06,$06
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave03:
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $03,$00,$03,$00,$03,$00,$03,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave04:
    db $03,$03,$06,$06,$06,$06,$03,$03
    db $03,$03,$06,$02,$02,$06,$03,$03
    db $03,$03,$06,$02,$02,$06,$03,$03
    db $02,$02,$00,$00,$00,$00,$02,$02
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave05:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave06:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $00,$06,$06,$00,$00,$06,$06,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave07:
    db $06,$02,$06,$02,$06,$02,$06,$02
    db $01,$02,$01,$02,$01,$02,$01,$02
    db $01,$02,$01,$02,$01,$02,$01,$02
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave08:
    db $06,$02,$03,$06,$02,$03,$06,$02
    db $03,$06,$02,$03,$06,$02,$03,$06
    db $02,$03,$06,$02,$03,$06,$02,$03
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave09:
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
EnemyWave0A:
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
EnemyWave0B:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave0C:
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
EnemyWave0D:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
EnemyWave0E:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
EnemyWave0F:
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave10:
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
EnemyWave11:
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
EnemyWave12:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
EnemyWave13:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
EnemyWave14:
    db $01,$05,$05,$07,$07,$05,$05,$01
    db $01,$01,$05,$07,$07,$05,$01,$01
    db $01,$05,$05,$07,$07,$05,$05,$01
    db $01,$01,$05,$07,$07,$05,$01,$01
    db $01,$05,$05,$07,$07,$05,$05,$01
EnemyWave15:
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave16:
    db $05,$07,$05,$07,$05,$07,$05,$07
    db $07,$05,$07,$05,$07,$05,$07,$05
    db $05,$07,$05,$07,$05,$07,$05,$07
    db $07,$05,$07,$05,$07,$05,$07,$05
    db $05,$07,$05,$07,$05,$07,$05,$07
EnemyWave17:
    db $02,$03,$04,$02,$02,$04,$03,$02
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $07,$05,$06,$08,$08,$06,$05,$07
EnemyWave18:
    db $02,$03,$02,$03,$02,$03,$02,$03
    db $03,$02,$03,$02,$03,$02,$03,$02
    db $02,$03,$02,$03,$02,$03,$02,$03
    db $03,$02,$03,$02,$03,$02,$03,$02
    db $02,$03,$02,$03,$02,$03,$02,$03
EnemyWave19:
    db $01,$00,$01,$00,$05,$00,$08,$00
    db $01,$00,$01,$00,$00,$00,$08,$00
    db $01,$01,$01,$00,$05,$00,$08,$00
    db $01,$00,$01,$00,$05,$00,$00,$00
    db $01,$00,$01,$00,$05,$00,$08,$00
EnemyWave1A:
    db $01,$01,$00,$02,$02,$02,$00,$00
    db $01,$01,$00,$02,$00,$00,$02,$00
    db $00,$00,$00,$02,$00,$00,$02,$00
    db $01,$01,$00,$02,$00,$00,$02,$00
    db $01,$01,$00,$02,$02,$02,$00,$00
EnemyWave1B:
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $01,$01,$01,$01,$01,$01,$01,$01
EnemyWave1C:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave1D:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave1E:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $02,$01,$01,$03,$02,$01,$01,$03
    db $03,$02,$01,$01,$03,$02,$01,$01
    db $01,$03,$02,$01,$01,$03,$02,$01
    db $01,$01,$03,$02,$01,$01,$03,$02
EnemyWave1F:
    db $06,$03,$06,$04,$06,$03,$06,$04
    db $03,$06,$04,$06,$03,$06,$04,$06
    db $06,$04,$06,$03,$06,$04,$06,$03
    db $04,$06,$03,$06,$04,$06,$03,$06
    db $06,$03,$06,$04,$06,$03,$06,$04
EnemyWave20:
    db $07,$05,$05,$02,$02,$05,$05,$07
    db $05,$07,$05,$02,$02,$05,$07,$05
    db $05,$05,$07,$02,$02,$07,$05,$05
    db $05,$07,$05,$02,$02,$05,$07,$05
    db $07,$05,$05,$02,$02,$05,$05,$07
EnemyWave21:
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $08,$07,$06,$05,$04,$03,$02,$01
    db $08,$07,$06,$05,$04,$03,$02,$01
EnemyWave22:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $05,$05,$05,$05,$05,$05,$05,$05
EnemyWave23:
    db $00,$05,$05,$05,$05,$05,$05,$00
    db $05,$05,$04,$04,$04,$04,$05,$05
    db $05,$04,$03,$02,$02,$03,$04,$05
    db $05,$05,$04,$04,$04,$04,$05,$05
    db $00,$05,$05,$05,$05,$05,$05,$00
EnemyWave24:
    db $01,$02,$03,$06,$06,$03,$02,$01
    db $01,$02,$03,$06,$06,$03,$02,$01
    db $01,$02,$03,$06,$06,$03,$02,$01
    db $01,$02,$03,$06,$06,$03,$02,$01
    db $01,$02,$03,$06,$06,$03,$02,$01
EnemyWave25:
    db $05,$05,$08,$05,$05,$08,$05,$05
    db $05,$05,$08,$05,$05,$08,$05,$05
    db $07,$05,$08,$05,$05,$08,$05,$07
    db $07,$05,$05,$05,$05,$05,$05,$07
    db $00,$07,$07,$07,$07,$07,$07,$00
EnemyWave26:
    db $05,$01,$05,$01,$01,$05,$01,$05
    db $01,$02,$01,$02,$02,$01,$02,$01
    db $05,$01,$03,$01,$01,$03,$01,$05
    db $00,$05,$01,$05,$05,$01,$05,$00
    db $00,$00,$05,$00,$00,$05,$00,$00
EnemyWave27:
    db $01,$01,$01,$01,$05,$05,$05,$05
    db $02,$02,$02,$02,$04,$04,$04,$04
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $04,$04,$04,$04,$02,$02,$02,$02
    db $05,$05,$05,$05,$01,$01,$01,$01
EnemyWave28:
    db $05,$05,$02,$02,$02,$02,$05,$05
    db $05,$05,$02,$02,$02,$02,$05,$05
    db $05,$05,$02,$02,$02,$02,$05,$05
    db $05,$05,$02,$02,$02,$02,$05,$05
    db $05,$05,$02,$02,$02,$02,$05,$05
EnemyWave29:
    db $07,$07,$02,$02,$07,$07,$02,$02
    db $07,$07,$02,$02,$07,$07,$02,$02
    db $07,$07,$02,$02,$07,$07,$02,$02
    db $07,$07,$02,$02,$07,$07,$02,$02
    db $07,$07,$02,$02,$07,$07,$02,$02
EnemyWave2A:
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$03,$03,$03,$03,$03,$03,$05
    db $05,$03,$03,$03,$03,$03,$03,$05
    db $05,$03,$03,$03,$03,$03,$03,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
EnemyWave2B:
    db $02,$02,$02,$08,$08,$02,$02,$02
    db $02,$02,$02,$08,$08,$02,$02,$02
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $02,$02,$02,$08,$08,$02,$02,$02
    db $02,$02,$02,$08,$08,$02,$02,$02
EnemyWave2C:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
EnemyWave2D:
    db $03,$03,$02,$02,$02,$02,$04,$04
    db $03,$03,$02,$02,$02,$02,$04,$04
    db $03,$03,$02,$02,$02,$02,$04,$04
    db $03,$03,$02,$02,$02,$02,$04,$04
    db $03,$03,$02,$02,$02,$02,$04,$04
EnemyWave2E:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
EnemyWave2F:
    db $07,$01,$07,$01,$07,$01,$07,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $07,$01,$07,$01,$07,$01,$07,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $07,$01,$07,$01,$07,$01,$07,$01
EnemyWave30:
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$06,$06,$00,$00,$00
    db $00,$00,$06,$04,$04,$06,$00,$00
    db $00,$06,$04,$04,$04,$04,$06,$00
    db $06,$06,$06,$06,$06,$06,$06,$06
EnemyWave31:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $00,$08,$05,$05,$05,$05,$08,$00
    db $00,$00,$08,$05,$05,$08,$00,$00
    db $00,$00,$00,$08,$08,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave32:
    db $01,$03,$04,$03,$01,$03,$04,$03
    db $01,$03,$04,$03,$01,$03,$04,$03
    db $01,$03,$04,$03,$01,$03,$04,$03
    db $01,$03,$04,$03,$01,$03,$04,$03
    db $01,$03,$04,$03,$01,$03,$04,$03
EnemyWave33:
    db $02,$07,$08,$07,$02,$07,$08,$07
    db $02,$07,$08,$07,$02,$07,$08,$07
    db $02,$07,$08,$07,$02,$07,$08,$07
    db $02,$07,$08,$07,$02,$07,$08,$07
    db $02,$07,$08,$07,$02,$07,$08,$07
EnemyWave34:
    db $05,$06,$05,$06,$05,$06,$05,$06
    db $06,$05,$06,$05,$06,$05,$06,$05
    db $05,$06,$05,$06,$05,$06,$05,$06
    db $06,$05,$06,$05,$06,$05,$06,$05
    db $05,$06,$05,$06,$05,$06,$05,$06
EnemyWave35:
    db $01,$04,$01,$04,$01,$04,$01,$04
    db $04,$01,$04,$01,$04,$01,$04,$01
    db $01,$04,$01,$04,$01,$04,$01,$04
    db $04,$01,$04,$01,$04,$01,$04,$01
    db $01,$04,$01,$04,$01,$04,$01,$04

;List of positions that an enemy tile is in on the tilemap
EnemyTilemapPos:
    for y = 0..!EnemyRows
        for x = 0..!EnemyCols
            dw (!x*3)+(!y*96)
        endfor
    endfor

;List of PIXEL positions that an enemy tile is in on the tilemap
EnemyPixelPos:
    for y = 0..!EnemyRows
        for x = 0..!EnemyCols
            db $8*(!x*3)
            db $8*(!y*3)
        endfor
    endfor

EnemyRowPos:
    for x = 0..!EnemyCols+1
        db (!x*24)-4
    endfor

EnemyVramOff:
    dw $0000
    dw $0400
    dw $0800
    dw $0C00

EnemyFrameOffset:
    db $00
    db $02
    db $04
    db $06
    db $06
    db $04
    db $02
    db $00

PlayerExplosionSpeedX:
    db $00
    db $00
    db $00
    db $FF
    db $FF
    
PlayerExplosionSpeedFineX:
    db $E0
    db $80
    db $00
    db $80
    db $20

PlayerExplosionSpeedY:
    db $FF
    db $FF
    db $FF
    db $FF
    db $FF

PlayerExplosionSpeedFineY:
    db $80
    db $40
    db $10
    db $40
    db $80

EnemyShootTypes:
    db $00              ;Empty
    db $00              ;Basic Squelcher
    db $01              ;Metal Rocketeer
    db $01              ;Boxy Greenback
    db $01              ;Mind Cake
    db $01              ;Sophisticated mimic
    db $01              ;Purple Mook
    db $01              ;MultiArm
    db $01              ;Tough Guy

BulletTypesTable:
    db $00              ;Empty
    db $00              ;Basic Squelcher
    db $00              ;Metal Rocketeer
    db $01              ;Boxy Greenback
    db $03              ;Mind Cake
    db $02              ;Sophisticated mimic
    db $00              ;Purple Mook
    db $01              ;MultiArm
    db $02              ;Tough Guy

BulletTypeTiles:
    db !EBulletF1
    db !EBulletF1+1
    db !EBulletF1+2
    db !EBulletF1+1
    db !EBullet2F1
    db !EBullet2F1+1
    db !EBullet2F1+2
    db !EBullet2F1+1
    db !EBullet3F1
    db !EBullet3F1+1
    db !EBullet3F1+2
    db !EBullet3F1+1
    db !EBullet4F1
    db !EBullet4F1+1
    db !EBullet4F1+2
    db !EBullet4F1+1

BG1ColTable:
    db $40          ;Scanline counter    
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter    
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03          ;Scanline counter
    db $03
    
BG2ColTable:
    db $10          ;Scanline counter
    db $0C          ;Scanline counter
    db $08          ;Scanline counter
    db $06          ;Scanline counter
    db $04          ;Scanline counter
    db $04          ;Scanline counter
    db $03          ;Scanline counter
    db $02          ;Scanline counter
    db $01          ;Scanline counter
    db $40          ;Scanline counter
    db $00
    
BG3ColTable:
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $0A          ;Scanline counter
    db $00

BG4ColTable:
    db $05          ;Scanline counter
    db $05          ;Scanline counter
    db $05          ;Scanline counter
    db $05          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $06          ;Scanline counter
    db $00

BG5ColTable:
    ;Sky
    db $08      ;Scanline
    db $08      ;Scanline
    db $08      ;Scanline
    db $08      ;Scanline
    db $07      ;Scanline
    db $07      ;Scanline
    db $06      ;Scanline
    db $06      ;Scanline
    db $05      ;Scanline
    db $05      ;Scanline
    db $04      ;Scanline
    db $04      ;Scanline
    db $03      ;Scanline
    db $02      ;Scanline
    db $01      ;Scanline

    ;Desert
    db $02      ;Scanline
    db $03      ;Scanline
    db $03      ;Scanline
    db $04      ;Scanline
    db $05      ;Scanline
    db $06      ;Scanline
    db $07      ;Scanline
    db $08      ;Scanline
    db $09      ;Scanline
    db $0A      ;Scanline
    db $0C      ;Scanline

BG6ColTable:
    db $08      ;Scanline
    db $08      ;Scanline
    db $07      ;Scanline
    db $06      ;Scanline
    db $05      ;Scanline
    db $04      ;Scanline
    db $03      ;Scanline
    db $03      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $01      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline
    db $02      ;Scanline

    db $01      ;Scanline
    db $00
BG6ColTableEnd:

BG8ColTable:
    db $04
    db $04
    db $04
    db $04
    db $04
    db $04
    db $04
    db $04
    db $04
    db $03
    db $03
    db $03
    db $03
    db $03
    db $03
    db $03

BG7ColTable:
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $01
	db $00

BG7ScrollScan:
	db $01
	db $0A
	db $0C
	db $20
	db $18
	db $20
	db $10

BG7ScrollDiv:
	db $01
	db $06
	db $0C
	db $10
	db $20
	db $60
	db $70

BG8ScrollDiv:
    db $05
    db $04
    db $03
    db $02
    db $01

    db $01
    db $02
    db $03
    db $04
    db $05

    ;1 for if the current layer should have a double write, 0 instead of a single write
BG8ScrollLayerSize:
    db $00
    db $00
    db $00
    db $01
    db $01
    db $01

BG8RocksSpeed:
    dw $007F^$FFFF
    dw $0074^$FFFF
    dw $0062^$FFFF
    dw $006A^$FFFF
    dw $005A^$FFFF
    dw $005C^$FFFF
    dw $0036^$FFFF
    dw $0024^$FFFF

BG8RockTiles:
    db !CRock1
    db !CRock2
    db !CRock5
    db !CRock6
    db !CRock1
    db !CRock2
    db !CRock3
    db !CRock4

BG8RockAttr:
    db !CliffRockAttr
    db !CliffRockAttr
    db !CliffRockAttr
    db !CliffRockAttr
    db !CliffRockAttr|$40
    db !CliffRockAttr|$40
    db !CliffRockAttr
    db !CliffRockAttr

BG8RockBigFlag:
    db $00
    db $00
    db $00
    db $00
    db $00
    db $00
    db $FF
    db $FF

HScoreWindow:
    db $0C
    dw $00FF
    db $10
    dw $E414
    db $0C
    dw $00FF
    db $60
    dw $E414
    db $04
    dw $00FF
    db $10
    dw $CC24
    db $01
    dw $00FF
    db $00

IntroWindow:
    db $7F
    dw $00FF
    db $18
    dw $00FF
    db $49
    dw $F010
    db $01
    dw $00FF
    db $00

OptionGradOff:
    db $00
    db $10
    db $20
    db $30
    db $40
    db $50
    db $60
    db $70
    db $70
    db $70
    db $60
    db $50
    db $40
    db $30
    db $20
    db $10

OptionGrad1:
    dw $7FBF
    dw $7F1F
    dw $7E9E
    dw $69F9
    dw $5995
    dw $4911
    dw $0000
    dw $0000

OptionGrad2:
    dw $771D
    dw $769D
    dw $761D
    dw $5D97
    dw $5133
    dw $40D0
    dw $0000
    dw $0000

OptionGrad3:
    dw $6A9A
    dw $6A1A
    dw $69BA
    dw $5135
    dw $40D1
    dw $348D
    dw $0000
    dw $0000

OptionGrad4:
    dw $5E18
    dw $5998
    dw $5938
    dw $40D2
    dw $348F
    dw $284B
    dw $0000
    dw $0000

OptionGrad5:
    dw $51B5
    dw $4D35
    dw $48F5
    dw $3490
    dw $284C
    dw $1C28
    dw $0000
    dw $0000

OptionGrad6:
    dw $4153
    dw $3CD3
    dw $3C93
    dw $284D
    dw $1C2A
    dw $1006
    dw $0000
    dw $0000

OptionGrad7:
    dw $34F0
    dw $30B0
    dw $2C70
    dw $1C2B
    dw $1007
    dw $0803
    dw $0000
    dw $0000

OptionGrad8:
    dw $28AE
    dw $246E
    dw $202E
    dw $1008
    dw $0805
    dw $0001
    dw $0000
    dw $0000

ShieldTileTable:
    ;Dead
    db $00
    db $00
    db $00
    db $00
    ;Severely damaged
    db $7E
    db $7F
    db $7F
    db $7E
    ;Severely damaged 2
    db $7D^$01
    db $7C^$01
    db $7C^$01
    db $7D^$01
    ;Moderately damaged
    db $7B^$01
    db $7A^$01
    db $7A^$01
    db $7B^$01
    ;Moderately damaged
    db $79^$01
    db $78^$01
    db $78^$01
    db $79^$01
    ;Partially damaged
    db $77^$01
    db $76^$01
    db $76^$01
    db $77^$01
    ;Partially damaged
    db $75^$01
    db $74^$01
    db $74^$01
    db $75^$01
    ;Full health
    db $73^$01
    db $72^$01
    db $72^$01
    db $73^$01
    ;Full health
    db $71^$01
    db $70^$01
    db $70^$01
    db $71^$01

ShieldExplosionTileTable:
    db $55+45
    db $54+45
    db $53+45
    db $52+45
    db $51+45
    db $50+45
    db $4F+45
    db $4E+45

WBitmask:
    dw $0001
    dw $0002
    dw $0004
    dw $0008
    dw $0010
    dw $0020
    dw $0040
    dw $0080
    dw $0100
    dw $0200
    dw $0400
    dw $0800
    dw $1000
    dw $2000
    dw $4000
    dw $8000

    ;Big flag lookup for table
SpriteTableMask:
    db $02
    db $08
    db $20
    db $80

    ;9th X bit lookup
SpriteTablePosMask:
    db $01
    db $04
    db $10
    db $40

StarParticleSize:
    db $04
    db $06
    db $08
    db $0A
    db $0C
    db $0E
    db $10
    db $12

StarParticleSpeed:
    db $0A
    db $12
    db $17
    db $21
    db $26
    db $2C
    db $38
    db $44

StarPrio:
    db $00
    db $00
    db $00
    db $00
    db $10
    db $10
    db $10
    db $10

PalFadeMask:
    for x = 0..32
        dw $0421*!x
    endfor

HighscoreVMode:
    db $7F
    db $09
    db $20
    db $09
    db $01
    db $07
    db $00

HighscoreTextBG:
    db $0E
    db $00
    
    db $0A
    db $DC

    db $01
    db $00
    
    db $4C
    db $DC
    
    db $01
    db $00
    db $00

TrophyChar:
    db $00
    db $29
    db $2A
    db $2B

TwinkleFrame3rd:
    db $04
    db $05
    db $06
TwinkleFrame2nd:
    db $07
    db $08
    db $09
TwinkleFrame1st:
    db $0A
    db $0B
    db $0C

UFOPartTiles:
    db $3B
    db $3A
    db $39
    db $38
    db $4B
    db $4A
    db $49
    db $48

UFOPartXSpeed:
    db $02
    db $01
    db $01^$FFFF
    db $02^$FFFF
    db $03
    db $02
    db $02^$FFFF
    db $03^$FFFF
    
UFOPartYSpeed:
    dw !UFOPartGravity
    dw !UFOPartGravity
    dw !UFOPartGravity
    dw !UFOPartGravity
    dw !UFOPartGravity+$0028
    dw !UFOPartGravity+$0028
    dw !UFOPartGravity+$0028
    dw !UFOPartGravity+$0028

StageTextChar:
    db $88
    db $88+$20
    db $86
    db $86+$20
    db $84
    db $84+$20
    db $82
    db $82+$20
    db $80
    db $80+$20

StageTextIndChar:
    db $8A
    db $8A+$20
    db $8C
    db $8C+$20
    db $8E
    db $8E+$20
    db $C0
    db $C0+$20
    db $C2
    db $C2+$20
    db $C4
    db $C4+$20
    db $C6
    db $C6+$20
    db $C8
    db $C8+$20
    db $CA
    db $CA+$20
    db $CC
    db $CC+$20

GameOverTextChar:
    db $00          ;G
    db $02          ;A
    db $04          ;M
    db $06          ;E
                    ;
    db $8A          ;O
    db $08          ;V
    db $06          ;E
    db $0A          ;R

ContinueTextChar:
    db $0C          ;C
    db $8A          ;O
    db $0E          ;N
    db $40          ;T
    db $42          ;I
    db $0E          ;N
    db $44          ;U
    db $06          ;E
    db $46          ;?
    
ContinueTextInd:
    db $8A
    db $48
    db $4A
    db $4C
    db $4E
    db $80
    db $82
    db $84
    db $86
    db $88

BG3CharTiles:
    db !BG3Char1
    db !BG3Char1
    db !BG3Char1
    db !BG3Char1
    db !BG3Char2
    db !BG3Char2
    db !BG3Char2
    db !BG3Char2
    db !BG3Char3
    db !BG3Char3
    db !BG3Char4
    db !BG3Char4
    db !BG3Char4
    db !BG3Char4
    db !BG3Char4
    db !BG3Char4

BG3CharAttr:
    db !BG3Char1Attr
    db !BG3Char1Attr
    db !BG3Char1Attr
    db !BG3Char1Attr
    db !BG3Char2Attr
    db !BG3Char2Attr
    db !BG3Char2Attr
    db !BG3Char2Attr
    db !BG3Char3Attr
    db !BG3Char3Attr
    db !BG3Char4Attr
    db !BG3Char4Attr
    db !BG3Char4Attr
    db !BG3Char4Attr
    db !BG3Char4Attr
    db !BG3Char4Attr

BG3OBJSpeed:
    db $20
    db $23
    db $26
    db $29

    db $50
    db $53
    db $56
    db $59

    db $60
    db $62

    db $80
    db $82
    db $83
    db $85
    db $87
    db $89

BG3StartX:
    for x = 0..16
        dw $0020+(!x*96)
    endfor

BG3StartY:
    db $70
    db $58
    db $64
    db $50
    
    db $50
    db $38
    db $44
    db $30

    db $22
    db $26
    db $24
    db $1C
    
    db $1A
    db $21
    db $1C
    db $19

HscoreCursorX:
	for t = 0..14
		db ($07+!t)*8
	endfor

HscoreCursorY:
	for t = 0..10
		db (($06+!t)*8)-1
	endfor

BHoleFrameTable:
    db !BHoleT8     ;Frame - 00
    db !BHoleT7     ;Frame - 01
    db !BHoleT6     ;Frame - 02
    db !BHoleT5     ;Frame - 03
    db !BHoleT4     ;Frame - 04
    db !BHoleT3     ;Frame - 05
    db !BHoleT2     ;Frame - 06
    db !BHoleT1     ;Frame - 07
    db !BHoleT1     ;Frame - 08
    db !BHoleT1     ;Frame - 09
    db !BHoleT1     ;Frame - 0A
    db !BHoleT1     ;Frame - 0B
    db !BHoleT1     ;Frame - 0C
    db !BHoleT1     ;Frame - 0D
    db !BHoleT1     ;Frame - 0E
    db !BHoleT1     ;Frame - 0F
    db !BHoleT1     ;Frame - 10
    db !BHoleT1     ;Frame - 11
    db !BHoleT1     ;Frame - 12
    db !BHoleT1     ;Frame - 13
    db !BHoleT1     ;Frame - 14
    db !BHoleT1     ;Frame - 15
    db !BHoleT1     ;Frame - 16
    db !BHoleT1     ;Frame - 17
    db !BHoleT1     ;Frame - 18
    db !BHoleT2     ;Frame - 19
    db !BHoleT3     ;Frame - 1A
    db !BHoleT4     ;Frame - 1B
    db !BHoleT5     ;Frame - 1C
    db !BHoleT6     ;Frame - 1D
    db !BHoleT7     ;Frame - 1E
    db !BHoleT8     ;Frame - 1F

BHoleXPos:
    db !BHoleX1     ;Frame - 00
    db !BHoleX1     ;Frame - 01
    db !BHoleX1     ;Frame - 02
    db !BHoleX1     ;Frame - 03
    db !BHoleX1     ;Frame - 04
    db !BHoleX1     ;Frame - 05
    db !BHoleX1     ;Frame - 06
    db !BHoleX1     ;Frame - 07
    db !BHoleX1     ;Frame - 08
    db !BHoleX1     ;Frame - 09
    db !BHoleX1     ;Frame - 0A
    db !BHoleX1     ;Frame - 0B
    db !BHoleX1     ;Frame - 0C
    db !BHoleX1     ;Frame - 0D
    db !BHoleX1     ;Frame - 0E
    db !BHoleX1     ;Frame - 0F
    db !BHoleX2     ;Frame - 10
    db !BHoleX2     ;Frame - 11
    db !BHoleX2     ;Frame - 12
    db !BHoleX2     ;Frame - 13
    db !BHoleX2     ;Frame - 14
    db !BHoleX2     ;Frame - 15
    db !BHoleX2     ;Frame - 16
    db !BHoleX2     ;Frame - 17
    db !BHoleX2     ;Frame - 18
    db !BHoleX2     ;Frame - 19
    db !BHoleX2     ;Frame - 1A
    db !BHoleX2     ;Frame - 1B
    db !BHoleX2     ;Frame - 1C
    db !BHoleX2     ;Frame - 1D
    db !BHoleX2     ;Frame - 1E
    db !BHoleX2     ;Frame - 1F

BHoleXPos2:
    db !BHoleX2     ;Frame - 00
    db !BHoleX2     ;Frame - 01
    db !BHoleX2     ;Frame - 02
    db !BHoleX2     ;Frame - 03
    db !BHoleX2     ;Frame - 04
    db !BHoleX2     ;Frame - 05
    db !BHoleX2     ;Frame - 06
    db !BHoleX2     ;Frame - 07
    db !BHoleX2     ;Frame - 08
    db !BHoleX2     ;Frame - 09
    db !BHoleX2     ;Frame - 0A
    db !BHoleX2     ;Frame - 0B
    db !BHoleX2     ;Frame - 0C
    db !BHoleX2     ;Frame - 0D
    db !BHoleX2     ;Frame - 0E
    db !BHoleX2     ;Frame - 0F
    db !BHoleX1     ;Frame - 10
    db !BHoleX1     ;Frame - 11
    db !BHoleX1     ;Frame - 12
    db !BHoleX1     ;Frame - 13
    db !BHoleX1     ;Frame - 14
    db !BHoleX1     ;Frame - 15
    db !BHoleX1     ;Frame - 16
    db !BHoleX1     ;Frame - 17
    db !BHoleX1     ;Frame - 18
    db !BHoleX1     ;Frame - 19
    db !BHoleX1     ;Frame - 1A
    db !BHoleX1     ;Frame - 1B
    db !BHoleX1     ;Frame - 1C
    db !BHoleX1     ;Frame - 1D
    db !BHoleX1     ;Frame - 1E
    db !BHoleX1     ;Frame - 1F

BHoleFrameAttr:
    db !BHoleAttr1  ;Frame - 00
    db !BHoleAttr1  ;Frame - 01
    db !BHoleAttr1  ;Frame - 02
    db !BHoleAttr1  ;Frame - 03
    db !BHoleAttr1  ;Frame - 04
    db !BHoleAttr1  ;Frame - 05
    db !BHoleAttr1  ;Frame - 06
    db !BHoleAttr1  ;Frame - 07
    db !BHoleAttr1  ;Frame - 08
    db !BHoleAttr1  ;Frame - 09
    db !BHoleAttr1  ;Frame - 0A
    db !BHoleAttr1  ;Frame - 0B
    db !BHoleAttr1  ;Frame - 0C
    db !BHoleAttr1  ;Frame - 0D
    db !BHoleAttr1  ;Frame - 0E
    db !BHoleAttr1  ;Frame - 0F
    db !BHoleAttr2  ;Frame - 10
    db !BHoleAttr2  ;Frame - 11
    db !BHoleAttr2  ;Frame - 12
    db !BHoleAttr2  ;Frame - 13
    db !BHoleAttr2  ;Frame - 14
    db !BHoleAttr2  ;Frame - 15
    db !BHoleAttr2  ;Frame - 16
    db !BHoleAttr2  ;Frame - 17
    db !BHoleAttr2  ;Frame - 18
    db !BHoleAttr2  ;Frame - 19
    db !BHoleAttr2  ;Frame - 1A
    db !BHoleAttr2  ;Frame - 1B
    db !BHoleAttr2  ;Frame - 1C
    db !BHoleAttr2  ;Frame - 1D
    db !BHoleAttr2  ;Frame - 1E
    db !BHoleAttr2  ;Frame - 1F

CloudWait:
    db $36
    db $30
    db $2C
    db $24
    db $26
    db $20
    db $4C
    db $44

CloudYPos:
    db $10
    db $10
    db $31
    db $31
    db $20
    db $20
    db $43
    db $43
    db $32
    db $32
    db $58
    db $58
    db $14
    db $14
    db $48
    db $48
    db $2C
    db $2C

CloudTileList:  
    db $C2
    db $C0

    db $C6
    db $C4

    db $CA
    db $C8

    db $CE
    db $CC

    db $C2
    db $C0

    db $C6
    db $C4

    db $CA
    db $C8

    db $CE
    db $CC

PlayerFrames:
    db !PlayerTile
    db !PlayerTile+2
    db !PlayerTile+4
    db !PlayerTile+2

SineTable:
db $00,$03,$06,$09,$0C,$10,$13,$16,$19,$1C
db $1F,$22,$25,$28,$2B,$2E,$31,$33,$36,$39
db $3C,$3F,$41,$44,$47,$49,$4C,$4E,$51,$53
db $55,$58,$5A,$5C,$5E,$60,$62,$64,$66,$68
db $6A,$6B,$6D,$6F,$70,$71,$73,$74,$75,$76
db $78,$79,$7A,$7A,$7B,$7C,$7D,$7D,$7E,$7E
db $7E,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E
db $7E,$7D,$7D,$7C,$7B,$7A,$7A,$79,$78,$76
db $75,$74,$73,$71,$70,$6F,$6D,$6B,$6A,$68
db $66,$64,$62,$60,$5E,$5C,$5A,$58,$55,$53
db $51,$4E,$4C,$49,$47,$44,$41,$3F,$3C,$39
db $36,$33,$31,$2E,$2B,$28,$25,$22,$1F,$1C
db $19,$16,$13,$10,$0C,$09,$06,$03,$00,$FD
db $FA,$F7,$F4,$F0,$ED,$EA,$E7,$E4,$E1,$DE
db $DB,$D8,$D5,$D2,$CF,$CD,$CA,$C7,$C4,$C1
db $BF,$BC,$B9,$B7,$B4,$B2,$AF,$AD,$AB,$A8
db $A6,$A4,$A2,$A0,$9E,$9C,$9A,$98,$96,$95
db $93,$91,$90,$8F,$8D,$8C,$8B,$8A,$88,$87
db $86,$86,$85,$84,$83,$83,$82,$82,$82,$81
db $81,$81,$81,$81,$81,$81,$82,$82,$82,$83
db $83,$84,$85,$86,$86,$87,$88,$8A,$8B,$8C
db $8D,$8F,$90,$91,$93,$95,$96,$98,$9A,$9C
db $9E,$A0,$A2,$A4,$A6,$A8,$AB,$AD,$AF,$B2
db $B4,$B7,$B9,$BC,$BF,$C1,$C4,$C7,$CA,$CD
db $CF,$D2,$D5,$D8,$DB,$DE,$E1,$E4,$E7,$EA
db $ED,$F0,$F4,$F7,$FA,$FD

UnSineTable:
db $7F,$82,$85,$88,$8B,$8F,$92,$95,$98,$9B
db $9E,$A1,$A4,$A7,$AA,$AD,$B0,$B2,$B5,$B8
db $BB,$BE,$C0,$C3,$C6,$C8,$CB,$CD,$D0,$D2
db $D4,$D7,$D9,$DB,$DD,$DF,$E1,$E3,$E5,$E7
db $E9,$EA,$EC,$EE,$EF,$F0,$F2,$F3,$F4,$F5
db $F7,$F8,$F9,$F9,$FA,$FB,$FC,$FC,$FD,$FD
db $FD,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FD,$FD
db $FD,$FC,$FC,$FB,$FA,$F9,$F9,$F8,$F7,$F5
db $F4,$F3,$F2,$F0,$EF,$EE,$EC,$EA,$E9,$E7
db $E5,$E3,$E1,$DF,$DD,$DB,$D9,$D7,$D4,$D2
db $D0,$CD,$CB,$C8,$C6,$C3,$C0,$BE,$BB,$B8
db $B5,$B2,$B0,$AD,$AA,$A7,$A4,$A1,$9E,$9B
db $98,$95,$92,$8F,$8B,$88,$85,$82,$7F,$7C
db $79,$76,$73,$6F,$6C,$69,$66,$63,$60,$5D
db $5A,$57,$54,$51,$4E,$4C,$49,$46,$43,$40
db $3E,$3B,$38,$36,$33,$31,$2E,$2C,$2A,$27
db $25,$23,$21,$1F,$1D,$1B,$19,$17,$15,$14
db $12,$10,$0F,$0E,$0C,$0B,$0A,$09,$07,$06
db $05,$05,$04,$03,$02,$02,$01,$01,$01,$00
db $00,$00,$00,$00,$00,$00,$01,$01,$01,$02
db $02,$03,$04,$05,$05,$06,$07,$09,$0A,$0B
db $0C,$0E,$0F,$10,$12,$14,$15,$17,$19,$1B
db $1D,$1F,$21,$23,$25,$27,$2A,$2C,$2E,$31
db $33,$36,$38,$3B,$3E,$40,$43,$46,$49,$4C
db $4E,$51,$54,$57,$5A,$5D,$60,$63,$66,$69
db $6C,$6F,$73,$76,$79,$7C

Sin16:
dw $0000,$0003,$0006,$0009,$000D,$0010,$0013
dw $0016,$0019,$001C,$001F,$0022,$0025,$0028
dw $002B,$002E,$0031,$0034,$0037,$003A,$003C
dw $003F,$0042,$0044,$0047,$004A,$004C,$004F
dw $0051,$0054,$0056,$0058,$005B,$005D,$005F
dw $0061,$0063,$0065,$0067,$0069,$006A,$006C
dw $006E,$006F,$0071,$0072,$0074,$0075,$0076
dw $0077,$0079,$007A,$007A,$007B,$007C,$007D
dw $007E,$007E,$007F,$007F,$007F,$0080,$0080
dw $0080,$0080,$0080,$0080,$0080,$007F,$007F
dw $007F,$007E,$007E,$007D,$007C,$007B,$007A
dw $007A,$0079,$0077,$0076,$0075,$0074,$0072
dw $0071,$006F,$006E,$006C,$006A,$0069,$0067
dw $0065,$0063,$0061,$005F,$005D,$005B,$0058
dw $0056,$0054,$0051,$004F,$004C,$004A,$0047
dw $0044,$0042,$003F,$003C,$003A,$0037,$0034
dw $0031,$002E,$002B,$0028,$0025,$0022,$001F
dw $001C,$0019,$0016,$0013,$0010,$000D,$0009
dw $0006,$0003,$0000,$FFFD,$FFFA,$FFF7,$FFF3
dw $FFF0,$FFED,$FFEA,$FFE7,$FFE4,$FFE1,$FFDE
dw $FFDB,$FFD8,$FFD5,$FFD2,$FFCF,$FFCC,$FFC9
dw $FFC6,$FFC4,$FFC1,$FFBE,$FFBC,$FFB9,$FFB6
dw $FFB4,$FFB1,$FFAF,$FFAC,$FFAA,$FFA8,$FFA5
dw $FFA3,$FFA1,$FF9F,$FF9D,$FF9B,$FF99,$FF97
dw $FF96,$FF94,$FF92,$FF91,$FF8F,$FF8E,$FF8C
dw $FF8B,$FF8A,$FF89,$FF87,$FF86,$FF86,$FF85
dw $FF84,$FF83,$FF82,$FF82,$FF81,$FF81,$FF81
dw $FF80,$FF80,$FF80,$FF80,$FF80,$FF80,$FF80
dw $FF81,$FF81,$FF81,$FF82,$FF82,$FF83,$FF84
dw $FF85,$FF86,$FF86,$FF87,$FF89,$FF8A,$FF8B
dw $FF8C,$FF8E,$FF8F,$FF91,$FF92,$FF94,$FF96
dw $FF97,$FF99,$FF9B,$FF9D,$FF9F,$FFA1,$FFA3
dw $FFA5,$FFA8,$FFAA,$FFAC,$FFAF,$FFB1,$FFB4
dw $FFB6,$FFB9,$FFBC,$FFBE,$FFC1,$FFC4,$FFC6
dw $FFC9,$FFCC,$FFCF,$FFD2,$FFD5,$FFD8,$FFDB
dw $FFDE,$FFE1,$FFE4,$FFE7,$FFEA,$FFED,$FFF0
dw $FFF3,$FFF7,$FFFA,$FFFD

Cos16:
dw $0080,$0080,$0080,$0080,$007F,$007F,$007F
dw $007E,$007E,$007D,$007C,$007B,$007A,$007A
dw $0079,$0077,$0076,$0075,$0074,$0072,$0071
dw $006F,$006E,$006C,$006A,$0069,$0067,$0065
dw $0063,$0061,$005F,$005D,$005B,$0058,$0056
dw $0054,$0051,$004F,$004C,$004A,$0047,$0044
dw $0042,$003F,$003C,$003A,$0037,$0034,$0031
dw $002E,$002B,$0028,$0025,$0022,$001F,$001C
dw $0019,$0016,$0013,$0010,$000D,$0009,$0006
dw $0003,$0000,$FFFD,$FFFA,$FFF7,$FFF3,$FFF0
dw $FFED,$FFEA,$FFE7,$FFE4,$FFE1,$FFDE,$FFDB
dw $FFD8,$FFD5,$FFD2,$FFCF,$FFCC,$FFC9,$FFC6
dw $FFC4,$FFC1,$FFBE,$FFBC,$FFB9,$FFB6,$FFB4
dw $FFB1,$FFAF,$FFAC,$FFAA,$FFA8,$FFA5,$FFA3
dw $FFA1,$FF9F,$FF9D,$FF9B,$FF99,$FF97,$FF96
dw $FF94,$FF92,$FF91,$FF8F,$FF8E,$FF8C,$FF8B
dw $FF8A,$FF89,$FF87,$FF86,$FF86,$FF85,$FF84
dw $FF83,$FF82,$FF82,$FF81,$FF81,$FF81,$FF80
dw $FF80,$FF80,$FF80,$FF80,$FF80,$FF80,$FF81
dw $FF81,$FF81,$FF82,$FF82,$FF83,$FF84,$FF85
dw $FF86,$FF86,$FF87,$FF89,$FF8A,$FF8B,$FF8C
dw $FF8E,$FF8F,$FF91,$FF92,$FF94,$FF96,$FF97
dw $FF99,$FF9B,$FF9D,$FF9F,$FFA1,$FFA3,$FFA5
dw $FFA8,$FFAA,$FFAC,$FFAF,$FFB1,$FFB4,$FFB6
dw $FFB9,$FFBC,$FFBE,$FFC1,$FFC4,$FFC6,$FFC9
dw $FFCC,$FFCF,$FFD2,$FFD5,$FFD8,$FFDB,$FFDE
dw $FFE1,$FFE4,$FFE7,$FFEA,$FFED,$FFF0,$FFF3
dw $FFF7,$FFFA,$FFFD,$0000,$0003,$0006,$0009
dw $000D,$0010,$0013,$0016,$0019,$001C,$001F
dw $0022,$0025,$0028,$002B,$002E,$0031,$0034
dw $0037,$003A,$003C,$003F,$0042,$0044,$0047
dw $004A,$004C,$004F,$0051,$0054,$0056,$0058
dw $005B,$005D,$005F,$0061,$0063,$0065,$0067
dw $0069,$006A,$006C,$006E,$006F,$0071,$0072
dw $0074,$0075,$0076,$0077,$0079,$007A,$007A
dw $007B,$007C,$007D,$007E,$007E,$007F,$007F
dw $007F,$0080,$0080,$0080

HeatDist:
db $00,$00,$00,$00,$00,$00,$01,$01,$01,$01
db $01,$01,$01,$01,$01,$01,$01,$01,$02,$02
db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
db $02,$02,$02,$02,$02,$02,$02,$01,$01,$01
db $01,$01,$01,$01,$01,$01,$01,$01,$01,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
db $FF,$FF,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
db $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
db $FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$01,$01,$01,$01,$01,$01
db $01,$01,$01,$01,$01,$01,$02,$02,$02,$02
db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
db $02,$02,$02,$02,$02,$01,$01,$01,$01,$01
db $01,$01,$01,$01,$01,$01,$01,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FF
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
db $FF,$00,$00,$00,$00,$00


GalRingSinePtr:
    for t = 0..!SpiralArmCount
        dw GalRingX0
    endfor
    for t = 0..!SpiralArmCount
        dw GalRingX1
    endfor
    for t = 0..!SpiralArmCount
        dw GalRingX2
    endfor
    for t = 0..!SpiralArmCount
        dw GalRingX3
    endfor
    for t = 0..!SpiralArmCount
        dw GalRingX4
    endfor

;Amp = 24
GalRingX0:
dw $0000,$0001,$0001,$0002,$0002,$0003,$0004
dw $0004,$0005,$0005,$0006,$0006,$0007,$0008
dw $0008,$0009,$0009,$000A,$000A,$000B,$000B
dw $000C,$000C,$000D,$000D,$000E,$000E,$000F
dw $000F,$0010,$0010,$0011,$0011,$0011,$0012
dw $0012,$0013,$0013,$0013,$0014,$0014,$0014
dw $0015,$0015,$0015,$0015,$0016,$0016,$0016
dw $0016,$0017,$0017,$0017,$0017,$0017,$0017
dw $0018,$0018,$0018,$0018,$0018,$0018,$0018
dw $0018,$0018,$0018,$0018,$0018,$0018,$0018
dw $0018,$0018,$0018,$0017,$0017,$0017,$0017
dw $0017,$0017,$0016,$0016,$0016,$0016,$0015
dw $0015,$0015,$0015,$0014,$0014,$0014,$0013
dw $0013,$0013,$0012,$0012,$0011,$0011,$0011
dw $0010,$0010,$000F,$000F,$000E,$000E,$000D
dw $000D,$000C,$000C,$000B,$000B,$000A,$000A
dw $0009,$0009,$0008,$0008,$0007,$0006,$0006
dw $0005,$0005,$0004,$0004,$0003,$0002,$0002
dw $0001,$0001,$0000,$FFFF,$FFFF,$FFFE,$FFFE
dw $FFFD,$FFFC,$FFFC,$FFFB,$FFFB,$FFFA,$FFFA
dw $FFF9,$FFF8,$FFF8,$FFF7,$FFF7,$FFF6,$FFF6
dw $FFF5,$FFF5,$FFF4,$FFF4,$FFF3,$FFF3,$FFF2
dw $FFF2,$FFF1,$FFF1,$FFF0,$FFF0,$FFEF,$FFEF
dw $FFEF,$FFEE,$FFEE,$FFED,$FFED,$FFED,$FFEC
dw $FFEC,$FFEC,$FFEB,$FFEB,$FFEB,$FFEB,$FFEA
dw $FFEA,$FFEA,$FFEA,$FFE9,$FFE9,$FFE9,$FFE9
dw $FFE9,$FFE9,$FFE8,$FFE8,$FFE8,$FFE8,$FFE8
dw $FFE8,$FFE8,$FFE8,$FFE8,$FFE8,$FFE8,$FFE8
dw $FFE8,$FFE8,$FFE8,$FFE8,$FFE8,$FFE9,$FFE9
dw $FFE9,$FFE9,$FFE9,$FFE9,$FFEA,$FFEA,$FFEA
dw $FFEA,$FFEB,$FFEB,$FFEB,$FFEB,$FFEC,$FFEC
dw $FFEC,$FFED,$FFED,$FFED,$FFEE,$FFEE,$FFEF
dw $FFEF,$FFEF,$FFF0,$FFF0,$FFF1,$FFF1,$FFF2
dw $FFF2,$FFF3,$FFF3,$FFF4,$FFF4,$FFF5,$FFF5
dw $FFF6,$FFF6,$FFF7,$FFF7,$FFF8,$FFF8,$FFF9
dw $FFFA,$FFFA,$FFFB,$FFFB,$FFFC,$FFFC,$FFFD
dw $FFFE,$FFFE,$FFFF,$FFFF

;Amp = 48
GalRingX1:
dw $0000,$0001,$0002,$0004,$0005,$0006,$0007
dw $0008,$0009,$000B,$000C,$000D,$000E,$000F
dw $0010,$0011,$0012,$0013,$0015,$0016,$0017
dw $0018,$0019,$001A,$001B,$001C,$001D,$001E
dw $001E,$001F,$0020,$0021,$0022,$0023,$0024
dw $0024,$0025,$0026,$0027,$0027,$0028,$0029
dw $0029,$002A,$002A,$002B,$002B,$002C,$002C
dw $002D,$002D,$002E,$002E,$002E,$002F,$002F
dw $002F,$002F,$002F,$0030,$0030,$0030,$0030
dw $0030,$0030,$0030,$0030,$0030,$0030,$0030
dw $002F,$002F,$002F,$002F,$002F,$002E,$002E
dw $002E,$002D,$002D,$002C,$002C,$002B,$002B
dw $002A,$002A,$0029,$0029,$0028,$0027,$0027
dw $0026,$0025,$0024,$0024,$0023,$0022,$0021
dw $0020,$001F,$001E,$001E,$001D,$001C,$001B
dw $001A,$0019,$0018,$0017,$0016,$0015,$0013
dw $0012,$0011,$0010,$000F,$000E,$000D,$000C
dw $000B,$0009,$0008,$0007,$0006,$0005,$0004
dw $0002,$0001,$0000,$FFFF,$FFFE,$FFFC,$FFFB
dw $FFFA,$FFF9,$FFF8,$FFF7,$FFF5,$FFF4,$FFF3
dw $FFF2,$FFF1,$FFF0,$FFEF,$FFEE,$FFED,$FFEB
dw $FFEA,$FFE9,$FFE8,$FFE7,$FFE6,$FFE5,$FFE4
dw $FFE3,$FFE2,$FFE2,$FFE1,$FFE0,$FFDF,$FFDE
dw $FFDD,$FFDC,$FFDC,$FFDB,$FFDA,$FFD9,$FFD9
dw $FFD8,$FFD7,$FFD7,$FFD6,$FFD6,$FFD5,$FFD5
dw $FFD4,$FFD4,$FFD3,$FFD3,$FFD2,$FFD2,$FFD2
dw $FFD1,$FFD1,$FFD1,$FFD1,$FFD1,$FFD0,$FFD0
dw $FFD0,$FFD0,$FFD0,$FFD0,$FFD0,$FFD0,$FFD0
dw $FFD0,$FFD0,$FFD1,$FFD1,$FFD1,$FFD1,$FFD1
dw $FFD2,$FFD2,$FFD2,$FFD3,$FFD3,$FFD4,$FFD4
dw $FFD5,$FFD5,$FFD6,$FFD6,$FFD7,$FFD7,$FFD8
dw $FFD9,$FFD9,$FFDA,$FFDB,$FFDC,$FFDC,$FFDD
dw $FFDE,$FFDF,$FFE0,$FFE1,$FFE2,$FFE2,$FFE3
dw $FFE4,$FFE5,$FFE6,$FFE7,$FFE8,$FFE9,$FFEA
dw $FFEB,$FFED,$FFEE,$FFEF,$FFF0,$FFF1,$FFF2
dw $FFF3,$FFF4,$FFF5,$FFF7,$FFF8,$FFF9,$FFFA
dw $FFFB,$FFFC,$FFFE,$FFFF

;Amp = 64
GalRingX2:
dw $0000,$0002,$0003,$0005,$0006,$0008,$0009
dw $000B,$000C,$000E,$0010,$0011,$0013,$0014
dw $0016,$0017,$0018,$001A,$001B,$001D,$001E
dw $0020,$0021,$0022,$0024,$0025,$0026,$0027
dw $0029,$002A,$002B,$002C,$002D,$002E,$002F
dw $0030,$0031,$0032,$0033,$0034,$0035,$0036
dw $0037,$0038,$0038,$0039,$003A,$003B,$003B
dw $003C,$003C,$003D,$003D,$003E,$003E,$003E
dw $003F,$003F,$003F,$0040,$0040,$0040,$0040
dw $0040,$0040,$0040,$0040,$0040,$0040,$0040
dw $003F,$003F,$003F,$003E,$003E,$003E,$003D
dw $003D,$003C,$003C,$003B,$003B,$003A,$0039
dw $0038,$0038,$0037,$0036,$0035,$0034,$0033
dw $0032,$0031,$0030,$002F,$002E,$002D,$002C
dw $002B,$002A,$0029,$0027,$0026,$0025,$0024
dw $0022,$0021,$0020,$001E,$001D,$001B,$001A
dw $0018,$0017,$0016,$0014,$0013,$0011,$0010
dw $000E,$000C,$000B,$0009,$0008,$0006,$0005
dw $0003,$0002,$0000,$FFFE,$FFFD,$FFFB,$FFFA
dw $FFF8,$FFF7,$FFF5,$FFF4,$FFF2,$FFF0,$FFEF
dw $FFED,$FFEC,$FFEA,$FFE9,$FFE8,$FFE6,$FFE5
dw $FFE3,$FFE2,$FFE0,$FFDF,$FFDE,$FFDC,$FFDB
dw $FFDA,$FFD9,$FFD7,$FFD6,$FFD5,$FFD4,$FFD3
dw $FFD2,$FFD1,$FFD0,$FFCF,$FFCE,$FFCD,$FFCC
dw $FFCB,$FFCA,$FFC9,$FFC8,$FFC8,$FFC7,$FFC6
dw $FFC5,$FFC5,$FFC4,$FFC4,$FFC3,$FFC3,$FFC2
dw $FFC2,$FFC2,$FFC1,$FFC1,$FFC1,$FFC0,$FFC0
dw $FFC0,$FFC0,$FFC0,$FFC0,$FFC0,$FFC0,$FFC0
dw $FFC0,$FFC0,$FFC1,$FFC1,$FFC1,$FFC2,$FFC2
dw $FFC2,$FFC3,$FFC3,$FFC4,$FFC4,$FFC5,$FFC5
dw $FFC6,$FFC7,$FFC8,$FFC8,$FFC9,$FFCA,$FFCB
dw $FFCC,$FFCD,$FFCE,$FFCF,$FFD0,$FFD1,$FFD2
dw $FFD3,$FFD4,$FFD5,$FFD6,$FFD7,$FFD9,$FFDA
dw $FFDB,$FFDC,$FFDE,$FFDF,$FFE0,$FFE2,$FFE3
dw $FFE5,$FFE6,$FFE8,$FFE9,$FFEA,$FFEC,$FFED
dw $FFEF,$FFF0,$FFF2,$FFF4,$FFF5,$FFF7,$FFF8
dw $FFFA,$FFFB,$FFFD,$FFFE

;Amp = 96
GalRingX3:
dw $0000,$0002,$0005,$0007,$0009,$000C,$000E
dw $0010,$0013,$0015,$0017,$001A,$001C,$001E
dw $0020,$0023,$0025,$0027,$0029,$002B,$002D
dw $002F,$0031,$0033,$0035,$0037,$0039,$003B
dw $003D,$003F,$0040,$0042,$0044,$0046,$0047
dw $0049,$004A,$004C,$004D,$004E,$0050,$0051
dw $0052,$0054,$0055,$0056,$0057,$0058,$0059
dw $005A,$005A,$005B,$005C,$005D,$005D,$005E
dw $005E,$005F,$005F,$005F,$0060,$0060,$0060
dw $0060,$0060,$0060,$0060,$0060,$0060,$005F
dw $005F,$005F,$005E,$005E,$005D,$005D,$005C
dw $005B,$005A,$005A,$0059,$0058,$0057,$0056
dw $0055,$0054,$0052,$0051,$0050,$004E,$004D
dw $004C,$004A,$0049,$0047,$0046,$0044,$0042
dw $0040,$003F,$003D,$003B,$0039,$0037,$0035
dw $0033,$0031,$002F,$002D,$002B,$0029,$0027
dw $0025,$0023,$0020,$001E,$001C,$001A,$0017
dw $0015,$0013,$0010,$000E,$000C,$0009,$0007
dw $0005,$0002,$0000,$FFFE,$FFFB,$FFF9,$FFF7
dw $FFF4,$FFF2,$FFF0,$FFED,$FFEB,$FFE9,$FFE6
dw $FFE4,$FFE2,$FFE0,$FFDD,$FFDB,$FFD9,$FFD7
dw $FFD5,$FFD3,$FFD1,$FFCF,$FFCD,$FFCB,$FFC9
dw $FFC7,$FFC5,$FFC3,$FFC1,$FFC0,$FFBE,$FFBC
dw $FFBA,$FFB9,$FFB7,$FFB6,$FFB4,$FFB3,$FFB2
dw $FFB0,$FFAF,$FFAE,$FFAC,$FFAB,$FFAA,$FFA9
dw $FFA8,$FFA7,$FFA6,$FFA6,$FFA5,$FFA4,$FFA3
dw $FFA3,$FFA2,$FFA2,$FFA1,$FFA1,$FFA1,$FFA0
dw $FFA0,$FFA0,$FFA0,$FFA0,$FFA0,$FFA0,$FFA0
dw $FFA0,$FFA1,$FFA1,$FFA1,$FFA2,$FFA2,$FFA3
dw $FFA3,$FFA4,$FFA5,$FFA6,$FFA6,$FFA7,$FFA8
dw $FFA9,$FFAA,$FFAB,$FFAC,$FFAE,$FFAF,$FFB0
dw $FFB2,$FFB3,$FFB4,$FFB6,$FFB7,$FFB9,$FFBA
dw $FFBC,$FFBE,$FFC0,$FFC1,$FFC3,$FFC5,$FFC7
dw $FFC9,$FFCB,$FFCD,$FFCF,$FFD1,$FFD3,$FFD5
dw $FFD7,$FFD9,$FFDB,$FFDD,$FFE0,$FFE2,$FFE4
dw $FFE6,$FFE9,$FFEB,$FFED,$FFF0,$FFF2,$FFF4
dw $FFF7,$FFF9,$FFFB,$FFFE

;Amp = 128
GalRingX4:
dw $0000,$0003,$0006,$0009,$000D,$0010,$0013
dw $0016,$0019,$001C,$001F,$0022,$0025,$0028
dw $002B,$002E,$0031,$0034,$0037,$003A,$003C
dw $003F,$0042,$0044,$0047,$004A,$004C,$004F
dw $0051,$0054,$0056,$0058,$005B,$005D,$005F
dw $0061,$0063,$0065,$0067,$0069,$006A,$006C
dw $006E,$006F,$0071,$0072,$0074,$0075,$0076
dw $0077,$0079,$007A,$007A,$007B,$007C,$007D
dw $007E,$007E,$007F,$007F,$007F,$0080,$0080
dw $0080,$0080,$0080,$0080,$0080,$007F,$007F
dw $007F,$007E,$007E,$007D,$007C,$007B,$007A
dw $007A,$0079,$0077,$0076,$0075,$0074,$0072
dw $0071,$006F,$006E,$006C,$006A,$0069,$0067
dw $0065,$0063,$0061,$005F,$005D,$005B,$0058
dw $0056,$0054,$0051,$004F,$004C,$004A,$0047
dw $0044,$0042,$003F,$003C,$003A,$0037,$0034
dw $0031,$002E,$002B,$0028,$0025,$0022,$001F
dw $001C,$0019,$0016,$0013,$0010,$000D,$0009
dw $0006,$0003,$0000,$FFFD,$FFFA,$FFF7,$FFF3
dw $FFF0,$FFED,$FFEA,$FFE7,$FFE4,$FFE1,$FFDE
dw $FFDB,$FFD8,$FFD5,$FFD2,$FFCF,$FFCC,$FFC9
dw $FFC6,$FFC4,$FFC1,$FFBE,$FFBC,$FFB9,$FFB6
dw $FFB4,$FFB1,$FFAF,$FFAC,$FFAA,$FFA8,$FFA5
dw $FFA3,$FFA1,$FF9F,$FF9D,$FF9B,$FF99,$FF97
dw $FF96,$FF94,$FF92,$FF91,$FF8F,$FF8E,$FF8C
dw $FF8B,$FF8A,$FF89,$FF87,$FF86,$FF86,$FF85
dw $FF84,$FF83,$FF82,$FF82,$FF81,$FF81,$FF81
dw $FF80,$FF80,$FF80,$FF80,$FF80,$FF80,$FF80
dw $FF81,$FF81,$FF81,$FF82,$FF82,$FF83,$FF84
dw $FF85,$FF86,$FF86,$FF87,$FF89,$FF8A,$FF8B
dw $FF8C,$FF8E,$FF8F,$FF91,$FF92,$FF94,$FF96
dw $FF97,$FF99,$FF9B,$FF9D,$FF9F,$FFA1,$FFA3
dw $FFA5,$FFA8,$FFAA,$FFAC,$FFAF,$FFB1,$FFB4
dw $FFB6,$FFB9,$FFBC,$FFBE,$FFC1,$FFC4,$FFC6
dw $FFC9,$FFCC,$FFCF,$FFD2,$FFD5,$FFD8,$FFDB
dw $FFDE,$FFE1,$FFE4,$FFE7,$FFEA,$FFED,$FFF0
dw $FFF3,$FFF7,$FFFA,$FFFD

Cos8Sign:
db $FE,$FE,$FE,$FE,$FD,$FD,$FD,$FC,$FC,$FB
db $FA,$F9,$F9,$F8,$F7,$F5,$F4,$F3,$F2,$F0
db $EF,$EE,$EC,$EA,$E9,$E7,$E5,$E3,$E1,$DF
db $DD,$DB,$D9,$D7,$D4,$D2,$D0,$CD,$CB,$C8
db $C6,$C3,$C0,$BE,$BB,$B8,$B5,$B2,$B0,$AD
db $AA,$A7,$A4,$A1,$9E,$9B,$98,$95,$92,$8F
db $8B,$88,$85,$82,$7F,$7C,$79,$76,$73,$6F
db $6C,$69,$66,$63,$60,$5D,$5A,$57,$54,$51
db $4E,$4C,$49,$46,$43,$40,$3E,$3B,$38,$36
db $33,$31,$2E,$2C,$2A,$27,$25,$23,$21,$1F
db $1D,$1B,$19,$17,$15,$14,$12,$10,$0F,$0E
db $0C,$0B,$0A,$09,$07,$06,$05,$05,$04,$03
db $02,$02,$01,$01,$01,$00,$00,$00,$00,$00
db $00,$00,$01,$01,$01,$02,$02,$03,$04,$05
db $05,$06,$07,$09,$0A,$0B,$0C,$0E,$0F,$10
db $12,$14,$15,$17,$19,$1B,$1D,$1F,$21,$23
db $25,$27,$2A,$2C,$2E,$31,$33,$36,$38,$3B
db $3E,$40,$43,$46,$49,$4C,$4E,$51,$54,$57
db $5A,$5D,$60,$63,$66,$69,$6C,$6F,$73,$76
db $79,$7C,$7F,$82,$85,$88,$8B,$8F,$92,$95
db $98,$9B,$9E,$A1,$A4,$A7,$AA,$AD,$B0,$B2
db $B5,$B8,$BB,$BE,$C0,$C3,$C6,$C8,$CB,$CD
db $D0,$D2,$D4,$D7,$D9,$DB,$DD,$DF,$E1,$E3
db $E5,$E7,$E9,$EA,$EC,$EE,$EF,$F0,$F2,$F3
db $F4,$F5,$F7,$F8,$F9,$F9,$FA,$FB,$FC,$FC
db $FD,$FD,$FD,$FE,$FE,$FE

;sin(8*pi*t/T)
WaterDist:
db $04,$04,$05,$05,$06,$06,$06,$07,$07,$07
db $07,$08,$08,$08,$08,$08,$08,$08,$08,$08
db $08,$08,$07,$07,$07,$07,$06,$06,$06,$05
db $05,$04,$04,$04,$03,$03,$02,$02,$02,$01
db $01,$01,$01,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02
db $02,$03,$03,$04,$04,$04,$05,$05,$06,$06
db $06,$07,$07,$07,$07,$08,$08,$08,$08,$08
db $08,$08,$08,$08,$08,$08,$07,$07,$07,$07
db $06,$06,$06,$05,$05,$04,$04,$04,$03,$03
db $02,$02,$02,$01,$01,$01,$01,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$01,$01
db $01,$01,$02,$02,$02,$03,$03,$04,$04,$04
db $05,$05,$06,$06,$06,$07,$07,$07,$07,$08
db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08
db $07,$07,$07,$07,$06,$06,$06,$05,$05,$04
db $04,$04,$03,$03,$02,$02,$02,$01,$01,$01
db $01,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$01,$01,$01,$01,$02,$02,$02,$03
db $03,$04,$04,$04,$05,$05,$06,$06,$06,$07
db $07,$07,$07,$08,$08,$08,$08,$08,$08,$08
db $08,$08,$08,$08,$07,$07,$07,$07,$06,$06
db $06,$05,$05,$04,$04,$04,$03,$03,$02,$02
db $02,$01,$01,$01,$01,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$01,$01,$01,$01
db $02,$02,$02,$03,$03,$04 

Cos8:
db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10
db $10,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0E,$0E
db $0E,$0E,$0E,$0E,$0D,$0D,$0D,$0D,$0C,$0C
db $0C,$0C,$0B,$0B,$0B,$0A,$0A,$0A,$0A,$09
db $09,$09,$08,$08,$08,$07,$07,$06,$06,$06
db $05,$05,$05,$04,$04,$04,$03,$03,$02,$02
db $02,$01,$01,$00,$00,$00,$FF,$FF,$FE,$FE
db $FE,$FD,$FD,$FC,$FC,$FC,$FB,$FB,$FB,$FA
db $FA,$FA,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F7
db $F6,$F6,$F6,$F6,$F5,$F5,$F5,$F4,$F4,$F4
db $F4,$F3,$F3,$F3,$F3,$F2,$F2,$F2,$F2,$F2
db $F2,$F1,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$F0
db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
db $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0,$F1
db $F1,$F1,$F1,$F1,$F1,$F1,$F2,$F2,$F2,$F2
db $F2,$F2,$F3,$F3,$F3,$F3,$F4,$F4,$F4,$F4
db $F5,$F5,$F5,$F6,$F6,$F6,$F6,$F7,$F7,$F7
db $F8,$F8,$F8,$F9,$F9,$FA,$FA,$FA,$FB,$FB
db $FB,$FC,$FC,$FC,$FD,$FD,$FE,$FE,$FE,$FF
db $FF,$00,$00,$00,$01,$01,$02,$02,$02,$03
db $03,$04,$04,$04,$05,$05,$05,$06,$06,$06
db $07,$07,$08,$08,$08,$09,$09,$09,$0A,$0A
db $0A,$0A,$0B,$0B,$0B,$0C,$0C,$0C,$0C,$0D
db $0D,$0D,$0D,$0E,$0E,$0E,$0E,$0E,$0E,$0F
db $0F,$0F,$0F,$0F,$0F,$0F,$10,$10,$10,$10
db $10,$10,$10,$10,$10,$10

;log(24/t)
SkewTable:
db $FF,$FF,$FF,$F2,$E2,$D6,$CB,$C3,$BC,$B5
db $AF,$AA,$A5,$A1,$9D,$99,$95,$92,$8F,$8C
db $89,$86,$84,$81,$7F,$7D,$7B,$79,$76,$75
db $73,$71,$6F,$6D,$6C,$6A,$69,$67,$66,$64
db $63,$61,$60,$5F,$5E,$5C,$5B,$5A,$59,$58
db $57,$55,$54,$53,$52,$51,$50,$4F,$4E,$4D
db $4C,$4C,$4B,$4A,$49,$48,$47,$46,$46,$45
db $44,$43,$42,$42,$41,$40,$3F,$3F,$3E,$3D
db $3D,$3C,$3B,$3B,$3A,$39,$39,$38,$37,$37
db $36,$35,$35,$34,$34,$33,$33,$32,$31,$31
db $30,$30,$2F,$2F,$2E,$2E,$2D,$2D,$2C,$2C
db $2B,$2B

;sin(2*pi*t/T)*(1-(t%2*2))
FogOffset:
db $00,$FD,$06,$F7,$0C,$F0,$13,$EA,$19,$E4
db $1F,$DE,$25,$D8,$2B,$D2,$31,$CD,$36,$C7
db $3C,$C1,$41,$BC,$47,$B7,$4C,$B2,$51,$AD
db $55,$A8,$5A,$A4,$5E,$A0,$62,$9C,$66,$98
db $6A,$95,$6D,$91,$70,$8F,$73,$8C,$75,$8A
db $78,$87,$7A,$86,$7B,$84,$7D,$83,$7E,$82
db $7E,$81,$7F,$81,$7F,$81,$7F,$81,$7E,$82
db $7E,$83,$7D,$84,$7B,$86,$7A,$87,$78,$8A
db $75,$8C,$73,$8F,$70,$91,$6D,$95,$6A,$98
db $66,$9C,$62,$A0,$5E,$A4,$5A,$A8,$55,$AD
db $51,$B2,$4C,$B7,$47,$BC,$41,$C1,$3C,$C7
db $36,$CD,$31,$D2,$2B,$D8,$25,$DE,$1F,$E4
db $19,$EA,$13,$F0,$0C,$F7,$06,$FD,$00,$03
db $FA,$09,$F4,$10,$ED,$16,$E7,$1C,$E1,$22
db $DB,$28,$D5,$2E,$CF,$33,$CA,$39,$C4,$3F
db $BF,$44,$B9,$49,$B4,$4E,$AF,$53,$AB,$58
db $A6,$5C,$A2,$60,$9E,$64,$9A,$68,$96,$6B
db $93,$6F,$90,$71,$8D,$74,$8B,$76,$88,$79
db $86,$7A,$85,$7C,$83,$7D,$82,$7E,$82,$7F
db $81,$7F,$81,$7F,$81,$7F,$82,$7E,$82,$7D
db $83,$7C,$85,$7A,$86,$79,$88,$76,$8B,$74
db $8D,$71,$90,$6F,$93,$6B,$96,$68,$9A,$64
db $9E,$60,$A2,$5C,$A6,$58,$AB,$53,$AF,$4E
db $B4,$49,$B9,$44,$BF,$3F,$C4,$39,$CA,$33
db $CF,$2E,$D5,$28,$DB,$22,$E1,$1C,$E7,$16
db $ED,$10,$F4,$09,$FA,$03

;Sigmoid curve, 0-127, 1/(1+pow(e,-(t-(T/2))/(T/16)))
Sigmoid:
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01
db $01,$01,$01,$01,$01,$01,$01,$01,$02,$02
db $02,$02,$02,$02,$02,$02,$03,$03,$03,$03
db $03,$04,$04,$04,$04,$04,$05,$05,$05,$06
db $06,$06,$07,$07,$08,$08,$09,$09,$0A,$0A
db $0B,$0B,$0C,$0D,$0E,$0E,$0F,$10,$11,$12
db $13,$14,$15,$16,$17,$18,$1A,$1B,$1C,$1E
db $1F,$21,$22,$24,$25,$27,$29,$2A,$2C,$2E
db $30,$32,$34,$36,$38,$3A,$3C,$3E,$3F,$41
db $43,$45,$47,$49,$4B,$4D,$4F,$51,$53,$55
db $56,$58,$5A,$5B,$5D,$5E,$60,$61,$63,$64
db $65,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F
db $70,$71,$71,$72,$73,$74,$74,$75,$75,$76
db $76,$77,$77,$78,$78,$79,$79,$79,$7A,$7A
db $7A,$7B,$7B,$7B,$7B,$7B,$7C,$7C,$7C,$7C
db $7C,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7E
db $7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E,$7E
db $7E,$7E,$7E,$7E,$7E,$7E,$7E,$7F,$7F,$7F
db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F
db $80,$80,$80,$80,$80,$80,$80,$80,$80,$80
db $80,$80,$80,$80,$80,$80

;sin(2*pi*t/T)
EnemyBullet3Wave:
db $00,$01,$02,$02,$03,$04,$04,$05,$06,$06
db $07,$07,$07,$08,$08,$08,$08,$08,$08,$08
db $07,$07,$07,$06,$06,$05,$04,$04,$03,$02
db $02,$01,$00,$FF,$FE,$FE,$FD,$FC,$FC,$FB
db $FA,$FA,$F9,$F9,$F9,$F8,$F8,$F8,$F8,$F8
db $F8,$F8,$F9,$F9,$F9,$FA,$FA,$FB,$FC,$FC
db $FD,$FE,$FE,$FF,$00,$01,$02,$02,$03,$04
db $04,$05,$06,$06,$07,$07,$07,$08,$08,$08
db $08,$08,$08,$08,$07,$07,$07,$06,$06,$05
db $04,$04,$03,$02,$02,$01,$00,$FF,$FE,$FE
db $FD,$FC,$FC,$FB,$FA,$FA,$F9,$F9,$F9,$F8
db $F8,$F8,$F8,$F8,$F8,$F8,$F9,$F9,$F9,$FA
db $FA,$FB,$FC,$FC,$FD,$FE,$FE,$FF,$00,$01
db $02,$02,$03,$04,$04,$05,$06,$06,$07,$07
db $07,$08,$08,$08,$08,$08,$08,$08,$07,$07
db $07,$06,$06,$05,$04,$04,$03,$02,$02,$01
db $00,$FF,$FE,$FE,$FD,$FC,$FC,$FB,$FA,$FA
db $F9,$F9,$F9,$F8,$F8,$F8,$F8,$F8,$F8,$F8
db $F9,$F9,$F9,$FA,$FA,$FB,$FC,$FC,$FD,$FE
db $FE,$FF,$00,$01,$02,$02,$03,$04,$04,$05
db $06,$06,$07,$07,$07,$08,$08,$08,$08,$08
db $08,$08,$07,$07,$07,$06,$06,$05,$04,$04
db $03,$02,$02,$01,$00,$FF,$FE,$FE,$FD,$FC
db $FC,$FB,$FA,$FA,$F9,$F9,$F9,$F8,$F8,$F8
db $F8,$F8,$F8,$F8,$F9,$F9,$F9,$FA,$FA,$FB
db $FC,$FC,$FD,$FE,$FE,$FF

;sin(4*pi*t/T)
EnemyBullet4Wave:
db $00,$01,$01,$02,$02,$03,$03,$04,$05,$05
db $06,$06,$07,$07,$08,$08,$08,$09,$09,$0A
db $0A,$0A,$0B,$0B,$0B,$0B,$0B,$0C,$0C,$0C
db $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0B,$0B
db $0B,$0B,$0B,$0A,$0A,$0A,$09,$09,$08,$08
db $08,$07,$07,$06,$06,$05,$05,$04,$03,$03
db $02,$02,$01,$01,$00,$FF,$FF,$FE,$FE,$FD
db $FD,$FC,$FB,$FB,$FA,$FA,$F9,$F9,$F8,$F8
db $F8,$F7,$F7,$F6,$F6,$F6,$F5,$F5,$F5,$F5
db $F5,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4
db $F4,$F4,$F5,$F5,$F5,$F5,$F5,$F6,$F6,$F6
db $F7,$F7,$F8,$F8,$F8,$F9,$F9,$FA,$FA,$FB
db $FB,$FC,$FD,$FD,$FE,$FE,$FF,$FF,$00,$01
db $01,$02,$02,$03,$03,$04,$05,$05,$06,$06
db $07,$07,$08,$08,$08,$09,$09,$0A,$0A,$0A
db $0B,$0B,$0B,$0B,$0B,$0C,$0C,$0C,$0C,$0C
db $0C,$0C,$0C,$0C,$0C,$0C,$0B,$0B,$0B,$0B
db $0B,$0A,$0A,$0A,$09,$09,$08,$08,$08,$07
db $07,$06,$06,$05,$05,$04,$03,$03,$02,$02
db $01,$01,$00,$FF,$FF,$FE,$FE,$FD,$FD,$FC
db $FB,$FB,$FA,$FA,$F9,$F9,$F8,$F8,$F8,$F7
db $F7,$F6,$F6,$F6,$F5,$F5,$F5,$F5,$F5,$F4
db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4
db $F5,$F5,$F5,$F5,$F5,$F6,$F6,$F6,$F7,$F7
db $F8,$F8,$F8,$F9,$F9,$FA,$FA,$FB,$FB,$FC
db $FD,$FD,$FE,$FE,$FF,$FF
;256, $100 - $FF02
StageTextXOff:
dw $00C3,$00C3,$00C3,$00C3,$00C3,$00C3,$00C3
dw $00C3,$00C2,$00C2,$00C2,$00C2,$00C2,$00C2
dw $00C1,$00C1,$00C1,$00C1,$00C1,$00C0,$00C0
dw $00C0,$00C0,$00C0,$00BF,$00BF,$00BF,$00BE
dw $00BE,$00BE,$00BE,$00BD,$00BD,$00BD,$00BC
dw $00BC,$00BB,$00BB,$00BB,$00BA,$00BA,$00B9
dw $00B9,$00B8,$00B8,$00B7,$00B7,$00B6,$00B5
dw $00B5,$00B4,$00B3,$00B3,$00B2,$00B1,$00B0
dw $00B0,$00AF,$00AE,$00AD,$00AC,$00AB,$00AA
dw $00A9,$00A8,$00A7,$00A6,$00A5,$00A3,$00A2
dw $00A1,$009F,$009E,$009D,$009B,$009A,$0098
dw $0096,$0095,$0093,$0091,$0090,$008E,$008C
dw $008A,$0088,$0086,$0084,$0081,$007F,$007D
dw $007A,$0078,$0076,$0073,$0070,$006E,$006B
dw $0068,$0066,$0063,$0060,$005D,$005A,$0057
dw $0053,$0050,$004D,$004A,$0046,$0043,$003F
dw $003C,$0038,$0035,$0031,$002E,$002A,$0026
dw $0022,$001F,$001B,$0017,$0013,$000F,$000C
dw $0008,$0004,$0000,$FFFC,$FFF8,$FFF4,$FFF1
dw $FFED,$FFE9,$FFE5,$FFE1,$FFDE,$FFDA,$FFD6
dw $FFD2,$FFCF,$FFCB,$FFC8,$FFC4,$FFC1,$FFBD
dw $FFBA,$FFB6,$FFB3,$FFB0,$FFAD,$FFA9,$FFA6
dw $FFA3,$FFA0,$FF9D,$FF9A,$FF98,$FF95,$FF92
dw $FF90,$FF8D,$FF8A,$FF88,$FF86,$FF83,$FF81
dw $FF7F,$FF7C,$FF7A,$FF78,$FF76,$FF74,$FF72
dw $FF70,$FF6F,$FF6D,$FF6B,$FF6A,$FF68,$FF66
dw $FF65,$FF63,$FF62,$FF61,$FF5F,$FF5E,$FF5D
dw $FF5B,$FF5A,$FF59,$FF58,$FF57,$FF56,$FF55
dw $FF54,$FF53,$FF52,$FF51,$FF50,$FF50,$FF4F
dw $FF4E,$FF4D,$FF4D,$FF4C,$FF4B,$FF4B,$FF4A
dw $FF49,$FF49,$FF48,$FF48,$FF47,$FF47,$FF46
dw $FF46,$FF45,$FF45,$FF45,$FF44,$FF44,$FF43
dw $FF43,$FF43,$FF42,$FF42,$FF42,$FF42,$FF41
dw $FF41,$FF41,$FF40,$FF40,$FF40,$FF40,$FF40
dw $FF3F,$FF3F,$FF3F,$FF3F,$FF3F,$FF3E,$FF3E
dw $FF3E,$FF3E,$FF3E,$FF3E,$FF3D,$FF3D,$FF3D
dw $FF3D,$FF3D,$FF3D,$FF3D

                                ;First half of the header
org $FFB0                       ;Goto FFB0
db "00"                         ;ROM data Region
db "BANS"                       ;Unique code for identification
fill 6                          ;Fill 6 bytes
db 0,0,0,0
                                ;Second half of header
db "BORED ALIENS IN SPACE"      ;Program name [21 characters long]
db $31                          ;Set ROM identification and speed
db 2                            ;Set what we have available [in this case ROM + RAM + Battery]
db 10                           ;Set ROM size [1024k]
db 1                            ;Set RAM size [0k]
db 2                            ;Set region [2 for PAL]
db $33                          ;Old ID code [replaced with new value]
db 0                            ;ROM version
dw $FFFF
dw $0000

org $FFE0                       ;Goto db FFE0
;Native
dw $FFFF                        ;Vector table
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw NMIHandler
dw $FFFF
dw $FFFF
;Emulation
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw $FFFF
dw Reset
dw $FFFF

org !CodeBank2

   	;-------------------------------;
    ;   Enemy Drawing Subroutine    ;
    ;-------------------------------;
    ;
    ;   Usage
    ;       Draws enemies from VRAM tile by tile to the screen tilemap
    ;
    ;   Clobber list:
    ;       
    ;
GameLoop_DrawEnemies:
    ;Enemy Load loop
    pha
    phx
    phy
    php
    sep #$20
    stz.w HW_WMADDH
    lda.b #(EnemyTileBuffer>>8)&$FF
    sta.w HW_WMADDM                     ;Set up Work ram pointer
    lda.b #(EnemyTileBuffer)&$FF
    sta.w HW_WMADDL                     ;Set up Work ram pointer
    rep #$20
    ldy.w #$0005
    lda.w #EnemyType
    sta.b ZP.MemPointer                 ;Set up EnemyType pointer
    lda.w #EnemyHurtTable
    sta.b ZP.MemPointer2                ;Set up EnemyHurtTimer table
    ldx.w #$0000
    .RowLoop:
    ;Top row
    tdc
    sep #$20
    for t = 0..8
        lda.b (ZP.MemPointer)           ;Grab type table data
        beq +
        asl
        asl
        tax
        lda.w EnemyDrawTop+0, X
        sta.w HW_WMDATA
        lda.b (ZP.MemPointer2)          ;Grab hurt timer
        bne +++
        lda.w EnemyDrawTop+1, X
        bra ++++
        +++
        lda.b #!EnemyHurtPal
        ++++
        sta.w HW_WMDATA
        lda.w EnemyDrawTop+2, X
        sta.w HW_WMDATA
        lda.b (ZP.MemPointer2)          ;Grab hurt timer
        bne +++
        lda.w EnemyDrawTop+3, X
        bra ++++
        +++
        lda.b #!EnemyHurtPalFlip
        ++++
        sta.w HW_WMDATA
        bra ++
        +
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        ++
        ;Write empty tile
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        ;Increment pointer
        rep #$20
        inc.b ZP.MemPointer
        inc.b ZP.MemPointer2
        sep #$20
    endfor

    for t = 0..8
        stz.w HW_WMDATA                 ;Write empty tile
        stz.w HW_WMDATA                 ;Write empty tile
    endfor
    rep #$20
    lda.b ZP.MemPointer
    sec
    sbc.w #$0008
    sta.b ZP.MemPointer
    lda.b ZP.MemPointer2
    sec
    sbc.w #$0008
    sta.b ZP.MemPointer2
    tdc
    sep #$20
    for t = 0..8
        lda.b (ZP.MemPointer)           ;Grab type table data
        beq +
        asl
        asl
        tax
        lda.w EnemyDrawBot+0, X
        sta.w HW_WMDATA
        lda.b (ZP.MemPointer2)          ;Grab hurt timer
        bne +++
        lda.w EnemyDrawBot+1, X
        bra ++++
        +++
        lda.b #!EnemyHurtPal
        ++++
        sta.w HW_WMDATA
        lda.w EnemyDrawBot+2, X
        sta.w HW_WMDATA
        lda.b (ZP.MemPointer2)          ;Grab hurt timer
        bne +++
        lda.w EnemyDrawBot+3, X
        bra ++++
        +++
        lda.b #!EnemyHurtPalFlip
        ++++
        sta.w HW_WMDATA
        bra ++
        +
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        ++
        ;Write empty tile
        stz.w HW_WMDATA
        stz.w HW_WMDATA
        ;Increment pointer
        rep #$20
        inc.b ZP.MemPointer
        inc.b ZP.MemPointer2
        sep #$20
    endfor

    for t = 0..40
        stz.w HW_WMDATA                 ;Write empty tile
        stz.w HW_WMDATA                 ;Write empty tile
    endfor
    
    dey
    beq +
    jmp .RowLoop
    +

    ldy.w #$0000
    rep #$20
    lda.w #(EnemyTileBuffer)&$FFFF
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(EnemyTileBuffer>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #L1Ram
    sta.b ZP.DMAQDest
    lda.w #$0400
    sta.b ZP.DMAQLength
    jsl QueueDMA
    plp
    ply
    plx
    pla
    rtl
    
    ;-----------------------------------;
    ;   Enemy Frame decider subroutine  ;
    ;-----------------------------------;
    ;
    ;   Usage
    ;       A register will hold the tile index, will output the corrected tile index frame
    ;
    ;   Clobber list:
    ;       A register
    ;
GameLoop_DrawEnemies_FrameDecider:
    pha
    php
    rep #$20
    stz.b ZP.R0
    stz.b ZP.R1
    ldx.w #$0000
    tdc
    sep #$30
    ldx.b ZP.EnemyFrame
    lda.w EnemyFrameOffset, X
    tax
    rep #$20
    lda.w EnemyVramOff, X
    sta.b ZP.R0
    sep #$20
    jsl LoadEnemyGFX
    plp
    pla
    rtl

LoadEnemyGFX:
    php    
    rep #$30
    ldy.w #$0000
    lda.w #Invaders&$FFFF       ;Grab graphics addr
    clc
    adc.b ZP.R0
    sta.b ZP.DMAQSrc
    sep #$20
    lda.b #(Invaders>>16)&$FF
    sta.b ZP.DMAQSrc+2
    lda.b #$01
    sta.b ZP.DMAQFlags
    rep #$20
    lda.w #!EnemyTileDest
    sta.b ZP.DMAQDest
    lda.w #$0400
    sta.b ZP.DMAQLength
    jsl QueueDMA
    plp
    rtl

ClearHDMA:
    php
    rep #$20
    stz.w HDMAMirror
    stz.w HDMAMirror+2
    stz.w HDMAMirror1
    stz.w HDMAMirror1+2
    stz.w HDMAMirror2
    stz.w HDMAMirror2+2
    stz.w HDMAMirror3
    stz.w HDMAMirror3+2
    stz.w HDMAMirror4
    stz.w HDMAMirror4+2
    stz.w HDMAMirror5
    stz.w HDMAMirror5+2
    plp
    rtl

ClearHDMAGameScene:
    php
    rep #$20
    stz.w HDMAMirror1
    stz.w HDMAMirror1+2
    stz.w HDMAMirror2
    stz.w HDMAMirror2+2
    stz.w HDMAMirror3
    stz.w HDMAMirror3+2
    stz.w HDMAMirror4
    stz.w HDMAMirror4+2
    stz.w HDMAMirror5
    stz.w HDMAMirror5+2
    plp
    rtl

    ;
    ; ZP.DMAQSrc        |   Source address
    ; ZP.DMAQFlags      |   Flags [non-zero for a viable entry]
    ; ZP.DMAQDest       |   Destination address
    ; ZP.DMAQLength     |   Size of transfer
QueueDMA:
    pha
    phx
    phy
    php
    rep #$20
    ldy.w #$0000
    lda.b ZP.DMAQSrc
    sta.b (ZP.VrDmaListPtr), Y
    inc.w ZP.VrDmaListPtr
    inc.w ZP.VrDmaListPtr

    lda.b ZP.DMAQSrc+2
    sta.b (ZP.VrDmaListPtr), Y
    inc.w ZP.VrDmaListPtr
    inc.w ZP.VrDmaListPtr
    
    lda.b ZP.DMAQDest
    sta.b (ZP.VrDmaListPtr), Y
    inc.w ZP.VrDmaListPtr
    inc.w ZP.VrDmaListPtr
    
    lda.b ZP.DMAQLength
    sta.b (ZP.VrDmaListPtr), Y
    inc.w ZP.VrDmaListPtr
    inc.w ZP.VrDmaListPtr
    ldy.w #$0003                ;Clear next entry to prevent harmful DMA's
    sep #$20
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y    
    plp
    ply
    plx
    pla
    rtl

    ;ZP.MemPointer  |   source palette address
    ;ZP.MemPointer2 |   source scanline list
    ;ZP.R0+R1       |   amount of colours to copy
ConstructGradientTable:
    pha
    phx
    phy
    php
    ldy.w #$0000
    ldx.w #$0000
    .TransferLoop:
    sep #$20
    lda.b (ZP.MemPointer2)      ;Grab current scanline
    sta.w HDMAColTableRAM, X
    rep #$20
    inc.w ZP.MemPointer2
    inx
    stz.w HDMAColTableRAM, X
    inx
    inx
    lda.b [ZP.MemPointer]       ;Grab current colour
    sta.w HDMAColTableRAM, X
    inc.w ZP.MemPointer
    inc.w ZP.MemPointer
    inx
    inx
    dec.b ZP.R0
    dec.b ZP.R0
    bpl .TransferLoop
    stz.w HDMAColTableRAM, X
    inx
    inx
    stz.w HDMAColTableRAM, X

    ;Transfer to output table
    rep #$20
    ldx.w #HDMAColTableRAM
    ldy.w #HDMAColTableOut
    lda.w #$00A0
    mvn (!CodeBank>>16)&$FF, (!CodeBank>>16)&$FF
    plp
    ply
    plx
    pla
    rtl

FadeGradientTable:
    pha
    phx
    phy
    php
    rep #$20
    tdc
    ldy.w #$009E
    ldx.w #$0000
    .FadeLoop:
    rep #$20
    lda.w HDMAColTableRAM, Y
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    sta.b ZP.R2
    lda.b ZP.R0
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    asl
    asl
    asl
    asl
    asl
    ora.b ZP.R2
    sta.b ZP.R2
    lda.b ZP.R0
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b ZP.R0
    and.w #$001F
    sec
    sbc.b ZP.PalFadeInd
    bcs +
    lda.w #$0000
    +
    xba
    asl
    asl
    ora.b ZP.R2
    sta.w HDMAColTableOut, Y
    sep #$20
    dey
    dey
    dey
    dey
    dey
    bpl .FadeLoop
    .SkipFade:
    plp
    ply
    plx
    pla
    rtl

ResetOBJ:
    php
    
    plp
    rtl

    ;
    ;   ZP.R0           |   Start index
    ;   ZP.R1           |   End index
    ;   ZP.R2           |   General Memory [Enemy hurt timers]
    ;   ZP.MemPointer   |   Tile buffer pointer
    ;
RedrawEnemyRange:
    pha
    phx
    phy
    php
    rep #$20
    ldx.w #(EnemyTileBuffer)&$FFFF
    stx.b ZP.MemPointer
    sep #$30
    ldx.w #(EnemyTileBuffer>>16)&$FF
    stx.b ZP.MemPointer+2
    ldy.b ZP.R1
    .RangeLoop:
    tdc
    sep #$20
    lda.w EnemyHurtTable, Y
    lda.w EnemyType, Y
    asl
    asl
    tax
    rep #$20
    ;Drawing loop
    lda.w EnemyDrawBot+0, X
    sta.b [ZP.MemPointer]

    inc.w ZP.MemPointer

    dey
    cpy.b ZP.R0
    bpl .RangeLoop
    ;After draw loop
    dey
    plp
    ply
    plx
    pla
    rtl