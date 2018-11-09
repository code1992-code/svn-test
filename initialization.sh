#!/bin/sh
#########################################################################
# File Name: initialization.sh
# Author: mark www.linuxea.com
# Email: usertzc@gmail.com
# Version:
# Created Time: 2016年12月26日 星期一 14时03分46秒
#########################################################################
SPA=/data/docker/svn
if [ "$(ls -A $SPA)" ];then
	svnserve -d -r /data/docker/svn && tail -f /etc/passwd
else
	svnadmin create $SPA
	sed -i  's/# anon-access = read/anon-access = none/g' $SPA/conf/svnserve.conf  && sed -i  's/# password-db = passwd/password-db = passwd/g' $SPA/conf/svnserve.conf && sed -i  's/# auth-access = write/auth-access = write/g' $SPA/conf/svnserve.conf && sed -i  's/# realm = My First Repository/realm = weba/g' $SPA/conf/svnserve.conf && sed -i  's/# authz-db = authz/authz-db = authz/g' $SPA/conf/svnserve.conf && echo ck=2d5be445af35eb354ab4724479663c28 >> $SPA/conf/passwd && qch=3643a4e3947cc6408c7df4040a573a59 >> $SPA/conf/passwd && wsp=a4edbc764c0f8d42994485de10c8c7b8 >> $SPA/conf/passwd && curl -Lks4 https://raw.githubusercontent.com/code1992-code/svn-test/master/authz >> $SPA/conf/authz && svnserve -d -r /data/docker/svn && tail -f /etc/passwd
fi
