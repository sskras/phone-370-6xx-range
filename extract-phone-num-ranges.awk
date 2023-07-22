#! /usr/bin/env -S awk -f

BEGIN \
{
    FS="[\"]"
}

/ownerFullName/ \
{
    print NF
    print
}

/range/ \
{
    print NF
    print
}
