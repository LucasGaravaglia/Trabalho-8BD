package project;

import java.sql.SQLException;

public class ItemPedidoVenda {
  private Integer[] saleQnt;
  private Double[] saleCost;
  private Double[] totalProductItem;
  private Integer orderNumber;
  private Integer[] productId;
  private String[] sqls;

  public ItemPedidoVenda(ItemPedidoVenda itemPedidoVenda) {
    int i, n = itemPedidoVenda.getSaleQnt().length;

    this.saleQnt = new Integer[n];
    this.saleCost = new Double[n];
    this.totalProductItem = new Double[n];
    this.productId = new Integer[n];

    for (i = 0; i < n; i++) {
      this.saleQnt[i] = itemPedidoVenda.getSaleQnt(i);
      this.saleCost[i] = itemPedidoVenda.getSaleCost(i);
      this.totalProductItem[i] = itemPedidoVenda.getTotalProductItem(i);
      this.productId[i] = itemPedidoVenda.getProductId(i);
    }
  }

  public ItemPedidoVenda(Integer[] saleQnt, Double[] saleCost,
                          Double[] totalProductItem,Integer[] productId) {
    int i, n = saleQnt.length;
    
    this.saleQnt = new Integer[n];
    this.saleCost = new Double[n];
    this.totalProductItem = new Double[n];
    this.productId = new Integer[n];

    for (i = 0; i < n; i++) {
      this.saleQnt[i] = saleQnt[i];
      this.saleCost[i] = saleCost[i];
      this.totalProductItem[i] = totalProductItem[i];
      this.productId[i] = productId[i];
    }
  }
  
  private String registerChosenItem(Integer saleQnt, Double saleCost,
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
    return sql;
  }

  public String[] registerAllChosenItems() {
    int numberOfItems = saleQnt.length;
    this.sqls = new String[numberOfItems];
    for (int i = 0; i < numberOfItems; i++) {
      this.sqls[i] = this.registerChosenItem(this.saleQnt[i], this.saleCost[i],
          this.totalProductItem[i],this.orderNumber, this.productId[i]);
    }
    return this.sqls;
  }
  
  public void executeTransaction(DbConnection connection) throws SQLException {
    for (String query : this.registerAllChosenItems()) {
      connection.execute(query);
    }
  }

  public void setOrderNumber(Integer orderNumber) {
    this.orderNumber = orderNumber;
  }

  public String[] getSqls() {
    return this.sqls;
  }
  public Integer getSaleQnt(int position) {
    return this.saleQnt[position];
  }

  public Double getSaleCost(int position) {
    return this.saleCost[position];
  }

  public Double getTotalProductItem(int position) {
    return this.totalProductItem[position];
  }

  public Integer getProductId(int position) {
    return this.productId[position];
  }

  public Integer[] getSaleQnt() {
    return this.saleQnt;
  }

  public Double[] getSaleCost() {
    return this.saleCost;
  }

  public Double[] getTotalProductItem() {
    return this.totalProductItem;
  }

  public Integer getOrderNumber() {
    return this.orderNumber;
  }

  public Integer[] getProductId() {
    return this.productId;
  }
}
