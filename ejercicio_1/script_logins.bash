echo "Ingrese el nombre del usuario: "
read usuario

user_exist=$(cat /etc/passwd | grep "$usuario")

if [ -z "$usuario" ] || [ -z "$user_exist" ]
then 
	echo "EL USUARIO INGRESADO NO TIENE LOGS O NO EXISTE. 
       ******SE MUESTRAN LOS LOGS Y LOGINS DE TODOS LOS USUARIOS******"
else 
	echo "******LOGS Y LOGINS DEL USUARIO $usuario******"
fi

files=$(find /var/log/ | grep wtmp)

for file in $files 
do

	last -f $file -w | awk -v usuario="$usuario" -v user_exist="$user_exist" '{ 
		if (usuario == "" || user_exist == ""){
			print $0
		} else if (usuario == $1) {
			print $0
		}
	}'
done
