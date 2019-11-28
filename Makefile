all: mzt.gen.hfst mzt.mor.hfstol

mzt.lexc.hfst: mzt.lexc
		hfst-lexc mzt.lexc -o mzt.lexc.hfst
mzt.twol.hfst: mzt.twol
		 hfst-twolc mzt.twol -o mzt.twol.hfst
mzt.gen.hfst: mzt.lexc.hfst mzt.twol.hfst
		hfst-compose-intersect -1 mzt.lexc.hfst -2 mzt.twol.hfst -o mzt.gen.hfst


mzt.mor.hfst: mzt.gen.hfst
	hfst-invert $< -o mzt.mor.hfst

mzt.mor.hfstol: mzt.mor.hfst
	hfst-fst2fst -w $< -o mzt.mor.hfstol
