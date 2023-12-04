class Pbase { 	int p = 100; }
class Cbase  extends Pbase { 	int c = 200; }
class Dbase  extends Pbase {                 }

public class Ex09_Inherit_Poly {
	public static void main(String[] args) {
		//상속관계에서 부모타입의 참조변수는 여러개의 자식타입 주소를 가질 수 있다(다형성)
		Cbase cbase = new Cbase();
		System.out.println(cbase.toString());
		
		//다형성
		Pbase pbase = cbase; //다형성
		       //xx   //xx
		Dbase dbase = new Dbase();
		pbase = dbase;
		
		//자식은 부모없이 드린다
		
		//down casting
		Cbase ccc =(Cbase)pbase;

	}

}
