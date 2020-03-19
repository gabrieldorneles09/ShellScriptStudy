#!/bin/bash

#############################################################
#                                                           #
# Nome: GeraBackupHome.sh                                   #
#                                                           #
# Autor: Gabriel Dorneles (gabrieldorneles09@gmail.com)     #
# Data: 17/03/2020 					    #
#                                                           #
# Descricao: O script faz backup do diretorio /home/<user>  #
#                                                           #
# Uso: ./GeraBackupHome.sh 				    #
#                                                           #
#############################################################

#USERDIR=$(cat /etc/passwd | cut -d":" -f6 | tail -n1)
DATETIME=$(date +%Y%m%d%H%M)
#BACKUPARQ=$(ls -ltr $HOME/Backup | tail -n1 | cut -d":" -f2 | cut -d" " -f2)
DIRDEST=$HOME/Backup

if [ ! -d $DIRDEST ]
then
	echo "Criando diretorio.."
	mkdir -P $DIRDEST
fi

DAYS7=$(find $DIRDEST -ctime -7 -name backup_home\*tgz)

if [ "$DAYS7" ]
then
	echo "Arquivo ja criado nos ultimos 7 dias, deseja continuar? (N/s):"
	read -n1 CONT
	echo
	if [ "$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
	then
		echo "Backup abortado!"
		exit 1
	elif [ "$CONT" = S -o "$CONT" = s ]
	then
		echo "Um novo backup sera criado.."
	else
		echo "Opcao invalida. Saindo..."
		exit 2
	fi
fi

echo "Criando Backup.."

ARQ="backup_home_$(date +%Y%m%d%H%M).tgz"

tar zcpf $DIRDEST/$ARQ --absolute-names --exclude="$DIRDEST" "$HOME"/* > /dev/null

echo
echo "O backup de \""$ARQ"\" foi criado com sucesso em $DIRDEST"
echo
echo "Backup concluido!"
