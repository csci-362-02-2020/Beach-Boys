package testCaseExecutables;

import java.awt.Color;

public class getHueDriver{
	public static void main(String[] args){
		
		Color c = Color.decode(args[0]);
		System.out.printf("%.2f\n", ColorConverter.getHue(c));
	}
}
