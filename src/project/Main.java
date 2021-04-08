package project;


public class Main {
	public static void main(String[] args) {

		DbConnection connection = new DbConnection();
		PedidoVenda pedidoVenda = new PedidoVenda(
				"2021-07-07", 6516.00, 4, 4, 774,
				"Ao lado da padaria.", "Alguma coisa q eu não sei."
		);
		Integer[] saleQnt = {3};
		Double[] saleCost = {33.00};
		Double[] totalProductItem = {11.00};
		Integer[] orderNumber = {1};
		Integer[] productId = { 5 };
		ItemPedidoVenda itemPedidoVenda = new ItemPedidoVenda(
				saleQnt, saleCost, totalProductItem, orderNumber, productId
		);
		Order order = new Order(itemPedidoVenda, pedidoVenda);
		order.endOrder(connection);
		
	}
}