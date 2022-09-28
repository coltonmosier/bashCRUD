#! /bin/bash

# List of variables passed into script
# 1 - item_number

# read item info from file passed in 
read simple_name item_name
read current_quantity max_quantity
read description

# echo info of item to terminal
echo "Item Name: $item_name"
echo "Simple Name: $simple_name"
echo "Item Number: $1"
echo "Qty: $current_quantity/$max_quantity"
echo "Description: $description"
