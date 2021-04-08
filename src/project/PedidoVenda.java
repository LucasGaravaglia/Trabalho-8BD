package project;

import java.sql.SQLException;
import java.sql.ResultSet;

public class PedidoVenda {

  private String orderDt;
  private Double total;
  private Integer clientId;
  private Integer deliveryAddrId;
  private Integer houseNumber;
  private String deliveryAddrCompliment;
  private String pedidoVendacol;

  public PedidoVenda( PedidoVenda pedidoVenda) {
    this.orderDt = pedidoVenda.getOrderDt();
    this.total = pedidoVenda.getTotal();
    this.clientId = pedidoVenda.getClientId();
    this.deliveryAddrId = pedidoVenda.getDeliveryAddrId();
    this.houseNumber = pedidoVenda.getHouseNumber();
    this.deliveryAddrCompliment = pedidoVenda.getDeliveryAddrCompliment();
    this.pedidoVendacol = pedidoVenda.getPedidoVendacol();
  }

  public PedidoVenda( String orderDt, Double total, Integer clientId, Integer deliveryAddrId, Integer houseNumber, String deliveryAddrCompliment, String pedidoVendacol) {
    this.orderDt = orderDt;
    this.total = total;
    this.clientId = clientId;
    this.deliveryAddrId = deliveryAddrId;
    this.houseNumber = houseNumber;
    this.deliveryAddrCompliment = deliveryAddrCompliment;
    this.pedidoVendacol = pedidoVendacol;
  }


  public String generateOrderRequest() {
    System.out.println("Gerando o pedido de venda");
    String sql = "INSERT INTO PedidoVenda" + "(dtPedido,totalPedido,Cliente_codCliente,"
        + "EnderecoEntrega_idEndereco,nroCasa_endEntrega," + "compl_endEntrega,PedidoVendacol) " + "VALUES " + "(" + "'"
        + this.orderDt + "'," + this.total.toString() + "," + this.clientId.toString() + ","
        + this.deliveryAddrId.toString() + "," + this.houseNumber.toString() + "," + "'" + this.deliveryAddrCompliment
        + "'," + "'" + this.pedidoVendacol + "'" + ")";
    return sql;
  }
  
  public Integer selectMaxNroPedido(DbConnection connection) throws SQLException {
    ResultSet rs = connection.createStatement().executeQuery("SELECT MAX(nroPedido) FROM PedidoVenda;");
    rs.next();
    return Integer.parseInt(rs.getString(1));
  } 

  public void executeTransaction(DbConnection connection) throws SQLException {
    connection.execute(this.generateOrderRequest());
  }

  public String getOrderDt (){
    return this.orderDt;
  }
  public Double getTotal (){
    return this.total;
  }
  public Integer getClientId (){
    return this.clientId;
  }
  public Integer getDeliveryAddrId (){
    return this.deliveryAddrId;
  }
  public Integer getHouseNumber (){
    return this.houseNumber;
  }
  public String getDeliveryAddrCompliment (){
    return this.deliveryAddrCompliment;
  }
  public String getPedidoVendacol (){
    return this.pedidoVendacol;
  }
  public void setOrderDt (String orderDt) {
    this.orderDt = orderDt;
  }
  public void setTotal (Double total) {
    this.total = total;
  }
  public void setClientId (Integer clientId) {
    this.clientId = clientId;
  }
  public void setDeliveryAddrId (Integer deliveryAddrId) {
    this.deliveryAddrId = deliveryAddrId;
  }
  public void setHouseNumber (Integer houseNumber) {
    this.houseNumber = houseNumber;
  }
  public void setDeliveryAddrCompliment (String deliveryAddrCompliment) {
    this.deliveryAddrCompliment = deliveryAddrCompliment;
  }
  public void setPedidoVendacol (String pedidoVendacol) {
    this.pedidoVendacol = pedidoVendacol;
  }
}
