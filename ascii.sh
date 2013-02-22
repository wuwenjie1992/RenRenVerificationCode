#!/bin/sh
#
#TODO 字符转换01编码
#RenRenVerificationCode v 0.0.1

CHAR=0;	#ascii字符序号
NUM="";	#01编码
PWD="`pwd`";
TMP=0;

AddZero(){
	for i in $(seq 1 $1)
	do
		echo -n "0" >> $2	
	done

}

AddOne(){
	echo -n "1" >> $1
}



#如果当前目录存在 AlphabetMap.txt 删除
if [ -e ${PWD}/AlphabetMap.txt ]
	then rm ${PWD}/AlphabetMap.txt
	else :

fi

while read  list #读取（read）l.txt，将read的结果命名为 list

	do

	#echo -n "$list";
	CHAR="`printf "%d\n" "'$list"`";


	if [ $CHAR -lt 58 ] #  < 9 57
		then
			if [ $CHAR -eq 48 ] 	#0
				then 
					AddZero 36 ${PWD}/AlphabetMap.txt;
			else    
				                          
				AddZero $(($CHAR-48)) ${PWD}/AlphabetMap.txt ;
				AddOne ${PWD}/AlphabetMap.txt;
				AddZero $((83-$CHAR)) ${PWD}/AlphabetMap.txt; 
					#10-1-($CHAR-48)+26
			fi
		else 
			AddZero 10 ${PWD}/AlphabetMap.txt;

			if [ $CHAR -eq 65 ] 	#a
				then 
						AddOne ${PWD}/AlphabetMap.txt;
						AddZero 25 ${PWD}/AlphabetMap.txt;
			else    
				                          
				AddZero $(($CHAR-65)) ${PWD}/AlphabetMap.txt ;
				AddOne ${PWD}/AlphabetMap.txt;
				AddZero $((90-$CHAR)) ${PWD}/AlphabetMap.txt; 
					#26-1-（$CHAR-65)
			fi
	fi



	echo "" >>${PWD}/AlphabetMap.txt; # 换行

done < alphabet.txt #从alphabet.txt输入
