#!/bin/sh
# captainer-discover.sh
# v1.0 – Captainer FOSS Edition
# Outputs system summary and saves captainer-context.txt for Captainer sessions

HOSTNAME=$(hostname)
OS=$(awk -F= '/^PRETTY_NAME/{print $2}' /etc/os-release | tr -d '"')
UPTIME=$(uptime -p)
CPU=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2- | sed 's/^ //')
RAM=$(free -h | awk '/Mem:/ { print $2 }')
IPV4=$(hostname -I | awk '{print $1}')
IPV6=$(ip -6 addr | awk '/inet6/ && !/fe80/ {print $2}' | head -n 1)

# Human-readable summary
echo "🖥️ Host:        $HOSTNAME"
echo "🧠 OS:          $OS"
echo "⏱️ Uptime:      $UPTIME"
echo "🧮 CPU:         $CPU"
echo "🧵 RAM:         $RAM"
echo "🌐 IPv4:        $IPV4"
echo "🌐 IPv6:        $IPV6"

# Save structured context to captainer-context.txt
cat <<EOF > ~/captainer-context.txt
host=$HOSTNAME
os=$OS
uptime=$UPTIME
cpu=$CPU
ram=$RAM
ipv4=$IPV4
ipv6=$IPV6
EOF

echo
 echo "✅ Context saved to ~/captainer-context.txt"