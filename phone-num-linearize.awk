#! /usr/bin/env -S awk -f

{
    NUM_FROM = $1
    NUM_TO   = $3

    if ( NUM_FROM == NUM_TO ) {
        gsub(/./, " ", $3)
    }

    for ( NUM = NUM_FROM; NUM <= NUM_TO; NUM++)
        ;

    print
}
