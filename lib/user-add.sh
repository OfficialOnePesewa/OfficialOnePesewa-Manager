#!/bin/bash
# Add VPN user with full system and geo info
source /usr/local/OfficialOnePesewa/lib/common.sh

clear
echo "============ Create VPN User ============"
read -p "Username: " username
read -p "Password: " password
read -p "Expiry (days): " exp

# Generate a simple user record
exp_date=$(date -d "+${exp} days" +%Y-%m-%d)
echo "$username $password $exp_date" >> /etc/OfficialOnePesewa/users.txt

echo ""
echo "======================================="
echo "        USER ACCOUNT CARD"
echo "======================================="
echo " Username       : $username"
echo " Password       : $password"
echo " Expires        : $exp_date"
echo ""
echo " --- Server Info ---"
echo " OS             : $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
echo " Kernel         : $(uname -r)"
echo " Architecture   : $(uname -m)"
geo=$(curl -s ipapi.co/json)
if [ $? -eq 0 ]; then
    echo " Public IP      : $(echo $geo | jq -r '.ip')"
    echo " Location       : $(echo $geo | jq -r '.city'), $(echo $geo | jq -r '.region'), $(echo $geo | jq -r '.country_name')"
    echo " ISP            : $(echo $geo | jq -r '.org')"
fi
echo ""
echo " Telegram       : @OfficialOnePesewa"
echo "======================================="
echo " Share this card with the user."
read -p "Press Enter to continue..."
