# CodeSandbox supports debian & ubuntu based images
FROM ubuntu

# Example; install htop by default
RUN apt-get update && apt-get install -y htop wget unzip

ENV UUID c38846ff-275a-4112-869e-2f0f41d51d5f
ENV VMESS_WSPATH /vmess
ENV VLESS_WSPATH /vless


RUN mkdir /etc/v2ray /usr/local/v2ray
COPY config.json /etc/v2ray/
COPY entrypoint.sh /usr/local/v2ray/
COPY link-vmess.json /etc/v2ray/

RUN chmod a+x /usr/local/v2ray/entrypoint.sh


# ENTRYPOINT [ "/usr/local/v2ray/entrypoint.sh" ]
