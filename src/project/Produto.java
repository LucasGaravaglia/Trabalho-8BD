package project;

import java.sql.SQLException;

public class Produto {

  private String[] queryItemPedidoVenda;

  public Produto(Produto produto) {
    int i, n = queryItemPedidoVenda.length;
    this.queryItemPedidoVenda = new String[n];
    for (i = 0; i < n; i++) {
      this.queryItemPedidoVenda[i] = produto.getItemPedidoVenda(i);
    }
  }

  public Produto(String[] queryItemPedidoVenda) {
    int i, n = queryItemPedidoVenda.length;
    this.queryItemPedidoVenda = new String[n];
    for (i = 0; i < n; i++) {
      this.queryItemPedidoVenda[i] = queryItemPedidoVenda[i];
    }
  }

  private String reduceProductQnt(Integer productId, Integer saleQnt) {
    System.out.println("Atualizando a quantidade do produto de id " + productId.toString());
    String sql = "UPDATE Produto SET qtdeEstoque = qtdeEstoque-"+ saleQnt.toString() +
    " WHERE codProduto = " + productId.toString() + ";";
    return sql;
  }

  private String[] reduceAllChosenProductsQtn(Integer[] productId, Integer[] saleQnt) {
    int numberOfProducts = productId.length;
    String[] sqls = new String[numberOfProducts];
    for(int i = 0; i < numberOfProducts; i++) {
      sqls[i] = this.reduceProductQnt(productId[i],saleQnt[i]);
    }
    return sqls;
  }

  public void executeTransition(DbConnection connection, Integer[] productId, Integer[] saleQnt) throws SQLException {
    for (String query : this.reduceAllChosenProductsQtn(productId, saleQnt)) {
      connection.execute(query);
    }
  }

  public String getItemPedidoVenda(int i) {
    return this.queryItemPedidoVenda[i];
  }

}
