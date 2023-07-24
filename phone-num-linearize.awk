#! /usr/bin/env -S awk -f

{
    NUM_FROM = $1
    NUM_TO   = $3

    if ( $1 == $3 ) {
        gsub(/./, " ", $3)
    }

    print
}
