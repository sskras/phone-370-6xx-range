#! /usr/bin/env -S awk -f

/^6.+\./ && !/\|/ \
{
    print ""
    print "["$0"]"
    print ""

    for (i = 0; i<10; i++)
    {
        first_step = gensub(/\./, i, 1)

        for (j = 0; j<10; j++)
        {
            second_step = gensub(/\./, j, 1, first_step)
            print second_step
        }
    }
}
