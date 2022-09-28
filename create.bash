#! /bin/bash


query=data/queries.log # locations of queries.log file
date=$(date "+%Y-%m-%d %H:%M:%S") # variable storing current date/time

# read item values from cl
read  -p "Item number: " item_number
read  -p "Simple name: " simple_name junk
read  -p "Item name: " item_name
read  -p "Current quantity: " current_quantity
read  -p "Maximum quantity: " max_quantity
read  -p "Description: " description

file=data/$item_number.item # location of new .item file

if [ -f "$file" ]; then # check if file exists
    exit 1 # exit with error
else
    # write item into .item value and update queries.log
    echo "$simple_name $item_name" >> $file
    echo "$current_quantity $max_quantity" >> $file
    echo "$description" >> $file
    echo "CREATED: $date - $simple_name" >> $query
fi
