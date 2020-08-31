CRITIC = $42
ROWCRS = $54
COLCRS = $55
GPRIOR = $26f
ICCOM  = $342
ICBAL  = $344
ICBAH  = $345
ICBLL  = $348
ICBLH  = $349
ICAX2  = $34b
ICAX1  = $34a
HPOSP0 = $d000          	
HPOSM0 = $d004
GRAFP0 = $d00d          	
HITCLR = $d01e        	
CIOV   = $e456

.proc @GTIA
    mva #0 @TIA_DETECT
    mva #1 CRITIC
    lda #0
    jsr grafic
    mva #0 COLOR1
    sta COLOR0
    sta CRITIC
    mva #64 GPRIOR
    mva #42 HPOSP0
    mva #3 GRAFP0
    ldx #0
    lda #0
    ldy #0
    jsr plot
    mva #0 HITCLR
    pause 1
    lda #0
    jsr grafic
    mva #0 HPOSP0
    lda HPOSM0
    cmp #4
    beq gtia_end
    mva #1 @TIA_DETECT
gtia_end
    rts

grafic
    pha
    ldx #$60
    lda #$c
    sta ICCOM,x
    jsr CIOV
    ldx #$60
    lda #3
    sta ICCOM,x
    lda #<screen
    sta ICBAL,x
    lda #>screen
    sta ICBAH,x
    pla         
    sta ICAX2,x
    and #$f0
    eor #$10
    ora #$c
    sta ICAX1,x
    jsr CIOV
    rts

plot
    sty ROWCRS
	stx COLCRS
	and #1
	sta COLCRS+1
    ldx #$60
    lda #$b
    sta ICCOM,x
    lda #0
    sta ICBLL,x
    sta ICBLH,x
    lda #1
    jsr CIOV
    rts 

screen
    dta c'S:',$9b

.endp