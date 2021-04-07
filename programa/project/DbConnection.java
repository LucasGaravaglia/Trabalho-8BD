package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
  private Connection connection = null;
  String ip = "localhost";
  String port = "3306";
  String dbName = "Pedidos";
  String user = "root";
  String pass = "123";
  String url = "jdbc:mariadb://" + ip + ":" + port + "/" + dbName;
  public DbConnection() {
    try {
      this.connection = DriverManager.getConnection(url, user, pass);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public String generateOrderRequest(String orderDt, Double total, 
      Integer clientId, Integer deliveryAddrId, Integer houseNumber,
      String deliveryAddrCompliment, String pedidoVendacol) {
    System.out.println("Gerando o pedido de venda");
    String sql = "INSERT INTO PedidoVenda" +
    "(dtPedido,totalPedido,Cliente_codCliente," +
      "EnderecoEntrega_idEntrega,nroCasa_endEntrega," +
      "compl_endEntrega,PedidoVendacol) " +
    "VALUES " +
      "(" + 
        "'" + orderDt + "'," +
        total.toString() + "," +
        clientId.toString() + "," +
        deliveryAddrId.toString() + "," +
        houseNumber.toString() + "," +
        "'" + deliveryAddrCompliment + "'," +
        "'" + pedidoVendacol + "'" + 
        ");";
    return sql;
  }

  public String registerChosenItem(Integer saleQnt, Double saleCost,
      Double totalProductItem, Integer orderNumber, Integer productId) {
    System.out.println("Registrando um item");
    String sql = "INSERT INTO ItemPedidoVenda" +
                "(" + 
                  "qtdeVenda,precoVenda,totalItemProduto," +
                  "PedidoVenda_nroPedido,Produto_codProduto" +
                ") " +
                "VALUES " +
                  "(" +
                    saleQnt.toString() + "," +
                    saleCost.toString() + "," +
                    totalProductItem.toString() + "," +
                    orderNumber.toString() + "," +
                    productId.toString() +
                    ");";
    return sql;
  }

  public String[] registerAllChosenItems(Integer saleQnt[], Double saleCost[],
      Double totalProductItem[], Integer orderNumber[], Integer productId[]) {
    int numberOfItems = saleQnt.length;
    String[] sqls = new String[numberOfItems];
    for (int i = 0; i < numberOfItems; i++) {
      sqls[i] = this.registerChosenItem(saleQnt[i], saleCost[i], totalProductItem[i], orderNumber[i], productId[i]);
    }
    return sqls;
  }
  
// UPDATE `Produto` SET `qtdEstoque` = qtdEstoque-1 WHERE codProduto = $;

  public String reduceProductQnt(Integer productId) {
    String sql = "";
  }

  public void endOrder() {
    

  }

  public void commit(String queryPedido,String []queryItensPedidos,String[] queryProdutos) {
    Statement stmQuery;
    try {
      stmQuery = this.connection.createStatement();
      this.connection.setAutoCommit(false);
      stmQuery.execute(queryPedido);
      
      for (String queryString : queryItensPedidos) {
        stmQuery.execute(queryString);
      }
      
      for (String queryString : queryProdutos) {
        stmQuery.execute(queryString);
      }
      
      this.connection.commit();
      
      System.out.println("Alterações confirmadas com sucesso no banco de dados!");
    } catch (SQLException e) {
      try { // Rollback update
        this.connection.rollback();
        System.out.println("Alterações revertidas com sucesso do banco de dados!");
      } catch (SQLException e1) {
        System.out.println("Não foi possível reverter as atualizações " + e1.getMessage());
      }
    }
  }

  public void closeConnection() {
      try{
        if(this.connection.isClosed())
          this.connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
  }


}