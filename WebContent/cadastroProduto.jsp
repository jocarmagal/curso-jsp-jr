<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Produto</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

</head>
<body>
	<center>
		<h1>Cadastro de Produto</h1>
	</center>
	<h3 style="color: orange;">${msg}</h3>
	<form action="salvarProduto" method="post" id="formProduto" onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>

					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${produto.nome}"></td>
					</tr>

					<tr>
						<td>Quantidade:</td>
						<td><input type="text" id="quantidade" name="quantidade"
							value="${produto.quantidade}"></td>
					</tr>
					<tr>
						<td>Valor:</td>
						<td><input type="text" id="valor" name="valor"
							value="${produto.valor}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"><input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'"></td>

					</tr>
					</li>
				</table>
				<div class="container">
					<table class="responsive-table">
						<caption>Produtos cadastrados</caption>
						<tr>
							<th>Id</th>
							<th>Nome</th>
							<th>Quantidade</th>
							<th>Valor</th>
							<th>Delete</th>
							<th>Editar</th>
						</tr>


						<c:forEach items="${produtos}" var="produto">
							<tr>
								<td style="width: 150px"><c:out value="${produto.id}"></c:out></td>
								<td style="widht: 150px"><c:out value="${produto.nome}"></c:out></td>
								<td><c:out value="${produto.quantidade}"></c:out></td>
								<td><c:out value="${produto.valor}"></c:out></td>
								<td><a href="salvarProduto?acao=delete&produto=${produto.id}"><img
										src="resources/img/excluir.png" alt="excluir" title="Excluir"
										width="20px" height="20px"></a></td>
								<td><a href="salvarProduto?acao=editar&produto=${produto.id}"><img
										alt="Editar" title="Editar" src="resources/img/editar.png"
										width="20px" height="20px"></a></td>
							</tr>
						</c:forEach>
					</table>
		</ul>
	</form>
<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("nome").value == '') {
				alert('Informe o Nome do Produto');
				return false;
			} else if (document.getElementById("quantidade").value == '') {
				alert('Informe a Quantidade do Produto');
				return false;
			} else if (document.getElementById("valor").value == '') {
				alert('Informe o Valor do Produto');
				return false;
			} 

			return true;
		}
	</script>

</body>
</html>