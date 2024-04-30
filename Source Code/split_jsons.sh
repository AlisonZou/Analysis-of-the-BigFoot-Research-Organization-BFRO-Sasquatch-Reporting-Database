cd ../data/repackaged_data

dir_size=100
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

cd ../../Source_Code