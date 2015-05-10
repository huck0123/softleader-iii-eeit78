package tw.org.iiiedu.thegivers.util;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

public class IdCheck {

	String Id;
	boolean b;

	public IdCheck(String Id, boolean b) {
		this.Id = Id;
		this.b = b;
	}

	public boolean IdVerify() {

		if(Id.length()!=10){
			return false;
		}
		
		Id = Id.toUpperCase();
		char[] ch = Id.toCharArray();

		if (b == true) {
			if((ch[1]-48) != 1){
				return false;
			}
		}
		if (b == false) {
			if((ch[1]-48) != 2){
				return false;
			}
		}		

		Map<Character, Integer> map = new HashMap<>();
		map.put('A', 10);
		map.put('B', 11);
		map.put('C', 12);
		map.put('D', 13);
		map.put('E', 14);
		map.put('F', 15);
		map.put('G', 16);
		map.put('H', 17);
		map.put('I', 34);
		map.put('J', 18);
		map.put('K', 19);
		map.put('L', 20);
		map.put('M', 21);
		map.put('N', 22);
		map.put('O', 35);
		map.put('P', 23);
		map.put('Q', 24);
		map.put('R', 25);
		map.put('S', 26);
		map.put('T', 27);
		map.put('U', 28);
		map.put('V', 29);
		map.put('W', 32);
		map.put('X', 30);
		map.put('Y', 31);
		map.put('Z', 33);

		int i, sum = 0, ans;

		sum = map.get(ch[0]) / 10 + map.get(ch[0]) % 10 * 9;

		for (i = 1; i <= 8; i++) {
			sum += (ch[i] - 48) * (9 - i);
		}
		sum += (ch[9] - 48);
		ans = sum % 10;
		if (ans == 0) {
			return true;
		} else {
			return false;
		}
	}

}
