<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/CSS.css">
<title>AgregarColaborador</title>
</head>
<body>

<div class="header">Agregar un nuevo colaborador</div>
<div class="menu">
<a href="AgregarColaborador.jsp">Agregar nuevo colaborador</a><br/>
<a href="ListarColaboradores.jsp">Ver lista de colaboradores</a>
</div>
<div class="cuerpo" id="cuerpo">
<form name="opcionMenu" method="post" id="opcionMenu" action="AgregarColaboradorCo" onsubmit="return validar(this)">
<ul>
<li>Nombre: <input type="text" name="nombre"/></li>
<li>Apellidos: <input type="text" name="apellidos"/></li>
<li>Cédula: <input type="text" name="cedula"/></li>
<li>Correo: <input type="text" name="correo"/></li>
<li>Teléfono de casa: <input type="text" name="telCasa"/></li>
<li>Teléfono de celular: <input type="text" name="telCelular"/></li>
<li>Nivel de Inglés: <input type="text" name="nivelIngles"/></li>
<li>Dirección: <input type="text" name="direccion"/></li>
<li>Observaciones: <input type="text" name="observaciones"/></li> 
</ul>
<input name="btnAgregar" type="submit" id="btnAgregar" value="Agregar" >
</form>
</div>
</body>
</html>