cd ../data/tika_results

python ../tika-img-similarity/tikasimilarity/distance/edit-value-similarity.py --inputDir ../splitted_data/splitted_300/folder2 --outCSV edit.csv
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-circle-packing.py --inputCSV edit.csv --cluster 0
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-cluster.py --inputCSV edit.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/generateLevelCluster.py
cp -R ../../etllib/html/* .

mkdir editdistance_3
mv *.json *.html edit.csv editdistance_3

cd ../../Source_Code