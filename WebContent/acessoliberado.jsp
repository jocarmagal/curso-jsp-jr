<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula" />
	<h2>Sej bem vindo ao sistema JSP</h2>
	
	<a href="salvarUsuario?acao=listartodos"><img
										src="resources/img/usuario.jpeg" title="Cadastro de usuário"
										width="100px" height="100px"></a>
</body>
</html>