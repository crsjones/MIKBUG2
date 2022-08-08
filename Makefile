target:		mikbug2.s19

mikbug2.asm:	pages/*.asm
	cat $(^) > $(@)

mikbug2.s19:	mikbug2.asm
	as0 $(^) -l > $(@:.s19=.lst)

clean:
	$(RM) *.s19 *.lst
