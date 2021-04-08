package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
  private Connection connection = null;
  private String ip = "localhost";
  private String port = "3306";
  private String dbName = "Pedidos";
  private String user = "root";
  private String pass = "123";
  private String url = "jdbc:mariadb://" + ip + ":" + port + "/" + dbName;

  
  public DbConnection() {
    try {
      this.connection = DriverManager.getConnection(url, user, pass);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void closeConnection() {
    try {
      if (this.connection.isClosed())
        this.connection.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public void setAutoCommit(Boolean commit) throws SQLException {
    this.connection.setAutoCommit(commit);
  }

  public void rollback() throws SQLException {
    this.connection.rollback();
  }

  public void execute(String query) throws SQLException {
    Statement stmQuery = this.connection.createStatement();
    stmQuery.execute(query);
  }
  

  // public Boolean commit(Connection connection,String queryPedidoVenda, String []queryItemPedidoVenda) {
  //   Statement stmQuery;
  //   String[] queryProdutos;
  //   try {
  //     stmQuery = connection.createStatement();
  //     connection.setAutoCommit(false);

  //     stmQuery.execute(queryPedidoVenda);
  //     // System.out.println(queryPedidoVenda);
      
  //     for (String queryString : queryItemPedidoVenda) {
  //       stmQuery.execute(queryString);
  //       // System.out.println(queryString);
  //     }
  //     queryProdutos = this.selectProductsIdAndQnt(queryItemPedidoVenda);
  //     for (String queryString : queryProdutos) {
  //       stmQuery.execute(queryString);
  //     }
  //     this.connection.commit();

  //     System.out.println("Alterações confirmadas com sucesso no banco de dados!");
  //     return true;
  //   } catch (SQLException e) {
  //     try { // Rollback update
  //       this.connection.rollback();
  //       System.out.println("Alterações revertidas com sucesso do banco de dados!" + e.getMessage());
  //     } catch (SQLException e1) {
  //       System.out.println("Não foi possível reverter as atualizações " + e1.getMessage());
  //     }
  //   }
  //   return false;
  // }

}