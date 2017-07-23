#!/bin/bash

# cd to the location of this file
cd ${0%/*}
# cd back to the WP root
cd ../../../wp-content/uploads/

# See if optimisation is being forced
if [ -z "$1" ]; then
    find=$(find * -mtime -3 -name '*.jpg' -or -name '*.JPG')
else
    find=$(find * -name '*.jpg' -or -name '*.JPG')
fi


# find JPEGs
for f in $find; do

    # Simple filter to grab WP cropped image, it looks for
    # [number][number][the letter x][number][number]
    # This sequence appears at the end of WP cropped images like:
    # 2016/09/structured-data-in-wordpress-392x250.jpg
    if [[ $f =~ [0-9][0-9]\x[0-9][0-9] ]] ; then
        echo $f;
        # jpegoptim $f --preserve --max=84
    fi
done
