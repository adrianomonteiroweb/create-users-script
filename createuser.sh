#!/bin/bash

declare -a folders=("/adm" "/ven" "/sec")
declare -a groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")

declare -a users_adm=("carlos" "maria" "joao")
declare -a users_ven=("debora" "sebastiana" "roberto")
declare -a users_sec=("josefina" "amanda" "rogerio")

echo "Creating foulders..."

mkdir /publico

for i in "${folders[@]}"
do
   mkdir "$i"
done

echo "Creating groups..."

for i in "${groups[@]}"
do
   groupadd "$i"
done

echo "Creating users and adding to your groups..."

for i in "${users_adm[@]}"
do
   useradd "$i" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

for i in "${users_ven[@]}"
do
   useradd "$i" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

for i in "${users_sec[@]}"
do
   useradd "$i" -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

echo "Specifying permissions..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico

for i in "${folders[@]}"
do
   chmod 770 "$i"
done

echo "Creating folders, groups and users completed..."