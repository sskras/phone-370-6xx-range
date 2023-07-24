#! /usr/bin/env -S awk -f

$1 == $3 \
{
    gsub(/./, " ", $3)
    print
    next
}

{
    print
}
