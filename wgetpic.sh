#!/bin/sh
#
#RenRenVerificationCode v 0.0.1

for i in $(seq 1 30)
do 
	wget -O $i.jpg http://icode.renren.com/getcode.do?t=web_login&rnd=Math.random%28%29

done

echo "done"
