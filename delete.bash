#! /bin/bash

# 1: item_number
query=data/queries.log
date=$(date "+%Y-%m-%d %H:%M:%S")
file=data/$1.item

read simple_name trash 
rm -f $file
echo "$simple_name was successfully deleted."
echo "DELETED: $date - $simple_name" >> $query
