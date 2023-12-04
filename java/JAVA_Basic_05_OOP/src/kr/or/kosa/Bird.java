package kr.or.kosa;

public class Bird {
	//공통기능
	public void fly() {
		System.out.println("flying");
	}
	//설계자 고민
	//Bird 상속하는 당신은 moveFast() 자원에 대해서 재정의 해서 써야해 ...강제....
	protected void moveFast() {
		fly();
	}
}
