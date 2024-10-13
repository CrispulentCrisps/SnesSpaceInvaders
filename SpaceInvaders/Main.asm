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

org $8000                       ;Go to db 8000

ZVal:
dw $0000

;---------------;
;  Characters   ;
;---------------;
;
GameGfx:
    incbin "bin/gfx/GameGFX.bin"
GameGfxEnd:

GameSpr:
    incbin "bin/gfx/GameSprites.bin"
GameSprEnd:

GamePal:
    incbin "bin/gfx/pal/GamePal.bin"
GamePalEnd:

GameSprPal:
    incbin "bin/gfx/pal/GameSpritesPal.bin"
GameSprPalEnd:

BG1_L3:
    incbin "bin/gfx/BG-1-L3.bin"
BG1_L3_End:

BG1_L2:
    incbin "bin/gfx/BG-1-L2.bin"
BG1_L2_End:


BG1_L3_Pal:
    incbin "bin/gfx/pal/BG-1-L3-Pal.bin"
BG1_L3_Pal_End:

BG1_L2_Pal:
    incbin "bin/gfx/pal/BG-1-L2-Pal.bin"
BG1_L2_Pal_End:

BG1Grad:
    incbin "bin/gfx/pal/BG-1-L3-Grad.bin"
BG1GradEnd:

;---------------;
;   Tilemaps    ;
;---------------;
;
TestBG:
    incbin "bin/gfx/tilemap/T1.map"
TestBGEnd:

BG1_L3_TM:
    incbin "bin/gfx/tilemap/BG-1-L3.bin"
BG1_L3_TM_End:

BG1_L2_TM:
    incbin "bin/gfx/tilemap/BG-1-L2.bin"
BG1_L2_TM_End:


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
    stz.w HW_A1B0
    stz.w HW_DAS0L
    stz.w HW_DAS0H
    lda.b #$01
    sta.w HW_MDMAEN
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
    ldx.w #GameSprPal&$FFFF        ;Grab palette addr
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

    ;Load BG tiles
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #BG1_L3&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #BG1_L3>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #BG1_L3_End-BG1_L3
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0
    
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #BG1_L2&$FFFF        ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #BG1_L2>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #BG1_L2_End-BG1_L2
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldy.w #$0000
    -
    lda.w GamePal, Y
    sta.w PalMirror, Y
    lda.w GameSprPal, Y
    sta.w PalMirror+256, Y
    iny
    cpy #$100
    bne -

    sep #%00100000              ;Enter Memory mode
    lda.b #$F0
    sta.w HW_BG1SC              ;Set Layer 1 values
    lda.b #$F4
    sta.w HW_BG2SC              ;Set Layer 2 values
    lda.b #$F8
    sta.w HW_BG3SC              ;Set Layer 3 values
    lda.b #$FC
    sta.w HW_BG4SC              ;Set Layer 4 values
    stz.w HW_MOSAIC             ;Reset BG mosaic
    lda.b #$02                  ;Load BG Mode
    sta.w HW_BGMODE             ;Set BG mode
    lda.b #$00
    sta.w HW_BG12NBA            ;Reset bg character DAD
    lda.b #$FF
    sta.w HW_TM
    lda.b #$00
    sta.w HW_OBSEL
    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP

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

    lda.b #$01
    sta.b ZP.SceneIndex         ;Set starting scene
    sta.b ZP.ChangeScene        ;Set load flag

    lda.b #$81
    sta.w HW_NMITIMEN           ;NMI Enabled

    rep #%00100000              ;Set A to 16 bit mode

    ;Example VrDmaPtr struct
    ;lda.w #SineTable             ;Grab source addr
    ;sta.w VrDmaPtr.Src             
    ;lda.w #$0180                 ;Load into bank 80 & specify non-end flag
    ;sta.w VrDmaPtr.Src+2
    ;lda.w #$2000
    ;sta.w VrDmaPtr.Dest
    ;lda.w #$0200
    ;sta.w VrDmaPtr.Len

MainLoop:
    stz.b ZP.NMIDone
    sep #%00110000              ;Set X width to 8
    lda.b ZP.SceneIndex         ;Load our scene in
    asl
    tax
    rep #%00110000              ;Set CPU to 16 bit mode
    lda.w #VrDmaPtr
    sta.w ZP.VrDmaListPtr
    lda.w #OAMCopy
    sta.w ZP.OAMPtr
    lda.w #$0000
    sta.w VrDmaPtr+3
    lda.w #HDMAMirror
    sta.b ZP.HDMAPtr
    jsr (SelectScene, X)        ;Go to correct subroutine logic in jumptable
    
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
    lda.b #$8F
    sta.w HW_INIDISP
    rep #$20

    ;------------------;
    ;   OAM Transfer   ;
    ;------------------;
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

    ;-----------------------;
    ;   PPU Mirror write    ;
    ;-----------------------;
    tdc
    sep #$20
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
    ;   DMA Queue   ;
    ;---------------;
    lda.w #VrDmaPtr
    sta.w ZP.VrDmaListPtr
    ldy.w #$0003
    .VrDMALoop:
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b (ZP.VrDmaListPtr), Y                  ;Load dma ptr flag
    beq .FinishDMALoop                          ;Check for 0 for end flag
    rep #%00100000                              ;Enter 8bit mode for A
    lda.w #HW_VMDATAL
    sta.w HW_BBAD0                              ;Shove in DMA destination
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b #%000000001                           ;Set transfer to be word length
    sta.w HW_DMAP0
    rep #%00100000                              ;Exit 8bit mode for A
    ldy.w #$0000
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_A1T0L                              ;Shove in first 2 bytes of source pointer
    sep #%00100000                              ;Enter 8bit mode for A
    ldy.w #$0002
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_A1B0                               ;Shove in first 3rd byte of source pointer [bank]
    rep #%00100000                              ;Exit 8bit mode for A
    ldy.w #$0004
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_VMADDL                             ;Set VRAM addr from DMA pointer
    ldy.w #$0006
    lda.b (ZP.VrDmaListPtr), Y
    sta.w HW_DAS0L                              ;Shove byte amount to enter
    sep #%00100000                              ;Enter 8bit mode for A
    lda.b #$01
    sta.w HW_MDMAEN                             ;Enable DMA
    rep #%00100000                              ;Exit 8bit mode for A 
    lda.w ZP.VrDmaListPtr
    clc
    adc.w #$0008
    sta.w ZP.VrDmaListPtr
    jmp .VrDMALoop      ;Keep looping until we find an END flag entry
    .FinishDMALoop:

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
    rep #%00100000                              ;Exit 8bit mode for A
    lda.w HW_JOY1L
    sta.b ZP.Controller

    sep #$20
    lda.b #$1F
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
    dw OptionsScene
    dw ContinueScene
    dw HighscoreScene

TitleScene:

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

    lda.b #$01                  ;Set BG Mode to 1 & Layer 3 to hi priority
    sta.w HW_BGMODE
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
    
    ldx.w #$0000
    stx.b ZP.Score

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

    ;-------------------;
    ;   Load tilemaps   ;
    ;-------------------;
    sep #$20
    ldx.w #L2Ram
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #BG1_L2_TM&$FFFF      ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #BG1_L2_TM>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #BG1_L2_TM_End-BG1_L2_TM
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN             ;Enable DMA channel 0

    ldx.w #L3Ram
    stx.w HW_VMADDL
    lda.b #$01
    sta.w HW_DMAP0              ;Setup DMAP0
    ldx.w #BG1_L3_TM&$FFFF      ;Grab graphics addr
    stx.w HW_A1T0L              ;Shove lo+mid addr byte
    lda.b #BG1_L3_TM>>16&$FF
    sta.w HW_A1B0               ;Store bank
    ldx.w #BG1_L3_TM_End-BG1_L3_TM
    stx.w HW_DAS0L              ;Return amount of bytes to be written in VRAM
    lda.b #HW_VMDATAL&$FF
    sta.w HW_BBAD0
    lda.b #$01
    sta.w HW_MDMAEN 
    
    ldy.w #(BG1_L3_Pal_End-BG1_L3_Pal)-1
    -
    lda.w BG1_L3_Pal, Y
    sta.w PalMirror, Y
    dey
    bpl -
    lda.b #%01000010
    sta.w PalMirror
    lda.b #%00010000
    sta.w PalMirror+1
    sep #$20
        
    ldy.w #(BG1_L2_Pal_End-BG1_L2_Pal)-1
    -
    lda.w BG1_L2_Pal, Y
    sta.w PalMirror+32, Y
    dey
    bpl -

    ldx.w #$0000
    stx.w !BG2VOffMirror
    ;Write enemy entries into Enemy struct array
    jsr GameLoop_UpdateEnemyArray
    jsr GameLoop_DrawEnemies
    jsr GameLoop_DrawScore
    jsr GameLoop_FindMaxRowBounds
    lda.b #!GameState_Play
    sta.w GameState

    sep #$20
    lda.b #$0F                  ;Set master brightness to 15 & stops blanking
    sta.w HW_INIDISP            ;Sends the value A to HW_INIDISP
    .SkipLoad:

    ;-----------------------;
    ;   Background Logic    ;
    ;-----------------------;
    jsr GameLoop_UpdateBG

    ;-------------------;
    ;   Player Logic    ;
    ;-------------------;
    lda.b ZP.Controller+1
    and #$01                    ;Check Right DPAD
    beq .SkipRightInput
    lda.w Player.X
    adc.b #!PlayerSpeed
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
    and #$80                    ;Check A button
    beq .SkipShoot
    lda.w Bullet[0].Enabled
    bne .SkipShoot
    ;Enable bullet
    lda.b #$01
    sta.w Bullet[0].Enabled
    ;Set Bullet position to the player's
    lda.w Player.X
    adc.b #$04
    sta.w Bullet[0].X
    sta.w LaserOAM
    lda.b #!PlayerY
    sta.w Bullet[0].Y
    .SkipShoot:
    
    stz.w Player.Frame
    stz.w Player.State

    ;------------------------------;
    ;   Player Drawing Commands    ;
    ;------------------------------;
    ;Player will take the first 4 spots of OAM
    ;BL tile
    lda.w Player.X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerTileB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$22
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    
    ;BR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerTileB
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$62
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

    ;TL tile
    lda.w Player.X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerTileT
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$22
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    
    ;TR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!PlayerTileT
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$62
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    

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
    sbc.b #!BulletSpeed
    bcs .SkipDisable0
    stz.w Bullet.Enabled
    lda.b #$FF
    sta.w Bullet[0].X
    .SkipDisable0:
    sta.w Bullet.Y
    ;Collision code
    lda.b #$FF
    sta.b ZP.BulletColTile      ;Reset collided tile index
    lda.w Bullet[0].X
    clc
    adc.b #!BulletColOff
    sta.b ZP.R0
    lda.w Bullet[0].Y
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
    .SkipEnemyHurt:

    .SkipBullet0Logic:
    ;---------------------;
    ;   Bullet Drawing    ;
    ;---------------------;
    lda.w Bullet.X
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.w Bullet.Y
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #!BulletF1
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr
    lda.b #$22
    sta.b (ZP.OAMPtr)
    inc.b ZP.OAMPtr

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
    ;Add speed offset
    inc.b ZP.EnemyPlanePosY

    ;Check if we've hit the starting Y posiiton
    lda.b ZP.EnemyPlanePosY
    cmp.b #!EnemyPlaneStartY
    bne ++
    ;If we have then set the reset flag to reset the wave
    inc.w EnemyResetFlag
    ++
    .SkipEnemyResetMove:
    +
    ;Draw enemies
    jsr GameLoop_DrawEnemies
    jsr GameLoop_DrawEnemies_FrameDecider

    dec.w PlayerDeathTimer
    bne +
    ;TRIGGER PLAYER DEATH
    jsr GameLoop_KillPlayer
    lda.b #$FF
    sta.w PlayerDeathTimer
    sta.w EnemyResetMove
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
    jsr GameLoop_DrawEnemies
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
    sta.w EnemyHurtTable, Y
    +
    iny
    cpy.w #$0028
    bne -
    ;Adjust speed and then apply
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
    eor #$FF
    and #$01
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

    ;------------------------;
    ;    Handle Explosions   ;
    ;------------------------;
    ldy.w #!EnemyHurtPalInd*2
    tdc
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
    rep #%00100000              ;Set A to 16 bit mode
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
    lda.b #(ScoreDispBuffer>>16)&$FF
    sta.w HW_WMADDH
    lda.b #(ScoreDispBuffer>>8)&$FF
    sta.w HW_WMADDM
    lda.b #(ScoreDispBuffer)&$FF
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

    ;Next, we draw some empty characters
    ldy.w #$000D
    -
    stz.w HW_WMDATA
    dey
    bpl -

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
    lda.b #(ScoreDispBuffer)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(ScoreDispBuffer>>8)&$FF
    sta.b (ZP.VrDmaListPtr), Y
    iny
    lda.b #(ScoreDispBuffer>>16)&$FF
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
    lda.b ZP.R3
    beq .SkipInc
    inc.b ZP.R2
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
    ;lda.b #!EnemyRBounds
    sta.w EnemyMin
    ldy.b ZP.R1
    iny
    lda.w EnemyRowPos, Y
    ;lda.b #!EnemyLBounds
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
    lda.b !EnemyMoveR
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    lda.b #!EnemyPlaneStartX
    sta.b ZP.EnemyPlanePosX
    sta.b !BG1HOffMirror
    stz.b !BG1HOffMirror+1
    lda.b #!EnemyPlaneStartY
    sta.b ZP.EnemyPlanePosY
    sta.b !BG1VOffMirror
    stz.b !BG1VOffMirror+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    jsr GameLoop_UpdateEnemyArray
    jsr GameLoop_FindMaxRowBounds
    lda.b #!GameState_Play
    sta.w GameState
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
        adc.b ZP.EnemyFrame
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
        adc.b ZP.EnemyFrame
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
    sep #$20
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
        adc.b ZP.EnemyFrame
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
        adc.b ZP.EnemyFrame
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
    lda.w #960
    sta.b (ZP.VrDmaListPtr), Y
    lda.b ZP.VrDmaListPtr
    clc
    adc #$0008
    sta.b ZP.VrDmaListPtr
    sep #$20
    ldy #$0003
    lda.b #$00
    sta.b (ZP.VrDmaListPtr), Y
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
    stz.b ZP.R2                     ;Reset frame offset
    beq .ZeroTileSkip
    lda.b ZP.EnemyFrame
    sta.b ZP.R2
    .ZeroTileSkip:
    pla
    clc
    adc.b ZP.R2
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

    lda.w OAMCopy+512             ;Player X 9th bit
    sec
    sbc.b #%01010101
    sta.w OAMCopy+512             ;Player X 9th bit
    lda.b #$01
    dec.b ZP.Lives
    bne +

    +
    jsr GameLoop_DrawScore
    plp
    ply
    plx
    pla
    rts

    ;
GameLoop_KillPlayer:
    php
    pha
    phx
    phy    
    sep #$20
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
    lda.w OAMCopy               ;Grab player X, since the player is always the first entry into OAM
    sta.w ExplosionX, Y
    lda.w OAMCopy+1             ;Player Y
    sta.w ExplosionY, Y
    dey
    bpl -
    lda.w OAMCopy+512             ;Player X 9th bit
    clc
    adc.b #%01010101
    sta.w OAMCopy+512             ;Player X 9th bit
    lda.b #$01
    sta.w EnemyResetMove
    ply
    plx
    pla
    plp
    rts

OptionsScene:

    rts

ContinueScene:

    rts

HighscoreScene:
    
    rts

    ;-------------------;
    ;   Palette cycler  ;
    ;-------------------;
    ;
    ;   Usage:
    ;       Takes a given palette address and cycles the first 15 colours of it
    ;   Input:
    ;       Y [Palette index]
    ;   Output:
    ;       Cycle'd palette by 1 entry
    ;
PalCycle:
    pha
    phy
    rep #$20
    ;First, grab the last palette of the selected zone
    lda.w PalMirror+2, Y
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
    cmp.b #$10
    bne -
    ;Then we apply the last colour back to the start of the palette [past the transparent first colour]
    rep #$20
    lda.b ZP.R0
    sta.w PalMirror-2, Y
    sep #$20
    ply
    pla
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
    pla
    rts

UpdateExplosives:
    ;Update Timers
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
    lda.b #%00110100            ;Palette 2, hi priority
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
    lda.b #$17          ;Scanline
    sta.w HW_WMDATA
    lda.w BGScrollVal+1 ;\
    sta.w HW_WMDATA     ;|  Offsets
    stz.w HW_WMDATA     ;/
    
    ;Score
    lda.b #$01
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
    rts

Text:
    dw "HELLO GUYS"
EndText:

ScoreText:
    dw "SCORE: "
EndScoreText:

LivesText:
    dw "LIVES: "
EndLivesText:

HighScoreText:
    dw "HIGH SCORE"
EndHighScoreText:

OptionsText:
    dw "OPTIONS"
EndOptionsText:

EnemyTypesPal:
    db $00<<2           ;Empty
    db !EnemyPal2           ;Basic Squelcher
    db !EnemyPal3           ;Slow Shooter
    db !EnemyPal2           ;Boxy Greenback
    db $05<<2           ;Fast Shooter
    db $00<<2           ;Sophisticated mimic
    db $05<<2           ;Purple Shooter
    db !EnemyPal3           ;Multi Arm
    db !EnemyPal2           ;Tough Guy

EnemyTypesTile:
    db $00              ;Empty
    db $2D              ;Basic Squelcher
    db $2F              ;Slow Shooter
    db $31              ;Boxy Greenback
    db $33              ;Fast Shooter
    db $3D              ;Sophisticated mimic
    db $3F              ;Purple Shooter
    db $41              ;MultiArm
    db $43              ;Tough Guy

EnemyDrawTop:
    ;Empty/Dead
    db $00              
    db $00<<2
    db $00              
    db $00<<2

    ;Basic Squelcher
    db $2D
    db !EnemyPal1
    db $2D
    db (!EnemyPal1)+$40

    ;Slow Shooter
    db $2F
    db !EnemyPal2
    db $2F
    db (!EnemyPal2)+$40

    ;Boxy Greenback
    db $31
    db !EnemyPal1
    db $31
    db (!EnemyPal1)+$40

    ;Fast Shooter
    db $33
    db !EnemyPal3
    db $33
    db (!EnemyPal3)+$40

    ;Sophisticated mimic
    db $3D
    db !EnemyPal4
    db $3D
    db (!EnemyPal4)+$40

    ;Purple shooter
    db $3F
    db !EnemyPal3
    db $3F
    db (!EnemyPal3)+$40

    ;MultiArm
    db $41
    db !EnemyPal2
    db $41
    db (!EnemyPal2)+$40

    ;Tough Guy
    db $43
    db !EnemyPal1
    db $43
    db (!EnemyPal1)+$40

EnemyDrawBot:

    ;Empty/Dead
    db $00
    db $00<<2
    db $00
    db $00<<2

    ;Basic Squelcher
    db $2D+$08
    db !EnemyPal1
    db $2D+$08
    db (!EnemyPal1)+$40

    ;Slow Shooter
    db $2F+$08
    db !EnemyPal2
    db $2F+$08
    db (!EnemyPal2)+$40

    ;Boxy Greenback
    db $31+$08
    db !EnemyPal1
    db $31+$08
    db (!EnemyPal1)+$40

    ;Fast Shooter
    db $33+$08
    db !EnemyPal3
    db $33+$08
    db (!EnemyPal3)+$40

    ;Sophisticated mimic
    db $3D+$08
    db !EnemyPal4
    db $3D+$08
    db (!EnemyPal4)+$40

    ;Purple shooter
    db $3F+$08
    db !EnemyPal3
    db $3F+$08
    db (!EnemyPal3)+$40

    ;MultiArm
    db $41+$08
    db !EnemyPal2
    db $41+$08
    db (!EnemyPal2)+$40

    ;Tough Guy
    db $43+$08
    db !EnemyPal1
    db $43+$08
    db (!EnemyPal1)+$40
    

EnemyHealthTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $02              ;Slow Shooter
    db $01              ;Boxy Greenback
    db $01              ;Fast Shooter
    db $02              ;Sophisticated mimic
    db $02              ;Purple Shooter
    db $02              ;MultiArm
    db $03              ;Tough Guy
    
EnemyScoreTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $02              ;Slow Shooter
    db $01              ;Boxy Greenback
    db $01              ;Fast Shooter
    db $02              ;Sophisticated mimic
    db $02              ;Purple Shooter
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
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $03,$03,$03,$03,$03,$03,$03,$03
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
    db $05,$05,$05,$05,$05,$05,$05,$05
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
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
    db $02,$08,$02,$08,$02,$08,$02,$08
EnemyWave09:
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
    db $01,$02,$03,$04,$05,$06,$07,$08
EnemyWave0A:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave0B:
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
EnemyWave0C:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02,$02,$02
EnemyWave0D:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $03,$03,$03,$03,$03,$03,$03,$03
EnemyWave0E:
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave0F:
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
EnemyWave10:
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
EnemyWave11:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
EnemyWave12:
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08
EnemyWave13:
    db $01,$05,$05,$07,$07,$05,$05,$01
    db $01,$01,$05,$07,$07,$05,$01,$01
    db $01,$05,$05,$07,$07,$05,$05,$01
    db $01,$01,$05,$07,$07,$05,$01,$01
    db $01,$05,$05,$07,$07,$05,$05,$01
EnemyWave14:
    db $04,$04,$04,$04,$04,$04,$04,$04
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $04,$04,$04,$04,$04,$04,$04,$04
EnemyWave15:
    db $05,$07,$05,$07,$05,$07,$05,$07
    db $07,$05,$07,$05,$07,$05,$07,$05
    db $05,$07,$05,$07,$05,$07,$05,$07
    db $07,$05,$07,$05,$07,$05,$07,$05
    db $05,$07,$05,$07,$05,$07,$05,$07
EnemyWave16:
    db $01,$03,$04,$02,$02,$04,$03,$07
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $07,$05,$06,$07,$08,$06,$05,$07

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
    db $01          ;Scanline counter
    dw $0000
    dw $0000
    
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
                                ;First half of the header
org $FFB0                       ;Goto FFB0
db "00"                         ;ROM data Region
db "SPNV"                       ;Unique code for identification
fill 6                          ;Fill 6 bytes
db 0,0,0,0
                                ;Second half of header
db "Space invaders clone "      ;Program name [21 characters long]
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