#!/bin/bash

DATAHORA=$(date)
PCNAME=$(hostname)
ACTIVESINCE=$(uptime -s)
KERNELVERSION=$(uname -r)
QTDCPUS=$(cat /proc/cpuinfo | grep "model name" | wc -l)
CPUMODEL=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c 14-)
RAM=$(expr $(cat /proc/meminfo | grep "MemTotal" | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024)
PARTITIONS=$(df -h | egrep -v '(tmpfs|udev)')

echo "========================================="
echo "Relatorio da Maquina $PCNAME"
echo "Data/Hora $DATAHORA"
echo -e "=========================================\n"

echo -e "Maquina ativa desde: $ACTIVESINCE\n"

echo -e "Versao do Kernel: $KERNELVERSION\n"

echo "CPUs:"
echo "Quantidade de CPUs/Core: $QTDCPUS"
echo -e "Modelo da CPU: $CPUMODEL\n"

echo -e "Memoria Total: $RAM MB\n"

echo "Particoes:"
echo "$PARTITIONS"
