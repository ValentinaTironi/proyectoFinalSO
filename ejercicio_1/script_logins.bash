echo "Ingrese el nombre del usuario: "
read usuario

last -w -F | awk -v usuario=$usuario '{ 
	if (usuario == $1) {
			print "El usuario " usuario " ingresó el " $5 " " $4 " " $7 " a las " $6 " y salió el " $11 " " $10 " a las " $12
	} else if (usuario == ""){
			print "El usuario " $1 " ingresó el " $5 " " $4 " " $7 " a las " $6 " y salió el " $11 " " $10 " a las " $12
	}
}'

