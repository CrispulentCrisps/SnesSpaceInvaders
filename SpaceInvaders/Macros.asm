;-----------------------------------;
;   Macro's file for Tile Testing   ;
;-----------------------------------;

struct ZP $00
.MemPointer     skip 3  ;General purpose pointer memory
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
.SceneIndex     skip 1  ;Current scene we are in
.ChangeScene    skip 1  ;Tell the scene's to load/deload data
.Controller     skip 2  ;Controller input
.EnemyTimer     skip 1  ;Enemy Movement Timer
.EnemyCount     skip 1  ;Amount of enemies on screen
.EnemyDir       skip 1  ;Which way the enemies are moving [0 for left, 1 for right]
.EnemySide      skip 1  ;What direction to move after going down
.EnemyPlanePosX skip 1  ;Position of the enemy plane
.EnemyPlanePosY skip 1  ;Position of the enemy plane
.EnemyWaveCount skip 2  ;Current wave the player is on
.EnemyDownCount skip 1  ;Counter for the downward movement of the enemies
.EnemyFrame     skip 1  ;Current enemy frame
.BulletColTile  skip 2  ;Current X and Y position of the bullet collision
.Score          skip 2  ;Current score of the player
endstruct

struct VrDmaPtr $0600   ;Pointer for VRAM Data copying
.Src            skip 3  ;Source address
.Flags          skip 1  ;Misc flags
.Dest           skip 2  ;Destination address
.Len            skip 2  ;Length of bytes to transfer
endstruct               ;Aligned in 8 byte entries

;Info on flags
;   Zero = END transfer loop
;   NonZero = Execute said transfer

struct Player $0400
.X      skip 1
.Frame  skip 1          ;Current player frame
.State  skip 1          ;Player animation states
endstruct

;At most there will be 2 lasers on screen at once
struct Bullet $0403
.X          skip 1
.Y          skip 1
.Frame      skip 1  ;Current animation frame
.Enabled    skip 1  ;Test if the current laser is travelling upwards
endstruct

;(12 columns * 5 rows) * 4 bytes per entry = 240 bytes of data up to 0x740
struct Enemy $0500
.Alive  skip 1      ;Checks if the invader is alive
.Type   skip 1      ;Determines which enemy tiles to display
endstruct

EnemyTilemap =      $0740

EnemyTileBuffer =   $7E8000

!BG1HOffMirror =    $0C00
!BG1VOffMirror =    $0C02
!BG2HOffMirror =    $0C04
!BG2VOffMirror =    $0C06
!BG3HOffMirror =    $0C08
!BG3VOffMirror =    $0C0A
!BG4HOffMirror =    $0C0C
!BG4VOffMirror =    $0C0E

!EnemyOffset =      $0084
!EnemyRows =        $05
!EnemyCols =        $08

!BulletSpeed =      $08
!BulletColOff =     $04

!PlayerSpeed =      $02
!EnemySpeed =       $02

EmptyChar =         $00
L0Ram =             $1000
L1Ram =             $1400
L2Ram =             $1800
L3Ram =             $1C00
OAMCopy =           $0800
LaserOAM =          $0810
!PlayerY =          $C0
!PlayerTileB =      $60
!PlayerTileT =      $5B
!BulletF1 =         $5D
!BulletF2 =         $5E
!EnemyGfx =         $2D

!EnemyRBounds =     $80
!EnemyLBounds =     $40
!EnemyDownLoop =    $08

!EnemyMoveL =       $00
!EnemyMoveR =       $01
!EnemyMoveD =       $02

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