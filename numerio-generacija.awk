#! /usr/bin/env -S awk -f

/^6.+\./ && !/\|/ \
{
    print ""
    print "["$0"]"
    print ""

    for (i = 0; i<10; i++)
    {
        first_step = gensub(/\./, i, 1)
        print first_step
    }
}
