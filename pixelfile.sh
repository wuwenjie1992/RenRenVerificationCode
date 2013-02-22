#!/bin/sh
#将图片用jar处理
#得到【像素特征】文件
#得到对应【字符】文件

#NOTICE jar文件应在当前路径下
#RenRenVerificationCode v 0.0.1



PWD="`pwd`";
alphabet="";

ls -al | awk '/.jpg/{print $9 >"l.txt"}';

#如果当前目录存在 number.txt 删除
if [ -e ${PWD}/number.txt ]
	then rm ${PWD}/number.txt
	else :

fi

#如果当前目录存在 alphabet.txt 删除
if [ -e ${PWD}/alphabet.txt ]
	then rm ${PWD}/alphabet.txt
	else :

fi

while read  list #读取（read）l.txt，将read的结果命名为 list

	do

	java -jar pixelsum.jar $PWD/$list $PWD/number.txt;
	
	#获得字母
	alphabet=`echo $list|awk -F . '{ print substr($3,1,1) }'`; #awk为字符串赋值
			#substr(s,p,n) 返回字符串s中从位置p开始最大长度为n的字串。

	echo	"$alphabet">>alphabet.txt

done < l.txt #从l.txt输入

rm l.txt;
