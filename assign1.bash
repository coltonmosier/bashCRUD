#!/bin/bash

running=0

while [ $running ] ; do
    # Print menu
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "C - create a new item"
    echo "R - read an existing item"
    echo "U - update an existing item"
    echo "D - delete an existing item"
    # check if CTRL-D was inputted from user
    if ! read userIn; then
        break
    fi
    # case to handle input past if-statement
    case "$userIn" in
        [Cc]) # creates a new item
            bash create.bash 
            if [ $? -ne 0 ]; then # check if create.bash returned an error
                echo "ERROR: item already exists"
            fi
            ;;
        [Rr]) # reads data from file
            read -p "Item number: " item_number
            file=data/$item_number.item
            if [ -r "$file" ]; then
                bash read.bash $item_number < $file
            else
                echo "ERROR: item not found"
            fi;;
        [Uu]) # updadtes a current item
            read -p "Item number: " item_number
            read -p "Simple name: " simple_name
            read -p "Item name: " item_name
            read -p "Current quantity: " current_quantity
            read -p "Maximum quantity: " max_quantity
            read -p "Definition: " definition
            file=data/$item_number.item
            if [ -r "$file" ]; then # check if file exists and is readable
                bash update.bash "$simple_name" "$item_name" "$current_quantity" \
                    "$max_quantity" "$definition" "$item_number" < $file
            else
                echo "ERROR: item not found"
            fi;;
        [Dd]) # delete item if exists 
            read -p "Item number: " item_number
            file=data/$item_number.item
            if [ -r "$file" ]; then
                bash delete.bash $item_number < $file
            else
                echo "ERROR: item not found"
            fi;;
        *) # check if input is not accepted
            echo 'wrong input';;
    esac
done;

