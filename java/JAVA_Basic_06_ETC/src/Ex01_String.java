
public class Ex01_String {

	public static void main(String[] args) {
		String str = "AAA";
		String str2 = "AAA";
		
		System.out.println(str);
		System.out.println(str2.toString());
		System.out.println(str == str2);
		//문자열 비교
		System.out.println(str.equals(str2));
		
		String str3 = new String("BBB");
		String str4 = new String("BBB");
		System.out.println(str3);
		System.out.println(str4.toString());
		System.out.println(str3 == str4);
		System.out.println(str3.equals(str4));
		
		String s = "A";
		s+="B";
		s+="C";
		s="A";
		
	}

}
