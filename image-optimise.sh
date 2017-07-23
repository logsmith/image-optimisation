

# https://regex101.com/r/iZ3fQ3/3





for f in $(find * -name '*.jpg' -or -name '*.JPG'); do

    # Dead simple filter to grab WP cropped image, it looks for
    # [number][number][the letter x][number][number]
    # This sequence appears at the end of WP cropped images like:
    # 2016/09/structured-data-in-wordpress-392x250.jpg
    if [[ $f =~ -[0-9][0-9]\x[0-9][0-9] ]] ; then
        jpegoptim -m 80 $f
    fi
done
