#!/usr/bin/zsh

if (( $# != 2 ));
then
	print "$0 input_file.pdf output_file.pdf"
	exit -1;
fi

startdir=$(pwd)
tempdir=$(mktemp -d)
cd $tempdir
mudraw -o "$tempdir/%d.pbm" -r600 $1
for pbm in $(ls *.pbm|sort -n);
do
	tiff_name="$pbm.tif"
	all_tiffs=($all_tiffs $tiff_name)
	print $tiff_name;
	ppm2tiff -c g4 "$pbm" "$tiff_name";
done

tiffcp -c g4 $all_tiffs "$startdir/$2"
rm -r $tempdir
