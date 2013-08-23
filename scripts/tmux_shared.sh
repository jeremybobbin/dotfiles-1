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
usage() {
    cat <<EOF
Usage:
    ./`basename $0` {ls|start|attach} session_name
EOF
    exit 1
}
case "$1" in
    ls)
        ls /tmp | grep -P "^session_"
        ;;
    start)
        if ! [[ $2 ]]; then usage; fi;
        SESSION_NAME=$2
        tmux -S /tmp/${SESSION_NAME}.sock new -s $SESSION_NAME
        sudo chmod 777 /tmp/${SESSION_NAME}.sock
        sudo chgrp tmux-shared /tmp/${SESSION_NAME}.sock
        ;;
    attach)
        if ! [[ $2 ]]; then usage; fi;
        SESSION_NAME=$2
        tmux -S /tmp/${SESSION_NAME}.sock attach -t $SESSION_NAME
        ;;
    *)
        usage;
esac
