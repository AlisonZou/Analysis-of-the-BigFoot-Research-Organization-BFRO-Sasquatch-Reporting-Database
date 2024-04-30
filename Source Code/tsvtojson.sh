set -e

cd ..
cd data
tsvtojson -t 'selected_bfro.tsv' -j 'aggregate-json/aggregate.json' -c 'conf/colheaders.conf' -e 'conf/encoding.conf' -o pixstoryposts -s 0.8 -v

cd repackaged_data
repackage -j ../aggregate-json/aggregate.json -o pixstoryposts -v

cd ../../Source_Code
