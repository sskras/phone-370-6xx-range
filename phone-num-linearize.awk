#! /usr/bin/env -S awk -f

{
    if ( $1 == $3 ) {
        gsub(/./, " ", $3)
    }

    print
}
