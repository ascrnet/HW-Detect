; HW-Detect Version PBI TESTER XE
; for Cartridge 8K
;-------------------------------------

SDMCTL = $22f

    opt f+h- 
    org $8000

data
    ins 'hw-detect-pbi.xex'

start_cart

    mva #0 SDMCTL
    ldy #0

copy1  
    mva .adr(data),y $2000,y+
    cpy #$80
    bne copy1
    ldy #0
copy2 
    mva .adr(data)+$80,y $2080,y+
    cpy #$80
    bne copy2
    ldy #0 
copy3
    mva .adr(data)+$100,y $2100,y+
    cpy #$80
    bne copy3
    ldy #0 
copy4
    mva .adr(data)+$180,y $2180,y+
    cpy #$80
    bne copy4
    ldy #0      
copy5
    mva .adr(data)+$200,y $2200,y+
    cpy #$80
    bne copy5
    ldy #0 
copy6
    mva .adr(data)+$280,y $2280,y+
    cpy #$80
    bne copy6
    ldy #0 
copy7
    mva .adr(data)+$300,y $2300,y+
    cpy #$80
    bne copy7
    ldy #0 
copy8
    mva .adr(data)+$380,y $2380,y+
    cpy #$80
    bne copy8
    ldy #0 
copy9
    mva .adr(data)+$400,y $2400,y+
    cpy #$80
    bne copy9
    ldy #0 
copy10
    mva .adr(data)+$480,y $2480,y+
    cpy #$80
    bne copy10
    ldy #0 
copy11
    mva .adr(data)+$500,y $2500,y+
    cpy #$80
    bne copy11
    ldy #0 
copy12
    mva .adr(data)+$580,y $2580,y+
    cpy #$80
    bne copy12
    ldy #0 
copy13
    mva .adr(data)+$600,y $2600,y+
    cpy #$80
    bne copy13
    ldy #0 
copy14
    mva .adr(data)+$680,y $2680,y+
    cpy #$80
    bne copy14
    ldy #0
copy15
    mva .adr(data)+$700,y $2700,y+
    cpy #$80
    bne copy15
    ldy #0
copy16
    mva .adr(data)+$780,y $2780,y+
    cpy #$80
    bne copy16
    ldy #0
copy17
    mva .adr(data)+$800,y $2800,y+
    cpy #$80
    bne copy17
    ldy #0
copy18
    mva .adr(data)+$880,y $2880,y+
    cpy #$80
    bne copy18
    ldy #0
copy19
    mva .adr(data)+$900,y $2900,y+
    cpy #$80
    bne copy19
    ldy #0
copy20
    mva .adr(data)+$980,y $2980,y+
    cpy #$80
    bne copy20
    ldy #0    
copy21
    mva .adr(data)+$a00,y $2a00,y+
    cpy #$80
    bne copy21
    ldy #0   
copy22
    mva .adr(data)+$a80,y $2a80,y+
    cpy #$80
    bne copy22
    ldy #0  
copy23
    mva .adr(data)+$b00,y $2b00,y+
    cpy #$80
    bne copy23
    ldy #0 
copy24
    mva .adr(data)+$b80,y $2b80,y+
    cpy #$1d
    bne copy24
    ldy #0 

; copy fonts
copy29
    mva .adr(data)+$1000,y $3000,y+
    cpy #$80
    bne copy29
    ldy #0 
copy30
    mva .adr(data)+$1080,y $3080,y+
    cpy #$80
    bne copy30
    ldy #0 
copy31
    mva .adr(data)+$1100,y $3100,y+
    cpy #$80
    bne copy31
    ldy #0 
copy32
    mva .adr(data)+$1180,y $3180,y+
    cpy #$80
    bne copy32
    ldy #0  
copy33
    mva .adr(data)+$1200,y $3200,y+
    cpy #$80
    bne copy33
    ldy #0  
copy34
    mva .adr(data)+$1280,y $3280,y+
    cpy #$80
    bne copy34
    ldy #0 
copy35
    mva .adr(data)+$1300,y $3300,y+
    cpy #$80
    bne copy35
    ldy #0 
copy36
    mva .adr(data)+$1380,y $3380,y+
    cpy #$80
    bne copy36
    ldy #0 
copy37
    mva .adr(data)+$1400,y $3400,y+
    cpy #$80
    bne copy37
    ldy #0 
copy38
    mva .adr(data)+$1480,y $3480,y+
    cpy #$80
    bne copy38
    ldy #0 
copy39
    mva .adr(data)+$1500,y $3500,y+
    cpy #$80
    bne copy39
    ldy #0
copy40
    mva .adr(data)+$1580,y $3580,y+
    cpy #$80
    bne copy40
    ldy #0 
copy41
    mva .adr(data)+$1600,y $3600,y+
    cpy #$19
    bne copy41

    mva #32 SDMCTL
    jmp $23b5

end_cart
    rts

    org $bffa
	    
    .word start_cart
    .by $0,$4
    .word end_cart
