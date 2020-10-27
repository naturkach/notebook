#!/bin/bash
#use: script textfile
awk '{
        for(i=1; i<=NF; i++) {
                tmp=match($i, /([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})/)
                if(tmp) {
                        print $i
                }
        }
}' $1
