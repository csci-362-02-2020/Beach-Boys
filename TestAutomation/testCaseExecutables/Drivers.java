package testCaseExecutables;
import java.awt.Color;

public class Drivers {
	public static void main(String[] args) {
		String input=args[0];
		Color newColor = ColorConverter.hex2Rgb(input);
		System.out.println("RGB value of hex number "+newColor);
			
		
	}
}