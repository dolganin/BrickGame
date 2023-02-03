asect 0xF3
XandOld: dc 0b01000000
asect 0xF4
YandNew: dc 0b00001110

asect 0xF1
YandRes:
asect 0xF0
X:
asect 0x00
start:
ldi r0, XandOld
ld r0, r0
ldi r1, YandNew
ld r1, r1
# Course
ldi r2, 0b00000011
and r0, r2
ldi r3, 0b00000011
and r1, r3
add r2, r3
if 
	ldi r2, 0b00000011
	cmp r3, r2
is eq
	ldi r3, 0b00000011
	and r0, r3
else
	ldi r3, 0b00000011
	and r1, r3
fi
# Work with X and Y
shra r0
shra r0
shra r0
shra r1
shra r1
if 
	ldi r2, 0b00000011
	cmp r3, r2
is eq 
	dec r1
else
	if 
		ldi r2, 0b00000010
		cmp r3, r2
	is eq 
		dec r0
	else
		if 
			ldi r2, 0b00000001
			cmp r3, r2
		is eq 
			inc r0
		else
			inc r1
		fi
	fi
fi

#check X

if 
	tst r0
is mi
	ldi r0, 9
else
	if 
		ldi r2, 9
		cmp r2, r0
	is mi
		ldi r0, 0
	fi
fi

#check Y

if 
	tst r1
is mi
	ldi r1, 19
else
	if 
		ldi r2, 19
		cmp r2, r1
	is mi
		ldi r1, 0
	fi
fi

shla r1
shla r1
add r3, r1

ldi r3, YandRes
st r3, r1
ldi r3, 0b01000000
or r3, r0
ldi r2, X
st r2, r0

br start
halt
end

