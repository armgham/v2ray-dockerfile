#!/bin/sh

# UUID="c38846ff-275a-4112-869e-2f0f41d51d5f"

UUID=""

if [ -f "/workspace/uuid.txt" ]; then
    UUID=$(cat /workspace/uuid.txt)
else
	UUID="$(cat /proc/sys/kernel/random/uuid)"
    echo $UUID > "/workspace/uuid.txt"
fi

VMESS_WSPATH="/"
VLESS_WSPATH="/vl"

wget -q -O /tmp/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip
unzip -d /usr/local/v2ray /tmp/v2ray-linux-64.zip v2ray v2ctl
wget -q -O /usr/local/v2ray/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -q -O /usr/local/v2ray/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json

cp /etc/v2ray/link-vmess.json /workspace/link-vmess.json
sed -i "s|UUID|${UUID}|g" /workspace/link-vmess.json
exec "$@"
