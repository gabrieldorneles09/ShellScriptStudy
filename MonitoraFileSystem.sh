#!/bin/bash

EMAIL=dorns
LIMITE=15
ARQ_TEMP=/tmp/monitora-particao.tmp
LOG=/var/log/scripts/$(basename $0).log

for loop in $(df -h | grep sda | tr -s " " | tr ' ' ':')
do
	USO=$(echo $loop | cut -d":" -f5 | tr -d "%")
	if [ $USO -ge $LIMITE ]
	then
		PARTICAO=$(echo $loop | cut -d":" -f6)

		echo "Atencao! A particao $PARTICAO esta com o uso acima do limite configurado!" >> $ARQ_TEMP
		echo >> $ARQ_TEMP
		echo "Limite: $LIMITE" >> $ARQ_TEMP
		echo >> $ARQ_TEMP
		df -h $PARTICAO >> $ARQ_TEMP

		mail -s "[$0] Verificar particao $PARTICAO" $EMAIL < $ARQ_TEMP

		#Gera log
		echo "$(date "+%d/%m/%Y %H:%M") - Particao $PARTICAO - Uso $USO%" >> $LOG
		rm -f $ARQ_TEMP
	fi
done
