source ./script_register_queries.bash

echo "Ingrese el nombre del usuario: "
read usuario

user_exist=$(cat /etc/passwd | grep "$usuario")

	if [ -z "$usuario" ] || [ -z "$user_exist" ]
then 
	echo "EL USUARIO "$usuario" NO EXISTE. 
       ******SE MUESTRAN LOS LOGIN Y LOGOUT DE TODOS LOS USUARIOS******"
else 
	echo "******FECHA Y HORA DE LOGIN Y LOGOUT DEL USUARIO $usuario******"
fi

files=$(find /var/log/ | grep wtmp)
touch logs_client
for file in $files 
do

	last -f $file -w | awk -v usuario="$usuario" -v user_exist="$user_exist" '{ 
		if (usuario == "" || user_exist == ""){
			print $0
		} else if (usuario == $1) {
			print $0
		}
	}' >> logs_client
done
	if [ -s logs_client ]
	then
		cat logs_client
	else
		echo "*****No se encuentran registros para el usuario $usuario*****"

	fi
	rm logs_client

registerQuery "script_logins"
