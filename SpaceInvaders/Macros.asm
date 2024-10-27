;-----------------------------------;
;   Macro's file for Tile Testing   ;
;-----------------------------------;

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
.NMIDone        skip 2  ;NMI Flag for graphics/logic control
.VrDmaListPtr   skip 2  ;Pointer to current position in list
.HDMAPtr        skip 2  ;Pointer for HDMA data
.SceneIndex     skip 1  ;Current scene we are in
.ChangeScene    skip 1  ;Tell the scene's to load/deload data
.Controller     skip 2  ;Controller input
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
.BulletColTile  skip 1  ;Index into enemy array
.Score          skip 3  ;Current score of the player
.Lives          skip 1  ;Current lives of the player as BCD
endstruct

!CodeBank =     $808000 ;Hold game code + palette's
!GFXBank =      $818000 ;Holds tiles and tilemaps
!MusicBank =    $828000 ;Holds music data

struct VrDmaPtr $0600   ;Pointer for VRAM Data copying
.Src            skip 3  ;Source address
.Flags          skip 1  ;Misc flags
.Dest           skip 2  ;Destination address
.Len            skip 2  ;Length of bytes to transfer
endstruct               ;Aligned in 8 byte entries

;Info on flags
;   Zero = END transfer loop
;   NonZero = Execute said transfer

RNGSeed =           $0300       ;16 byte section of memory
struct Player $0400
.X      skip 1
.Frame  skip 1          ;Current player frame
.State  skip 1          ;Player animation states
endstruct

struct Bullet $0403
.X          skip 1
.Y          skip 1
.Frame      skip 1  ;Current animation frame
.Enabled    skip 1  ;Test if the current laser is travelling upwards
endstruct

;At most 4 eemy bullets on screen at once
!EnemyBulletSpeed = $02
EnemyShootDebug =   $040D   ;Current position display for debug purposes
EnemyShootIndex =   $040F   ;Wich enemy is to fire said bullet
EnemyShootTimer =   $0410   ;Frames to wait until firing bullet
EnemyBulletXPos =   $0414
EnemyBulletYPos =   $0418
EnemyBulletActive = $041C

BGIndex  =          $04F0
;(8 columns * 5 rows)
EnemyResetMove  =   $04FE
EnemyResetFlag  =   $04FF
EnemyHealth =       $0500
EnemyType =         $0528
EnemyHurtTable =    $0550   ;Array of hurt timers

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

!MaxEpl = $05
!MaxEplW = $0005

ExplosionTimer =    $0580
ExplosionFrame =    $0580+!MaxEplW
ExplosionX =        $0580+(!MaxEplW*2)
ExplosionY =        $0580+(!MaxEplW*3)
ExplosionFineX =    $0580+(!MaxEplW*4)
ExplosionFineY =    $0580+(!MaxEplW*5)
ExplosionXVal =     $0580+(!MaxEplW*6)
ExplosionYVal =     $0580+(!MaxEplW*7)
ExplosionFineXVal = $0580+(!MaxEplW*8)
ExplosionFineYVal = $0580+(!MaxEplW*9)

!ExplosionStart =   $20     ;Explosion timer to set to
!ExplosionTile =    $5F

EnemyTileBuffer =   $7E8000
ScoreDispBuffer =   $7E8400   ;Takes up [score text] + 6 bytes for score display
HDMAScrollBuffer =  $7E8500
HDMAScrollBuffer2 = $7E8600

BGScrollOff =       $05C0     ;Scrolling offsets for background elements
BGScrollVal =       $05D0

!BG1HOffMirror =    $0C00
!BG1VOffMirror =    $0C02
!BG2HOffMirror =    $0C04
!BG2VOffMirror =    $0C06
!BG3HOffMirror =    $0C08
!BG3VOffMirror =    $0C0A
!BG4HOffMirror =    $0C0C
!BG4VOffMirror =    $0C0E
PalMirror =         $0C10

HDMAMirror =        $0E10
HDMAMirror1 =       $0E20
HDMAMirror2 =       $0E30

GameState =         $0EF0   ;Current state of the GameScene
!GameState_Pre =    $00     ;Before the game starts
!GameState_Play =   $01     ;Invaders on screen and moving
!GameState_Stop =   $02     ;Invaders dead, waiting for next wave
!GameState_Dead =   $03     ;Player dead
!GameState_Reset =  $04     ;Player dead, wave resetting

GameStateWait =     $0EF1   ;Frames to wait before game scene changes
!GameWaitTime =     $0060   ;Frames to wait 
PlayerDeathTimer =  $0EF2   ;Frames to wait when player dies
!PlayerDieReset =   50
!WaveInit =         $01

!EnemyOffset =      $0084
!EnemyRows =        $05
!EnemyCols =        $08
!EnemyStructWr =    $28
!EnemyHurtTimer =   $08

!EnemyPal0 =        $04<<2
!EnemyPal1 =        $05<<2
!EnemyPal2 =        $06<<2
!EnemyPal3 =        $07<<2
!EnemyPal4 =        $03<<2

!EnemyHurtPalInd =  $40
!EnemyHurtPal =     $04<<2
!EnemyHurtPalFlip = ($04<<2)+$40

!BulletSpeed =      $07
!BulletColOff =     $04

!EnemySpeed =       $02
!EnemyPlaneStartX = $00
!EnemyPlaneStartY = $F0

EmptyChar =         $00
L1Ram =             $7000
L2Ram =             $7400
L3Ram =             $7800
L4Ram =             $7C00
OAMCopy =           $0800
LaserOAM =          $0810
!PlayerSpeed =      $02
!PlayerY =          $C8
!PlayerTileB =      $57
!PlayerTileT =      $4F
!BulletAttr =       %00100110
!BulletF1 =         $51
!BulletF2 =         $52
!EBulletF1 =        $59
!EBulletF2 =        $5A

!EnemyGfx =         $2D

EnemyMax =          $04E7   ;R boundaries
EnemyMin =          $04E8   ;L boundaries
EnemyFloor =        $04E9   ;Floor boundaries

!FloorOff =         $10
!BFloor   =         $C0

!EnemyRBounds =     $80
!EnemyLBounds =     $40
!EnemyFloor =       $9F
!EnemyDownLoop =    $09

!EnemyMoveL =       $00
!EnemyMoveR =       $01
!EnemyMoveD =       $02

!ScoreDisp =        $7760
!LifeDisp =         $777C

!BG_L3_OFF =        $65

SinePtr =           $0F00   ;Index into sine table

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