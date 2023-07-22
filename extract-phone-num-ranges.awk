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
    print $4" "OWNER
}
