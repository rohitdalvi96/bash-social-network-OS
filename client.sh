#!/bin/bash

pipe=/tmp/testpipe
outpipe=/tmp/out_pipe

if [[ ! -p $pipe ]]; then
    echo "Reader not running"
    exit 1
fi

if [[ ! -p $outpipe ]]; then
    echo "Out pipe not running"
    exit 1
fi

#while true; do

        read -p "Enter request: " request variable1 variable2 variable3

        if [[ "$1" ]]; then
                echo "$1" >$pipe
        else
            echo $request > $pipe
            sleep 0.01
            echo $variable1 > $pipe
            sleep 0.01
            echo $variable2 > $pipe
            sleep 0.01
            echo $variable3 > $pipe
            sleep 0.01
        fi
if read output <$outpipe; then
 echo $output
fi
#done

exit 0