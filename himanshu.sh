#!/bin/bash
printmenu(){

  	echo ' 1.	Change Password';

	echo ' 2.	See the disk space';

	echo ' 3.	Login to other box using ssh';

	echo ' 4.	Show all Service running';

	echo ' 5.	Show all ports opened';

	echo " 6.	Show all java apps running";

	echo " 7.	Facility to kill a  app";

	echo " 8.	Exit";

	echo " 0.	Print this menu";
}
test ()
{
	opt=options;
case "$num" in 
		 '0')
			printmenu;
			#break;
			;;

		 '1')
			echo "Please enter username which password you want to change";
			read usrname;
			passwd $usrname;
			#break;
			;;
		 '2')
			echo " Disk Status"
			df -h
			#break;
			;;
		 '3')
			echo " Login into another box";
			echo "Please write username and box name in which you want to login";
			echo " e.g. root@ipaddress";
			read usrname
			ssh $usrname;
			#break;
			;;
		'4')	
			echo "Status of Services running in server";
			ps -aux;
			#break;
			;;
		'5')
			echo "Open ports";
			netstat -tulpn
			#break;
			;;
		'6')
			echo " Status of Java apps";
			ps -elf | grep -i java
			#break;
			;;
		'7')
			echo " kill a process";
			echo " Provide process number which you want to kill";
			read processnum;
			kill -9 $processnum;
			if [ $? -eq 0	];  then 
				echo " process $processnum killed successfully";
			fi
			#break;
			;;
		'8')
			echo " Thanks for using this program";
			exit;	
			#break;
			;;
		'default')
			echo " Press 0 to see menu options";

	esac
	}
echo " With the help of this program we can perform following action";
printmenu;
echo " Please enter your choice, Press 0 to see available option";
read num;
while [ $num -ne 8 ]
	do
	test $num;
	echo " Please enter your choice, Press 0 to see available option";
	read num;
done
