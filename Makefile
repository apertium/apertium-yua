all:
	hfst-lexc --Werror apertium-yua.yua.lexc -o yua.lexc.hfst
	hfst-twolc apertium-yua.yua.twol -o yua.twol.hfst
	hfst-regexp2fst -S -o yua.spellrelax.hfst < apertium-yua.yua.spellrelax
	hfst-compose-intersect -1 yua.lexc.hfst  -2 yua.twol.hfst | hfst-compose-intersect -1 - -2 yua.spellrelax.hfst  | hfst-invert -o yua.mor.hfst
	hfst-fst2fst -w yua.mor.hfst -o yua.mor.hfstol
	hfst-fst2fst -O yua.mor.hfst -o yua.automorf.hfst
	apertium-gen-modes modes.xml
	cg-comp apertium-yua.yua.rlx yua.rlx.bin
