;-----------------------------------;
;   Macro's file for Bored Aliens   ;
;-----------------------------------;

!Region = $00           ;0 for PAL, 1 for NTSC

struct ZP $00
.MemPointer     skip 3  ;General purpose pointer memory
.MemPointer2    skip 3  ;General purpose pointer memory
.MemPointer3    skip 3  ;General purpose pointer memory
.R0             skip 1  ;General purpose scratch memory
.R1             skip 1  ;General purpose scratch memory
.R2             skip 1  ;General purpose scratch memory
.R3             skip 1  ;General purpose scratch memory
.R4             skip 1  ;General purpose scratch memory
.R5             skip 1  ;General purpose scratch memory
.R6             skip 1  ;General purpose scratch memory
.R7             skip 1  ;General purpose scratch memory
.AddSprPtr      skip 2  ;Pointer for second OAM table
.AddSprX        skip 2  ;XPos for add spr
.AddSprY        skip 1  ;YPos for add spr
.AddSprTile     skip 1  ;Tile Index for add spr
.AddSprAttr     skip 1  ;Attribute for add spr
.AddSprBigFlag  skip 1  ;XPos for add spr
.NMIDone        skip 2  ;NMI Flag for graphics/logic control
.SceneIndex     skip 1  ;Current scene we are in
.SceneGoto      skip 1  ;Byte to hold which scene to go to while transitioning
.ChangeScene    skip 1  ;Tell the scenes to load/deload data
.Controller     skip 2  ;Controller input
.InputFlag      skip 1  ;Controller input pressed flag
.OAMPtr         skip 2  ;Pointer to the last object in OAM
.EnemyTimer     skip 1  ;Enemy Movement Timer
.EnemyCount     skip 1  ;Amount of enemies on screen
.EnemyDir       skip 1  ;Which way the enemies are moving [0 for left, 1 for right]
.EnemySide      skip 1  ;What direction to move after going down
.EnemyPlanePosX skip 1  ;Position of the enemy plane
.EnemyPlanePosY skip 1  ;Position of the enemy plane
.EnemyWaveCount skip 2  ;Current wave the player is on
.EnemyDownCount skip 1  ;Counter for the downward movement of the enemies
.EnemyFrame     skip 1  ;Current enemy frame
.EnemyWait      skip 1  ;Amount of frames between enemy movement
.BulletColTile  skip 2  ;Index into enemy array
.Score          skip 3  ;Current score of the player
.Lives          skip 1  ;Current lives of the player as BCD
.Modifiers      skip 2  ;Bitfield for current game modifiers
.ExitScene      skip 1  ;Flag to say to exit the scene
.PalFadeInd     skip 2  ;Index into palette fade, 0-31
.PalFadeStart   skip 2  ;Pointer to start of palette fade
.PalFadeEnd     skip 2  ;Pointer to end of palette fade
.PalFadeTimer   skip 1  ;Timer to wait for palette index
.VrDmaListPtr   skip 2  ;Pointer to current position in list
.DMAQSrc        skip 3  ;DMA Queue source address
.DMAQFlags      skip 1  ;DMA Queue flags
.DMAQDest       skip 2  ;DMA Queue destination address
.DMAQLength     skip 2  ;Data size of transfer
endstruct

!CodeBank =     $008000 ;Hold game code + palettes
!GFXBank =      $018000 ;Holds character data
!GfxBank2 =     $028000 ;Holds GFX data
!GfxBank3 =     $038000 ;Holds GFX data
!GfxBank4 =     $048000 ;Holds GFX data
!GfxBank5 =     $058000 ;Holds GFX data
!GfxBank6 =     $068000 ;Holds GFX data
!PalBank =      $078000 ;Holds palette info
!TilemapBank2 = $088000 ;Holds tilemap
!TilemapBank =  $098000 ;Holds tilemap
!CodeBank2 =    $0A8000 ;Hold long functions
!MusicBank =    $0B8000 ;Holds music data
!MusicBank2 =   $0C8000 ;Holds music data

struct VrDmaPtr $0600   ;Pointer for VRAM Data copying
.Src            skip 3  ;Source address
.Flags          skip 1  ;Misc flags
.Dest           skip 2  ;Destination address
.Len            skip 2  ;Length of bytes to transfer
endstruct               ;Aligned in 8 byte entries

;Info on flags
;   Zero = END transfer loop
;   NonZero = Execute said transfer

RNGSeed =           $02FE       ;word section of memory
struct Player $0400
.X      skip 1
.Frame  skip 1          ;Current player frame
.State  skip 1          ;Player animation states
.Dead   skip 1     
.FTime  skip 1          ;Firing timer
endstruct
!PlayerFTimeReset =     $1C

struct Bullet $0406
.X          skip 2
.Y          skip 1
.Frame      skip 1  ;Current animation frame
.Enabled    skip 1  ;Test if the current laser is travelling upwards
.Dir        skip 1  ;H dir
endstruct

;At most 8 enemy bullets on screen at once
!EBulLoopCount =    $0007
!EnemyBulletSpeed = $02
EnemyShootDebug =   $040D   ;Current position display for debug purposes
EnemyShootIndex =   $040F   ;Wich enemy is to fire said bullet
EnemyShootTimer =   $0410   ;Frames to wait until firing bullet
EnemyBulletXPos =   $0418
EnemyBulletYPos =   $0420
EnemyBulletActive = $0428
EnemyBulletFrame =  $0430
EnemyBulletType =   $0438
BulletFCount =      $0440
EnemyBulletSine =   $0448
EnemyBulletWait =   $044A   ;Time to wait between movement when homing

!StartMaxBGCount =  $08     ;Maximum amount of waves to clear before next stage [note, value of 1 will cause palette flickering]
!BGCountInitVal =   $07
!MaxBG =            $07
BGIndex  =          $04F0   ;Game background index
BGCount  =          $04F1   ;Incrementer for BG index
BGChange  =         $04F2   ;How many waves to pass before BG changes
PalMaskInd =        $04F3

;(8 columns * 5 rows)
EnemyResetMove  =   $04FE
EnemyResetFlag  =   $04FF
EnemyHealth =       $0500
EnemyType =         $0528   ;Array of current enemy types
EnemyHurtTable =    $0550   ;Array of hurt timers

UFOXPos =           $06B0
UFOActive =         $06B2   ;Flag for if the UFO is active or not
UFOTimer =          $06B3   ;Frames to wait before UFO appears
UFOFrame =          $06B5
UFOFrameTimer =     $06B6
UFODeleteFlag =     $06B7   ;flag to delete UFO when position overflow is hit
!UFOScore =         $0050   ;Score to give to the player when shooting down the UFO
!UFOSpeed =         $01     ;How fast the UFO moves
!UFOResetTime =     $05DC   ;Timer to wait to make UFO active [30 seconds on PAL, 25 on NTSC]
!UFOYPos =          $00     ;Y Position of the UFO
!UFOYPosB =         $08     ;Y Position of the UFO
!UFOStartX =        $0100
!UFOTile0 =         $38
!UFOTile1 =         $3A
!UFOAttr =          %00101000
!UFOAttrMir =       %01101000
!UFOPartAttr =      %00101000
OBJTimers =         $0700   ;16 byte array of timers for general OBJ use
OBJFrame =          $0710   ;16 byte array of general object frame counts, used for animating less important objects
OBJXPos =           $0720   ;32 byte array of object types XPositions
OBJYPos =           $0740   ;16 byte array of object types YPositions
OBJActive =         $0750   ;16 byte array of object active states
;Explosions each carry a
;   Timer   [Byte]  How many frames left the explosion has
;   Frame   [Byte]  What tile it is currently to display
;   X       [Byte]  X position
;   Y       [Byte]  Y position
;
;   At most 8 explosions can be on screen at once
;   so overall it take 32 bytes to represent every explosion
;
;   If an explosion has 0 frames then it is "Dead" and can be skipped over

!MaxEpl =           $05
!MaxEplW =          $0005

ExplosionTimer =    $0580
ExplosionX =        $0580+(!MaxEplW*2)
ExplosionY =        $0580+(!MaxEplW*3)
ExplosionFineX =    $0580+(!MaxEplW*4)
ExplosionFineY =    $0580+(!MaxEplW*5)
ExplosionXVal =     $0580+(!MaxEplW*6)
ExplosionYVal =     $0580+(!MaxEplW*7)
ExplosionFineXVal = $0580+(!MaxEplW*8)
ExplosionFineYVal = $0580+(!MaxEplW*9)

!ExplosionStart =   $20     ;Explosion timer to set to
!ExplosionTile =    $50
!ExplosionAttr =    $3C

EnemyTileBuffer =   $7E8000
TextDispBuffer =    $7E8400   ;Takes up [score text] + 6 bytes for score display
HDMAScrollBuffer =  $7E8A00
HDMAScrollBuffer2 = $7E8E00
HDMAScrollBuffer3 = $7EA000

BGScrollOff =       $06C0     ;Scrolling offsets for background elements
BGScrollVal =       $06D0

BG1HOffMirror =     $0C00
BG1VOffMirror =     $0C02
BG2HOffMirror =     $0C04
BG2VOffMirror =     $0C06
BG3HOffMirror =     $0C08
BG3VOffMirror =     $0C0A
BG4HOffMirror =     $0C0C
BG4VOffMirror =     $0C0E
PalMirror =         $0C10

HDMAMirror =        $0E10
HDMAMirror1 =       $0E20
HDMAMirror2 =       $0E30
HDMAMirror3 =       $0E40
HDMAMirror4 =       $0E50
HDMAMirror5 =       $0E60

INIDSPMirror =      $0EA0
BGMODEMirror =      $0EA1
TMMirror =          $0EA2
TSMirror =          $0EA3

CGWSELMirror =      $0EA4
CGADSUBMirror =     $0EA5
COLDATAMirror =     $0EA6

WH0Mirror =         $0EA8
WH1Mirror =         $0EA9
WH2Mirror =         $0EAA
WH3Mirror =         $0EAB

W12SELMirror =      $0EAC
W34SELMirror =      $0EAD
WOBJSELMirror =     $0EAE
WBGLOGMirror =      $0EAF
WOBJLOGMirror =     $0EB0
TMWMirror =         $0EB1
TSWMirror =         $0EB2

M7AMirror =         $0EB3
M7BMirror =         $0EB5
M7CMirror =         $0EB7
M7DMirror =         $0EB9
M7XMirror =         $0EBB
M7YMirror =         $0EBD

GameState =         $0EF0   ;Current state of the GameScene
!GameState_Pre =    $00     ;Before the game starts
!GameState_Play =   $01     ;Invaders on screen and moving
!GameState_Stop =   $02     ;Invaders dead, waiting for next wave
!GameState_Dead =   $03     ;Player dead
!GameState_Reset =  $04     ;Player dead, wave resetting

GameStateWait =     $0EF1   ;Frames to wait before game scene changes
!GameWaitTime =     $0060   ;Frames to wait 
PlayerDeathTimer =  $0EF2   ;Frames to wait when player dies
TransitionIndex =   $0EF3   ;Index into transition timer
TransitionFlag =    $0EF4   ;Flag to say transition is in progress
TransitionState =   $0EF5   ;Value to say which direction we are transitioning [0 for not, 1 for in, 2 for out]
!TransSpeed =       $08
!OptionsTextAttr =  $20
!OptionsTMapAddr =  $7CC5

StageSettings =     $0EF8   ;Settings byte for stage
MusicSettings =     $0EF9   ;Settings byte for music options
SinePtr2 =          $0EFA   ;Index into sine table
SubOptionIndex3 =   $0EFB   ;Index into whatever option is chosen
SubOptionIndex2 =   $0EFC   ;Index into whatever option is chosen
SubOptionIndex =    $0EFD   ;Index into whatever option is chosen
OptionIndex =       $0EFE   ;Index into what option to pick on a menu
SinePtr =           $0EFF   ;Index into sine table
SPRTextPosX =       $0F00   ;\  array of 128 position entries
SPRTextPosY =       $0F80   ;/

ShieldHealth =      $1100   ;Health of shields
ShieldBlinkTimer =  $1104   ;Timer for shields to blink
ShieldXPos =        $1108   ;Health of shields

EnemyTransInd =     $1110
EnemyTransSetup =   $1111
SendWave =          $1112

UFOPartEnabled =    $1120
UFOPartX =          $1128
UFOPartY =          $1138
EPlaneTop =         $1140
UFOPartXVel =       $1148
UFOPartYVel =       $1158
UFOPartFlip =       $1168   ;Switch for setting the graphics for the UFO gibs

StageTextX =        $1170
StageTextY =        $117C
StageTextIndex =    $1182
ShowStageText  =    $1183
ShowStageTextOut =  $1184   ;Flag to move out of the transition
StageTextTransInd = $1185   ;Inde into transition offset table

ContinueTimer =     $1186
ContinueSelection = $1187
ContinueCount =     $1188

EPlaneTopW =        $1186   ;Max height enemies go to
PalOut =            $1200   ;Output palette
SpiralGalX =        $1400   ;32 word values
SpiralGalY =        $1440   ;32 byte values
SpiralGalZ =        $1460   ;32 byte values
SpiralTimer =       $1480   ;32 Timer values
SpiralXScale =      $14A0   ;1 byte scaling factor X
SpiralYScale =      $14A1   ;1 byte scaling factor Y
BHoleFrame =        $14A2   ;1 byte frame index for black hole
BHoleTimer =        $14A3   ;1 byte timer value for black hole

HScorePlace =       $14A4   ;1 byte entry byte for what placing the player got
HScoreTextCursor =  $14A5   ;1 byte position for the cursor when entering in highscore
HScoreCursorFrame = $14A6   ;1 byte frame index for cursor frame
HScoreCursorTimer = $14A7   ;1 byte frame index for cursor timer
HScoreTextBlink =   $14A8   ;1 byte timer for blinking the currently selected character
HScoreCursorChar =  $14A9   ;1 byte index for current character
;Each entry contains:
;       13 name bytes
;       3 score bytes
;Thus making a single entry 16 bytes large
;10 entries means 160 [$A0] bytes
HScoreEntries =     $14B0   ;$0100 byte list of highscore entries

IntroTimer =        $1550   ;2 byte timer for intro text
IntroTextInd =      $1552   ;1 byte index into text
IntoMoveFlag =      $1553   ;1 byte flag to move onto next panel
IntroStart =        $1554   ;1 byte flag to do the main palette fade

HDMAColTableRAM =   $1600   ;160 byte [$A0] list of colour table entries

!IntroL2Start =     $7A62
!TextTime =         $01F4    ;Approximately 10 seconds PAL time
!IntroBG2Restart =  $B0
!Intro2MaxY =       $40
!IntroPanelVram =   $0400
!MaxPanel =         $0B
SRam =              $306000 ;Save data storage

!HScoreEntrySize =  $03
!HScoreEntrySizeW = $0003
!HScoreTextSize =   $30
!HScoreTextSizeW =  $0030
!HscoreDispSize =   $0030*10

!HScoreCursorSpr =  $70
!HScoreCursorAttr = $32

!HScoreCursorMax =  $2D
!HScoreCursorXMax = $0D

!SpiralArmCount =   $05
!SpiralArmOffset =  $04
!SpiralBCount =     ((!SpiralArmCount*$05)-1)
!SpiralWCount =     (!SpiralBCount*2)
!SpiralGalAttr =    $20
!CX =               $0078
!CY =               $A0

!BHoleX1 =          $80
!BHoleY =           $9A
!BHoleX2 =          !BHoleX1-$10

!BHoleT1 =          $30
!BHoleT2 =          $34
!BHoleT3 =          $38
!BHoleT4 =          $3C
!BHoleT5 =          $50
!BHoleT6 =          $54
!BHoleT7 =          $58
!BHoleT8 =          $5C

!BHoleAttr1 =        $7E
!BHoleAttr2 =        $3E

!SpiralGalAttrP0 =  $20
!SpiralGalAttrP1 =  $30

!StageTextAttr =    $35
!GameOverTextAttr = $3F
!GameOverTextTime = $64

!UFOPartGravity =   $0030

!ShieldStartHP =    $08
!PlayerDieReset =   50
!WaveInit =         $00

;32 particles at once
SParticleX =        $0200   ;32 word X positions
SParticleY =        $0240   ;32 byte Y positions
SParticleVelX =     $0260   ;32 byte X velocities
SParticleVelY =     $0280   ;32 byte Y velocities
SParticleState =    $02A0   ;32 states
SParticleTimer =    $02C0   ;32 particle timers

!EnemyOffset =      $0084
!EnemyRows =        $05
!EnemyCols =        $08
!EnemyStructWr =    $28
!EnemyHurtTimer =   $10

!EnemyPal0 =        $04<<2
!EnemyPal1 =        $05<<2
!EnemyPal2 =        $06<<2
!EnemyPal3 =        $07<<2
!EnemyPal4 =        $03<<2

!EnemyHurtPalInd =  $40
!EnemyHurtPal =     $04<<2
!EnemyHurtPalFlip = ($04<<2)+$40

!BulletSpeed =      $06
!BulletHSpeed =     $01
!BulletColOff =     $04

!EnemySpeed =       $02
!EnemyPlaneStartX = $00
!EnemyPlaneStartY = $F0
!EnemyTransHeight = $01F0

EmptyChar =         $00
L1Ram =             $7000
L2Ram =             $7800
L3Ram =             $7C00
L4Ram =             $7C00
OAMCopy =           $0800
LaserOAM =          $0810
!PlayerSpeed =      $02
!PlayerY =          $C8
!PlayerTile =       $32
!PlayerAttr =       %00111010
!BulletAttr =       %00101110
!EBullAttr =        %00101110
!EBull2Attr =       %00101010
!BulletF1 =         $36
!BulletF2 =         $37
!EBulletF1 =        $83
!EBullet2F1 =       $86
!EBullet3F1 =       $89

!EnemyGfx =         $2D

!EnemyTileDest =    $0600
!BGTileDest =       $0800
!BG3TileDest =      $2000

EnemyMax =          $04E7   ;R boundaries
EnemyMin =          $04E8   ;L boundaries
EnemyFloor =        $04E9   ;Floor boundaries

!FloorOff =         $10
!BFloor   =         $C0

!EnemyRBounds =     $80
!EnemyLBounds =     $40
!EnemyFloor =       $40
!EnemyDownLoop =    $09

!EnemyMoveL =       $00
!EnemyMoveR =       $01
!EnemyMoveD =       $02

!ScoreDisp =        $7760
!LifeDisp =         $777C

!BG_L3_OFF =        $65

!SurfboardT0 =      $C0
!SurfboardT1 =      $C1
!SurfboardAttr =    $32

!BG3Char1 =         $C0
!BG3Char2 =         $C2
!BG3Char3 =         $C4
!BG3Char4 =         $C6
!BG3Char1Attr =     $00
!BG3Char2Attr =     $00
!BG3Char3Attr =     $00
!BG3Char4Attr =     $00
!SprFont1Attr =     $30

!ArrowX =           $50
!ArrowChar =        $29
!ArrowChar2 =       $01
!Arrow2Attr =       $30
!ShieldAttr1 =      $2E
!ShieldAttr2 =      $6E
!ShieldYPos =       $A8
!Tick =             $02
!Cross =            $03

!Planet0 =          $26
!Planet1 =          $28
!Planet2 =          $2A
!PlanetsAttr =      $06
!PlanetsHiAttr =    $36

!HTextNormal =      $20
!HText3rd =         $24
!HText2nd =         $28
!HText1st =         $2C

!SprVram =          $4000
!Spr2Vram =         $5000 ;Second sprite table
!SprTextVram =      $5800 ;VRAM position for stage text
!HSSprVram =        $6010
!BGVram =           $0000

!ScoreTextAttr =    $38
!UIAttr =           $3A
!LivesUI =          $80
!WaveUI =           $81
!ScoreUI =          $82

!Mod0 =             $0001       ;2x enemy health
!Mod1 =             $0002       ;1/2 time to make enemies move
!Mod2 =             $0004       ;Player bullets move at half speed
!Mod3 =             $0008       ;Enemy bullets move at 2x speed
!Mod4 =             $0010       ;Enemy bullets home in on the player
!Mod5 =             $0020       ;Mosaic applied to layer 1
!Mod6 =             $0040       ;Ship moves half as fast
!Mod7 =             $0080       ;1 life for a given session
!Mod8 =             $0100       ;Randomize what wave to go to
!Mod9 =             $0200       ;Waves start lower
!ModA =             $0400       ;Shields have 1 health
!ModB =             $0800       ;Moving shields
!ModC =             $1000       ;Alien palette is set to black so only outlines are seen
!ModD =             $2000       ;Bullets have random direction
!ModE =             $4000       ;Enemy Bullets have a random direction
!ModF =             $8000       ;UFO fires bullets at the player
;Character data
' ' = $00
'0' = $00+1
'1' = $01+1
'2' = $02+1
'3' = $03+1
'4' = $04+1
'5' = $05+1
'6' = $06+1
'7' = $07+1
'8' = $08+1
'9' = $09+1
'A' = $0A+1
'B' = $0B+1
'C' = $0C+1
'D' = $0D+1
'E' = $0E+1
'F' = $0F+1
'G' = $10+1
'H' = $11+1
'I' = $12+1
'J' = $13+1
'K' = $14+1
'L' = $15+1
'M' = $16+1
'N' = $17+1
'O' = $18+1
'P' = $19+1
'Q' = $1A+1
'R' = $1B+1
'S' = $1C+1
'T' = $1D+1
'U' = $1E+1
'V' = $1F+1
'W' = $20+1
'X' = $21+1
'Y' = $22+1
'Z' = $23+1
'!' = $24+1
'?' = $25+1
''' = $26+1
':' = $27+1
'>' = $28+1
'@' = $29+1 ;Trophy character 2
'~' = $2A+1 ;Trophy character 3
'.' = $2B+1 ;Full stop
'|' = $2C+1 ;Quotation mark