#!/bin/bash

# Ambil informasi dari sistem
NS=$(cat /etc/xray/dns)
PUB=$(cat /etc/slowdns/server.pub)
DOMAIN=$(cat /etc/xray/domain)

# Warna
GREEN="\e[92;1m"
NC='\e[0m'

# Install dependencies
apt update && apt upgrade -y
apt install python3 python3-pip git unzip -y
cd /usr/bin

# Download bot
wget -O bot.zip "https://raw.githubusercontent.com/zanprtmvpn/vip/main/limit/bot.zip"
unzip -o bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear

# Download kyt module
wget -O kyt.zip "https://raw.githubusercontent.com/zanprtmvpn/vip/main/limit/kyt.zip"
unzip -o kyt.zip
pip3 install -r kyt/requirements.txt
rm -rf kyt.zip

# Input data bot
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${GREEN}[*] Buat Token Bot di: @BotFather${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Masukkan Bot Token: " BOT_TOKEN

# Simpan ke dalam var.txt (Tanpa ADMIN_IDS)
cat <<EOF > /usr/bin/kyt/var.txt
BOT_TOKEN="$BOT_TOKEN"
DOMAIN="$DOMAIN"
PUB="$PUB"
HOST="$NS"
EOF

clear

# Membuat service systemd untuk bot
cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Bot Panel VPN - kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

# Aktifkan service bot
systemctl daemon-reload
systemctl enable kyt
systemctl start kyt
systemctl restart kyt

# Hapus installer setelah selesai
rm -f kyt.sh

# Tampilkan informasi bot
echo "✅ Instalasi selesai!"
echo -e "==============================="
echo "🔑 Token Bot   : $BOT_TOKEN"
echo "🌐 Domain      : $DOMAIN"
echo "🔑 Public Key  : $PUB"
echo "📡 Host        : $NS"
echo -e "==============================="
echo "💡 Bot berhasil dipasang, ketik /menu di bot Telegram!"
clear
