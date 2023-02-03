asect 0xF3
cars: 

asect 0xF0
res:

asect 0x00
start:
	ldi r0, cars
	ld r0, r0
ldi r1, 0b00000100
ldi r2, 0b00000010
ldi r3, 0b00000001
if 
	and r0, r1
is eq
	if
		and r0, r2
	is eq
		ldi r1, res
		ldi r3, 0b01000000
		or r3, r0
		st r1, r0
	else
		ldi r0, res
		ldi r1, 0b11000000
		st r0, r1
	fi
else
	if
		and r0, r3
	is eq
		ldi r1, res
		ldi r3, 0b01000000
		or r3, r0		
		st r1, r0
		
	else
		ldi r0, res
		ldi r1, 0b11000000
		st r0, r1
	fi	
fi
br start
halt

end
