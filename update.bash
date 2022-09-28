#! /bin/bash

# list of variables passed into this script
# $1: simple_name $2: item_name $3: current_quantity 
# $4: max_quantity  $5: definition $6: item_number

file=data/$6.item
query=data/queries.log
date=$(date "+%Y-%m-%d %H:%M:%S")

# read in old values from file
read old_sname old_iname
read old_cquant old_mquant
read old_def

# delete old file
rm -f $file

# checking if variables are empty if so keep previous values from file 
# to be updated, else update values. "updates" the file by creating a new file.
if [ -z "$1" ]; then
    simple_name=$old_sname
    echo "$simple_name"  >> $file
else
    simple_name=$1
    echo "$simple_name"  >> $file
fi
if [ -z "$2" ]; then
    item_name=$old_iname
    echo "$item_name"  >> $file
else
    item_name="$2"
    echo "$item_name"  >> $file
fi
if [ -z "$3" ]; then
    current_quantity=$old_cquant
    echo "$current_quantity" >> $file
else
    current_quantity=$3
    echo "$current_quantity" >> $file
fi
if [ -z "$4" ]; then
    max_quantity=$old_mquant
    echo "$max_quantity" >> $file
else
    max_quantity=$4
    echo "$max_quantity" >> $file
fi
if [ -z "$5" ]; then
    definition=$old_def
    echo "$definition" >> $file
else
    definition=$5
    echo "$definition" >> $file
fi

# update log
echo "UPDATED: $date - $simple_name" >> $query

