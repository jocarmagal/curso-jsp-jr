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
	<center>
		<h1>Cadastro de Usuario</h1>
	</center>
	<h3 style="color: orange;">${msg}</h3>
	<form action="salvarUsuario" method="post"
		onsubmit="return validarCampos() ? true : false;">
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
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}"></td>
					</tr>
					<tr>
						<td>Fone:</td>
						<td><input type="text" id="fone" name="fone"
							value="${user.telefone}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"><input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>

					</tr>
					</li>
				</table>
				<div class="container">
					<table class="responsive-table">
						<caption>Usuários cadastrados</caption>
						<tr>
							<th>Id</th>
							<th>Login</th>
							<th>Nome</th>
							<th>Telefone</th>
							<th>Delete</th>
							<th>Editar</th>
						</tr>


						<c:forEach items="${usuarios}" var="user">
							<tr>
								<td style="width: 150px"><c:out value="${user.id}"></c:out></td>
								<td style="widht: 150px"><c:out value="${user.login}"></c:out></td>
								<td><c:out value="${user.nome}"></c:out></td>
								<td><c:out value="${user.telefone}"></c:out></td>
								<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
										src="resources/img/excluir.png" alt="excluir" title="Excluir"
										width="20px" height="20px"></a></td>
								<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
										alt="Editar" title="Editar" src="resources/img/editar.png"
										width="20px" height="20px"></a></td>
							</tr>
						</c:forEach>
					</table>
		</ul>
	</form>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert('Informe o Login');
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert('Informe o Senha');
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert('Informe o Nome');
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert('Informe o Telefone');
				return false;
			}

			return true;
		}
	</script>


</body>
</html>