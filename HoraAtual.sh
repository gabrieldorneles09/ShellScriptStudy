#!/bin/bash

#############################################################
#                                                           #
# Nome: HoraAtual.sh                                        #
#                                                           #
# Autor: Gabriel Dorneles (gabrieldorneles09@gmail.com)     #
# Data: 17/03/2020                                          #
#                                                           #
# Descricao: O script exibe a hora atual.		    #
#                                               	    #
#                                                           #
# Uso: ./HoraAtual.sh                                       #
#                                                           #
#############################################################

CURRENTTIME=$(date +%I:%M)
HOUR=$(date +%H)
AMPM=""
GREETING=""

if [ $HOUR -ge 0 -a $HOUR -le 11 ]
then
	AMPM="AM"
	if [ $HOUR -ge 6 ]
	then
		GREETING="Bom dia!"
	else
		GREETING="Boa noite!"
	fi
else
	AMPM="PM"
	if [ $HOUR -ge 18 ]
	then
		GREETING="Boa noite!"
	else
		GREETING="Boa tarde!"
	fi
fi

echo $GREETING
echo
echo "A hora atual e: $CURRENTTIME $AMPM"

