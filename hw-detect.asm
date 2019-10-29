SDLSTL = $230
COLDST = $244          	
CHBAS  = $2f4
COLOR0 = $2c4
COLOR1 = $2c5
COLOR2 = $2c6
COLOR3 = $2c7
COLOR4 = $2c8
PORTB  = $d301
BASROM = $a8e2
PAL    = $d014
CONSOL = $d01f         	
COLDSV = $e477
SELFTST= $e471 
OSROM  = $fff7

    org $2000
    opt c+

dlist
:5  .by $70
    .by $47
    .word title
    .by $10
    .by $42
    .word author
:3  .by $70
    .by $42
    .word processor
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
:6  .by $70
    .by $42
    .word options
    .by $41
    .word dlist

title
    dta d' #$ HARDWARE DETECT '
author
:10 .by $41
    .by $42
    dta d'by AsCrNet, 2019'*
    .by $43
:12 .by $41

processor
    dta d'        Processor : '
processordetect
    dta d'                    '
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
tvdetect
    dta d'                    '
soundversion
    dta d'            Sound : '
sounddetect
    dta d'                    '

options
    .by $0,$0,$44
    dta d'Start'*
    .by $45
    dta d'Reboot  '
    .by $44
    dta d'Select'*
    .by $45
    dta d'Run Self TEST  '

cpu1
    dta d'NMOS 6502/6502C'
cpu2
    dta d'CMOS 65c02'
cpu3
    dta d'CMOS 65c816'
osver1
    dta d'XL/XE OS Rev.1 '
osver2
    dta d'XL/XE OS Rev.2 '
osver3
    dta d'XL/XE OS Rev.3 '
osver4
    dta d'XL/XE/XEGS OS Rev.4'  
osver10
    dta d'XL/XE OS Rev.10'
osver11
    dta d'XL/XE OS Rev.11'  
osver59
    dta d'XL/XE OS Rev.3B'
osother
    dta d'Unknown !!!!   '

basic_a
    dta d'Atari Basic Rev.A'
basic_b
    dta d'Atari Basic Rev.B'
basic_c
    dta d'Atari Basic Rev.C'
basic_off
    dta d'Disabled !!!!    '

tvstandard1
    dta d'NTSC'
tvstandard2
    dta d'PAL '

sound1
    dta d'Mono  '
sound2
    dta d'Stereo'


; Program start
begin
    mwa #dlist SDLSTL
    mva #>font CHBAS
    mva #30 COLOR0
    mva #$c COLOR1
    mva #$a0 COLOR4

; Delect the CPU
detect_cpu
    lda #$99
    clc
    sed
    adc #$01
    cld
    beq cpu_cmos
    string cpu1,processordetect,14
    jmp os_detect
cpu_cmos
    lda #0
    rep #%00000010	
    bne cpu_c816
cpu_c02
    string cpu2,processordetect,9
    jmp os_detect
cpu_c816
    string cpu3,processordetect,10

; Detect the OS ROM
os_detect
    lda OSROM
    cmp #1
    beq os_v1
    cmp #2
    beq os_v2
    cmp #3
    beq os_v3
    cmp #4
    beq os_v4
    cmp #10
    beq os_v10
    cmp #11
    beq os_v11
    string osother,osdetect,14
    jmp os_end
os_v1
    string osver1,osdetect,14
    jmp os_end
os_v2
    string osver2,osdetect,14
    jmp os_end   
os_v3
    string osver3,osdetect,14
    jmp os_end  
os_v4
    string osver4,osdetect,18
    jmp os_end  
os_v10
    string osver10,osdetect,14
    jmp os_end
os_v11
    string osver11,osdetect,14
    jmp os_end
os_end

; Detect the Basic ROM
    lda BASROM
    cmp #162
    beq bas_a
    cmp #96
    beq bas_b
    cmp #234
    beq bas_c
    string basic_off,basdetect,16
    jmp bas_end
bas_a
    string basic_a,basdetect,16
    jmp os_end
bas_b
    string basic_b,basdetect,16
    jmp os_end
bas_c
    string basic_c,basdetect,16
bas_end

; Detect the tv standard
    lda PAL
    and #$e
    bne tvs
    string tvstandard2,tvdetect,3
    jmp tv_end
tvs
    string tvstandard1,tvdetect,3
tv_end

; Detect the Sound
    jsr stereo
    bmi soundstereo
    string sound1,sounddetect,5
    jmp sound_end
soundstereo
    string sound2,sounddetect,5
sound_end

; Key console
keyconsole
    lda CONSOL
    cmp #6
    beq reboot
    cmp #5
    beq selftest
    jmp keyconsole

; Reboot
reboot
    jmp COLDSV

; Selt Test
selftest
    mva #$e0 CHBAS
    jmp SELFTST

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

; Macro to copy texts on screen
.macro string origin,destination,quantity
    ldx #:quantity
copybytes
    lda :origin,x
    sta :destination,x
    dex
    bpl copybytes
.endm

; Memory area for the font
    org +1024
font
    ins 'letter.fnt'
