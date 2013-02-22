#!/bin/sh
# 将下载的原图，处理切小
#RenRenVerificationCode v 0.0.1

ls -al | awk '/.jpg/{print $9 >"l.txt"}' 
		#将LS出来的结果，管道到，用AWK找到第九列中为.jpg文件，输出到L.txt

mkdir newpic

while read  list #读取（read）l.txt，将read的结果命名为 list

	do
	
		#x21	93 X' 93-21=72；y 7 y'=45-7=38

		convert -despeckle -monochrome -white-threshold 150 -crop 72x36+21+7 $list $list.2c.jpg

		mv $list.2c.jpg ./newpic/$list.2c.jpg

done < l.txt #从l.txt输入


rm l.txt;
