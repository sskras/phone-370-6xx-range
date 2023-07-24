#! /usr/bin/env -S awk -f

/^6.+\./ && !/\|/ \
{
    print ""
    print "["$0"]"
    print ""

    for (i = 0; i<10; i++)
    {
        print gensub(/\./, i, 1)
    }
}
