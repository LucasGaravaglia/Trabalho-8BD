package project;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {

		DbConnection conn = new DbConnection();
		Integer[] saleQnt = {11,12,13,14,15};
		Double[] saleCost = {21.0,22.0,23.0,24.0,25.0};
		Double[] totalProductItem = {31.0,32.0,33.0,34.0,35.0};
		Integer[] orderNumber = {41,42,43,44,45};
		Integer[] productId = {51,52,53,54,55};

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