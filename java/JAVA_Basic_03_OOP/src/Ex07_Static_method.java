/*
설계도
static member field : 객체간 공유자원 
static method : public static void run() .....

1. 객체 생성 없이 사용할려고
2. 편하게 .. 빠르게 ...
3. 많이 사용하니까  ... 
4.  설계도 : 자원은 많이 사용할 것 같아 (기능 .....)
5. 자원 많이 > 편하게 > new > static 설계 ....
*/

class StaticClass{
	int iv;
	
	static int cv;
	
	static void print() {
		//static 자원 
		//iv = 10; 일반자원 접근 불가
	}
	
	void printIv() {
		//일반함수
		//일반자원 + static 자원 모두 사용
		cv = 100;
		iv = 200;
	}
}


public class Ex07_Static_method {

	public static void main(String[] args) {
		System.out.println();

	}

}
