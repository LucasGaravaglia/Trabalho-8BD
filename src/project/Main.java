package project;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner( System.in );
		DbConnection connection = new DbConnection();
		PedidoVenda successCasePedidoVenda = new PedidoVenda(
				"2021-07-07", 6516.00, 4, 4, 774,
				"Ao lado da padaria.", "Alguma coisa q eu não sei."
		);
		Integer[] productId = {1,5,9};
		Integer[] saleQnt = {5,3,8};
		Double[] saleCost = {265.00,33.00,8.00};
		Double[] totalProductItem = {53.00,11.00,1.00};
		ItemPedidoVenda successCaseItemPedidoVenda = new ItemPedidoVenda(
				saleQnt, saleCost, totalProductItem, productId
		);
		Order order = new Order(successCaseItemPedidoVenda, successCasePedidoVenda);
		order.endOrder(connection);

		in.nextLine();

		PedidoVenda errorCasePedidoVenda = new PedidoVenda(
				"2021-07-07", 6516.00, 4, 4, 774,
				"Ao lado da padaria.", "Alguma coisa q eu não sei."
		);
		Integer[] productIdError = {1,5,9};
		Integer[] saleQntError = {5,11,8};
		Double[] saleCostError = {265.00,121.00,8.00};
		Double[] totalProductItemError = {53.00,11.00,1.00};
		ItemPedidoVenda errorCaseItemPedidoVenda = new ItemPedidoVenda(
				saleQntError, saleCostError, totalProductItemError, productIdError
		);
		Order errorOrder = new Order(errorCaseItemPedidoVenda, errorCasePedidoVenda);
		errorOrder.endOrder(connection);
		
	}
}