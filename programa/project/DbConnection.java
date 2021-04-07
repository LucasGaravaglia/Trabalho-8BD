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
      "EnderecoEntrega_idEndereco,nroCasa_endEntrega," +
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
    System.out.println(sql);
    return sql;
  }

  public String registerChosenItem(Integer saleQnt, Double saleCost,
      Double totalProductItem, Integer orderNumber, Integer productId) {
    System.out.println("Registrando um item para o pedido " + orderNumber.toString());
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
    System.out.println(sql);
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
  

  public String reduceProductQnt(Integer productId, Integer saleQnt) {
    System.out.println("Atualizando a quantidade do produto de id " + productId.toString());
    String sql = "UPDATE Produto SET qtdeEstoque = qtdeEstoque-"+ saleQnt.toString() +
    " WHERE codProduto = " + productId.toString() + ";";
    return sql;
  }

  public String[] reduceAllChosenProductsQtn(Integer[] productId, Integer[] saleQnt) {
    int numberOfProducts = productId.length;
    String[] sqls = new String[numberOfProducts];
    for(int i = 0; i < numberOfProducts; i++) {
      sqls[i] = this.reduceProductQnt(productId[i],saleQnt[i]);
    }
    return sqls;
  }


  public String[] selectProductsIdAndQnt(String[] query) {
    Integer[] ids = new Integer[query.length];
    Integer[] qnts = new Integer[query.length];
    String[] values = new String[5];
    int i = 0;
    for (String queryString : query) {
      System.out.println("CHEGOU");
      values = queryString.split("VALUES (")[1].split(")")[0].split(",");
      System.out.println(values);
      ids[i] = Integer.parseInt(values[4]); 
      qnts[i] = Integer.parseInt(values[0]); 
    }
    return reduceAllChosenProductsQtn(ids, qnts);
  }

  public Boolean commit(String queryPedidoVenda, String []queryItemPedidoVenda) {
    Statement stmQuery;
    String[] queryProdutos;
    try {
      stmQuery = this.connection.createStatement();
      this.connection.setAutoCommit(false);

      stmQuery.execute(queryPedidoVenda);
      
      for (String queryString : queryItemPedidoVenda) {
        stmQuery.execute(queryString);
      }
      queryProdutos = this.selectProductsIdAndQnt(queryItemPedidoVenda);
      for (String queryString : queryProdutos) {
        stmQuery.execute(queryString);
      }
      
      this.connection.commit();
      System.out.println("Alterações confirmadas com sucesso no banco de dados!");
      return true;
    } catch (SQLException e) {
      try { // Rollback update
        this.connection.rollback();
        System.out.println("Alterações revertidas com sucesso do banco de dados!");
      } catch (SQLException e1) {
        System.out.println("Não foi possível reverter as atualizações " + e1.getMessage());
      }
    }
    return false;
  }

  public Boolean endOrder(String orderDt, Double total, 
      Integer clientId, Integer deliveryAddrId, Integer houseNumber,
      String deliveryAddrCompliment, String pedidoVendacol,
      Integer saleQnt[], Double saleCost[],
      Double totalProductItem[], Integer orderNumber[], Integer productId[]) {
    return this.commit(
        this.generateOrderRequest(
            orderDt,
            total,
            clientId,
            deliveryAddrId,
            houseNumber,
            deliveryAddrCompliment,
            pedidoVendacol
            ),this.registerAllChosenItems(
            saleQnt, 
            saleCost, 
            totalProductItem, 
            orderNumber, 
            productId
        )
    );
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