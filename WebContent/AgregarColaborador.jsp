<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/CSS.css">
<link rel="stylesheet" type="text/css" href="CSS/FormStyle.css">
<title>Agregar Colaborador</title>
</head>
<body>

	<div class="header">Agregar un nuevo colaborador</div>
	<div class="menu">
		<ul>
			<li><a href="AgregarColaborador.jsp">Agregar nuevo
					colaborador</a></li>
			<li><a href="ListarColaboradores.jsp">Ver lista de
					colaboradores</a></li>
		</ul>
	</div>
	<div class="cuerpo" id="cuerpo">
		<form name="frmAgregarColaborador" method="post"
			id="frmAgregarColaborador" action="AgregarColaboradorCo"
			onsubmit="return validarForm()" class="borde">
			<ul>
				<li><label for="txtNombre">Nombre: </label><input type='text'
					id='txtNombre' name='txtNombre' /><span id="errorNombre"
					class="errorStyle"></span></li>
				<li><label for="txtApellidos">Apellidos:</label> <input
					type='text' id='txtApellidos' name='txtApellidos' /><span
					id="errorApellidos" class="errorStyle"></span></li>
				<li><label for="txtCedula">Cédula:</label><input type='text'
					id='txtCedula' name='txtCedula' /><span id="errorCedula"
					class="errorStyle"></span></li>
				<li><label for="txtEmail">Correo electrónico: </label><input
					type='text' id='txtEmail' name='txtEmail' /><span id="errorEmail"
					class="errorStyle"></span></li>
				<li><label for="txtTelCasa">Teléfono de casa: </label><input
					type='text' id='txtTelCasa' name='txtTelCasa' /><span
					id="errorTelCasa" class="errorStyle"></span></li>
				<li><label for="txtTelCel">Teléfono de celular: </label><input
					type='text' id='txtTelCel' name='txtTelCel' /><span
					id="errorTelCel" class="errorStyle"></span></li>
				<li><label for="txtNvlIngles">Nivel de Inglés: </label><input
					type='text' id='txtNvlIngles' name='txtNvlIngles' /><span
					id="errorNvlIngles" class="errorStyle"></span></li>
				<li><label for="txtDireccion">Dirección: </label>
				<textarea id='txtDireccion' name='txtDireccion' rows="2" cols="24"></textarea><span
					id="errorDireccion" class="errorStyle"></span></li>
				<li><label for="txtObservaciones">Observaciones:</label> <textarea
						id='txtObservaciones' name='txtObservaciones' rows="4" cols="24"></textarea><span
					id="errorObservaciones" class="errorStyle"></span></li>
			</ul>
			<input name="btnAgregar" type="submit" id="btnAgregar"
				value="Agregar" class="boton">
		</form>
	</div>
	<script type="text/javascript" src="JS/validarFormColaborador.js"></script>
</body>
</html>