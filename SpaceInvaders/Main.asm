;|==============================|
;|                              |
;|   SNES Space Invaders Clone  |
;|                              |
;|          08/06/2024          |
;|                              |
;|==============================|

hirom                           ;Sets the SNES mapping mode to HIROM

incsrc "hardware.asm"           ;Include namespace HW which contains names for each memory and register addr in the SNES
incsrc "Macros.asm"             ;Include ZP shit

arch 65816                      ;sets the architecture to the 65816 CPU on the SNES

org $8000                       ;Go to db 8000

ZVal:
dw $0000

GameGfx:
    incbin "bin/gfx/GameGFX.bin"
GameGfxEnd:

GamePal:
    incbin "bin/gfx/pal/GamePal.bin"
GamePalEnd:

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
    
    ldx.w #GamePal&$FFFF        ;Grab palette addr
    stx.w HW_A1T1L              ;Shove lo+mid addr byte
    ldx.w #GamePalEnd-GamePal
    stx.w HW_DAS1L              ;Return amount of bytes to be written in VRAM
    lda.b #$02
    sta.w HW_MDMAEN             ;Enable DMA channel 0 + 1

    ldy.w #$0000
    -
    lda.w GamePal, Y
    sta.w PalMirror, Y
    iny
    cpy #GameGfxEnd-GameGfx
    bne -

    ;Window Layer 1 Reset
    ldx.w #L1Ram               ;Shove tile map addr in
    stx.w HW_VMADDL
    ldy.w #$0800
    rep #%00100000              ;Exit Memory mode
    -
    stz.w HW_VMDATAL            ;Set layer to empty 0tile
    dey
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
    lda.w #$0000
    sta.w VrDmaPtr+3
    jsr (SelectScene, X)        ;Go to correct subroutine logic in jumptable
    
    lda.w #$FFFF
    sta.b ZP.NMIDone
    -                           ;Infinite loop to
    lda.b ZP.NMIDone
    bpl MainLoop
    bra -                       ;Prevent the code going into random memory

NMIHandler:
    rep #%00110000      ;Reset X + M flags to set X to 16 bit mode
    
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
    lda.b #$02
    sta.w HW_DMAP0
    ldx.w #PalMirror            ;Grab source addr
    stx.w HW_A1T0L
    lda.b #$80                  ;Load into bank 80
    sta.w HW_A1B0
    lda.b #HW_CGDATA&$FF        ;Destination addr
    sta.w HW_BBAD0
    rep #%00100000
    ldx.w #$100                 ;Bytes to write
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

    lda.b #$01                  ;Set BG Mode to 1
    sta.w HW_BGMODE
    ;Reset Player
    lda.b #$70
    sta.w Player.X    
    ;Reset Bullets
    stz.w Bullet[0].X
    stz.w Bullet[0].Y
    stz.w Bullet[0].Frame
    lda.b #$00
    sta.w Bullet[0].Enabled

    lda.b #$02
    sta.b ZP.EnemyWaveCount
    lda.b !EnemyMoveR
    sta.b ZP.EnemyDir
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    rep #$20
    lda.w #!EnemySpeed
    sta.w ZP.EnemyPlanePosX
    sep #$20
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    
    ;Write enemy entries into Enemy struct array
    jsr GameLoop_UpdateEnemyArray
    jsr GameLoop_DrawEnemies
    jsr GameLoop_DrawScore

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
    sta.w Player.X
    .SkipRightInput:
    
    lda.b ZP.Controller+1
    and #$02                    ;Check Left DPAD
    beq .SkipLeftInput
    lda.w Player.X
    sec
    sbc.b #!PlayerSpeed
    sta.w Player.X
    .SkipLeftInput:

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
    sta.w OAMCopy
    lda.b #!PlayerY
    sta.w OAMCopy+1
    lda.b #!PlayerTileB
    sta.w OAMCopy+2
    lda.b #$02
    sta.w OAMCopy+3
    ;BR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.w OAMCopy+4
    lda.b #!PlayerY
    sta.w OAMCopy+5
    lda.b #!PlayerTileB
    sta.w OAMCopy+6
    lda.b #$42
    sta.w OAMCopy+7
    ;TL tile
    lda.w Player.X
    sta.w OAMCopy+8
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.w OAMCopy+9
    lda.b #!PlayerTileT
    sta.w OAMCopy+10
    lda.b #$02
    sta.w OAMCopy+11
    ;TR tile
    lda.w Player.X
    clc
    adc.b #$08
    sta.w OAMCopy+12
    lda.b #!PlayerY
    sec
    sbc.b #$08
    sta.w OAMCopy+13
    lda.b #!PlayerTileT
    sta.w OAMCopy+14
    lda.b #$42
    sta.w OAMCopy+15
    

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
    bpl .SkipBullet0Logic   ;Exit if we're out of bounds of the tile Y index
    sta.b ZP.R6
    lda.w HW_RDMPYL         ;Grab remainder of division
    sta.b ZP.R7

    lda.b ZP.R5             ;X remainder
    cmp #2
    beq .SkipBullet0Logic   ;Skip if we've hit the empty tile next to the enemy
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
    clc
    adc.w EnemyScoreTable, Y
    bcc ++
    inc.b ZP.Score+1
        bcc +++
        inc.b ZP.Score+2
        +++
    ++
    sta.b ZP.Score
    ply
    lda.b #$00
    sta.w EnemyType, Y      ;Set enemy type to 0 to prevent null enemy collisions
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
    sta.w LaserOAM
    lda.w Bullet.Y
    sta.w LaserOAM+1
    lda.b #!BulletF1
    sta.w LaserOAM+2
    lda.b #$0C
    sta.w LaserOAM+3
    
    ;-----------------;
    ;   Enemy Logic   ;
    ;-----------------;
    ;Update enemy graphics
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
    lsr
    bne +
    lda.b #$01
    +
    sta.b ZP.EnemyWait

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
    ;Move enemy right
    lda.b ZP.EnemyPlanePosX
    clc
    adc #!EnemySpeed
    sta.b ZP.EnemyPlanePosX
    ;Check enemy right boundary
    cmp #!EnemyRBounds
    bpl .ApplyMove
    lda.b #!EnemyMoveD
    sta.b ZP.EnemyDir
    lda.b #!EnemyMoveL
    sta.b ZP.EnemySide
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    jmp .ApplyMove
    .Neg:
    ;Move enemy left
    lda.b ZP.EnemyPlanePosX
    sec
    sbc #!EnemySpeed
    sta.b ZP.EnemyPlanePosX
    ;Check enemy left boundary
    cmp #!EnemyLBounds
    bmi .ApplyMove
    lda.b #!EnemyMoveD
    sta.b ZP.EnemyDir
    lda.b #!EnemyMoveR
    sta.b ZP.EnemySide
    lda.b #!EnemyDownLoop
    sta.b ZP.EnemyDownCount
    .ApplyMove:
    lda.b ZP.EnemyPlanePosX    
    sta.w !BG2HOffMirror
    lda.b #$01
    sta.w !BG2HOffMirror+1
    lda.b ZP.EnemyPlanePosY
    sta.w !BG2VOffMirror
    stz.w !BG2VOffMirror+1
    lda.b ZP.EnemyWait
    sta.b ZP.EnemyTimer
    jsr GameLoop_DrawEnemies_FrameDecider
    .SkipMove:
    dec.b ZP.EnemyTimer

    ;------------------------;
    ;    Handle Explosions   ;
    ;------------------------;
    ldy.w #$0040
    tdc
    jsr PalCycle

    ;-------------------;
    ;    Handle Score   ;
    ;-------------------;
    ;jsr GameLoop_DrawScore

    rep #%00100000              ;Set A to 16 bit mode
    rts

    ;---------------------------;
    ;   Draw Score to Screen    ;
    ;---------------------------;
    ;
    ;   Usage:
    ;
    ;   Clobberlist
    ;       R0
    ;       R1
    ;       R2
    ;       R3
    ;       R4
    ;       R5
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
    cpy #(EndScoreText-ScoreText)
    bne -

    ;Next, Convert score into decimal and store into temporary memory

    ;After, we then store this information into WRam

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
    lda.w #(EndScoreText-ScoreText)+16
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

GameLoop_SendWave:

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

    ;rep #$20
    ;lda.w #(EnemyTileBuffer)&$FFFF
    ;adc.b ZP.BulletColTile
    ;sta.b ZP.MemPointer
    ;sep #$20
    ;lda.b #(EnemyTileBuffer>>16)&$FF
    ;sta.b ZP.MemPointer+2
    ;lda.b #61
    ;sta.b [ZP.MemPointer]

    ;sep #$20
    ;lda.b #(EnemyTileBuffer>>16)&$FF
    ;sta.b ZP.MemPointer+2
    ;ldy.w #$0000
    ;lda.b ZP.BulletColTile
    ;bmi +    
    ;asl
    ;tay
    ;rep #$20
    ;lda.w EnemyTilemapPos, Y
    ;asl
    ;clc
    ;adc.w #EnemyTileBuffer&$FFFF
    ;sta.w ZP.MemPointer
    ;sep #$20
    ;lda.b #$61
    ;sta.b [ZP.MemPointer]
    ;+

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
    lda.w #L2Ram
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

Text:
    dw "HELLO GUYS"
EndText:

ScoreText:
    dw "SCORE: "
EndScoreText:

HighScoreText:
    dw "HIGH SCORE"
EndHighScoreText:

OptionsText:
    dw "OPTIONS"
EndOptionsText:

EnemyTypesPal:
    db $00<<2           ;Empty
    db $03<<2           ;Basic Squelcher
    db $04<<2           ;Slow Shooter
    db $03<<2           ;Boxy Greenback
    db $05<<2           ;Fast Shooter
    db $00<<2           ;Sophisticated mimic
    db $05<<2           ;Purple Shooter
    db $04<<2           ;Multi Arm
    db $03<<2           ;Tough Guy

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
    db $03<<2
    db $2D
    db ($03<<2)+$40

    ;Slow Shooter
    db $2F
    db $04<<2
    db $2F
    db ($04<<2)+$40

    ;Boxy Greenback
    db $31
    db $03<<2
    db $31
    db ($03<<2)+$40

    ;Fast Shooter
    db $33
    db $05<<2
    db $33
    db ($05<<2)+$40

    ;Sophisticated mimic
    db $3D
    db $00<<2
    db $3D
    db ($00<<2)+$40

    ;Purple shooter
    db $3F
    db $05<<2
    db $3F
    db ($05<<2)+$40

    ;MultiArm
    db $41
    db $04<<2
    db $41
    db ($04<<2)+$40

    ;Tough Guy
    db $43
    db $03<<2
    db $43
    db ($03<<2)+$40

EnemyDrawBot:

    ;Empty/Dead
    db $00
    db $00<<2
    db $00
    db $00<<2

    ;Basic Squelcher
    db $2D+$08
    db $03<<2
    db $2D+$08
    db ($03<<2)+$40

    ;Slow Shooter
    db $2F+$08
    db $04<<2
    db $2F+$08
    db ($04<<2)+$40

    ;Boxy Greenback
    db $31+$08
    db $03<<2
    db $31+$08
    db ($03<<2)+$40

    ;Fast Shooter
    db $33+$08
    db $05<<2
    db $33+$08
    db ($05<<2)+$40

    ;Sophisticated mimic
    db $3D+$08
    db $00<<2
    db $3D+$08
    db ($00<<2)+$40

    ;Purple shooter
    db $3F+$08
    db $05<<2
    db $3F+$08
    db ($05<<2)+$40

    ;MultiArm
    db $41+$08
    db $04<<2
    db $41+$08
    db ($04<<2)+$40

    ;Tough Guy
    db $43+$08
    db $03<<2
    db $43+$08
    db ($03<<2)+$40
    

EnemyHealthTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $01              ;Slow Shooter
    db $01              ;Boxy Greenback
    db $02              ;Fast Shooter
    db $02              ;Sophisticated mimic
    db $02              ;Purple Shooter
    db $03              ;MultiArm
    db $04              ;Tough Guy
    
EnemyScoreTable:
    db $00              ;Empty
    db $01              ;Basic Squelcher
    db $01              ;Slow Shooter
    db $02              ;Boxy Greenback
    db $02              ;Fast Shooter
    db $04              ;Sophisticated mimic
    db $04              ;Purple Shooter
    db $08              ;MultiArm
    db $08              ;Tough Guy
    
;List of enemy waves
EnemyWaveLookup:
    dw EnemyWave1
    dw EnemyWave2
    dw EnemyWave3
    dw EnemyWave4
    dw EnemyWave5
    dw EnemyWave6

;Enemy wave definitions
EnemyWave1:
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave2:
    db $02,$02,$02,$02,$02,$02,$02,$02
    db $03,$03,$03,$03,$03,$03,$03,$03
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $01,$01,$01,$01,$01,$01,$01,$01
    db $00,$00,$00,$00,$00,$00,$00,$00
EnemyWave3:
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $05,$05,$05,$05,$05,$05,$05,$05
    db $03,$03,$03,$03,$03,$03,$03,$03
EnemyWave4:
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $06,$06,$06,$06,$06,$06,$06,$06
    db $00,$00,$00,$00,$00,$00,$00,$00
    db $07,$07,$07,$07,$07,$07,$07,$07
    db $07,$07,$07,$07,$07,$07,$07,$07
EnemyWave5:
    db $04,$04,$06,$06,$06,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$02,$02,$06,$04,$04
    db $04,$04,$06,$06,$06,$06,$04,$04
EnemyWave6:
    db $01,$06,$03,$08,$05,$02,$07,$04
    db $02,$07,$04,$01,$06,$03,$08,$05
    db $03,$08,$05,$02,$07,$04,$01,$06
    db $04,$01,$06,$03,$08,$05,$02,$07
    db $05,$02,$07,$04,$01,$06,$03,$08
EnemyWave7:
    db $01,$00,$01,$00,$01,$00,$01,$00
    db $01,$00,$01,$00,$01,$00,$01,$00
    db $01,$00,$01,$00,$01,$00,$01,$00
    db $01,$00,$01,$00,$01,$00,$01,$00
    db $01,$00,$01,$00,$01,$00,$01,$00

;List of positions that an enemy tile is in on the tilemap
EnemyTilemapPos:
    for y = 0..!EnemyRows
        for x = 0..!EnemyCols
            dw (!x*3)+(!y*96)
        endfor
    endfor

DecimalMaskTable:
    dw $00FF
    dw $FF00
    dw $00FF
    dw $FF00
    dw $00FF
    dw $FF00

SineTable:
    dw $0000
    dw $0003
    dw $0006
    dw $0009
    dw $000C
    dw $0010
    dw $0013

    dw $0016
    dw $0019
    dw $001C
    dw $001F
    dw $0022
    dw $0025
    dw $0028

    dw $002B
    dw $002E
    dw $0031
    dw $0033
    dw $0036
    dw $0039
    dw $003C

    dw $003F
    dw $0041
    dw $0044
    dw $0047
    dw $0049
    dw $004C
    dw $004E

    dw $0051
    dw $0053
    dw $0055
    dw $0058
    dw $005A
    dw $005C
    dw $005E

    dw $0060
    dw $0062
    dw $0064
    dw $0066
    dw $0068
    dw $006A
    dw $006B

    dw $006D
    dw $006F
    dw $0070
    dw $0071
    dw $0073
    dw $0074
    dw $0075

    dw $0076
    dw $0078
    dw $0079
    dw $007A
    dw $007A
    dw $007B
    dw $007C

    dw $007D
    dw $007D
    dw $007E
    dw $007E
    dw $007E
    dw $007F
    dw $007F

    dw $007F
    dw $007F
    dw $007F
    dw $007F
    dw $007F
    dw $007E
    dw $007E

    dw $007E
    dw $007D
    dw $007D
    dw $007C
    dw $007B
    dw $007A
    dw $007A

    dw $0079
    dw $0078
    dw $0076
    dw $0075
    dw $0074
    dw $0073
    dw $0071

    dw $0070
    dw $006F
    dw $006D
    dw $006B
    dw $006A
    dw $0068
    dw $0066

    dw $0064
    dw $0062
    dw $0060
    dw $005E
    dw $005C
    dw $005A
    dw $0058

    dw $0055
    dw $0053
    dw $0051
    dw $004E
    dw $004C
    dw $0049
    dw $0047

    dw $0044
    dw $0041
    dw $003F
    dw $003C
    dw $0039
    dw $0036
    dw $0033

    dw $0031
    dw $002E
    dw $002B
    dw $0028
    dw $0025
    dw $0022
    dw $001F

    dw $001C
    dw $0019
    dw $0016
    dw $0013
    dw $0010
    dw $000C
    dw $0009

    dw $0006
    dw $0003
    dw $0000
    dw $FFFD
    dw $FFFA
    dw $FFF7
    dw $FFF4

    dw $FFF0
    dw $FFED
    dw $FFEA
    dw $FFE7
    dw $FFE4
    dw $FFE1
    dw $FFDE

    dw $FFDB
    dw $FFD8
    dw $FFD5
    dw $FFD2
    dw $FFCF
    dw $FFCD
    dw $FFCA

    dw $FFC7
    dw $FFC4
    dw $FFC1
    dw $FFBF
    dw $FFBC
    dw $FFB9
    dw $FFB7

    dw $FFB4
    dw $FFB2
    dw $FFAF
    dw $FFAD
    dw $FFAB
    dw $FFA8
    dw $FFA6

    dw $FFA4
    dw $FFA2
    dw $FFA0
    dw $FF9E
    dw $FF9C
    dw $FF9A
    dw $FF98

    dw $FF96
    dw $FF95
    dw $FF93
    dw $FF91
    dw $FF90
    dw $FF8F
    dw $FF8D

    dw $FF8C
    dw $FF8B
    dw $FF8A
    dw $FF88
    dw $FF87
    dw $FF86
    dw $FF86

    dw $FF85
    dw $FF84
    dw $FF83
    dw $FF83
    dw $FF82
    dw $FF82
    dw $FF82

    dw $FF81
    dw $FF81
    dw $FF81
    dw $FF81
    dw $FF81
    dw $FF81
    dw $FF81

    dw $FF82
    dw $FF82
    dw $FF82
    dw $FF83
    dw $FF83
    dw $FF84
    dw $FF85

    dw $FF86
    dw $FF86
    dw $FF87
    dw $FF88
    dw $FF8A
    dw $FF8B
    dw $FF8C

    dw $FF8D
    dw $FF8F
    dw $FF90
    dw $FF91
    dw $FF93
    dw $FF95
    dw $FF96

    dw $FF98
    dw $FF9A
    dw $FF9C
    dw $FF9E
    dw $FFA0
    dw $FFA2
    dw $FFA4

    dw $FFA6
    dw $FFA8
    dw $FFAB
    dw $FFAD
    dw $FFAF
    dw $FFB2
    dw $FFB4

    dw $FFB7
    dw $FFB9
    dw $FFBC
    dw $FFBF
    dw $FFC1
    dw $FFC4
    dw $FFC7

    dw $FFCA
    dw $FFCD
    dw $FFCF
    dw $FFD2
    dw $FFD5
    dw $FFD8
    dw $FFDB

    dw $FFDE
    dw $FFE1
    dw $FFE4
    dw $FFE7
    dw $FFEA
    dw $FFED
    dw $FFF0

    dw $FFF4
    dw $FFF7
    dw $FFFA
    dw $FFFD
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