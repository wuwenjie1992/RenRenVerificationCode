
##1.Download picture from [renren](http://icode.renren.com/getcode.do?t=web_login&rnd=Math.random%28%29)
``` shell
    chmod +x wgetpic.sh
    ./wgetpic.sh
    # 
```

##2.Install imagemagick
``` shell
    sudo apt-get install imagemagick
```

##3.Use convert To clip picture
``` shell
    chmod +x convert_cilp.sh
    ./convert_cilp.sh
```

##4.Change workplace
``` shell
    cd newpic
```

##5.Change pictures' name
* change name like this `1.FH73.jpg`

##6.Clip picture to 4 parts
``` shell
    chmod +x convert_clip_to4.sh
    ./convert_clip_to4.sh
```

##7.Get alphabet.txt && number.txt
* need [`java`](http://openjdk.java.net/) 
* `pixelsum.jar` shoud exit in current dir
``` shell
    chmod +x pixelfile.sh
    ./pixelfile.sh
```

##8.Get AlphabetMap.txt
``` shell
    chmod +x ascii.sh
    ./ascii.sh
```
##9.Compile PIC_BP.c
* Change define
``` c
#define    OUT_FILE	"/home/wuwenjie/hello/EX/AlphabetMap.txt"	//CHANGE
#define	IN_FILE	"/home/wuwenjie/hello/EX/number.txt"	//CHANGE
```
``` shell
    gcc PIC_BP.c -o PIC_BP -lm
```

##10.Exec PIC_BP
``` shell
    ./PIC_BP
```

