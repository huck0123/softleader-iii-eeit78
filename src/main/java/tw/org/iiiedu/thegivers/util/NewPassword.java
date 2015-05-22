package tw.org.iiiedu.thegivers.util;

public class NewPassword {
	
	public String createPassword(){
		String[] array = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
				"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
				"W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h",
				"i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
				"u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
				"6", "7", "8", "9" };

		String str = "";
		for (int t = 0; t < 6; t++) {
			double d = Math.random() * 61;
			Long l = Math.round(d);
			int i = l.intValue();
			str += array[i];
		}
		return str;

	}
}
