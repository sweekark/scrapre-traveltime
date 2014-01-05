#!/bin/bash
count=1;
while :; 
do
	echo "RUNNING @ $count,$dt FOR Electronic City, Bangalore" "BTM Layout, Bangalore " >> /home/dev/gtravel/op.txt
	wget "http://54.251.169.128/cgi-bin/gtravel.pl?from=%22Kormangala,Bangalore,%20Karnataka,%20India%22&to=%22IndiraNagar,%20Bangalore,%20Karnataka,%20India%22" -o /home/dev/gtravel/op.txt -O /home/dev/gtravel/opdoc.txt;
	sleep 1200;
	echo "RUNNING @ $count, $dt FOR Silkboard, Bangalore" "Malleshwaram, Bangalore " >>/home/dev/gtravel/op.txt
#	/usr/bin/perl gtravel.pl "Silkboard, Bangalore" "Malleshwaram, Bangalore" >> /home/dev/gtravel/op.txt
#	sleep 1200;
	echo "RUNNING @ $count, $dt FOR Silkboard, Bangalore" "Majestic, Bangalore " >> /home/dev/gtravel/op.txt
#	/usr/bin/perl gtravel.pl "Silkboard, Bangalore" "Majestic, Bangalore" >> /home/dev/gtravel/op.txt
#	sleep 600;
	count=`expr $count + 1 `;
done
