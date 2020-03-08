#!/bin/bash

url="http://169.254.169.254/latest/meta-data/"

list=`curl $url`

echo $list > file.txt

for i in `cat file.txt`
do
echo $i
new=`curl http://169.254.169.254/latest/meta-data/$i`

echo "$i : $new" >> final.json
done
