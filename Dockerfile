FROM registry.cn-qingdao.aliyuncs.com/chenyou/alpine:1.0.0
MAINTAINER ck 1779912327@qq.com
ENV SPA /data/docker/svn
RUN apk add --update subversion curl\
  && rm /var/cache/apk/* \
  && mkdir $SPA -p \
  && curl -Lks4 https://raw.githubusercontent.com/code1992-code/svn-test/master/initialization.sh -o /initialization.sh \
  && chmod +x /initialization.sh
ENTRYPOINT  ["/initialization.sh"]
