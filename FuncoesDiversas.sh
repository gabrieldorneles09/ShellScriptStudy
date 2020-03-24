#!/bin/bash

DATA=$(echo $2 | tr -d "/")
VAL1=$(echo $DATA | cut -c-2)
VAL2=$(echo $DATA | cut -c3-4)
ANO=$(echo $DATA | cut -c5-8)

RetornaFormato(){
	if [ $VAL1 -le 12 -a $VAL1 -eq $VAL2 ]
	then
		return 0
	elif [ $VAL1 -gt 12 -a $VAL2 -le 12 ]
	then
		return 0
	elif [ $VAL1 -le 12 -a $VAL2 -gt 12 ]
	then
		return 1
	elif [ $VAL1 -le 12 -a $VAL2 -le 12 ]
	then
		return 2
	else
		return 3
	fi
}

InverteDiaMes() {
	RetornaFormato $1
	local FORMATO=$?

	if [ $FORMATO -ne 3 ]
	then
		echo "$VAL2/$VAL1/$ANO"
	else
		echo "Formato de data invalido"
	fi
}

IncluiBarra(){
        RetornaFormato $1
        local FORMATO=$?

        if [ $FORMATO -ne 3 ]
        then
                echo "$VAL1/$VAL2/$ANO"
        else
                echo "Formato de data invalido"
        fi
}

DataExtenso(){
	RetornaFormato $1
	local FORMATO=$?
	case $FORMATO in
		0)
			local DIA=$VAL1
			local MES=$VAL2
			;;
		1)
			local DIA=$VAL2
			local MES=$VAL1
			;;
		2)
			local FORMATO_2=0
			until [ $FORMATO_2 = 1 -o $FORMATO_2 = 2 ]
			do
				echo
				echo "Impossivel determinar o padrao de data"
				echo "1 - Formato BR (DD/MM/AAAA)"
				echo "2 - Formato US (MM/DD/AAAA)"
				read -p "Informe o formato desejado: " FORMATO_2
				case $FORMATO_2 in
					1)
						local DIA=$VAL1
						local MES=$VAL2
						;;
					2)
						local DIA=$VAL2
						local MES=$VAL1
						;;
					*)
						echo "Opcao Invalida"
						;;
				esac
			done
			echo
			;;
		3)
			echo "Formato de data invalido"
			exit 3
			;;
	esac
	
	case $MES in
		1)
			MESEXT=Janeiro
			;;
		2)
			MESEXT=Fevereiro
			;;
		3)
			MESEXT=Marco
			;;
		4)
			MESEXT=Abril
			;;
		5)
			MESEXT=Maio
			;;
		6)
			MESEXT=Junho
			;;
		7)
			MESEXT=Julho
			;;
		8)
			MESEXT=Agosto
			;;
		9)
			MESEXT=Setembro
			;;
		10)
			MESEXT=Outubro
			;;
		11)
			MESEXT=Novembro
			;;
		12)
			MESEXT=Dezembro
			;;
	esac

	echo "$DIA de $MESEXT de $ANO"
}


case $1 in
	"-f")
		RetornaFormato $2
		echo $?
		;;
	"-i")
		InverteDiaMes $2
		;;
	"-b")
		IncluiBarra $2
		;;
	"-e")
		DataExtenso $2
		;;
	"--help")
		echo "USO $0 OPCAO DATA"
		echo
		echo "-f = lorem ipsum"
		echo "-i = Inverte dia e mes"
		echo "-b = Inclui barra na data"
		echo "-e = Mostra a data por extenso"
		;;
	*)
		echo "Uso indevido, utilize $0 --help"
		;;

esac	
