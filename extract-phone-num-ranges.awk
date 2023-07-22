#! /usr/bin/env -S awk -f

BEGIN \
{
    FS="[\"]"
}

/ownerFullName/ \
{
    gsub(/\\"/, "'")
    OWNER = $4
}

/range/ \
{
    RANGE = $4
    print $4" "OWNER
}
