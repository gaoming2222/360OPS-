#!/bin/bash
#!ֱ�ӽ�sh�ļ�����/etc/cron.hourly�»�һ��Сʱִ��һ����־���и����
#��������ÿ��20���ӣ���һ���ļ�������������ʱ������log�ļ�

20* * * * split -b 2m access.log access_$(date +%Y-%m-%d-%H-%M).log 