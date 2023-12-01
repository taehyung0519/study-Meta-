/*

다형성 : 여러가지 성질 (상태) 를 가질 수 있는 능력
다형성 : 상속관계에서 존재
JAVA : [상속관계]에서 [하나의 참조변수]가 [여러개의 타입]을 가질 수 있는 것
[하나의 참조변수] >> 부모타입
[여러개의 타입]  >> 부모를 상속받은 자식 타입


*/
class Tv2{
	boolean power;
	int ch;
	
	void power() {
		this.power = !this.power; 
	}
	void chUp() {
		this.ch++;
	}
	void chDown() {
		this.ch--;
	}
}

class  CapTv extends Tv2 {
	String text;
	String captionText() {
		return this.text = "현재 자막 서비스 처리중 ...";
	}
}
public class Ex08_Inherit_Poly {

	public static void main(String[] args) {
		CapTv ct = new CapTv();
		ct.power();
		ct.chUp();
		System.out.println(ct.captionText());
		
		Tv2 tv2 = ct; //Today Point
		//상속관계에서 부모타입의 참조변수는 여러개의 자식타입의 참조주소를 가질 수 있다
		//단 부모는 [자신의 자원만 접근] 가능
		//단 재정의는 제외하고
		
		
				
		

	}

}
