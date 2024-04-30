cd ../data/splitted_data
mkdir splitted_200 splitted_300 splitted_1k

cd splitted_200

repackage -j ../../aggregate-json/aggregate.json -o pixstoryposts -v

dir_size=204
dir_name="folder"
n=$(($(find . -maxdepth 1 -type f -name "*.json" | wc -l)/$dir_size))
if [ $(($n * $dir_size)) -lt $(find . -maxdepth 1 -type f -name "*.json" | wc -l) ]; then
  n=$(($n + 1))
fi

for i in $(seq 1 $n);
do
    mkdir -p "$dir_name$i"
    find . -maxdepth 1 -type f -name "*.json" | head -n $dir_size | xargs -I {} mv {} "$dir_name$i"
done

cd ../splitted_300
repackage -j ../../aggregate-json/aggregate.json -o pixstoryposts -v

dir_size=300
dir_name="folder"
n=$(($(find . -maxdepth 1 -type f -name "*.json" | wc -l)/$dir_size))
if [ $(($n * $dir_size)) -lt $(find . -maxdepth 1 -type f -name "*.json" | wc -l) ]; then
  n=$(($n + 1))
fi

for i in $(seq 1 $n);
do
    mkdir -p "$dir_name$i"
    find . -maxdepth 1 -type f -name "*.json" | head -n $dir_size | xargs -I {} mv {} "$dir_name$i"
done

cd ../splitted_1k
repackage -j ../../aggregate-json/aggregate.json -o pixstoryposts -v

dir_size=1000
dir_name="folder"
n=$(($(find . -maxdepth 1 -type f -name "*.json" | wc -l)/$dir_size))
if [ $(($n * $dir_size)) -lt $(find . -maxdepth 1 -type f -name "*.json" | wc -l) ]; then
  n=$(($n + 1))
fi

for i in $(seq 1 $n);
do
    mkdir -p "$dir_name$i"
    find . -maxdepth 1 -type f -name "*.json" | head -n $dir_size | xargs -I {} mv {} "$dir_name$i"
done

cd ../../../Source_Code