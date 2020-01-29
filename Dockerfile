FROM alpine:3.6

ENV VER=4.20.0
ENV PORT=8080
ENV DOMAIN=
ENV UUID=89db424c-feb2-496d-910b-a74566e898dc

ADD v2ray-linux-64.zip /root/v2ray-linux-64.zip

RUN apk add --no-cache curl \
  && cd /root && mkdir /v2ray \
  && unzip v2ray-linux-64.zip -d /v2ray \
  && cd /v2ray && chmod a+x v2ray v2ctl \
  && rm -rf /root/v2ray-linux-64.zip
 
COPY entrypoint.sh /root/
RUN chmod a+x /root/entrypoint.sh

CMD /root/entrypoint.sh

