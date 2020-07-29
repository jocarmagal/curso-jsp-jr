package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCursoJsp;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;

	public DaoUsuario() {
		connection = SingleConnection.getConnection();

	}

	public void salvar(BeanCursoJsp usuario) {

		try {
			String sql = "insert into usuario(login, senha, nome, telefone, cep, rua, bairro, cidade, estado, ibge)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, usuario.getLogin());
			insert.setString(2, usuario.getSenha());
			insert.setString(3, usuario.getNome());
			insert.setString(4, usuario.getTelefone());
			insert.setString(5, usuario.getCep());
			insert.setString(6, usuario.getRua());
			insert.setString(7, usuario.getBairro());
			insert.setString(8, usuario.getCidade());
			insert.setString(9, usuario.getEstado());
			insert.setString(10, usuario.getIbge());
			
			insert.execute();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public List<BeanCursoJsp> listar() throws Exception {
		List<BeanCursoJsp> listar = new ArrayList<BeanCursoJsp>();
		String sql = "select * from usuario";

		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();

		while (resultSet.next()) {

			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));	
			beanCursoJsp.setTelefone(resultSet.getString("telefone"));	
			beanCursoJsp.setCep(resultSet.getString("cep"));	
			beanCursoJsp.setRua(resultSet.getString("rua"));	
			beanCursoJsp.setBairro(resultSet.getString("bairro"));	
			beanCursoJsp.setCidade(resultSet.getString("cidade"));	
			beanCursoJsp.setEstado(resultSet.getString("estado"));	
			beanCursoJsp.setIbge(resultSet.getString("ibge"));	
			listar.add(beanCursoJsp);
		}
		return listar;

	}

	public void delete(String id) {

		try {
			String sql = "delete from usuario where id = '" + id + "'";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}

	public BeanCursoJsp consultar(String id) throws Exception {
		String sql = "select * from usuario where id='" + id + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
			beanCursoJsp.setId(resultSet.getLong("id"));
			beanCursoJsp.setLogin(resultSet.getString("login"));
			beanCursoJsp.setSenha(resultSet.getString("senha"));
			beanCursoJsp.setNome(resultSet.getString("nome"));
			beanCursoJsp.setTelefone(resultSet.getString("telefone"));
			beanCursoJsp.setCep(resultSet.getString("cep"));	
			beanCursoJsp.setRua(resultSet.getString("rua"));	
			beanCursoJsp.setBairro(resultSet.getString("bairro"));	
			beanCursoJsp.setCidade(resultSet.getString("cidade"));	
			beanCursoJsp.setEstado(resultSet.getString("estado"));	
			beanCursoJsp.setIbge(resultSet.getString("ibge"));	
			return beanCursoJsp;
		}

		return null;
	}
	
	
	
	
	public boolean validarLogin(String login) throws Exception {
		String sql = "select count(1) as qtd from usuario where login='" + login + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0 ;
		}

		return false;
	}
	public boolean validarLoginUpdate(String login,String id) throws Exception {
		String sql = "select count(1) as qtd from usuario where login='" + login + "'and id <>" + id;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0 ;
		}

		return false;
	}
	public boolean validarSenhaUpdate(String senha,String id) throws Exception {
		String sql = "select count(1) as qtd from usuario where senha='" + senha + "'and id <>" + id;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			return resultSet.getInt("qtd") <= 0 ;
		}

		return false;
	}
	public boolean validarSenha(String senha) throws Exception {
		String sql = "select count(1) as qtd from usuario where senha='" + senha + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			
			return resultSet.getInt("qtd") <= 0;/*Return true*/
		}
		return false;
	}
	
	
	


public void atualizar(BeanCursoJsp usuario) {
	try {
	String sql = "update usuario set login = ? , senha = ?, nome = ?, telefone = ?, cep = ?, rua = ?, bairro = ?, cidade = ? , estado = ? , ibge = ? where id =  "+ usuario.getId();
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, usuario.getLogin()); 
	preparedStatement.setString(2, usuario.getSenha());
	preparedStatement.setString(3, usuario.getNome());
	preparedStatement.setString(4, usuario.getTelefone());
	preparedStatement.setString(5, usuario.getCep());
	preparedStatement.setString(6, usuario.getRua());
	preparedStatement.setString(7, usuario.getBairro());
	preparedStatement.setString(8, usuario.getCidade());
	preparedStatement.setString(9, usuario.getEstado());
	preparedStatement.setString(10, usuario.getIbge());
	preparedStatement.executeUpdate();
	connection.commit();
	}catch (Exception e) {
		e.printStackTrace();
		try {
			connection.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
}
}

