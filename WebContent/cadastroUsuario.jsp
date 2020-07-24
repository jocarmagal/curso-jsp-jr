<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuario</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<center><h1>Cadastro de Usuario</h1></center>
	<form action="salvarUsuario" method="post">
		<ul class="form-style-1">
			<li>
				<table>

					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}"></td>
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"></td>
						
					</tr>
					</li>
				</table>
<div class="container">
				<table class="responsive-table" >
					<caption>Usuários cadastrados</caption>
					<c:forEach items="${usuarios}" var="user">
						<tr>
							<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
							<td style="widht: 150px"><c:out value="${user.login}"></c:out></td>
							<td><c:out value="${user.senha}"></c:out></td>
						
						<td><a href="salvarUsuario?acao=delete&user=${user.login}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px"></a></td>
						<td><a href="salvarUsuario?acao=editar&user=${user.login}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>
</tr>
					</c:forEach>
				</table>
		</ul>
	</form>
	</div>
</body>
</html>