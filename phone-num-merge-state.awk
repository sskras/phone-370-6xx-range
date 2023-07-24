#! /usr/bin/env -S awk -f

BEGIN \
{
    while (getline < "phone-num-state.txt")
        state[$1] = $2
}

$0 ~ PROVIDER \
{
    num = $1
    print num" "state[num]
}
