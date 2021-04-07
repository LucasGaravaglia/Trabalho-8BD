package project;


public class Main {
	public static void main(String[] args) {

		DbConnection conn = new DbConnection();
		Integer[] saleQnt = {3};
		Double[] saleCost = {33.00};
		Double[] totalProductItem = {11.00};
		Integer[] orderNumber = {1};
		Integer[] productId = {5};

		conn.endOrder(
			"2021-07-07", 
			6516.00, 
			5, //ATUALIZAR
			5, //ATUALIZAR
			774, 
			"Ao lado da padaria.", 
			"Alguma coisa q eu nao sei.", 

			saleQnt, 
			saleCost, 
			totalProductItem, 
			orderNumber, 
			productId);


		conn.closeConnection();
	}
}