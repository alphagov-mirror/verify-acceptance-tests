#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

pushd $DIR
echo -e '<!DOCTYPE html>\n<html><head><link rel="stylesheet" href="./journey.css"></head><body>' > index.html
cat $DIR/journey.dot | dot -Tsvg -Kdot \
	-Nshape=tab -Nwidth=2 -Nheight=1.33 -Nfixedsize=true -Nimagescale=true -Nimagepos=tc -Nlabelloc=b \
	-Eweight=0 -EURL='#\E' -Eid='\E' -Edir=both -Earrowtail=invempty \
	-Goverlap=false -Gnewrank=true \
	| sed -n '/^<svg/,/^\<\/svg\>/p;/^\/svg/q' >> index.html
echo -e '</body></html>' >> index.html
popd
