package testCaseExecutables;
import java.awt.Color;

public class rgb2hexDriver {
	public static void main(String[] args) {
		String input=args[0];
		String newColor = ColorConverter.rgb2hex(input);
		System.out.println(newColor);
			
		
	}
}
