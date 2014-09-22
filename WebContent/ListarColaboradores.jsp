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
                <a href="AgregarColaborador.jsp">Agregar nuevo colaborador</a><br />
                 <a href="ListarColaboradores.jsp">Ver lista de colaboradores</a>
        </div>
        <div class="cuerpo">

                <table border="1" cellpadding="5" cellspacing="5">
                        <tr>
                                <th>Cedula</th>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                        </tr>
                        <c:forEach var="colaborador" items="${tblColaboradores}">
                                <tr>
                                		
                                        <td> <a href="ModificarColaboradorCo?btnCedulaColaborador=${colaborador.cedula}"> ${colaborador.cedula}</a>
                                        </td>
                                        <td>${colaborador.nombre}</td>
                                        <td>${colaborador.apellidos}</td>
                                        <td>${colaborador.correo}</td>
                                        <td>${colaborador.telefonoCelular}</td>
                                </tr>
                        </c:forEach>
                        
                </table>


                <%--For displaying Previous link except for the 1st page --%>
                <c:if test="${currentPage != 1}">
                        <td><a href="ListarColaboradores.jsp?page=${currentPage - 1}">Previous</a></td>
                </c:if>

                <%--For displaying Page numbers. The when condition does not display a link for the current page--%>
                <table border="1" cellpadding="5" cellspacing="5">
                        <tr>
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
                        </tr>
                </table>

                <%--For displaying Next link --%>
                <c:if test="${currentPage lt noOfPages}">
                        <td><a href="ListarColaboradores.jsp?page=${currentPage + 1}">Next</a></td>
                </c:if>
        </div>
</body>
</html>