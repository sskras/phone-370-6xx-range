#! /usr/bin/env -S awk -f

{
    NUM_FROM = $1
    NUM_TO   = $3

    if ( NUM_FROM == NUM_TO ) {
       #gsub(/./, " ", $3)
    }

   #print

    $1 = $2 = $3 = ""
   #sub(/^ +/, "")
    NUM_PROVIDER = $4

    print NUM_PROVIDER

    for ( NUM = NUM_FROM; NUM <= NUM_TO; NUM++)
        print NUM;

}
