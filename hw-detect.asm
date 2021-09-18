RTCLOK = $14
ATRACT = $4d
PALNTS = $62          	
SDMCTL = $22f      	
VDSLST = $200
SDLSTL = $230
COLDST = $244
PADDL0 = $270
PADDL1 = $271
PADDL2 = $272
PADDL3 = $273
STICK0 = $278
STICK1 = $279
CHBAS  = $2f4
COLOR0 = $2c4
COLOR1 = $2c5
COLOR2 = $2c6
COLOR3 = $2c7
COLOR4 = $2c8
BASICF = $3f8
STRIG0 = $d010
STRIG1 = $d011
COLPF0 = $d016
COLPF1 = $d017
AUDF1  = $d200
AUDC1  = $d201
AUDF2  = $d202
AUDC2  = $d203
AUDF3  = $d204
AUDC3  = $d205
AUDF4  = $d206
AUDC4  = $d207
AUDCTL = $d208
PORTB  = $d301
WSYNC  = $d40a
VCOUNT = $d40b
NMIEN  = $d40e         	
BASROM = $a8e2
PAL    = $d014
CONSOL = $d01f  
SETVBV = $e45C
XITVBV = $e462       	
COLDSV = $e477
SELFTST= $e471 
OSROM  = $fff7
OSROM2 = $fff8

@TAB_MEM_BANKS = $600
@ANTIC_DETECT = $650
A1200  = $652
@TIA_DETECT = $653
A600KB = $4000
A800KB = $A000
A800  = $80
OSXL  = $81

    org $2000
    opt c+
;   opt f+h-

dlist
    .by $70
    .by $70+$80
    .by $47
    .word title
    .by $46
    .word subtitle
    .by $10
    .by $42
    .word author
:2  .by $70
    .by $42
    .word processor
    .by $0
    .by $42
    .word memory
    .by $0
    .by $42
    .word osversion
    .by $0
    .by $42
    .word basversion
    .by $0
    .by $42
    .word tvversion
    .by $0
    .by $42
    .word soundversion
:4  .by $70
    .by $42
    .word tjoy1
    .by $42
    .word tjoy2
    .by $42
    .word tjoy3
:4  .by $70
    .by $42
    .word options1
    .by $41
    .word dlist

title
    dta d' #$ HARDWARE-DETECT '
subtitle
    dta d' 400/800/XL/XE/XEGS '
author
:7  .by $41
    .by $42
    dta d'by AsCrNet, 2021'*
    .by $43
    .by $41
    .by $42
    dta d'V1.7'*
    .by $43
:8  .by $41

processor
    dta d'        Processor : ' 
processordetect
    dta d'                    '
memory
    dta d'              RAM : '
memorydetect
    dta d'   KB Atari         '
osversion
    dta d'           OS ROM : '
osdetect
    dta d'                    '
basversion
    dta d'        Basic ROM : '
basdetect
    dta d'                    '
tvversion
    dta d'        TV System : '
tvtype
    dta d'CTIA='
tvgtia
    dta d'     ANTIC='
tvantic
    dta d'    '
soundversion
    dta d'            Sound : '
sounddetect
    dta d'                    '

tjoy1
    dta d'               ',$4b,d'  Test  '*,$4c,d'                   '       
tjoy2
    dta d'   ',$4a,d'  1 2 3    ',$4b,d'Joystick'*,$4c,d'     ',$4a,d'  1 2 3   '
tjoy3
    dta d'               ',$4b,d'  1 & 2 '*,$4c,d'                   '

options1
    dta d'Start'*
    .by $4d
    dta d'Reboot '
    dta d'Select'*
    .by $4d
    dta d'Self-TEST '
    dta d'OPTION'*
    .by $4d
    dta d'Dos'

options2
    dta d'             '
    .by $44
    dta d'Start'*
    .by $45
    dta d'  Reboot'
    dta d'            '


cpu1
    dta d'NMOS 6502/6502C'
cpu2
    dta d'CMOS 65c02'
cpu3
    dta d'CMOS 65c816'
kb16
    dta d'16'
kb24
    dta d'24'    
kb32
    dta d'32' 
kb40
    dta d'40'
kb48
    dta d'48'
kb52
    dta d'52'
bank1
    dta d'64'
bank4
    dta d'128 KB Atari'
bank15
    dta d'256 KB Rambo'
bank16
    dta d'320 KB Rambo/Compy'
bank32
    dta d'576 KB Rambo/Compy'
bank64
    dta d'1088 KB    '
bank128
    dta d'2112 KB    '
osver1
    dta d'XL OS Rev.1'
osver2
    dta d'XL/XE OS Rev.2'
osver3
    dta d'XL/XE OS Rev.3'
osver4
    dta d'XEGS OS Rev.4'  
osver10
    dta d'1200XL OS Rev.A'
osver11
    dta d'1200XL OS Rev.B'  
osver59
    dta d'XL/XE OS Rev.3B'
osver64
    dta d'QMEG+OS 4.04'
osver253
    dta d'QMEG+OS RC01'
osver800_1
    dta d'400/800 NTSC'
osver800_2
    dta d'400/800 Rev.A NTSC'
osver800_3
    dta d'400/800 Rev.A PAL'
osver800_4
    dta d'400/800 Rev.B NTSC'
osver800_5
    dta d'400/800 Rev.B PAL'    
osother
    dta d'Unknown !!!!'

basic_a
    dta d'Atari Basic Rev.A'
basic_b
    dta d'Atari Basic Rev.B'
basic_c
    dta d'Atari Basic Rev.C'
basic_other
    dta d'Unknown !!!!'
basic_a1200
    dta d'Without cartridge'
tvstandard1
    dta d'NTSC'
tvstandard2
    dta d'PAL '
tvtype2
    dta d'GTIA='
sound1
    dta d'Mono  '
sound2
    dta d'Stereo'
bas1200xl
    dta d'  Basic Cartridge : '
optionbank
    dta d'                       '

; Program start
begin

    mva #0 AUDCTL
    mva #59 AUDF1
    mva #71 AUDF2
    mva #84 AUDF3
    mva #107 AUDF4

    jsr @GTIA

    mwa #dlist SDLSTL
    mwa #dli VDSLST
    mva #>font CHBAS
    mva #$d COLOR1
    mva #0 A1200
    mva #0 A800
    mva OSROM OSXL

; Detect the TIA
    lda @TIA_DETECT
    cmp #1
    bne detect_cpu
    string tvtype2,tvtype,4

; Detect the CPU
detect_cpu
    lda #$99
    clc
    sed
    adc #$01
    cld
    beq cpu_cmos
    string cpu1,processordetect,14
    jmp offrom
cpu_cmos
    lda #0
    rep #%00000010	
    bne cpu_c816
cpu_c02
    string cpu2,processordetect,9
    jmp offrom
cpu_c816
    string cpu3,processordetect,10

; Off ROM XL/XE
offrom
    lda #0
    sta NMIEN
    lda #$fe
    sta PORTB

; Detect the RAM 16k
ram16
    mva #$a A600KB
    lda A600KB
    cmp #$a
    bne d600_16k
ram24
    mva #$b A600KB+$2000
    lda A600KB+$2000
    cmp #$b
    bne d600_24k
ram32
    mva #$c A600KB+$4000
    lda A600KB+$4000
    cmp #$c
    bne d600_32k
ram40
    mva #$d A600KB+$6000
    lda A600KB+$6000
    cmp #$d
    bne d600_40k
ram48
    mva #$e A600KB+$8000
    lda A600KB+$8000
    cmp #$e
    bne d600_48k
ram52
    mva #$d A600KB+$A000
    lda A600KB+$A000
    cmp #$d
    bne d600_52k
    jmp ram_detect

d600_16k
    string kb16,memorydetect,1
    jmp end_bank
d600_24k
    string kb24,memorydetect,1
    jmp end_bank
d600_32k
    string kb32,memorydetect,1
    jmp end_bank 
d600_40k
    string kb40,memorydetect,1
    jmp end_bank       
d600_48k
    string kb48,memorydetect,1
    jmp end_bank
d600_52k
    string kb52,memorydetect,1
    jmp end_bank

ram_detect
    jsr @MEM_DETECT
    sta banks
    cpw banks #0
    beq ram_0
    cpw banks #4
    beq ram_4
    cpw banks #15
    beq ram_15
    cpw banks #16
    beq ram_16
    cpw banks #32
    beq ram_32
    cpw banks #64
    beq ram_64
    cpw banks #128
    beq ram_128
    jmp end_bank
ram_0
    string bank1,memorydetect,1
    jmp end_bank
ram_4
    string bank4,memorydetect,11
    jmp end_bank
ram_15
    string bank15,memorydetect,11
    jmp end_bank
ram_16
    string bank16,memorydetect,17
    jmp end_bank
ram_32
    string bank32,memorydetect,17
    jmp end_bank
ram_64
    string bank64,memorydetect,10
    jmp end_bank
ram_128
    string bank128,memorydetect,10
end_bank 

; Detect the OS-B or XL
osb_detect
    lda $fcd8
    cmp #$a2
    beq os_800
    jmp os_detect

; Detect the OS ROM 400/800
os_800
    lda OSROM2
    cmp #255
    bne os_800other1
    jmp os_800_1
os_800other1
    cmp #221
    bne os_800other2
    jmp os_800_2
os_800other2
    cmp #214
    bne os_800other3
    jmp os_800_3
os_800other3
    cmp #243
    bne os_800other4
    jmp os_800_4
os_800other4
    cmp #34
    bne os_800other5
    jmp os_800_5
os_800other5
    jmp os_detect

os_800_1
    string osver800_1,osdetect,11
    jmp os_end
os_800_2
    string osver800_2,osdetect,17
    jmp os_end
os_800_3
    string osver800_3,osdetect,16
    jmp os_end
os_800_4
    string osver800_4,osdetect,17
    jmp os_end
os_800_5
    string osver800_5,osdetect,16
    jmp os_end

; Detect the OS ROM XL/XE/XEGS
os_detect
    mva #1 A800
    lda OSXL
    cmp #1
    bne os_other1
    jmp os_v1
os_other1
    cmp #2
    bne os_other2
    jmp os_v2
os_other2
    cmp #3
    bne os_other3
    jmp os_v3
os_other3
    cmp #4
    bne os_other4
    jmp os_v4
os_other4
    cmp #10
    bne os_other5
    jmp os_v10
os_other5
    cmp #11
    bne os_other6
    jmp os_v11
os_other6
    cmp #59
    bne os_other7
    jmp os_v59
os_other7
    cmp #64
    bne os_other8
    jmp os_v64
os_other8
    cmp #253
    bne os_other99
    jmp os_v253
os_other99    
    string osother,osdetect,11
    jmp os_end
os_v1
    string osver1,osdetect,10
    jmp os_end
os_v2
    string osver2,osdetect,13
    jmp os_end   
os_v3
    string osver3,osdetect,13
    jmp os_end  
os_v4
    string osver4,osdetect,12
    jmp os_end  
os_v10
    string osver10,osdetect,14
    mva #1 A1200
    jmp os_end
os_v11
    string osver11,osdetect,14
    mva #1 A1200
    jmp os_end
os_v59
    string osver59,osdetect,14
    jmp os_end
os_v64
    string osver64,osdetect,11
    jmp os_end
os_v253
    string osver253,osdetect,11
os_end

; Detect 1200XL
    lda A1200
    cmp #0
    beq bas_rom
    string bas1200xl,basversion,19

; Detect the Basic ROM
bas_rom
    lda #$fd
    sta PORTB
    lda BASROM
    cmp #162
    beq bas_a
    cmp #96
    beq bas_b
    cmp #234
    beq bas_c
    string basic_other,basdetect,11
    jmp bas_end
bas_a
    string basic_a,basdetect,16
    jmp bas_end
bas_b
    string basic_b,basdetect,16
    jmp bas_end
bas_c
    string basic_c,basdetect,16
bas_end

; Detect the tv standard
    lda PAL ;PALNTS
    cmp #1
    bne tvs
    mva #$90 COLOR4
    string tvstandard2,tvgtia,3
    jmp tv_end
tvs
    mva #$a0 COLOR4
    string tvstandard1,tvgtia,3
tv_end

; Detect Antic
    jsr @ANTIC
    lda @ANTIC_DETECT
    cmp #1
    bne antic_pal
    string tvstandard1,tvantic,3
    jmp antic_end
antic_pal
    string tvstandard2,tvantic,3
antic_end

; Detect the Sound
    jsr stereo
    bmi soundstereo
    string sound1,sounddetect,5
    jmp sound_end
soundstereo
    string sound2,sounddetect,5
sound_end

; Change text
options
    lda A800
    cmp #0
    bne keyconsole
    string options2,options1,39

; Key console
keyconsole
    mva #59 AUDF1
    mva #0 ATRACT
    ldy CONSOL
    lda A800
    cmp #1
    bne onlystart   
    cpy #6
    beq reboot
    cpy #5
    beq selftest
    cpy #3
    beq dos
onlystart
    cpy #6
    beq reboot
    jmp joystick

; Reboot
reboot
    lda CONSOL
    cmp #6
    beq reboot
    jmp COLDSV

; Selt Test
selftest
    lda CONSOL
    cmp #5
    beq selftest
    mva #$e0 CHBAS
    jmp SELFTST

; DOS 2.x
dos
    lda CONSOL
    cmp #3
    beq dos
    mva #$e0 CHBAS
    lda #$ff
    sta BASICF
    sta PORTB
    jmp ($a)

joystick
    lda STICK0
    drawDirection #%0101, #%0000, #$4f, tjoy1+2  ; up + left
    drawDirection #%1101, #%1100, #$46, tjoy1+3  ; up
    drawDirection #%1001, #%0000, #$50, tjoy1+4  ; up + right
    drawDirection #%0111, #%0011, #$48, tjoy2+2	 ; left
    drawDirection #%1011, #%0011, #$49, tjoy2+4  ; right
    drawDirection #%0110, #%0000, #$51, tjoy3+2  ; down + left
    drawDirection #%1110, #%1100, #$47, tjoy3+3  ; down
    drawDirection #%1010, #%0000, #$52, tjoy3+4  ; down + right
    setVolume prev_s1, vol_s1

    lda STICK1
    drawDirection #%0101, #%0000, #$4f, tjoy1+29  ; up + left
    drawDirection #%1101, #%1100, #$46, tjoy1+30  ; up
    drawDirection #%1001, #%0000, #$50, tjoy1+31  ; up + right
    drawDirection #%0111, #%0011, #$48, tjoy2+29  ; left
    drawDirection #%1011, #%0011, #$49, tjoy2+31  ; right
    drawDirection #%0110, #%0000, #$51, tjoy3+29  ; down + left
    drawDirection #%1110, #%1100, #$47, tjoy3+30  ; down
    drawDirection #%1010, #%0000, #$52, tjoy3+31  ; down + right
    setVolume prev_s2, vol_s2

    sound vol_s1, vol_s2, AUDC1

; Buttons
    lda STRIG0
    readButton #$01, #"1", tjoy2+6, vol_a1
    lda STRIG1
    readButton #$10, #"1", tjoy2+33, vol_a2
    sound vol_a1, vol_a2, AUDC2

    lda PADDL0
    cmp #$e4
    readButton #$02, #"2", tjoy2+8, vol_b1
    lda PADDL2
    cmp #$e4
    readButton #$20, #"2", tjoy2+35, vol_b2
    sound vol_b1, vol_b2, AUDC3

    lda PADDL1
    cmp #$e4
    readButton #$04, #"3", tjoy2+10, vol_c1
    lda PADDL3
    cmp #$e4
    readButton #$40, #"3", tjoy2+37, vol_c2
    sound vol_c1, vol_c2, AUDC4

    ldx #0
    ldy #3
delay
    dex
    bne delay
    dey
    bne delay
    jmp keyconsole

; Dli
dli
    pha
    txa
    pha
    ldx #12
    lda #$4f
    sta WSYNC
loop_dli
    sta COLPF0
    sec
    sbc #2
    dex
    sta WSYNC
    sta WSYNC
    bne loop_dli
    lda #$00
    sta COLPF0
    pla
    tax
    pla
    rti

; Stereo pokey detection routine
stereo
    sei
    inc $d40e
    lda #$03
    sta $d21f
    sta $d210
    ldx #$00
    stx $d211
    inx
    stx $d21e
    ldx:rne $d40b
    stx $d219
loop
    ldx $d40b
    bmi stop
    lda #$01
    bit $d20e
    bne loop
stop
    lda $10
    sta $d20e
    dec $d40e
    cli
    txa
    rts

    run begin

banks
    dta a(0)

; Macro to copy texts on screen
.macro string origin,destination,quantity
    ldx #:quantity
copybytes
    lda :origin,x
    sta :destination,x
    dex
    bpl copybytes
.endm

; Macro pause CPU
.macro pause
    ift :1 == 0
    lda:cmp:req 20
    els
    lda 20
    add #:1
    cmp 20
    bne *-2
    eif
.endm

.macro drawDirection mask, value, char, pos
    pha
    and :mask
    cmp :value
    bne clear
    lda :char
    bne draw
clear
    lda #0
draw
    sta :pos
    pla
.endm

.macro setVolume prev, vol
    cmp :prev
    beq unchanged
    sta :prev
    cmp #$f
    beq not_held
    lda #$8f
    bne setvol
not_held
    lda #0
    beq setvol
unchanged
    lda :vol
    beq skip
    sec
    sbc #1
setvol
    sta :vol
skip
.endm

.macro sound v1, v2, channel
    lda :v1
    cmp :v2
    scs:lda :v2
    lsr
    lsr
    lsr
    lsr
    seq:ora #$a0
    sta :channel
.endm

.macro readButton mask, char, pos, vol
    beq pressed
    lda :exists
    ora :mask
    sta :exists
    mva :char+128 :pos
    lda #0
    beq setvol
pressed
    lda :exists
    and :mask
    beq next
    mva :char :pos
    lda :vol
    bne decay
    lda #$8f
    bne setvol
decay
    cmp #$f
    bcc next
    sbc #1
setvol
    sta :vol
next
.endm

exists
    .byte 0
vol_s1
    .byte 0
vol_s2
    .byte 0
prev_s1
    .byte 0
prev_s2
    .byte 0
vol_a1
    .byte 0
vol_a2
    .byte 0
vol_b1
    .byte 0
vol_b2
    .byte 0
vol_c1
    .byte 0
vol_c2
    .byte 0

    icl 'antic_detect.asm'
    icl 'mem_detect.asm'
    icl 'gtia_detect.asm'

; Memory area for the font
    org $3000
font
    ins 'letter.fnt'

; ----Cart--------
;init
;    rts 
;
;   org $BFFA
;		    
;    .word begin
;    .by 0,4
;    .word init
