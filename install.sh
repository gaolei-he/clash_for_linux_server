#!/bin/bash

mkdir -p ~/.config/clash
cp ./data/Country.mmdb ./data/cfw ~/.config/clash/
echo '
# ==== clash config start ====
start_clash() {
    export http_proxy='http://127.0.0.1:7890'
    export https_proxy='http://127.0.0.1:7890'
    export HTTP_PROXY='http://127.0.0.1:7890'
    export HTTPS_PROXY='http://127.0.0.1:7890'
    ~/.config/clash/cfw >~/.config/clash/clash.log 2>&1 &
    echo "Clash started. Log file: ~/.config/clash/clash.log"

    export CLASH_PID=$!
    trap "echo \"exit clash\"; kill -9 $CLASH_PID; exit" EXIT
}
exit_clash() {
    if [ -n "$CLASH_PID" ]; then
        kill -9 $CLASH_PID
        echo "Clash stopped"
        unset CLASH_PID
        unset http_proxy
        unset https_proxy
        unset HTTP_PROXY
        unset HTTPS_PROXY
    else
        echo "Clash is not running."
    fi
}
# ==== clash config end ====
' >> ~/.bashrc

source ~/.bashrc