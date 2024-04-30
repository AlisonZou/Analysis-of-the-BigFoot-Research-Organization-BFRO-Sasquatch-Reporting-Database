cd ../data/tika_results

python ../tika-img-similarity/tikasimilarity/distance/cosine_similarity.py --inputDir ../repackaged_data/folder3 --outCSV cosine.csv
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-circle-packing.py --inputCSV cosine.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-cluster.py --inputCSV cosine.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/generateLevelCluster.py
cp -R ../../etllib/html/* .

mkdir cosine_1
mv *.json *.html cosine.csv cosine_1

cd ../../Source_Code