package testCaseExecutables;
import java.awt.Color;

public class rgb2hexDriver {
	public static void main(String[] args) {
		String input=args[0];
		Color c = Color.decode(input);
		System.out.println(ColorConverter.rgb2Hex(c));
			
		
	}
}
