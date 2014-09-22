<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="CSS/CSS.css">
	<link rel="stylesheet" type="text/css" href="CSS/FormStyle.css">
	<title>AgregarColaborador</title>
</head>
<body>

	<div class="header">Agregar un nuevo colaborador</div>
	<div class="menu">
		<a href="AgregarColaborador.jsp">Agregar nuevo colaborador</a><br/>
		<a href="ListarColaboradores.jsp">Ver lista de colaboradores</a>
	</div>
	<div class="cuerpo" id="cuerpo">
		<form name="frmAgregarColaborador" method="post" id="frmAgregarColaborador" action="AgregarColaboradorCo" onsubmit="return validarForm()">
			<ul>
				<li>Nombre: <input type='text' id='txtNombre' name='txtNombre'/><span id="errorNombre" class="errorStyle"></span></li>
				<li>Apellidos: <input type='text' id='txtApellidos' name='txtApellidos'/><span id="errorApellidos" class="errorStyle"></span></li>
				<li>Cédula:<input type='text'id='txtCedula' name='txtCedula'/><span id="errorCedula" class="errorStyle"></span></li>
				<li>Correo electrónico: <input type='text' id='txtEmail' name='txtEmail'/><span id="errorEmail" class="errorStyle"></span></li>
				<li>Teléfono de casa: <input type='text' id='txtTelCasa' name='txtTelCasa'/><span id="errorTelCasa" class="errorStyle"></span></li>
				<li>Teléfono de celular: <input type='text' id='txtTelCel' name='txtTelCel'/><span id="errorTelCel" class="errorStyle"></span></li>
				<li>Nivel de Inglés: <input type='text' id='txtNvlIngles' name='txtNvlIngles'/><span id="errorNvlIngles" class="errorStyle"></span></li>
				<li>Dirección: <input type='text' id='txtDireccion' name='txtDireccion'/><span id="errorDireccion" class="errorStyle"></span></li>
				<li>Observaciones: <input type='text' id='txtObservaciones' name='txtObservaciones'/><span id="errorObservaciones" class="errorStyle"></span></li>
			</ul>
		<input name="btnAgregar" type="submit" id="btnAgregar" value="Agregar">
		</form>
	</div>
	<script type="text/javascript" src="JS/validarFormColaborador.js"></script>
</body>
</html>