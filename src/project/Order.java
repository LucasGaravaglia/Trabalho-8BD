package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Order {
  ItemPedidoVenda itemPedidoVenda;
  PedidoVenda pedidoVenda;

  public Order(ItemPedidoVenda itemPedidoVenda, PedidoVenda pedidoVenda) {
    this.itemPedidoVenda = new ItemPedidoVenda(itemPedidoVenda);
    this.pedidoVenda = new PedidoVenda(pedidoVenda);
  }
  
  public void endOrder(DbConnection connection) {
    try{
      connection.setAutoCommit(false);
      this.pedidoVenda.executeTransition(connection);
      this.itemPedidoVenda.executeTransition(connection);

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
