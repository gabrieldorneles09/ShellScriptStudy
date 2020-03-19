#!/bin/bash

read -p "Informe o valor 1: " VALOR1
read -p "Informe o valor 2: " VALOR2

if [ ! $VALOR1 -o ! $VALOR2 ]
then
	echo "Nenhum dos dois valores pode ser nulo.."
	exit 1
fi

echo
echo "Escolha uma opcao"
echo "1 = Soma"
echo "2 = Subtracao"
echo "3 = Multiplicacao"
echo "4 = Divisao"
echo "Q = Sair"
echo

read -p "Opcao: " OPCAO

case $OPCAO in
	1)
		OPER="+"
		;;
	2)
		OPER="-"
		;;
	3)
		OPER="*"
		;;
	4)
		if [ $VALOR1 -eq 0 -o $VALOR2 -eq 0 ]
		then
			echo "O valor 0 nao pode ser utilizado na divisao"
			exit 1
		fi

		OPER="/"
		;;
	[Qq])
		echo "Saindo..."
		exit
		;;
	*)
		echo "Opcao invalida"
		exit 1
		;;

esac

echo
echo "$VALOR1 $OPER $VALOR2 = $(expr $VALOR1 "$OPER" $VALOR2)"
