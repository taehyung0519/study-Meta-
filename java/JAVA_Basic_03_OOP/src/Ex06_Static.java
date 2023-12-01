
class Test2{
	static int cv = 1111;
	static int cv2; //default 0
	int iv=9;
	
	//초기화 블럭
	// {   } 일반자원 초기화 블럭
	
	// static {  }  static 자원 초기화 블럭
	
	static {
		//static 자원에 메모리에 올라간 직후 호출(자동)
		System.out.println("static 초기화 블럭");
		cv = 1111;
		cv2 = cv + 2222; //** 조작된 표현이 가능 **  (제어문)
		
	}
	
	{
		//일반 초기화 ....블럭  >> 생성자 더 좋아여...
		System.out.println("초기화 블럭 실행");
		if(iv < 10) iv= 10000;
	}
}

public class Ex06_Static {

	public static void main(String[] args) {
		
		Test2 t = new Test2();
		
		System.out.println(t.iv);
	}

}
