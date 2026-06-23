#!/bin/bash
# OfficialOnePesewa Dashboard - optech command
source /usr/local/OfficialOnePesewa/lib/banner.sh
source /usr/local/OfficialOnePesewa/lib/common.sh

while true; do
    clear
    show_banner
    echo ""
    echo "  [1] Install UDP Custom"
    echo "  [2] Install ZIVPN"
    echo "  [3] Create User (VPN Account)"
    echo "  [4] Show active users"
    echo "  [5] System Info"
    echo "  [0] Exit"
    echo ""
    echo -n "  Choose option: "
    read opt

    case $opt in
        1) bash /usr/local/OfficialOnePesewa/protocols/udp-custom.sh ;;
        2) bash /usr/local/OfficialOnePesewa/protocols/zivpn.sh ;;
        3) bash /usr/local/OfficialOnePesewa/lib/user-add.sh ;;
        4) cat /etc/OfficialOnePesewa/users.txt 2>/dev/null || echo "No users yet." ;;
        5) system_info ;;
        0) exit ;;
        *) echo "Invalid option"; sleep 1 ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
done
