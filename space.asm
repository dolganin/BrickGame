asect 0xF3
date: 

asect 0xF0
res: 

asect 0x00
start:

ldi r0, 0
ldi r1, 0
ldi r2, 0
ldi r3, 0

ldi r3, date
ld r3, r1
while
	ldi r2, 8
	cmp r2, r0
stays nz
	ldi r2, 0b00000001
	if 
		and r1, r2
	is nz
		br fin
	fi
	shra r1
	inc r0
wend
inc r3
ld r3, r1
while
	ldi r2, 16
	cmp r2, r0
stays nz
	ldi r2, 0b00000001
	if 
		and r1, r2
	is nz
		if 
			tst r0
		is nz
			br fin
		fi
	fi
	shra r1
	inc r0
wend
inc r3
ld r3, r1
while
	ldi r2, 20
	cmp r2, r0
stays nz
	ldi r2, 0b00000001
	if 
		and r1, r2
	is nz
		br fin
	fi
	shra r1
	inc r0
wend
fin:
ldi r3, res
dec r0
ldi r2, 0b01000000
or r2, r0
st r3, r0

br start

halt

end
