#!/bin/bash
# Common functions and system detection

system_info() {
    clear
    echo "==================== System Info ===================="
    echo "Hostname      : $(hostname)"
    echo "OS            : $(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f2)"
    echo "Kernel        : $(uname -r)"
    echo "Architecture  : $(uname -m)"
    echo "CPU           : $(grep 'model name' /proc/cpuinfo | head -1 | cut -d':' -f2 | xargs)"
    echo "Memory        : $(free -h | awk '/Mem/{print $2}')"
    echo "Disk          : $(df -h / | awk 'NR==2{print $2}')"
    echo "-----------------------------------------------------"
    # GeoIP via ipapi.co
    geo=$(curl -s ipapi.co/json)
    if [ $? -eq 0 ]; then
        ip=$(echo $geo | jq -r '.ip')
        city=$(echo $geo | jq -r '.city')
        region=$(echo $geo | jq -r '.region')
        country=$(echo $geo | jq -r '.country_name')
        isp=$(echo $geo | jq -r '.org')
        echo "Public IP     : $ip"
        echo "Location      : $city, $region, $country"
        echo "ISP           : $isp"
    else
        echo "GeoIP lookup failed."
    fi
    echo "====================================================="
}
