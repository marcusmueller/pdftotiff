pdftotiff
=========

pdftotiff script that uses mupdf and libtiff-tools
to generate a 300dpi b/w G4-encoded multipage TIFF.

usage
========

pdftotiff.zsh input_file.pdf output_file.tif


caveats
========

This script uses temporary files to store the
uncompressed rasterized pages. This needs a lot
of free space in the temporary directory!
