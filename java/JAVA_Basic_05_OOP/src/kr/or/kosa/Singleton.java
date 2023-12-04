package kr.or.kosa;
/*
디자인 패턴 (생성에 관련되 이야기) : new 

싱글톤 : 객체 하나를 만들어 공유
의도  : 하나의 객체를 공유하는 보장성 코드를 만들어라

Singleton s = new Singleton();
Singleton s2 = new Singleton();

*/



public class Singleton {
	private static Singleton p;
	private Singleton() {
		
	}
	public static Singleton getInstance() {
		if(p == null) {
			p = new Singleton(); //생성자 함수 호출 ( 클래스 내부에서 private , public)
		}
		return p;
	}
	
}



















