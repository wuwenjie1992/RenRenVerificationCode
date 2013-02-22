#!/bin/sh
#将图片切为四片
#RenRenVerificationCode v 0.0.1

newNAME="";
num="";

#n1=16;
#n2=33;
#n3=49;


#切片函数 $1 切第几片 $2 原文件 $3 新文件
crop(){

case $1 in 
	
	0) convert -crop 16x36+0+0 $2 $3
		;;
	1) convert -crop 16x36+17+0 $2 $3
		;;
	2) convert -crop 16x36+33+0 $2 $3
		;;
	3) convert -crop 16x36+49+0 $2 $3
		;;
	*) echo "crop $1 should be 1-3"
		;;

esac

}



ls -al | awk '/.jpg/{print $9 >"l.txt"}'



while read  list #读取（read）l.txt，将read的结果命名为 list

	do

	#获得序号
	num=`echo $list|awk -F . '{ print $1 }'`; #awk为字符串赋值
			#-F 指定字段分割符



	#获得名称
	newNAME=`echo $list|awk -F . '{ print substr($2,1,1) }'`; #awk为字符串赋值
			#substr(s,p,n) 返回字符串s中从位置p开始最大长度为n的字串。
	
	#newNAME= "$num"."$newNAME"."jpg";

	echo $newNAME;
	
	crop 0 $list $num.1.$newNAME.jpg;


	newNAME=`echo $list|awk -F . '{ print substr($2,2,1) }'`;
	crop 1 $list $num.2.$newNAME.jpg;

	newNAME=`echo $list|awk -F . '{ print substr($2,3,1) }'`;
	crop 2 $list $num.3.$newNAME.jpg;

	newNAME=`echo $list|awk -F . '{ print substr($2,4,1) }'`;
	crop 3 $list $num.4.$newNAME.jpg;

	rm $list; #删除原图

done < l.txt #从l.txt输入

rm l.txt

