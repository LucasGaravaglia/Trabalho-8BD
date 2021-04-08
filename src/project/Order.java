package project;

import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

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
      System.out.println("Inicializando transação\n");
      connection.setAutoCommit(false);
      this.pedidoVenda.executeTransaction(connection);
      this.itemPedidoVenda.setOrderNumber(this.pedidoVenda.selectMaxNroPedido(connection));
      this.itemPedidoVenda.executeTransaction(connection);
      this.produto = new Produto(this.itemPedidoVenda.getSqls());
      this.produto.executeTransaction(connection,this.itemPedidoVenda.getProductId(), this.itemPedidoVenda.getSaleQnt());
      connection.commit();
      System.out.println("Finalizada a transação\n");
    } catch (SQLSyntaxErrorException e1) {
      try {
        connection.rollback();
        System.out.println("\nAlterações revertidas com sucesso do banco de dados!");
      } catch (SQLException e2) {
        System.out.println("Não foi possível reverter as atualizações.");
      }
      System.out.println("Não foi possível reduzir a quantidade em estoque.\nValor negativo não permitido.");
    }catch (SQLException e) {
      try {
        connection.rollback();
        System.out.println("Alterações revertidas com sucesso do banco de dados!");
      } catch (SQLException e1) {
        System.out.println("Não foi possível reverter as atualizações " + e1.getMessage());
      }
    }
  }
}
