#!/bin/bash

#############################################################
#                                                           #
# Nome: SomaValores.sh                                      #
#                                                           #
# Autor: Gabriel Dorneles (gabrieldorneles09@gmail.com)     #
# Data: 16/03/2020 					    #
#                                                           #
# Descricao: O script faz a soma de dois valores inseridos  #
#	     pelo usuario				    #
#                                                           #
# Uso: ./SomaValores.sh 				    #
#                                                           #
#############################################################

read -p "Informe o Valor 1: " VAL1
read -p "Informe o Valor 2: " VAL2

echo
echo "A soma de $VAL1 + $VAL2 e $(expr $VAL1 + $VAL2)"
