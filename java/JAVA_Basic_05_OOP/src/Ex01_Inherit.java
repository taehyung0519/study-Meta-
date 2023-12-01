import kr.or.kosa.Emp;
/*
OOP 특징 (여러개의 조각(작은)(클래스) 들을 조립해서 하나의 큰 그림을(제품)을 만드는 행위
설계도 : 메인 설계도의 부분 설계도 , 메인 설계도의 하위 설계도 , 별도 독립적인 설계도 ....

1. 상속
2. 캡슐화(은닉화) >> private 
3. 다형성 (상속관계에서 부모타입이 자식타입의 주소를 가질 수 있다)

상속
JAVA : child extends Base
C#   : child : Base

특징
1. 다중 상속 불가 (단일 상속 원칙 >> 계층적 상속)
2. 계층적 상속(여러개의 클래스를 상속)
3. 다중 상속 지원은 interface 만 (표준, 약속 , 규칙 , 규약)을 정의하고 있는 클래스 

상속 
1. 진정한 의미 : 재사용성 
2. 단점 : 비용 (초기 설계 비용)      ...부모 자식 관계 (커플링) >> 느슨한 관계를 좋아해요 
3. 재사용성 >> 설계 >> 시간 >> .... 재사용성 높아져서 ... 

모든 클래스는 메모리에 올라가야 사용가능 하다

Child child = new Child();



GrandFather >> Father >> Child

사용자가 만드는 모든 클래스는  default (명시하지 않아도) : Object 상속한다
class Car extends Object 생략 
Object  >> Root >> 최상위 >> 모든 클래스의 부모 >> 단군
*/

class GrandFather {
	public int gmoney=5000;
	private int pmoney = 10000;
}
class Father extends GrandFather {
	public int fmoney=1000;
}
class Child  extends Father{
	public int cmoney=500;
}

public class Ex01_Inherit {

	public static void main(String[] args) {
		/*
		Emp emp = new Emp();
		emp.setEmpno(100);
		System.out.println(emp.getEmpno());
		
		Emp emp2 = new Emp(2000);
		*/
		Child child = new Child();
		
	}

}
