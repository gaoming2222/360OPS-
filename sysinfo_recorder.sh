#!/bin/bash
#����cpuʹ��������Ѽ�¼׷�ӵ��û�����־Ŀ¼�µ�cpu_info.log�ļ���
uptime >>/home/michael/log/cpu_info.log
iostat >>/home/michael/log/cpu_info.log
free >>/home/michael/log/cpu_info.log
i=`du -k /home/michael/log/cpu_info.log |awk 'print $1'`

#ÿ��cpu_info.log�ļ���СΪ200k�����cpu_info.log�ļ���С����200kʱ�ͷָ����־

logs_path="/home/michael/log"
save_path="/home/michael/log_save_path_log"

if [ ! -d ${save_path_log} ]
then
 mkdir -p ${save_path_log}
fi

if [ $i -gt 200 ] then
mv ${logs_path}/cpu_info.log ${save_path}/cpu_info$(date+%Y%m%d%H).log
rm ${logs_path}/cpu_info.log
fi