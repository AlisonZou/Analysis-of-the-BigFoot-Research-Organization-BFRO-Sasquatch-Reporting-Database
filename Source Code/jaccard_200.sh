cd ../data/tika_results

python ../tika-img-similarity/tikasimilarity/distance/jaccard_similarity.py --inputDir ../splitted_data/splitted_200/folder1 --outCSV jaccard.csv
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-circle-packing.py --inputCSV jaccard.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/edit-cosine-cluster.py --inputCSV jaccard.csv --cluster 2
python ../tika-img-similarity/tikasimilarity/cluster/generateLevelCluster.py
cp -R ../../etllib/html/* .

mkdir jaccard_2
mv *.json *.html jaccard.csv jaccard_2

cd ../../Source_Code