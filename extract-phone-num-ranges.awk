#! /usr/bin/env -S awk -f

BEGIN \
{
    FS="[\"]"
}

/ownerFullName/ \
{
    gsub(/\\"/, "'")
    print $4
}

/range/ \
{
    print $4
}
