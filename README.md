# 360OPS-
360实习生笔试题
您好，这是我的答卷。由于本人对perl 确实是比较的陌生，所以子本次作答中设计代码的部分就用shell脚本来完成。忘谅解

基础题：1. password_cache:
	运维操作在很多情况下需要访问不同的服务器，运维人员可能会频繁的输入自己的账号和密码。是否可以通过一个简单方式只需要输入一遍密码，然后余下的操作都可以不再重复的输入密码。密码应该存储在什么地方会比较隐蔽，让有这台机器sudo权限的其他人看不到。

答：  （1） 我们可以通过ssh-keygen命令来避免重复的输入密码。输入ssh-keygen 后系统提示输入密码的保存地址，我们以ipass命名，然后会生成ipass和ipass.pub的私钥和公钥这样，我们就只在/.ssh/ipass/pub  gaoming@host:~/.ssh  的过程中输入密码了。
         （2）对于密码的存储都是加密过的，为了让其他的sudo权限人员看不到我们可以对/etc/suders 来修改sudo命令的权限。
2.ifconfig_reg:
解析ifconfig命令的标准输出，返回一个hash。key是网卡名称 value是对应的ip。

答：我们可以正则表达式获取网卡的数量，然后通过一个循环去除网卡和其对应的ip地址具体见ifconfig_reg.sh
4.log_cutting：
日志切割，有这样一个access.log每天会打出大量的日志。实现一个日志切割的功能，并说明该实现方式会有什么缺陷。

	答：我们可以通过split操作对access.log文件进行分割，我们以文件的大小作为分割的依据，下面的语句实现了以将日志分割为2M的日志文件：split -b 2m access.log new_access.log
这种单纯的分割配合定时任务cron服务使用可以起到不错的效果 。Cron本身提供了hourly，daily，weekly，将上述的脚本放在/etc/cron.hourly 目录下会使分割操作没隔一个小时执行一次，不过得改下文件的命名方式，我么可以以时间为文件名：
split -b 2m access.log access_$(date +%Y-%m-%d-%H-%M).log。
也可以自己定时：
20* * * * split -b 2m access.log access_$(date +%Y-%m-%d-%H-%M).log 即20分钟执行一个分割操作。
优点：结合以文件大小为条件的切割和定时操作，实现了将某段时间的日志取出并分割成很多个较小的日志文件，当我们需要对日志进行查找是，可以更容易的查找。
缺点：随着时间的增加，会生成很多的这种日志文件，在造成硬盘脆片的同时，可能会趋于每个目录下节点数量的限制，所以还得周期性的对文件进行删除或者整理


应用题：6.sysinfo_recorder :
写一个本地服务，定时的搜集系统的cpu使用情况并记录下来。
需要考虑到cup的使用情况包括哪项信息，用什么方式存储数据（记录文件的大小不能一直增长，记录的数据易于展示）
答：差找cpu的使用情况，把记录写到用户日志目录下的cpu_info.log文件中，然后用定时的log_cutting操作将这些日志文件进行分割。具体的实现见sysinfo_recorder.sh文件实现



