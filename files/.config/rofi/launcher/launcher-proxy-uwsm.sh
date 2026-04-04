dir="$HOME/.config/rofi/launcher"
theme=$1
env http_proxy=127.0.0.1:2080 https_proxy=127.0.0.1:2080 ftp_proxy=127.0.0.1:2080 rsync_proxy=127.0.0.1:2080 all_proxy=127.0.0.1:2080 HTTP_PROXY=127.0.0.1:2080 HTTPS_PROXY=127.0.0.1:2080 FTP_PROXY=127.0.0.1:2080 RSYNC_PROXY=127.0.0.1:2080 ALL_PROXY=127.0.0.1:2080 rofi -show drun -theme "${dir}/${theme}.rasi" -hover-select -run-command "uwsm-app -- {cmd}"
