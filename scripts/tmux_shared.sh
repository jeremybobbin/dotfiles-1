#
#    tmux_shared.sh
#    =========
#
#    Shared TMUX sessions from (http://www.howtoforge.com/sharing-terminal-sessions-with-tmux-and-screen)
#
#    :created: 2013-08-23 19:12:29 +0000
#    :copyright: (c) 2013, Lambda Labs, Inc.
#    :license: All Rights Reserved.
#
case "$1" in
    start)
        tmux -S /tmp/shareds new -s shared
        sudo chgrp tmux-shared /tmp/shareds
        ;;
    attach)
        tmux -S /tmp/shareds attach -t shared
        ;;
    *)
        cat <<EOF
Usage:
    ./`basename $0` {start|attach}
EOF
        exit 1
esac
