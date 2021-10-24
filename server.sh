#!/bin/bash
#if [ ! $# -eq 0 ]
#  then echo "Error: parameters problem"
#  exit 1
#fi

pipe=/tmp/testpipe
outpipe=/tmp/out_pipe

trap "rm -f $pipe" EXIT

trap "rm -f $outpipe" EXIT


if [[ ! -p $pipe ]]; then
    mkfifo $pipe
fi
if [[ ! -p $outpipe ]]; then
    mkfifo $outpipe
fi

while true; do
# read -p "Enter request: " request variable1 variable2 variable3
   read request <$pipe
   read variable1 <$pipe
   read variable2 <$pipe
   read variable3 <$pipe
    case "$request" in
        create)
                echo $(exec "./create.sh" "$variable1") > $outpipe
                ;;
        add)
                echo $(exec "./add.sh" "$variable1" "$variable2") > $outpipe
                ;;
        post)
                echo $(exec "./post.sh" "$variable1" "$variable2" "$variable3") > $outpipe
                ;;
        show)
                echo $(exec "./show.sh" "$variable1") > $outpipe
                ;;
        shutdown)
                exit 0
                ;;
        *)
                echo "Error: bad request"
                exit 1
  esac
done
