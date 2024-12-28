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

;       Title       ;
Title_L2:
    incbin "bin/gfx/Title-BG-L2.bin"
Title_L2_End:

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

;   Background 4    ;
BG4_L2:
    incbin "bin/gfx/BG-4-L2.bin"
BG4_L2_End:

BG4_OBJ:
    incbin "bin/gfx/Surfboard.bin"
    incbin "bin/gfx/OceanRocks.bin"
BG4_OBJ_End:

BG4_L3:
    incbin "bin/gfx/BG-4-L3.bin"
BG4_L3_End:

;   Sprite font 1    ;  5x5
SPRFont:
    incbin "bin/gfx/SprFont.bin"
SPRFont_End:

org !GfxBank2
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

org !GfxBank3

;   highscore mode7 BG    ;
HScoreBGM7:
    incbin "bin/gfx/Mode7TestOut.bin"
HScoreBGM7_End:

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

Title_L2_TM:
    incbin "bin/gfx/tilemap/Title-BG-L2.bin"
Title_L2_TM_End:

Options_TM:
    incbin "bin/gfx/tilemap/OptionsBG.bin"
    incbin "bin/gfx/tilemap/OptionsBG2.bin"
Options_TM_End:

org !CodeBank

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

SPRFont_Pal:
    incbin "bin/gfx/pal/SprFont-Pal.bin"
SPRFont_Pal_End:

SPRFont2BPP_Pal:
    incbin "bin/gfx/pal/SprFont2BPP-Pal.bin"
SPRFont2BPP_Pal_End:

InvadersPal:
    incbin "bin/gfx/pal/InvadersPal.bin"
InvadersPalEnd:

;       Title       ;
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

;   Background 4    ;
BG4_L3_Pal:
    incbin "bin/gfx/pal/BG-4-L3-Pal.bin"
BG4_L3_Pal_End:

BG4_L2_Pal:
    incbin "bin/gfx/pal/BG-4-L2-Pal.bin"
BG4_L2_Pal_End:

Surfboard_Pal:
    incbin "bin/gfx/pal/Surfboard-Pal.bin"
Surfboard_Pal_End:

OceanRocks_Pal:
    incbin "bin/gfx/pal/OceanRocks-Pal.bin"
OceanRocks_Pal_End:

;   Options screen graphics
OptionsBG_Pal:
    incbin "bin/gfx/pal/OptionsBG.bin"
    incbin "bin/gfx/pal/OptionsBG2.bin"
OptionsBG_Pal_End:

;   Options screen Gradient
OptionsGrad:
    incbin "bin/gfx/pal/OptionsBGGalaxyGrad.bin"
OptionsGrad_End:

;   Arrow Sprite Palette
ArrowSpr_Pal:
    incbin "bin/gfx/pal/Arrow.bin"
ArrowSpr_Pal_End:

;   highscore mode7 BG    ;
HScoreBGM7_Pal:
    incbin "bin/gfx/pal/Mode7Test-Pal.bin"
HScoreBGM7_Pal_End:

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
    
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
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

    lda.b #$00
    sta.w WBGLOGMirror
    lda.b #$0A
    sta.w WOBJLOGMirror
    
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
    
    ;Load Game BG tiles
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

    ;Load Game BG Palette
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

    ;Load Game Sprite Palette
    lda.b #$02
    sta.w HW_DMAP1              ;Setup DMAP1
    ldx.w #GameSprPal&$FFFF     ;Grab palette addr
    stx.w HW_A1T1L              ;Shove lo+mid addr byte
    lda.b #GameSprPal>>16&$FF
    sta.w HW_A1B1               ;Store bank
    ldx.w #GameSprPalEnd-GameSprPal
    stx.w HW_DAS1L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_CGDATA&$FF        ;Grab Video mem data lo addr
    sta.w HW_BBAD1              ;Set bus addr

    ;Load Game Sprites
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #GameSpr&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #GameSpr>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #GameSprEnd-GameSpr
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$03
    sta.w HW_MDMAEN             ;Enable DMA channel 0 + 1

    ldy.w #$0000
    -
    lda.w GamePal, Y
    sta.w PalMirror, Y
    lda.w GameSprPal, Y
    sta.w PalMirror+384, Y
    iny
    cpy #$100
    bne -

    sep #%00100000              ;Enter Memory mode
    lda.b #$70
    sta.w HW_BG1SC              ;Set Layer 1 values
    lda.b #$74
    sta.w HW_BG2SC              ;Set Layer 2 values
    lda.b #$78
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

    lda.b #$00
    sta.b ZP.SceneIndex         ;Set starting scene
    lda.b #$00
    sta.w BGIndex
    lda.b #$01
    sta.b ZP.ChangeScene        ;Set load flag
    lda.b #$00
    sta.w HW_SETINI
    lda.b #$81
    sta.w HW_NMITIMEN           ;NMI Enabled

    rep #%00100000              ;Set A to 16 bit mode

MainLoop:
    stz.b ZP.NMIDone
    lda.w #VrDmaPtr
    sta.w ZP.VrDmaListPtr
    lda.w #OAMCopy
    sta.w ZP.OAMPtr
    ldy.w #$220
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
    lda.w #$FFFF
    sta.b ZP.NMIDone
    -                           ;Infinite loop to
    lda.b ZP.NMIDone
    bpl MainLoop
    bra -                       ;Prevent the code going into random memory

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
    sta.w ZP.VrDmaListPtr
    
    .VrDMALoop:
    ldy.w #$0003
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b (ZP.VrDmaListPtr), Y                  ;Load dma ptr flag
    beq .FinishDMALoop                          ;Check for 0 for end flag
    rep #%00100000                              ;Enter 8bit mode for A
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
    lda.w !BG1HOffMirror
    sta.w HW_BG1HOFS
    lda.w !BG1HOffMirror+1
    sta.w HW_BG1HOFS
    lda.w !BG1VOffMirror
    sta.w HW_BG1VOFS
    lda.w !BG1VOffMirror+1
    sta.w HW_BG1VOFS

    ;BG 2
    lda.w !BG2HOffMirror
    sta.w HW_BG2HOFS
    lda.w !BG2HOffMirror+1
    sta.w HW_BG2HOFS
    lda.w !BG2VOffMirror
    sta.w HW_BG2VOFS
    lda.w !BG2VOffMirror+1
    sta.w HW_BG2VOFS
    
    ;BG 3
    lda.w !BG3HOffMirror
    sta.w HW_BG3HOFS
    lda.w !BG3HOffMirror+1
    sta.w HW_BG3HOFS
    lda.w !BG3VOffMirror
    sta.w HW_BG3VOFS
    lda.w !BG3VOffMirror+1
    sta.w HW_BG3VOFS

    ;BG 4
    lda.w !BG3HOffMirror
    sta.w HW_BG4HOFS
    lda.w !BG4HOffMirror+1
    sta.w HW_BG4HOFS
    lda.w !BG4VOffMirror
    sta.w HW_BG4VOFS
    lda.w !BG4VOffMirror+1
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
    ldx.w #PalMirror            ;Grab source addr
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
    rep #$20
    
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

SelectScene:
    dw TitleScene
    dw GameScene
    dw HighscoreScene
    dw OptionsScene
    dw ContinueScene

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
    ldx.w #Title_L2_TM&$FFFF    ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #Title_L2_TM>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #Title_L2_TM_End-Title_L2_TM
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    ldy.w #SPRFont_Pal_End-SPRFont_Pal
    -
    lda.w SPRFont_Pal, Y
    sta.w PalMirror+256, Y
    dey
    bpl -

    ldy.w #Title_L2_Pal_End-Title_L2_Pal
    -
    lda.w Title_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
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
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w ArrowTitleYPos, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ArrowChar
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!SprFont1Attr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

    rep #$10
    ldx.w #StartText
    stx.b ZP.MemPointer
    ldx.w #EndOptionsText-StartText
    stx.b ZP.R1
    ;Draw sprite text
    jsr DrawSpriteText

    ;ldx.w #$6040
    ;stx.b ZP.R0
    ;ldx.w #$0C42
    ;stx.b ZP.R2
    ;lda.b #$01
    ;sta.b ZP.R4
    ;jsr AddSprite

    sep #$10
    ldy.w SinePtr
    rep #$10
    lda.w BGScrollOff+2
    inc
    sta.w BGScrollOff+2
    and #$04
    beq +
    stz.w BGScrollOff+2
    ldy.w #$0102
    tdc
    lda.b #$05
    sta.b ZP.R4
    jsr PalCycle
    ldy.w #$0022
    tdc
    lda.b #$07
    sta.b ZP.R4
    jsr PalCycle
    +

    sep #$20
    ldx.w #HDMAScrollBuffer2
    stx.w HW_WMADDL
    lda.b #$7E
    sta.w HW_WMADDH
    inc.w SinePtr

    ldx.w #$0000
    ldy.w #$0000
    sep #$10
    ldx.b #$80
    ldy.w SinePtr
    -
    lda.b #$01
    sta.w HW_WMDATA
    lda.w SineTable, Y
    lsr
    lsr
    clc
    adc.w BGScrollVal
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    lda.b #$01
    sta.w HW_WMDATA
    lda.w SineTable, Y
    lsr
    lsr
    eor.b #$FF
    sec
    sbc.w BGScrollVal
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
    sta.w HDMAMirror
    lda.b #(HW_BG1HOFS)&$FF
    sta.w HDMAMirror+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror+2
    lda.b #$7E
    sta.w HDMAMirror+4
    lda.b #$02
    sta.w HDMAMirror1
    lda.b #(HW_BG1VOFS)&$FF
    sta.w HDMAMirror1+1
    ldx.w #HDMAScrollBuffer2
    stx.w HDMAMirror1+2
    lda.b #$7E
    sta.w HDMAMirror1+4
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

    ldx.w #$0000
    stx.b ZP.R0
    jsr LoadEnemyGFX

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

    ldy.w #$0000
    -
    lda.w GamePal, Y
    sta.w PalMirror, Y
    lda.w InvadersPal, Y
    lda.w GameSprPal, Y
    sta.w PalMirror+384, Y
    iny
    cpy #$100
    bne -
    
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
    stz.w BGCount
    ;Reset Player
    lda.b #$70
    sta.w Player.X
    lda.b #$03
    sta.w ZP.Lives
    ;Reset Bullets
    lda.b #$F0
    sta.w Bullet[0].X
    sta.w Bullet[0].Y
    stz.w Bullet[0].Frame
    lda.b #$00
    sta.w Bullet[0].Enabled

    lda.b #!WaveInit
    sta.b ZP.EnemyWaveCount
    lda.b !EnemyMoveR
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    
    ;Set RNG up for enemy timers
    ldy.w #$0003
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
    sta.w ExplosionFrame, Y
    lda.b #$F0
    sta.w ExplosionX, Y
    sta.w ExplosionY, Y
    dey
    bpl -

    ;Setup Shields
    ldy.w #$0003
    -
    lda.b #!ShieldStartHP
    sta.w ShieldHealth, Y
    lda.b #$00
    sta.w ShieldBlinkTimer, Y    
    dey
    bpl -
    ;-------------------;
    ;   Load tilemaps   ;
    ;-------------------;
    jsr GameLoop_LoadBG

    ldx.w #$0000
    stx.w !BG2VOffMirror
    stx.w !BG1VOffMirror
    ;Write enemy entries into Enemy struct array
    jsr GameLoop_UpdateEnemyArray
    jsr GameLoop_DrawEnemies
    jsr GameLoop_DrawScore
    jsr GameLoop_FindMaxRowBounds
    lda.b #!GameState_Play
    sta.w GameState
    lda.b #$01
    sta.w HW_BGMODE
    sep #$20
    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipLoad:

    ;-------------------;
    ;   Player Logic    ;
    ;-------------------;
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

    lda.w GameState
    cmp.b #!GameState_Dead
    beq .SkipShoot
    lda.b ZP.Controller+1
    and #$40                    ;Check A button
    beq .SkipShoot
    lda.w Bullet[0].Enabled   
    bne .SkipShoot
    ;Enable bullet
    lda.b #$01
    sta.w Bullet[0].Enabled
    ;Set Bullet position to the player's
    lda.w Player.X
    clc
    adc.b #$04
    sta.w Bullet[0].X
    sta.w LaserOAM
    lda.b #!PlayerY
    sta.w Bullet[0].Y
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
    beq .SkipShoot
    lda.b #$00
    sec
    sbc.b #!BulletHSpeed
    sta.w Bullet.Dir
    .SkipShoot:

    sep #$20
    stz.w Player.Frame
    lda.w Player.X
    bit #$4
    beq +
    lda.b #$01
    sta.w Player.Frame
    +
    stz.w Player.State

    jsr HandleEBulletCollisions

    ;------------------------------;
    ;   Player Drawing Commands    ;
    ;------------------------------;
    ;Player will take the first 4 spots of OAM
    lda.w Player.Dead
    beq +
    lda.w OAMCopy+512             ;Player X 9th bit
    ora.b #%01010101
    sta.w OAMCopy+512             ;Player X 9th bit
    +
    ;BL tile    
    lda.w Player.X
    sta.b ZP.R0
    lda.b #!PlayerY
    sta.b ZP.R1
    lda.b #!PlayerTileB
    clc
    adc.w Player.Frame
    sta.b ZP.R2
    lda.b #!PlayerAttr
    sta.b ZP.R3
    stz.b ZP.R4
    jsr AddSprite

    ;BR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.b ZP.R0
    lda.b #!PlayerY
    sta.b ZP.R1
    lda.b #!PlayerTileB
    clc
    adc.w Player.Frame
    sta.b ZP.R2
    lda.b #!PlayerAttr+$40
    sta.b ZP.R3
    stz.b ZP.R4
    jsr AddSprite

    ;TL tile
    lda.w Player.X
    sta.b ZP.R0
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.b ZP.R1
    lda.b #!PlayerTileT
    sta.b ZP.R2
    lda.b #!PlayerAttr
    sta.b ZP.R3
    stz.b ZP.R4
    jsr AddSprite

    ;TR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.b ZP.R0
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.b ZP.R1
    lda.b #!PlayerTileT
    sta.b ZP.R2
    lda.b #!PlayerAttr+$40
    sta.b ZP.R3
    stz.b ZP.R4
    jsr AddSprite

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
    jsr GameLoop_DrawScore
    sta.w EnemyHealth, Y
    stz.w Bullet[0].Enabled
    lda.b #$FF
    sta.w Bullet[0].X
    sta.b ZP.BulletColTile
    lda.b #!EnemyHurtTimer
    sta.w EnemyHurtTable, Y
    jsr GameLoop_DrawEnemies
    .SkipEnemyHurt:

    .SkipBullet0Logic:

    ;---------------------;
    ;   Bullet Drawing    ;
    ;---------------------;
    lda.w Bullet.X
    sta.b ZP.R0
    lda.w Bullet.Y
    sta.b ZP.R1
    lda.b #!BulletF1
    sta.b ZP.R2
    lda.b #!BulletAttr
    sta.b ZP.R3
    stz.b ZP.R4
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
    lda.w EnemyBulletFrame
    eor.b #$01
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
    jsr GameLoop_HandleEnemyTimers
    sep #$20
    ;Handle bullet logic
    jsr GameLoop_EBulletLogic
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
    lda.b #!EnemyPlaneStartY
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
    cmp.b #!EnemyPlaneStartY
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
    jsr GameLoop_DrawEnemies
    ++
    sta.w EnemyHurtTable, Y
    +
    iny
    cpy.w #$0028
    bne -
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
    lda.b #!GameState_Stop
    sta.w GameState
    rep #$20
    lda.w #!GameWaitTime
    sta.w GameStateWait
    sep #$20
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
    sta.w !BG1HOffMirror
    stz.w !BG1HOffMirror+1
    lda.b ZP.EnemyPlanePosY
    sta.w !BG1VOffMirror
    stz.w !BG1VOffMirror+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    jsr GameLoop_DrawEnemies_FrameDecider
    .SkipMove:
    dec.b ZP.EnemyTimer
    .SkipEnemy

    ;-------------------;
    ;    Handle UFO     ;
    ;-------------------;
    jsr GameLoop_HandleUFO

    ;-----------------------;
    ;   Background Logic    ;
    ;-----------------------;
    jsr GameLoop_UpdateBG
    
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
    ldy.w #$03
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
    lda.b #$04
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

    jsr Gameloop_DrawShields
    ;------------------------;
    ;    Handle Game State   ;
    ;------------------------;
    rep #$20
    lda.w GameStateWait
    beq +
    dec
    sta.w GameStateWait
    bne .SkipSend
    sep #$20
    lda.b #!GameState_Play
    sta.w GameState
    jsr GameLoop_SendWave
    .SkipSend:
    +
    sep #$20

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
    ;   WMADDL
    ;   WMADDM
    ;   WMADDH
    ;
GameLoop_DrawScore:
    pha
    phy
    ;Set up WRAM addr
    tdc
    sep #$20
    lda.b #(TextDispBuffer>>16)&$FF
    sta.w HW_WMADDH
    lda.b #(TextDispBuffer>>8)&$FF
    sta.w HW_WMADDM
    lda.b #(TextDispBuffer)&$FF
    sta.w HW_WMADDL
    ldy #$0000
    ;Draw initial text characters
    -
    lda.w ScoreText, Y
    sta.w HW_WMDATA
    iny
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    iny
    cpy #(EndScoreText-ScoreText)
    bne -

    ;Next, we then split each nibble of the score stored in BCD and then put them into the buffer
    ldy #$0002
    -
    lda.w ZP.Score, Y
    and #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    lda.w ZP.Score, Y
    and #$0F
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    dey
    bpl -

    ;Space char
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    ;Next, we draw the wave counter
    ldy.w #$0000
    -
    lda.w WaveText, Y
    sta.w HW_WMDATA
    iny
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    iny
    cpy #(EndWaveText-WaveText)
    bne -
    ;Draw said wave amount to screen
    lda.b ZP.EnemyWaveCount
    and #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    lda.b ZP.EnemyWaveCount
    and #$0F
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    ;Space char
    stz.w HW_WMDATA
    stz.w HW_WMDATA
    ldy.w #$0000
    ;Draw Lives text characters
    -
    lda.w LivesText, Y
    sta.w HW_WMDATA
    iny
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    iny
    cpy #(EndLivesText-LivesText)
    bne -

    ;Draw lives counter
    tdc
    lda.b ZP.Lives
    and #$F0
    lsr
    lsr
    lsr
    lsr
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA
    lda.b ZP.Lives
    and #$0F
    inc
    sta.w HW_WMDATA
    lda.b #!EnemyPal4
    sta.w HW_WMDATA

    ;Finally, set up DMA pointer to render to screen
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
    lda.w #!ScoreDisp
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #(EndLivesText-ScoreText)+36
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc.w #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    ply
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
    lda.w ShieldPosTable, X
    sec
    sbc.b #$0C
    cmp.b ZP.R0
    bcs .SkipPlayerBulletCheck
    lda.w ShieldPosTable+3, X
    clc
    adc.b #$0C
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

Gameloop_DrawShields:
    pha
    phx
    phy
    php
    ldy.w #$0003
    ldx.w #ShieldPosTableEnd-1
    stx.b ZP.MemPointer
    tdc
    .ShieldDrawLoop
    ldx.w #$0000
    lda.w ShieldHealth, Y
    asl
    asl
    tax
    sep #$20
    lda.b #!ShieldAttr1
    sta.b ZP.R0
    lda.b #!ShieldAttr2
    sta.b ZP.R1
    lda.w ShieldBlinkTimer, Y
    bit #$40
    beq +
    lda.b #$00
    sta.w ShieldBlinkTimer, Y
    stz.b ZP.R0
    stz.b ZP.R1
    +

    lda.b (ZP.MemPointer)
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ShieldYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w ShieldTileTable, X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R0
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.b (ZP.MemPointer)
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ShieldYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w ShieldTileTable, X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R1
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.b (ZP.MemPointer)
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ShieldYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w ShieldTileTable, X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R0
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20
    
    lda.b (ZP.MemPointer)
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ShieldYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w ShieldTileTable, X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R1
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    inx
    rep #$20
    dec.b ZP.MemPointer
    sep #$20

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
    lda.w EnemyHealthTable, X
    sta.w EnemyHealth, Y
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
    lda.b #$00
    sta.w BGIndex
    ++
    ldy.w #$0003
    lda.b #!ShieldStartHP
    -
    sta.w ShieldHealth, Y
    dey
    bpl -
    jsr GameLoop_LoadBG
    +
    lda.b !EnemyMoveR
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    sta.b !BG1HOffMirror
    sta.w HW_BG1HOFS
    stz.b !BG1HOffMirror+1
    stz.w HW_BG1HOFS+1
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    sta.b !BG1VOffMirror
    sta.w HW_BG1VOFS
    stz.b !BG1VOffMirror+1
    stz.w HW_BG1VOFS+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    lda.b #!GameState_Play
    sta.w GameState
    ;Set RNG up for enemy timers
    ldy.w #$0003
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
    jsr GameLoop_DrawEnemies
    jsr GameLoop_FindMaxRowBounds
    jsr GameLoop_DrawScore
    rts

LoadEnemyGFX:
    php    
    ldy.w #$0000
    rep #$20
    lda.w #Invaders&$FFFF       ;Grab graphics addr
    clc
    adc.b ZP.R0
    sta.b (ZP.VrDmaListPtr), Y
    iny
    iny
    sep #$20
    lda.b #(Invaders>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #!EnemyTileDest
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #$0400
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    plp
    rts
    
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
    lda.b #(EnemyTileBuffer)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(EnemyTileBuffer>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(EnemyTileBuffer>>16)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #$01
    sta.b (ZP.VrDmaListPtr), Y
    iny
    rep #$20
    lda.w #L1Ram
    sta.b (ZP.VrDmaListPtr), Y
    sep #$20
    iny
    iny
    rep #$20
    lda.w #940
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
    ply
    plx
    pla
    rts
    
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
    plp
    jsr LoadEnemyGFX
    pla
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
    ;Check for first inactive bullet
    ldx.b #$00
    -
    lda.w EnemyBulletActive, X  ;Don't fire if the current enemy bullet is active
    beq .InactiveBulletFound
    inx
    cpx.b #$04                  ;Break if no enemy bullets found to be active
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
    ;Set position
    lda.w EnemyPixelPos, Y
    sec
    sbc.b ZP.EnemyPlanePosX
    clc
    adc.b #$04
    sta.w EnemyBulletXPos, X
    sta.w EnemyShootDebug
    lda.w EnemyPixelPos+1, Y
    sec
    sbc.b ZP.EnemyPlanePosY
    sta.w EnemyBulletYPos, X
    sta.w EnemyShootDebug+1
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
    ldy.w #$0003
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
    ldy.w #$0003
    .EBLogicLoop:
    lda.w EnemyBulletActive, Y
    beq +
    lda.w EnemyBulletYPos, Y
    clc
    adc.b #!EnemyBulletSpeed
    sta.w EnemyBulletYPos, Y
    sec
    sbc.b #$04
    cmp #!BFloor
    bcs +
    bra .SkipDeactive
    +
    lda.b #$FF
    sta.w EnemyBulletXPos, Y
    lda.b #$F0
    sta.w EnemyBulletYPos, Y
    lda.b #$00
    sta.w EnemyBulletActive, Y
    .SkipDeactive:
    dey
    bpl .EBLogicLoop
    plp
    ply
    plx
    pla
    rts

GameLoop_EBulletDraw:
    pha
    phx
    phy
    php
    ldy.w #$0003
    .EBDrawLoop:
    lda.w EnemyBulletXPos, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w EnemyBulletYPos, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!EBulletF1
    clc
    adc.w EnemyBulletFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!BulletAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
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
    bne +
    ;GAMEOVER code
    +
    jsr GameLoop_DrawScore
    plp
    ply
    plx
    pla
    rts

HandleEBulletCollisions:
    ldy.w #$0003
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
    sbc.b #$0C
    sec
    sbc.w EnemyBulletYPos, Y
    bcs .SkipCol
    ;if GameState != Dead
    lda.w GameState
    cmp.b #!GameState_Dead
    beq .SkipCol
    jsr GameLoop_KillPlayer
    lda.b #$00
    ldy.w #$0003
    -
    sta.w EnemyBulletActive, Y
    dey
    bpl -
    .SkipCol:
    dey
    bpl .ColLoop
    rts

    ;
GameLoop_KillPlayer:
    php
    pha
    phx
    phy    
    sep #$20
    lda.b #!GameState_Dead
    sta.w GameState
    lda.b #$FF
    sta.w PlayerDeathTimer
    sta.w EnemyResetMove
    sta.w Player.Dead
    stz.w EnemyResetFlag
    ldy.w #!MaxEplW-1
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
    lda.w OAMCopy+512             ;Player X 9th bit
    ora.b #%01010101
    sta.w OAMCopy+512             ;Player X 9th bit
    lda.b #$01
    sta.w EnemyResetMove
    ply
    plx
    pla
    plp
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
    ldx.w #SPRFont2BPP&$FFFF       ;Grab graphics addr
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

    ldy.w #OptionsBG_Pal_End-OptionsBG_Pal
    -
    lda.w OptionsBG_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bpl -

    ldy.w #SPRFont2BPP_Pal_End-SPRFont2BPP_Pal
    -
    lda.w SPRFont2BPP_Pal, Y
    sta.w PalMirror, Y
    dey
    bpl -

    ldy.w #ArrowSpr_Pal_End-ArrowSpr_Pal
    -
    lda.w ArrowSpr_Pal, Y
    sta.w PalMirror+$0100, Y
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
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w OptionsArrowPos, Y
    rep #$10
    clc
    adc.b ZP.R2
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!ArrowChar2
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!Arrow2Attr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

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
    lda.b #$D8
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$3E
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R5
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!Arrow2Attr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

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

    rep #$20
    rts

HighscoreScene:
    sep #$20
    lda.b ZP.ChangeScene
    bne .LoadHighscore
    jmp .SkipHighscoreLoad
    .LoadHighscore:
    
    lda.b #$8F                  ;Set master brightness to 15 & forces blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    stz.b ZP.ChangeScene        ;Reset flag
    lda.b #$07
    sta.w HW_BGMODE

    stz.w HW_HDMAEN
    jsr TransitionIn

    ldx.w #$0000
    stx.w HW_VMADDL
    ;Load BG characters
    lda.b #$18
    sta.w HW_BBAD7
    lda.b #$01
    sta.w HW_DMAP7              ;Setup DMAP0
    ldx.w #HScoreBGM7&$FFFF     ;Grab graphics addr
    stx.w HW_A1T7L              ;Shove lo+mid addr byte
    lda.b #HScoreBGM7>>16&$FF
    sta.w HW_A1B7               ;Store bank
    ldx.w #HScoreBGM7_End-HScoreBGM7
    stx.w HW_DAS7L              ;Return amount of bytes to be written in VRAM
    lda.b #$80
    sta.w HW_MDMAEN             ;Enable DMA channel 7
    ldy.w #HScoreBGM7_Pal_End-HScoreBGM7_Pal
    -
    lda.w HScoreBGM7_Pal, Y
    sta.w PalMirror, Y
    dey
    bpl -
    lda.b #$C0
    sta.w HW_M7SEL
    lda.b #$FF
    sta.w TMMirror
    rep #$20
    lda.w #$0200
    sta.w !BG1HOffMirror
    sta.w !BG1HOffMirror+1
    sta.w !BG1VOffMirror
    sta.w !BG1VOffMirror+1
    lda.w !BG1HOffMirror
    adc.w #$0080
    sta.w M7XMirror
    lda.w !BG1VOffMirror
    adc.w #$0080
    sta.w M7YMirror

    sep #$20
    ldy.w #HDMAMirror2-HDMAMirror
    lda.b #$00
    -
    sta.w HDMAMirror, Y
    dey
    bpl -
    lda.b #$0F                  ;Set master brightness to 15 & stop blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipHighscoreLoad:
    inc.w SinePtr
    tdc
    lda.w SinePtr
    rep #$20
    asl
    tay
    sep #$20
    ;just pretend @ is theta
    ;A = Cos  @
    ;B = Sin  @
    ;C = -Sin @
    ;D = Cos  @
    rep #$20
    lda.w Sin16, Y
    asl
    asl
    asl
    sta.w M7BMirror
    eor.w #$FFFF
    sta.w M7CMirror
    lda.w Cos16, Y
    ;asl
    sta.w M7DMirror
    sta.w M7AMirror

    lda.w !BG1HOffMirror
    adc.w #$0080
    sta.w M7XMirror
    lda.w !BG1VOffMirror
    adc.w #$0080
    sta.w M7YMirror

    ;sep #$20
    ;lda.b ZP.Controller
    ;and #$20                ;Check R
    ;beq .SkipMoveR
    ;rep #$20
    ;lda.w !BG1HOffMirror
    ;clc
    ;adc.w #$0004
    ;sta.w !BG1HOffMirror
    ;sep #$20
    ;.SkipMoveR:
;
    ;lda.b ZP.Controller
    ;and #$10                ;Check L
    ;beq .SkipMoveL
    ;rep #$20
    ;lda.w !BG1HOffMirror
    ;sec
    ;sbc.w #$0004
    ;sta.w !BG1HOffMirror
    ;.SkipMoveL:
    rep #$20
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
    pha
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
    pla
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
    ;       Y
    ;       OAMPtr
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
    ;Check UFO bounds 
    sep #$20
    lda.w Bullet.Y
    cmp.b #$10          ;BulletY < 16
    bcs .SkipUFOCol
    lda.w UFOXPos
    sec
    sbc.b #$08          ;Adjust to occasional bullet misses
    cmp.w Bullet.X
    bcs .SkipUFOCol     ;BulletX > UFOX
    lda.w UFOXPos
    adc.b #$20
    cmp.w Bullet.X      ;&& BulletX < UFOX+32
    bcc .SkipUFOCol
    
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
    jsr GameLoop_DrawScore
    .SkipUFOCol:

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
    eor #$02
    sta.w UFOFrame
    stz.w UFOFrameTimer
    +
    rts

GameLoop_DrawUFO:
    stz.w OAMCopy+$0202
    stz.w OAMCopy+$0203
    stz.w OAMCopy+$0204
    stz.w OAMCopy+$0205
    rep #$20
    lda.w UFOXPos
    and.w #$01FF
    sta.b ZP.R0
    lda.b ZP.R0
    and.w #$0100
    beq +
    sep #$20
    lda.w OAMCopy+$0202
    ora.b #$04
    sta.w OAMCopy+$0202
    lda.w OAMCopy+$0203
    ora.b #$04
    sta.w OAMCopy+$0203
    +
    ;mid 1
    rep #$20
    lda.b ZP.R0
    clc
    adc.w #$0008
    and.w #$0100
    beq +
    sep #$20
    lda.w OAMCopy+$0202
    ora.b #$10
    sta.w OAMCopy+$0202
    lda.w OAMCopy+$0203
    ora.b #$10
    sta.w OAMCopy+$0203
    +
    ;mid 2
    rep #$20
    lda.b ZP.R0
    clc
    adc.w #$0010
    and.w #$0100
    beq +
    sep #$20
    lda.w OAMCopy+$0202
    ora.b #$40
    sta.w OAMCopy+$0202
    lda.w OAMCopy+$0203
    ora.b #$40
    sta.w OAMCopy+$0203
    +
    ;Ass
    rep #$20
    lda.b ZP.R0
    clc
    adc.w #$0018
    and.w #$0100
    beq +
    sep #$20
    lda.w OAMCopy+$0203
    ora.b #$01
    sta.w OAMCopy+$0203
    lda.w OAMCopy+$0204
    ora.b #$01
    sta.w OAMCopy+$0204
    +

    ;Top left
    sep #$20
    lda.w UFOXPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile0
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Top mid
    lda.w UFOXPos
    clc
    adc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile1
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Top mid
    lda.w UFOXPos
    clc
    adc.b #$10
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile1
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Top right
    lda.w UFOXPos
    clc
    adc.b #$18
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile0
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttrMir
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

    ;Bottom left
    lda.w UFOXPos
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPosB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile2
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Bottom mid
    lda.w UFOXPos
    clc
    adc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPosB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile3
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Bottom mid
    lda.w UFOXPos
    clc
    adc.b #$10
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPosB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile3
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Bottom right
    lda.w UFOXPos
    clc
    adc.b #$18
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOYPosB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOTile2
    clc
    adc.w UFOFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!UFOAttrMir
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
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
    .OAMLoop:
    ;Write XPos
    lda.b ZP.R2
    and.b #$40
    lsr
    lsr
    lsr
    clc
    adc.w ExplosionX, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Write YPos
    lda.b ZP.R2
    and.b #$80
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w ExplosionY, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Calculate tile frame
    lda.b #!ExplosionStart   ;Grab the max timer since we want to _increment_ through the frame list
    sec
    sbc.w ExplosionTimer, Y
    lsr
    lsr
    sta.w ExplosionFrame, Y
    ;Write Tile
    lda.b #!ExplosionTile
    clc
    adc.w ExplosionFrame, Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Write Attr
    lda.b #!ExplosionAttr
    clc
    adc.b ZP.R2                 ;Add on tile offsets
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Loop check
    lda.b ZP.R2
    clc
    adc.b #$40
    sta.b ZP.R2
    bcc .OAMLoop                ;Should overflow when it reaches loop 4

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
    stz.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror

    stz.w HW_BG12NBA
    stz.w HW_BG34NBA

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
    ldy.w #BG1_L2_Pal_End-BG1_L2_Pal
    -
    lda.w BG1_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bne -
    ldy.w #BG1_L3_Pal_End-BG1_L3_Pal
    -
    lda.w BG1_L3_Pal, Y
    sta.w PalMirror, Y
    dey
    bne -
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
    lda.b #$8A
    sta.w CGWSELMirror
    lda.b #$5F
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
    ldy.w #BG2_L2_Pal_End-BG2_L2_Pal
    -
    lda.w BG2_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bne -
    
    ldy.w #BG2_L3_Pal_End-BG2_L3_Pal
    -
    lda.w BG2_L3_Pal, Y
    sta.w PalMirror, Y
    dey
    bne -    
    stz.w !BG3VOffMirror
    stz.w !BG3VOffMirror+1

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
    stz.w CGWSELMirror
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

    lda.b #$20
    sta.w !BG3VOffMirror
    stz.w !BG3VOffMirror+1

    ;Transfer palette data
    ldy.w #BG3_L2_Pal_End-BG3_L2_Pal
    -
    lda.w BG3_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bne -
    ldy.w #BG3_L3_Pal_End-BG3_L3_Pal
    -
    lda.w BG3_L3_Pal, Y
    sta.w PalMirror, Y
    dey
    bne -
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
    stz.w CGWSELMirror
    stz.w CGADSUBMirror
    stz.w COLDATAMirror
    stz.w COLDATAMirror+1
    stz.w WH0Mirror
    stz.w WH1Mirror
    
    stz.w HW_BG12NBA
    stz.w HW_BG34NBA

    ;Load Graphics
    ldy.w #$0000
    lda.b #(BG4_L2)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L2>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L2>>16)&$FF
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
    lda.w #BG4_L3_End-BG4_L2
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
    lda.b #(BG4_L2_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L2_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L2_TM>>16)&$FF
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
    lda.w #BG4_L2_TM_End-BG4_L2_TM
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
    lda.b #(BG4_L3_TM)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L3_TM>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(BG4_L3_TM>>16)&$FF
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
    lda.w #BG4_L3_TM_End-BG4_L3_TM
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy.w #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y

    stz.w !BG3VOffMirror
    stz.w !BG3VOffMirror+1
    ;Transfer palette data
    ldy.w #BG4_L2_Pal_End-BG4_L2_Pal
    -
    lda.w BG4_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bne -
    ldy.w #BG4_L3_Pal_End-BG4_L3_Pal
    -
    lda.w BG4_L3_Pal, Y
    sta.w PalMirror, Y
    dey
    bne -
    ldy.w #Surfboard_Pal_End-Surfboard_Pal
    -
    lda.w Surfboard_Pal, Y
    sta.w PalMirror+(144*2), Y
    dey
    bne -

GameLoop_UpdateBG:
    php
    pha
    phx
    phy
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
    dw BG0
    dw BG1
    dw BG2
    dw BG3

BG0:
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
    
    ;Score
    lda.b #$10
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    stz.w HW_WMDATA

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
    lda.b #$1F          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$23          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    lda.b #$60          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    stz.w HW_WMDATA     ;End flag
    
    lda.b #$03
    sta.w HDMAMirror
    lda.b #(HW_CGADD)&$FF
    sta.w HDMAMirror+1
    ldx.w #BG1ColTable
    stx.w HDMAMirror+2
    lda.b #$80
    sta.w HDMAMirror+4

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

BG1:    
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

    lda.b #$03
    sta.w HDMAMirror
    lda.b #(HW_CGADD)&$FF
    sta.w HDMAMirror+1
    ldx.w #BG2ColTable
    stx.w HDMAMirror+2
    lda.b #$80
    sta.w HDMAMirror+4

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
    inc.w !BG3HOffMirror
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
    adc.w !BG3HOffMirror
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

BG2:
    lda.w BGScrollOff+$0F
    inc
    sta.w BGScrollOff+$0F
    cmp.b #$05
    bne +
    stz.w BGScrollOff+$0F
    ;Wires
    ldy.w #$000A
    tdc
    lda.b #$03
    sta.b ZP.R4
    jsr PalCycle
    ;Forewires
    ldy.w #$0028
    tdc
    lda.b #$06
    sta.b ZP.R4
    jsr PalCycle
    +

    lda.w BGScrollOff
    inc
    sta.w BGScrollOff
    bit #$40
    beq +
    stz.w BGScrollOff
    inc.w !BG3HOffMirror
    stz.w !BG3HOffMirror+1
    +
    
    ;Top CPU line
    lda.w BGScrollOff+1
    inc
    sta.w BGScrollOff+1
    bit #$20
    beq +
    stz.w BGScrollOff+1
    inc.w BGScrollVal+1
    +

    ;Bottom CPU line
    lda.w BGScrollOff+2
    inc
    sta.w BGScrollOff+2
    bit #$08
    beq +
    stz.w BGScrollOff+2
    inc.w BGScrollVal+2
    +

    ;Buildings
    lda.w BGScrollOff+3
    inc
    sta.w BGScrollOff+3
    bit #$04
    beq +
    stz.w BGScrollOff+3
    inc.w BGScrollVal+3
    +

    ;Pinout fence
    lda.w BGScrollOff+4
    inc
    sta.w BGScrollOff+4
    bit #$02
    beq +
    stz.w BGScrollOff+4
    inc.w BGScrollVal+4
    +
    
    lda.w BGScrollVal+5
    clc
    adc.b #$03
    sta.w BGScrollVal+5

    ldx.w #HDMAScrollBuffer&$FFFF
    stx.w HW_WMADDL
    lda.b #(HDMAScrollBuffer>>16)&$FF
    sta.w HW_WMADDH

    lda.b #$70          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Cloud2
    lda.b #$07          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    ;Cloud3
    lda.b #$20          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+2 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$1B          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+3 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$15          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+4 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$10          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+5 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/

    lda.b #$01          ;Scanline
    sta.w HW_WMDATA
    stz.w HW_WMDATA     ;\
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

    lda.b #$03
    sta.w HDMAMirror
    lda.b #(HW_CGADD)&$FF
    sta.w HDMAMirror+1
    ldx.w #BG3ColTable
    stx.w HDMAMirror+2
    lda.b #$80
    sta.w HDMAMirror+4
    rts

BG3:
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
    lda.b #$D7          ;Scanline
    sta.w HW_WMDATA
    ;Skew water
    ldy.w #$0000
    -
    lda.w BGScrollVal+4
    adc.w SkewTable, Y
    sta.w HW_WMDATA
    stz.w HW_WMDATA
    iny
    cpy.w #$005D
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

    lda.b #$03
    sta.w HDMAMirror
    lda.b #(HW_CGADD)&$FF
    sta.w HDMAMirror+1
    ldx.w #BG4ColTable
    stx.w HDMAMirror+2
    lda.b #$80
    sta.w HDMAMirror+4

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
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    clc
    adc.b #$06
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!SurfboardT0
    clc
    adc.w OBJFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!SurfboardAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    ;Second surfboard sprite
    lda.w Player.X
    clc
    adc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    clc
    adc.b #$06
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!SurfboardT1
    clc
    adc.w OBJFrame
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!SurfboardAttr
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
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
    sta.b (ZP.OAMPtr)
    rep #$20
    inc.b ZP.OAMPtr
    sep #$20
    ;Y
    lda.w SPRTextPosY, Y
    sta.b (ZP.OAMPtr)
    rep #$20
    inc.b ZP.OAMPtr
    sep #$20
    ;Tile
    lda.b (ZP.MemPointer)       ;Grab character
    sta.b (ZP.OAMPtr)
    rep #$20
    inc.b ZP.OAMPtr
    sep #$20
    ;Attr
    lda.b #!SprFont1Attr
    sta.b (ZP.OAMPtr)
    rep #$20
    inc.b ZP.OAMPtr
    sep #$20
    ;Move onto next character
    rep #$20
    inc.b ZP.MemPointer
    sep #$20
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
    sta.w W12SELMirror
    sta.w W34SELMirror
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

    ; ZP.R0             |   X
    ; ZP.R1             |   Y
    ; ZP.R2             |   Tile
    ; ZP.R3             |   Attr
    ; ZP.R4             |   Big/Small
    ; ZP.MemPointer     |   Bullshit second table
AddSprite:
    pha
    phx
    phy
    php
    rep #$20
    lda.b ZP.OAMPtr
    sec
    sbc.w #OAMCopy
    lsr
    lsr
    and.w #$0003
    tay
    ;Find second table position
    lda.b ZP.OAMPtr
    sec
    sbc.w #OAMCopy
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w #OAMCopy+$0200
    sta.b ZP.MemPointer
    sep #$20
    lda.b ZP.R0
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R1
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R2
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R3
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b ZP.R4
    beq +
    lda.b (ZP.MemPointer)
    ora.w SpriteTableMask, Y
    sta.b (ZP.MemPointer)
    +
    plp
    ply
    plx
    pla
    rts

;|------------------|
;|   IN GAME TEXT   |
;|------------------|
HighscoreText:
    dw "01      CRIS      100000"
    dw "02      TOAS      090000"
    dw "03      DAVR      080000"
    dw "04      MRMA      070000"
    dw "05      JUIC      060000"
    dw "06      WANK      050000"
    dw "07      PZZA      040000"
    dw "08      FUCK      030000"
    dw "09      DEAD      020000"
    dw "10      HEHE      010000"
HighscoreTextEnd:

ScoreText:
    dw "SCORE: "
EndScoreText:

WaveText:
    dw "WAVE: "
EndWaveText:

LivesText:
    dw "LIVES: "
EndLivesText:

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
    db "13: BROKEN CANNON     "     ;Bullets have random direction
OpEText:
    db "14: CONFUSED ENEMIES  "     ;Enemy Bullets have a random direction
OpFText:
    db "15: 2-????????????????"     ;NAN
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
    db $02              ;Purple Mook
    db $02              ;MultiArm
    db $03              ;Tough Guy
    
EnemyScoreTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $02              ;Metal Rocketeer
    db $01              ;Boxy Greenback
    db $01              ;Mind Cake
    db $02              ;Sophisticated mimic
    db $02              ;Purple Mook
    db $04              ;MultiArm
    db $08              ;Tough Guy
    
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

;Enemy wave definitions
EnemyWave00:
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $01,$00,$00,$00,$00,$00,$00,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave01:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave02:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave03:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
EnemyWave04:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave05:
    db $04,$04,$06,$06,$06,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$06,$06,$06,$04,$04
EnemyWave06:
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
EnemyWave07:
    db $01,$05,$01,$05,$01,$05,$01,$05
    db $01,$05,$01,$05,$01,$05,$01,$05
    db $01,$05,$01,$05,$01,$05,$01,$05
    db $01,$05,$01,$05,$01,$05,$01,$05
    db $01,$05,$01,$05,$01,$05,$01,$05
EnemyWave08:
    db $06,$07,$06,$07,$06,$07,$06,$07
    db $06,$07,$06,$07,$06,$07,$06,$07
    db $06,$07,$06,$07,$06,$07,$06,$07
    db $06,$07,$06,$07,$06,$07,$06,$07
    db $06,$07,$06,$07,$06,$07,$06,$07
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
    db $00              ;Boxy Greenback
    db $01              ;Mind Cake
    db $00              ;Sophisticated mimic
    db $01              ;Purple Mook
    db $01              ;MultiArm
    db $01              ;Tough Guy

BG1ColTable:
    db $40          ;Scanline counter
    dw $0000        ;Address
    dw $0821        ;Colour value
    
    db $20          ;Scanline counter
    dw $0000        ;Address
    dw $1021

    db $20          ;Scanline counter
    dw $0000
    dw $1842

    db $10          ;Scanline counter
    dw $0000
    dw $2063
    
    db $08          ;Scanline counter
    dw $0000
    dw $2884

    db $08          ;Scanline counter
    dw $0000
    dw $30A5

    db $08          ;Scanline counter
    dw $0000
    dw $38C6

    db $08          ;Scanline counter
    dw $0000
    dw $44E7

    db $08          ;Scanline counter
    dw $0000
    dw $4D08

    db $40          ;Scanline counter
    dw $0000
    dw $0000
    
BG2ColTable:
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $6F7B

    db $0C          ;Scanline counter
    dw $0000        ;Address
    dw $3188

    db $08          ;Scanline counter
    dw $0000        ;Address
    dw $39CA

    db $06          ;Scanline counter
    dw $0000        ;Address
    dw $420C

    db $04          ;Scanline counter
    dw $0000        ;Address
    dw $462C

    db $04          ;Scanline counter
    dw $0000        ;Address
    dw $4A4E

    db $03          ;Scanline counter
    dw $0000        ;Address
    dw $4E6E

    db $02          ;Scanline counter
    dw $0000        ;Address
    dw $5290

    db $01          ;Scanline counter
    dw $0000        ;Address
    dw $56B1

    db $40          ;Scanline counter
    dw $0000
    dw $0000
    
    dw $0000

    
BG3ColTable:
    db $40          ;Scanline counter
    dw $0000        ;Address
    dw $0020
    db $20          ;Scanline counter
    dw $0000        ;Address
    dw $0441
    db $18          ;Scanline counter
    dw $0000        ;Address
    dw $0862
    db $18          ;Scanline counter
    dw $0000        ;Address
    dw $0882
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $10A4
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $14C5
    db $08          ;Scanline counter
    dw $0000        ;Address
    dw $18E6
    db $04          ;Scanline counter
    dw $0000        ;Address
    dw $0000
    db $00

BG4ColTable:
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $5294
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $4A52
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $420F
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $39CB
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $3188
    db $10          ;Scanline counter
    dw $0000        ;Address
    dw $2947
    db $08          ;Scanline counter
    dw $0000        ;Address
    dw $2946
    db $04          ;Scanline counter
    dw $0000        ;Address
    dw $0000
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

    ;Only for X pos, Y pos is constant
ShieldPosTable:
    dw $1018
    dw $2028
    dw $5058
    dw $6068
    dw $9098
    dw $A0A8
    dw $D0D8
    dw $E0E8
ShieldPosTableEnd:

ShieldTileTable:
    ;Dead
    db $00
    db $00
    db $00
    db $00
    ;Severely damaged
    db $4D
    db $4C
    db $4C
    db $4D
    ;Moderately damaged
    db $4B
    db $4A
    db $4A
    db $4B
    ;Partially damaged
    db $49
    db $48
    db $48
    db $49
    ;Full health
    db $47
    db $46
    db $46
    db $47

ShieldExplosionTileTable:
    db $55
    db $54
    db $53
    db $52
    db $51
    db $50
    db $4F
    db $4E

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

SpriteTableMask:
    db $02
    db $08
    db $20
    db $80

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

;exp(5*t/T)
Perspective:
dw $0080,$008A,$0096,$00A2,$00AF,$00BD,$00CD
dw $00DD,$00EF,$0103,$0118,$012E,$0147,$0161
dw $017E,$019D,$01BF,$01E3,$020A,$0235,$0263
dw $0294,$02CA,$0304,$0343,$0386,$03D0,$041F
dw $0475,$04D2,$0536,$05A2,$0617,$0696,$071F
dw $07B3,$0853,$0901,$09BC,$0A86,$0B61,$0C4E
dw $0D4E,$0E63,$0F8E,$10D2,$122F,$13AA,$1543
dw $16FD,$18DB,$1AE0,$1D0F,$1F6C,$21F9,$24BC
dw $27B8,$2AF3,$2E70,$3236,$364A,$3AB4,$3F79
dw $44A1

;log(24/t)
SkewTable:
db $FF,$FF,$FF,$EA,$DA,$CE,$C4,$BC,$B4,$AE
db $A8,$A3,$9E,$99,$95,$92,$8E,$8B,$88,$85
db $82,$7F,$7C,$7A,$78,$75,$73,$71,$6F,$6D
db $6B,$6A,$68,$66,$64,$63,$61,$60,$5E,$5D
db $5B,$5A,$59,$57,$56,$55,$54,$53,$51,$50
db $4F,$4E,$4D,$4C,$4B,$4A,$49,$48,$47,$46
db $45,$44,$43,$42,$42,$41,$40,$3F,$3E,$3D
db $3D,$3C,$3B,$3A,$3A,$39,$38,$37,$37,$36
db $35,$35,$34,$33,$33,$32,$31,$31,$30,$2F
db $2F,$2E,$2E,$2D,$2C,$2C,$2B,$2B,$2A,$29
db $29,$28,$28,$27,$27,$26,$26,$25,$25,$24
db $24,$23,$23,$22,$22,$21,$21,$20,$20,$1F
db $1F,$1E,$1E,$1E,$1D,$1D,$1C,$1C,$1B,$1B
db $1A,$1A,$1A,$19,$19,$18,$18,$18,$17,$17
db $16,$16,$16,$15,$15,$14,$14,$14,$13,$13
db $13,$12,$12,$11,$11,$11,$10,$10,$10,$0F
db $0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C
db $0C,$0B,$0B,$0B,$0A,$0A,$0A,$09,$09,$09
db $09,$08,$08,$08,$07,$07,$07,$06,$06,$06
db $06,$05,$05,$05,$04,$04,$04,$04,$03,$03
db $03,$02,$02,$02,$02,$01,$01,$01,$01,$00
db $00,$00,$00,$00 

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

                                ;First half of the header
org $FFB0                       ;Goto FFB0
db "00"                         ;ROM data Region
db "BANS"                       ;Unique code for identification
fill 6                          ;Fill 6 bytes
db 0,0,0,0
                                ;Second half of header
db "BORED ALIENS IN SPACE"      ;Program name [21 characters long]
db $31                          ;Set ROM identification and speed
db 0                            ;Set what we have available [in this case ROM]
db 8                            ;Set ROM size [256k]
db 0                            ;Set RAM size [0k]
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