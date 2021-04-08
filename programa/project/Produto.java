package project;

public class Produto {

  private String[] queryItemPedidoVenda;

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

  public String[] selectProductsIdAndQnt() {
    Integer[] ids = new Integer[this.queryItemPedidoVenda.length];
    Integer[] qnts = new Integer[this.queryItemPedidoVenda.length];
    String[] values = new String[5];
    int i = 0;
    for (String queryString : this.queryItemPedidoVenda) {
      values = queryString.split("VALUES \\(")[1].split("\\)")[0].split(",");
      ids[i] = Integer.parseInt(values[4]);
      qnts[i] = Integer.parseInt(values[0]);
    }
    return reduceAllChosenProductsQtn(ids, qnts);
  }
  
}
