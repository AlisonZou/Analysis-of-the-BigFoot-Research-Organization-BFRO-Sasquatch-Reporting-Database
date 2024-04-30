cd ../data/tika_results

python ../tika-img-similarity/tikasimilarity/distance/cosine_similarity.py --inputDir ../splitted_data/splitted_300/folder3 --outCSV cosine.csv
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-circle-packing.py --inputCSV cosine.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-cluster.py --inputCSV cosine.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/generateLevelCluster.py
cp -R ../../etllib/html/* .

mkdir cosine_3
mv *.json *.html cosine.csv cosine_3

cd ../../Source_Code