package testCaseExecutables;
import java.awt.Color;

public class hex2rgbDriver {
	public static void main(String[] args) {
		String input=args[0];
		Color newColor = ColorConverter.hex2Rgb(input);
		if(newColor == null) {
			System.out.println("null");
		}else {
			int redValue=newColor.getRed();
			int greenValue=newColor.getGreen();
			int blueValue=newColor.getBlue();
			System.out.println("Red Value: "+redValue+"; Green Value: "+greenValue+"; Blue Value: "+blueValue);
		}		
		
	}
}
