<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>

<div class="login-page">
<div class="form">

<form action="LoginServlet" method = "post" class = "login-form">
Login:
<input type = "text" id="login" name="login">
<br/>
Senha:
<input type = "password" id="senha" name="senha">
<br/>
<button type="submit" value="Logar">Logar</button>


</form>
</div>
</div>







</body>
</html>