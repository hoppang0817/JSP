package ch19;

import java.text.DecimalFormat;

public class ELMethod {
	public static String comma(int number) {
		DecimalFormat df = new DecimalFormat("#,##0");
		return df.format(number);
	}
	
	public static void main(String[] args) {
		System.out.println(comma(10000000));
	}
}
