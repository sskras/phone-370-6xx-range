#! /usr/bin/env -S awk -f

/^6.+\./ && !/\|/ \
{
    print
}
