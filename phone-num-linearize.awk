#! /usr/bin/env -S awk -f

{
    NUM_FROM = $1
    NUM_TO   = $3

    $1 = $2 = $3 = ""
    sub(/^ +/, "")
    NUM_PROVIDER = $0

    for ( NUM = NUM_FROM; NUM <= NUM_TO; NUM++)
        print NUM" "NUM_PROVIDER;

}
