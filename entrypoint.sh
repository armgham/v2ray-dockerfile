#!/bin/sh
# Create By ifeng
# Web Site:https://www.hicairo.com
# Telegram:https://t.me/HiaiFeng
UUID="c38846ff-275a-4112-869e-2f0f41d51d5f"
VMESS_WSPATH="/vmess"
VLESS_WSPATH="/vless"
sed -i "s#UUID#$UUID#g;s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/v2ray/config.json
sed -i "s#VMESS_WSPATH#$VMESS_WSPATH#g;s#VLESS_WSPATH#$VLESS_WSPATH#g" /etc/nginx/nginx.conf
exec "$@"
