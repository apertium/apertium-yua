all:
	hfst-lexc --Werror apertium-yua.yua.lexc -o yua.lexc.hfst
	hfst-twolc apertium-yua.yua.twol -o yua.twol.hfst
	hfst-compose-intersect -1 yua.lexc.hfst -2 yua.twol.hfst -o yua.gen.hfst
	hfst-invert yua.gen.hfst -o yua.mor.hfst
	hfst-fst2fst -w yua.mor.hfst -o yua.mor.hfstol
