all: mzt.gen.hfst mzt.mor.hfstol

mzt.lexc.hfst: mzt.lexc
		hfst-lexc mzt.lexc -o mzt.lexc.hfst

mzt.twol.hfst: mzt.twol
		hfst-compose-intersect -1 mzt.mor.twol.hfst | hfst-invert -o $@
		
		
mzt.gen.hfst: mzt.lexc.hfst mzt.twol.hfst
		hfst-compose-intersect -1 mzt.lexc.hfst -2 mzt.twol.hfst -o $@


mzt.mor.hfst: mzt.gen.hfst
	hfst-invert $< -o mzt.mor.hfst


mzt.mor.twol.hfst: mzt.mor.twol.
	hfst-twolcmxt.mor.twol -o mzt.mor.twol.hfst

