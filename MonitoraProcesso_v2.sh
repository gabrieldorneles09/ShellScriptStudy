#!/bin/bash

TIME=10

if [ $# -eq 0 ]
then
	echo "Favor informar um processo como argumento."
	exit 1
fi

while true
do
	if ps axu | grep $1 | grep -v grep | grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo -e "Atencao! O processo $1 nao esta em execucao\n" | mail -s "Warning" dorns
		#echo "Atencao, o processo $1 nao esta em execucao"
		sleep $TIME
	fi
done
