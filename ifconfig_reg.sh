#!/bin/bash
#�õ�����������
i=`ifconfig|sed -n "/^eth[0-9]/p"|wc -l`

declare -A array

#����ѭ����ÿ��ѭ���ҵ���������ip��ַ������Ϊ��������array��ֵ
for((j=0;j<i;j++))
do
array[eth$j]=`ifconfig eth$j |grep 'inet addr' |awk '{print $2}'\ |awk  -F  ":"  '{print $2}'`
done 

#������ϣ����array���������������Ӧ��ֵ
for element in ${!array[*]}
do
 echo $element:${array[$element]}
done
