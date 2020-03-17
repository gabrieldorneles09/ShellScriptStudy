#!/bin/bash

#ls /home/$1 > /dev/null 2>&1 || echo "Usuario Inexistente"
#ls /home/$1 > /dev/null 2>&1 || exit 1

ls /home/$1 > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1; }

USER=$1
UUID=$(grep $1 /etc/passwd | cut -d":" -f3)
DESCRIPTION=$(grep $1 /etc/passwd | cut -d":" -f5 | tr -d ,)
DIR="/home/$USER"
USE=$(du -sh /home/$1 | cut -f1)

echo "===================================================================="
echo -e "Relatorio do Usuario: $USER\n"

echo "UUID: $UUID"
echo -e "Nome ou Descricao: $DESCRIPTION\n"

echo -e "Total Usado no $DIR: $USE\n"

echo "Ultimo Login:"
lastlog | head -1
lastlog | grep "$USER"
echo "===================================================================="
