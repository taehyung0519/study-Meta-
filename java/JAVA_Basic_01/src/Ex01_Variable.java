//클래스 == 설계도 == 데이터 타입
import kr.or.kosa.Emp;
class Test{
	int data; //instance variable 
}

public class Ex01_Variable {
	public static void main(String[] args) {
		int value;
		value = 100; //초기화 , 할당
		
		int age = 99; //선언과 할당을 동시에 ...
		
		//초기화 정의 : 변수의 초기화 : 변수가 처음 값을 갖는 것 (할당을 통해서)
		
		Test test = new Test();
		System.out.println(test.data);
		
		Emp emp; //emp라는 지역변수는  Emp 클래스 객체의 주소를 받을 준비 ....
		emp = new Emp();
		emp.setEmpno(100);
		int empnodata = emp.getEmpno();
		System.out.println(emp);//kr.or.kosa.Emp@5e91993f
		Emp emp2 = emp;
		System.out.println(emp2 == emp);
	
		int a,b,c; 
		//같은 타입 나열 > 개발자 > array  > int[] a;
		//초기화 ...
		a = 100;
		b = 200;
		c = 300;
		
		//int age = 200;  같은 지역 같은 변수 안되용 ....
		
		int result = a + b;
		
		int k = 100;
		int y = k;
		y = 200;
	}

}
/*
블럭주석

클래스 == 설계도 == 데이터 타입 명제는 ^^

클래스의 종류
1. class Car {} > main 함수를 가지고 있지 않은 클래스 > 독자적인 실행이 불가능 > 다른 클래스에 도움을 주는 클래스(lib)
2. class Car { public static void main(String[] args){} } > main함수를 가지고 있는 클래스 > 독자적인 실행 가능
3. 현재는 main 함수를 가지고 있는 클래스가 있어야 결과를 확인 할 수 있다
4. public static void main(String[] args) >> static (new 없이도 메모리에 생성) >> 함수의 이름 (main) :시작점,진입점 >> 약속

TIP)
C# 코드 >> class Car { public static void Main(String[] args){} }

변수 : variable
데이터 (자료) 담을 수 있는 공간(메모리)의 이름
공간(크기) >> 데이터 타입(자료형) >> 메모리의 공간이 한정 >> 최소한의 공간 최대한 데이터 표현
int data =100;


변수가 선언되는 위치(scope : 유효범위)
1. instance variable : 객체변수(클래스안에)  >> class Car { public int door;}
2. local variable : 지역변수 (함수안에)     >> class Car { public void run(){ int data=0; } }
3. static variable : 공유자원 (객체간)     >> class Car {public static int num;}
4. 함수안에 있는 제어블럭 안에 있는 변수 (if , for) 블럭변수 >> class Car {  void run(){ for(int i=0...  }  for(int i=0...  }   }
*/
