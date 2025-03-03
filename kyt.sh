#!/bin/bash
NS=$(cat /etc/xray/dns)
PUB=$(cat /etc/slowdns/server.pub)
domain=$(cat /etc/xray/domain)

# Warna
grenbo="\e[92;1m"
NC='\e[0m'

# Install dependencies
apt update && apt upgrade -y
apt install python3 python3-pip git -y
cd /usr/bin

# Download bot
wget https://raw.githubusercontent.com/ariksavania/zanprtmvpn/main/limit/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear

# Download kyt bot module
wget https://raw.githubusercontent.com/zanprtmvpn/vip/main/limit/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt

# Memasukkan data bot
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Create Bot Token via : @BotFather${NC}"
echo -e "${grenbo}[*] Get Your Telegram ID : @MissRose_bot , command /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken

# Menambahkan lebih dari satu admin
echo -e "${grenbo}[*] Input Your Admin Ids (pisahkan dengan spasi)${NC}"
read -e -p "[*] Input Admin Ids : " admins

# Simpan bot token dan admin dalam var.txt
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN_IDS='"'${admins// /,}'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
clear

# Membuat service systemd
cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt.sh

echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot   : $bottoken"
echo "Admins      : $admins"
echo "Domain      : $domain"
echo "Pub Key     : $PUB"
echo "Host        : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo "Installation complete, type /menu on your bot"
