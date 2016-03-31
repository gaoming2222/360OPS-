#!/bin/bash
#!直接将sh文件放于/etc/cron.hourly下会一个小时执行一次日志的切割操作
#！以下是每隔20分钟，做一次文件操作，并且以时间命名log文件

20* * * * split -b 2m access.log access_$(date +%Y-%m-%d-%H-%M).log 