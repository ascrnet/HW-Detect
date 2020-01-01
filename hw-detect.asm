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

@TAB_MEM_BANKS = $600
@ANTIC_DETECT = $650
A1200  = $652
A600KB = $4000

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
    .word options
    .by $41
    .word dlist

title
    dta d' #$ HARDWARE-DETECT '
subtitle
    dta d'  ATARI XL/XE/XEGS  '
author
:7  .by $41
    .by $42
    dta d'by AsCrNet, 2020'*
    .by $43
    .by $41
    .by $42
    dta d'V1.5'*
    .by $43
:8  .by $41

processor
    dta d'        Processor : ' 
processordetect
    dta d'                    '
memory
    dta d'              RAM : '
memorydetect
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
    dta d'        TV System : GTIA='
tvgtia
    dta d'     ANTIC='
tvantic
    dta d'    '
soundversion
    dta d'            Sound : '
sounddetect
    dta d'                    '

tjoy1
    dta d'   ',$46,d'           ',$4b,d'  Test  '*,$4c,d'     ',$46,d'            '       
tjoy2
    dta d'  ',$48,$4a,$49,d' 1 2 3    ',$4b,d'Joystick'*,$4c,d'    ',$48,$4a,$49,d' 1 2 3   '
tjoy3
    dta d'   ',$47,d'           ',$4b,d'  1 & 2 '*,$4c,d'     ',$47,d'            '

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
bank0
    dta d'16 KB Atari'
bank1
    dta d'64 KB Atari'
bank4
    dta d'128 KB Atari'
bank15
    dta d'256 KB Rambo'
bank16
    dta d'320 KB Rambo/Compy'
bank32
    dta d'576 KB Rambo/Compy'
bank64
    dta d'1088 KB'
bank128
    dta d'2112 KB'
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
sound1
    dta d'Mono  '
sound2
    dta d'Stereo'
bas1200xl
    dta d'  Basic Cartridge : '

; Program start
begin
    mva #0 AUDCTL
    mwa #dlist SDLSTL
    mwa #dli VDSLST
    mva #>font CHBAS
    mva #$d COLOR1
    mva #0 A1200
 
; Delect the CPU
detect_cpu
    lda #$99
    clc
    sed
    adc #$01
    cld
    beq cpu_cmos
    string cpu1,processordetect,14
    jmp ram16
cpu_cmos
    lda #0
    rep #%00000010	
    bne cpu_c816
cpu_c02
    string cpu2,processordetect,9
    jmp ram16
cpu_c816
    string cpu3,processordetect,10

; Detect the RAM
ram16
    mva #$a A600KB
    lda A600KB
    cmp #$a
    bne d600_16k
    jmp ram_detect
d600_16k
    string bank0,memorydetect,10
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
    string bank1,memorydetect,10
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
    string bank64,memorydetect,6
    jmp end_bank
ram_128
    string bank128,memorydetect,6
end_bank 

; Detect the OS ROM
os_detect
    lda OSROM
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

;Detect 1200XL
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
    lda PALNTS
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


; Key console
keyconsole
    mva #0 ATRACT
    lda CONSOL
    cmp #6
    beq reboot
    cmp #5
    beq selftest
    jmp joystick1

; Reboot
reboot
    jmp COLDSV

; Selt Test
selftest
    mva #$e0 CHBAS
    jmp SELFTST

joystick1
	lda STICK0
	pha
p1_right
	pla
	pha
	and #8
	bne p1_left
	anima $49,tjoy2+4,AUDC1
p1_left
	pla
	pha
	and #4
	bne p1_down
	anima $48,tjoy2+2,AUDC1
p1_down
	pla
	pha
	and #2
	bne p1_up
	anima $47,tjoy3+3,AUDC1
p1_up
	pla
	pha
	and #1
	bne p1_b1
	anima $46,tjoy1+3,AUDC1
p1_b1
	lda STRIG0
	bne p1_j2b
	anima $11,tjoy2+6,AUDC2
p1_j2b
    lda PADDL0
    and PADDL1
    cmp #$e4
    bne p1_b2
    jmp joystick2
p1_b2
	lda PADDL0
	cmp #$e4
	bne p1_b3
    anima $12,tjoy2+8,AUDC2
p1_b3
	lda PADDL1
	cmp #$e4
	bne joystick2
    anima $13,tjoy2+10,AUDC2
;
joystick2
	lda STICK1
	pha
p2_right
	pla
	pha
	and #8
	bne p2_left
	anima $49,tjoy2+31,AUDC3
p2_left
	pla
	pha
	and #4
	bne p2_down
	anima $48,tjoy2+29,AUDC3
p2_down
	pla
	pha
	and #2
	bne p2_up
	anima $47,tjoy3+30,AUDC3	
p2_up
	pla
	pha
	and #1
	bne p2_b1
	anima $46,tjoy1+30,AUDC3
p2_b1
	lda STRIG1
	bne p2_j2b
	anima $11,tjoy2+33,AUDC4
p2_j2b
    lda PADDL2
    and PADDL3
    cmp #$e4
    bne p2_b2
    jmp end_joy
p2_b2
	lda PADDL2
	cmp #$e4
	bne p2_b3
    anima $12,tjoy2+35,AUDC4
p2_b3
	lda PADDL3
	cmp #$e4
	bne end_joy
    anima $13,tjoy2+37,AUDC4
end_joy
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

; Macro que anima el caracter 
.macro anima
	mva #:1-128 :2
	mva #$9b :3
    pause 3
	mva #0 :3
	mva #:1 :2
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

    icl 'antic_detect.asm'
    icl 'mem_detect.asm'

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


