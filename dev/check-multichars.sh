head=`grep -nH 'LEXICON Root' apertium-yua.yua.lexc  | cut -f2 -d':'`

for tag in `cat apertium-yua.yua.lexc | grep -o '%<[^>]\+%>' | sort -u`;  do
	found=`head -n $head apertium-yua.yua.lexc | grep "$tag" | wc -l`
	if [[ $found -eq 0 ]]; then
		echo "$tag                         !";
	fi
done

for tag in `cat apertium-yua.yua.lexc | grep -o '%{[^}]\+%}' | sort -u`;  do
	found=`head -n $head apertium-yua.yua.lexc | grep "$tag" | wc -l`
	if [[ $found -eq 0 ]]; then
		echo "$tag                         !";
	fi
done
