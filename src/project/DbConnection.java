package project;

import java.sql.*;

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

  public void commit() throws SQLException {
    this.connection.commit();
  }
  
  public Statement createStatement() throws SQLException {
    return this.connection.createStatement();
  }

}