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
<li>Nombre: <input type='text' name= "txtNombre" id='txtNombre'/><span id="errorNombre" class="errorStyle"></span></li>
<li>Apellidos: <input type='text' name= "txtApellidos" id='txtApellidos'/><span id="errorApellidos" class="errorStyle"></span></li>
<li>Cédula:<input type='text' name= "txtCedula" id='txtCedula'/><span id="errorCedula" class="errorStyle"></span></li>
<li>Correo electrónico: <input type='text' name= "txtEmail" id='txtEmail'/><span id="errorEmail" class="errorStyle"></span></li>
<li>Teléfono de casa: <input type='text' name= "txtTelCasa" id='txtTelCasa'/><span id="errorTelCasa" class="errorStyle"></span></li>
<li>Teléfono de celular: <input type='text' name= "txtTelCel" id='txtTelCel'/><span id="errorTelCel" class="errorStyle"></span></li>
<li>Nivel de Inglés: <input type='text' name= "txtNvlIngles" id='txtNvlIngles'/><span id="errorNvlIngles" class="errorStyle"></span></li>
<li>Dirección: <input type='text' name= "txtDireccion" id='txtDireccion'/><span id="errorDireccion" class="errorStyle"></span></li>
<li>Observaciones: <input type='text' name= "txtObservaciones" id='txtObservaciones'/><span id="errorObservaciones" class="errorStyle"></span></li>
</ul>
<input name="btnAgregar" type="submit" id="btnAgregar" value="Agregar" >
</form>
</div>
</body>
</html>