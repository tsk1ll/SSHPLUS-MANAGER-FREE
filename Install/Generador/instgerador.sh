#!/bin/bash
barra="\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} > /dev/null 2>&1
${comando[1]} > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}

fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

fun_attlist () {
    apt-get update -y
    apt-get upgrade -y
}

clear
echo -e "$barra"
echo -e "      \033[1;33mINSTALADOR KEY SSHPLUS MANAGER !\033[0m"
echo -e "$barra"
echo ""
read -n1 -r -p " Enter to Continue..."
echo
echo -e "\033[1;33mATUALIZANDO REPOSITÓRIOS..... \033[1;32mAGUARDE"
apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install curl -y > /dev/null 2>&1
apt-get install zip -y > /dev/null 2>&1
echo -e "\033[1;33mINSTALANDO RECURSOS.......... \033[1;32mAGUARDE"
apt-get install unzip -y > /dev/null 2>&1
apt-get install apache2 -y > /dev/null 2>&1
echo -e "\033[1;33mCONFIGURANDO APACHE.......... \033[1;32mAGUARDE"
sed -i "s;Listen 81;Listen 80;g" /etc/apache2/ports.conf
service apache2 restart > /dev/null 2>&1
cp /var/www/html/index.html /var/www/index.html
echo -e "\033[1;33mPREPARANDO SISTEMA........... \033[1;32mAGUARDE"
    rm -rf /home/list > /dev/null 2>&1
    rm -rf /home/versao > /dev/null 2>&1
    rm -rf /bin/keyssh > /dev/null 2>&1
    rm -rf /bin/otimizar > /dev/null 2>&1
    rm -rf /var/www/html/Plus > /dev/null 2>&1
    rm -rf /var/www/html/script > /dev/null 2>&1
    rm -rf /var/www/html/_S_script > /dev/null 2>&1
    mkdir /var/www/html/script > /dev/null 2>&1
    mkdir /var/www/html/_S_script > /dev/null 2>&1
    touch /var/www/html/script/index.html > /dev/null 2>&1
    touch /var/www/html/_S_script/index.html > /dev/null 2>&1
echo -e "\033[1;33mDONWLOAD SERVER.............. \033[1;32mAGUARDE"
cd
cd /var/www/html/_S_script
wget https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/raw/master/Install/Generador/sshplus-v37.zip > /dev/null 2>&1
unzip sshplus-v37.zip > /dev/null 2>&1
rm -rf sshplus-v37.zip
cd
echo -e "\033[1;33mINSTALANDO SISTEMA........... \033[1;32mAGUARDE"
wget -O /var/www/html/Plus https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Install/Generador/Plus > /dev/null 2>&1
wget -O /home/list https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Install/Generador/list > /dev/null 2>&1
wget -O /home/versao https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Install/Generador/versao > /dev/null 2>&1
wget -O /bin/keyssh https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Install/Generador/keyssh > /dev/null 2>&1
wget -O /bin/otimizar https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/master/Install/Generador/otimizar > /dev/null 2>&1
echo -e "\033[1;33mPERMISOS ARQUIVOS............ \033[1;32mAGUARDE"
    chmod +x  /var/www/html/Plus > /dev/null 2>&1
    chmod +x  /home/list > /dev/null 2>&1
    chmod +x  /home/versao > /dev/null 2>&1
    chmod +x  /bin/keyssh > /dev/null 2>&1
    chmod +x  /bin/otimizar > /dev/null 2>&1
    cat /home/versao >/var/www/html/script/versao
echo -e "\033[1;33mMONTANDO O SEU LINK-IP....... \033[1;32mAGUARDE"
fun_ip
sed -i "s;SEU-IP-AKI;$IP;g" /var/www/html/Plus > /dev/null 2>&1
fun_ip
sed -i "s;SEU-IP-AKI;$IP;g" /home/list > /dev/null 2>&1
sleep 3s
echo -e "\033[1;33mFINALIZANDO CONFIGURACION.... \033[1;32mAGUARDE"
service ssh restart >/dev/null 2>&1
service apache2 restart >/dev/null 2>&1
echo -e "$barra"
echo -e " \033[1;36m> \033[1;37mPerfeito, Use o Comando \033[1;31mkeyssh "
echo -e " \033[1;36m> \033[1;37mpara Gerenciar as Suas Keys e "
echo -e " \033[1;36m> \033[1;37mAtualizar a Base do servidor "
echo -e "$barra"
rm $HOME/instgerador.sh && cat /dev/null > ~/.bash_history && history -c
