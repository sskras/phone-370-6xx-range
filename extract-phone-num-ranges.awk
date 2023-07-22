#! /usr/bin/env -S awk -f

BEGIN \
{
    FS="[\"]"
}

/ownerFullName/ \
{
    print NF
    print
    gsub("\\\"", "'")
    print
}

/range/ \
{
    print $4
}
