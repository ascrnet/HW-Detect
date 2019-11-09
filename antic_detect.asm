// ANTIC PAL Test for Atari 8-bits
// (C) 2019 Guillermo Fuenzalida

.proc @ANTIC

max	.byte 0

antic_loop1
	lda vcount
	cmp #100
	bcc antic_loop1 //Wait till scanline 200
	sta max
antic_loop2
	lda vcount
	cmp #10
	bmi antic_loop2_fin
	cmp max
	bmi antic_loop2
	sta max
	bpl antic_loop2
antic_loop2_fin	
	ldx #$00
	lda max
	cmp #135
	bmi ntsc
	inx
ntsc
	stx palnts	
detect
	mva #1 @antic_detect
	lda palnts
	beq end_antic
	mva #0 @antic_detect
end_antic
	rts
	
.endp


	