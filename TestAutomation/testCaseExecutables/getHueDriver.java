package testCaseExecutables;

import java.awt.Color;

public class getHueDriver{
	public static void main(String[] args){
		
		Color c = Color.decode(args[0]);
		System.out.println(ColorConverter.getHue(c));
	}
}
