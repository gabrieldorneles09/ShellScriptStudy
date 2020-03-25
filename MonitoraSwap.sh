#!/bin/bash

EMAIL=dorns
LIMITE_LOG=50
LIMITE_EMAIL=80
ARQ_TEMP=/tmp/monitora-swap.log

USO=$(free -m | grep Swap | tr -s " " | cut -d" " -f3)
TOTAL=$(free -m | grep Swap | tr -s " " | cut -d" " -f2)
#PERC=$(expr $USO / $TOTAL \* 100)
PERC=90

if [ $PERC -ge $LIMITE_LOG ]
then
	logger -p local7.warn -t [MonitoraSwap] "Uso de swap = $PERC%"
	if [ $PERC -ge $LIMITE_EMAIL ]
	then
		echo -e "Atencao, o uso de swap esta acima do limite\n" >> $ARQ_TEMP
		echo -e "Limite = $LIMITE_EMAIL%\n" >> $ARQ_TEMP
		echo -e "Valor atual = $PERC%\n" >> $ARQ_TEMP
		free -m >> $ARQ_TEMP
		mail -s "[basename $0] Uso de swap acima de $LIMITE_EMAIL%" $EMAIL < $ARQ_TEMP
	fi
fi

rm -f $ARQ_TEMP
