#!/bin/bash

ZRED="\e[1;31m"
ZBLUE="\e[36m"
ZGREEN="\e[1;32m"
ZEND="\e[0m"
ZYELLOW="\e[1;33m"

REALIP=$(wget -qO - icanhazip.com)
PRIVATEIP=$(hostname -I)
FREESPACE=$(df -h | grep 'dev' | grep -v "tmp\|udev" | awk '{print$1"\t"$4"\t"$6}')
ZLOAD1=$(uptime | awk -F'average: ' {'print$2'} | cut -d ' ' -f 1 | sed 's/\,/\./g')
ZLOAD2=${ZLOAD1::-1}
ZCORES=$(cat /proc/cpuinfo | grep processor | wc -l)
ZUPTIME=$(w | head -n1 | awk -F',' {'print$1'} | sed 's/^[ \t]*//')
ZMEM=$(free -m |grep Mem | awk '{print ($2 - $3)}')

echo -e "$ZGREENВъншно IP:$ZEND\t$REALIP"
echo -e "$ZYELLOW===============$ZEND"
echo -e "$ZBLUEВътрешно IP:$ZEND\t$PRIVATEIP"
echo -e "$ZYELLOW===============$ZEND"
echo -e "$ZREDСвободно място:$ZEND\n$FREESPACE"
echo -e "$ZYELLOW===============$ZEND"
echo -e "$ZGREENТекущо нат.:$ZEND\t$ZLOAD2 от $ZCORES"
echo -e "$ZYELLOW===============$ZEND"
echo -e "$ZBLUEСвободна памет:$ZEND\t$ZMEM MB"
echo -e "$ZYELLOW===============$ZEND"
echo -e "$ZREDОнлайн от:$ZEND\t$ZUPTIME"

