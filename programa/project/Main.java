package project;

import java.util.Scanner;

public class Main {
	public static void main(String[] args) {

		DbConnection conn = new DbConnection();
		Integer[] a = {11,12,13,14,15};
		Double[] b = {21.0,22.0,23.0,24.0,25.0};
		Double[] c = {31.0,32.0,33.0,34.0,35.0};
		Integer[] d = {41,42,43,44,45};
		Integer[] e = {51,52,53,54,55};

		// conn.generateOrderRequest("2021-04-07", 255.36, 12, 1, 77, 
		// 		"Ao lado do Mercado.", "Não sei oq é isso");
		//conn.registerChosenItem(5, 200.0, 1000.0, 2, 9);
		conn.registerAllChosenItems(a,b,c,d,e);

		conn.closeConnection();
	}
}