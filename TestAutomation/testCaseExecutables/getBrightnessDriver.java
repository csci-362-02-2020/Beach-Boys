package testCaseExecutables;
import java.awt.Color;

public class getBrightnessDriver {
	public static void main(String[] args) {
		String input=args[0];
		float colorValue = ColorConverter.getBrightness(input);
		System.out.println("Bright value of " + input +  " = " + colorValue);
			
		
	}
}
