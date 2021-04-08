package project;

import java.sql.SQLException;

public class Order {
  ItemPedidoVenda itemPedidoVenda;
  PedidoVenda pedidoVenda;
  Produto produto;

  public Order(ItemPedidoVenda itemPedidoVenda, PedidoVenda pedidoVenda) {
    this.itemPedidoVenda = new ItemPedidoVenda(itemPedidoVenda);
    this.pedidoVenda = new PedidoVenda(pedidoVenda);
  }
  
  public void endOrder(DbConnection connection) {
    try{
      System.out.println("Inicializando transação");
      connection.setAutoCommit(false);
      this.pedidoVenda.executeTransaction(connection);
      this.itemPedidoVenda.setOrderNumber(this.pedidoVenda.selectMaxNroPedido(connection));
      this.itemPedidoVenda.executeTransaction(connection);
      this.produto = new Produto(this.itemPedidoVenda.getSqls());
      this.produto.executeTransaction(connection,this.itemPedidoVenda.getProductId(), this.itemPedidoVenda.getSaleQnt());
      connection.commit();
      System.out.println("Finalizada a transação");
    } catch (SQLException e) {
      try {
        connection.rollback();
        System.out.println("Alterações revertidas com sucesso do banco de dados!" + e.getMessage());
      } catch (SQLException e1) {
        System.out.println("Não foi possível reverter as atualizações " + e1.getMessage());
      }
    }
  }
}
