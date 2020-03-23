#!/bin/bash

read -p "Informe o nome do arquivo a ser criado: " FILE
read -p "Informe o conjunto de caracteres: " WORD
read -p "Informe o tamanho final em bytes: " SIZE

cat /dev/null > $FILE

PORC_EXIBIDA=0

until [ $SIZE -le $(stat --printf=%s "$FILE") ]
do
	echo -n $WORD >> $FILE
	SIZEATUAL=$(stat --printf=%s "$FILE")

	PORC_ATUAL=$(expr $SIZEATUAL \* 100 / $SIZE)

	if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]
	then
		echo "Concluido $PORC_ATUAL% - Tamanho do Arquivo: $SIZEATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
done
