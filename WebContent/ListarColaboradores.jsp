
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/CSS.css">
<title>Lista de colaboradores</title>
</head>
<body>
<jsp:include page="/ListarColaboradoresCo" flush="true"></jsp:include>
<div class="header">Agregar un nuevo colaborador</div>
<div class="menu">
	<a href="AgregarColaborador.jsp">Agregar nuevo colaborador</a><br/>
	<a href="ListarColaboradores.jsp">Ver lista de colaboradores</a>
</div>
<div class="cuerpo">
<table>
<tr>
<th>Cedula</th>
<th>Nombre</th>
<th>Apellidos</th>
<th>Correo</th>
<th>Telefono Celular</th>
</tr>
<c:forEach var="colaborador" items = "${colaboradores}">
<tr>
<td>${colaborador.cedula}</td>
<td>${colaborador.nombre}</td>
<td>${colaborador.apellidos}</td>
<td>${colaborador.correo}</td>
<td>${colaborador.telefonoCelular}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>