if [ $# -ne 1 ] ; then 
	echo "USAGE: $0 wiki-dump.bz2"
	exit 
fi 
BASE=/home/ankurgan/work/projectX/eventline
wikiparser=$BASE/src/wikipedia/parser  
databz2=$1
outdir=${databz2%.*}

bzcat $databz2 | python $wikiparser/WikiExtractor.py -s -o $outdir 

