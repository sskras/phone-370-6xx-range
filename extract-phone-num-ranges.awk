#! /usr/bin/env -S awk -f

BEGIN \
{
    FS="[\"]"
}

/ownerFullName/ \
{
    print
    gsub(/\\"/, "'")
    print $4
}

/range/ \
{
    print $4
}
