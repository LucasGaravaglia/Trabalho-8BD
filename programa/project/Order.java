package project;

import java.sql.SQLException;
import java.util.ArrayList;


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
      connection.setAutoCommit(false);
      this.pedidoVenda.executeTransition(connection);
      this.itemPedidoVenda.executeTransition(connection);
      this.produto = new Produto(this.itemPedidoVenda.getSqls());
      this.produto.executeTransition(connection,this.itemPedidoVenda.getProductId(), this.itemPedidoVenda.getSaleQnt());

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
