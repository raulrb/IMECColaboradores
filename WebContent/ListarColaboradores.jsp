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
	<div class="header">Lista de Colaboradores</div>
	<div class="menu">
	<ul>
		<li><a href="AgregarColaborador.jsp">Agregar nuevo colaborador</a></li>
		<li><a href="ListarColaboradores.jsp">Ver lista de colaboradores</a></li>
		</ul>
	</div>
	<div class="cuerpo">
		<form name="frmEliminarColaborador" method="post"
			id="frmEliminarColaborador" action="ListarColaboradoresCo"
			onsubmit="return validarDelete()">
			<table>
				<tr>
					<th>Cedula</th>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>Email</th>
					<th>Telefono celular</th>
					<th>Eliminar</th>
				</tr>
				<c:forEach var="colaborador" items="${tblColaboradores}">
					<tr>
						<td><a
							href="ModificarColaboradorCo?btnCedulaColaborador=${colaborador.cedula}">
								${colaborador.cedula}</a></td>
						<td>${colaborador.nombre}</td>
						<td>${colaborador.apellidos}</td>
						<td>${colaborador.correo}</td>
						<td>${colaborador.telefonoCelular}</td>
						<td><input type="checkbox" name="idCbx" id="idCbx"
							value="${colaborador.cedula}"></td>
					</tr>
				</c:forEach>
			</table>
			<table class="borde paginacion">
				<tr>

					<%--For displaying Previous link except for the 1st page --%>
					<c:if test="${currentPage != 1}">
						<td class="anterior"><a
							href="ListarColaboradores.jsp?page=${currentPage - 1}">Anterior</a></td>
					</c:if>


					<%--For displaying Page numbers. The when condition does not display a link for the current page--%>
					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<td>${i}</td>
							</c:when>
							<c:otherwise>
								<td><a href="ListarColaboradores.jsp?page=${i}">${i}</a></td>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%--For displaying Next link --%>
					<c:if test="${currentPage lt noOfPages}">
						<td class="siguiente"><a
							href="ListarColaboradores.jsp?page=${currentPage + 1}">Siguiente</a></td>
					</c:if>

				</tr>
			</table>
			<input name="btnEliminar" type="submit" id="btnEliminar"
				value="Eliminar Seleccionados" class="boton">
		</form>
	</div>
	<script type="text/javascript" src="JS/validarListDelete.js"></script>
</body>
</html>