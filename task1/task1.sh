#!/bin/bash -x

echo "Hello Wolrd!"

TMP_DIRS="tmp_dirs"
touch tmp_dirs
find /opt  -name ".prune-enable" -exec dirname {} \; > $TMP_DIRS
cat $TMP_DIRS
for PRUNE_DIRS in $(cat $TMP_DIRS)
do
	echo $PRUNE_DIRS
	if [ -e "$PRUNE_DIRS/crash.dump" ] ; then
		#rm -rf 
		echo "$PRUNE_DIRS/crash.dump"	
	fi	
	for f in $(find $PRUNE_DIRS -size +1M -name "*.log")
	do
		echo "$(tail -20000 $f)" > $f
	done
done
