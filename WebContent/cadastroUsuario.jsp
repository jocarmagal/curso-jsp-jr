<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuario</title>
<link rel="stylesheet" href="resources/css/cadastro.css">


<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>
	<a href="acessoliberado.jsp"> <img alt="Inicio" title="Inicio"
		src="resources/img/inicio.png" width="90px" height="90px"></a>
	<a href="index.jsp"> <img alt="Sair" title="Sair"
		src="resources/img/sair.jpeg" width="90px" height="90px"></a>
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
						<td>Cep:</td>
						<td><input type="text" id="cep" name="cep"
							onblur="consultaCep();"></td>

					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}"></td>
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"></td>
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}"></td>
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" placeholder="Informe um Nome"></td>
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"></td>
					</tr>
					<tr>
						<td>Telefone:</td>
						<td><input type="text" id="telefone" name="telefone"
							value="${user.telefone}"placeholder="Informe um Telefone"></td>
						<td>Estado:</td>
						<td><input type="text" id="estado" name="estado"></td>
					</tr>


					<td>IBGE:</td>
					<td><input type="text" id="ibge" name="ibge"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"><input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
					</tr>
				</table>

			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Usuários cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Login</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Cep</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cidade</th>
				<th>Estado</th>
				<th>Ibge</th>
				<th>Delete</th>
				<th>Editar</th>
				<th>Telefones</th>
			</tr>


			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td><c:out value="${user.id}"></c:out></td>
					<td><c:out value="${user.login}"></c:out></td>
					<td><c:out value="${user.nome}"></c:out></td>
					<td><c:out value="${user.telefone}"></c:out></td>
					<td><c:out value="${user.cep}"></c:out></td>
					<td><c:out value="${user.rua}"></c:out></td>
					<td><c:out value="${user.bairro}"></c:out></td>
					<td><c:out value="${user.cidade}"></c:out></td>
					<td><c:out value="${user.estado}"></c:out></td>
					<td><c:out value="${user.ibge}"></c:out></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px"></a></td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>
					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							alt="Telefones" title="Telefones" src="resources/img/fone.png"
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
			function consultaCep() {
				var cep = $("#cep").val();
				//Consulta o webservice viacep.com.br/
				$.getJSON("https://viacep.com.br/ws/" + cep
						+ "/json/?callback=?", function(dados) {

					if (!("erro" in dados)) {
						$("#rua").val(dados.logradouro);
						$("#bairro").val(dados.bairro);
						$("#cidade").val(dados.localidade);
						$("#estado").val(dados.uf);
						$("#ibge").val(dados.ibge);
					} //end if.
					else {
						$("#rua").val('');
						$("#bairro").val('');
						$("#cidade").val('');
						$("#estado").val('');
						$("#ibge").val('');
						//CEP pesquisado não foi encontrado.
						limpa_formulário_cep();
						alert("CEP não encontrado.");
					}
				});
			}
		</script>
</body>
</html>