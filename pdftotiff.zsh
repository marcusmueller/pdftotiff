#!/usr/bin/zsh

if (( $# != 2 ));
then
	print "$0 input_file.pdf output_file.pdf"
	exit -1;
fi

startdir=$(pwd)
tempdir=$(mktemp -d)
mudraw -o "$tempdir/%d.pbm" -r300 $1
pushd $tempdir
print "moved to temporary directory $(pwd)"
for pbm in $(ls *.pbm|sort -n);
do
	tiff_name="$pbm.tif"
	all_tiffs=($all_tiffs $tiff_name)
	print "converting $pbm to $tiff_name"
	ppm2tiff -c g4 -R 300 "$pbm" "$tiff_name";
done

tiffcp -c g4 $all_tiffs "$startdir/$2"
popd
rm -r $tempdir
