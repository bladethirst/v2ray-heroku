#!/bin/sh

cd /v2ray

CONFIG_TLS=${DOMAIN:+,\"security\":\"tls\",\"tlsSettings\":{\"serverName\":\"${DOMAIN}\",\"certificates\":[{\"certificateFile\":\"cert.pem\",\"keyFile\":\"key.pem\"\}]\}}
CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbounds\":[{\"protocol\":\"vmess\",\"port\":
CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\"
[ ${CONFIG_TLS} ] && [ ! -e cert.pem -o ! -e key.pem ] && CONFIG_TLS=
CONFIG_JSON3=\",\"alterId\":64}]},\"streamSettings\":{\"network\":\"ws\"${CONFIG_TLS}}}],\"outbounds\":[{\"protocol\":\"freedom\",\"settings\":{}}]}

echo -e -n "$CONFIG_JSON1" >  config.json
echo -e -n "$PORT" >> config.json
echo -e -n "$CONFIG_JSON2" >> config.json
echo -e -n "$UUID" >> config.json
echo -e -n "$CONFIG_JSON3" >> config.json

exec /v2ray/v2ray -config config.json

