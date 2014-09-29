
search ()
{
	## search for a title " " in wiki dump dir ##
	title=$1
	dumpdir=$2 # extracted text
	titleplus="title=\""$title"\""
	#>&2 echo "searching for:"$titleplus
	filename=`grep -l "$titleplus" $dumpdir/*/*`

	if [ -f $filename ]; then 
		if [ $# -ne 3 ] ; then 
			cat $filename | python get_document.py "$title"
		else
			cat $filename | python get_document.py "$title" > $3 
		fi 
	
	fi
}

usage () 
{
	echo "Usage: $0  -t \"title\" -d wiki-dir " 

}

title=""
dumpdir=""
while [ "$1" != "" ]; do
    case $1 in
        -t | --title )          shift
                                title=$1
                                ;;
        -d | --dumpdir )        shift
   				dumpdir=$1
                                ;;
	-o | --outfile )	shift
				outfile=$1
				;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ "$title" != "" ] && [ -d $dumpdir ] ; then
		search "$title" $dumpdir $outfile
else
	usage 
fi 

