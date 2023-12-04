import kr.or.kosa.Bird;

class Bi extends Bird{

	@Override
	protected void moveFast() {
		super.moveFast(); //public 상속관계
	}
	
	//movefast() >> 재정의 (사용시)

}

class Ostrich extends Bird {
	//특수화 , 구체화
	void run() {
		System.out.println("run....");
	}

	@Override
	protected void moveFast() {
		// TODO Auto-generated method stub
		run();
	}
	
	
}

public class Ex07_Inherit_Protected {

	public static void main(String[] args) {
		Bi bi = new Bi();
		bi.fly();
		bi.moveFast(); 
		
		Ostrich o = new Ostrich();
		o.moveFast();

	}

}
