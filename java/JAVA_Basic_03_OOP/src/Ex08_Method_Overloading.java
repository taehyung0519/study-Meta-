/*
OOP 객체 지향 프로그래밍 (여러개의 작은 조각(작은 설계도)만들어서 조합(큰 설계도)하는 행위)
>> 설계도를 재사용 

1. 상속 (재사용성)
2. 캡슐화 (은닉화) : private ..setter ,getter (직접 할당을 막고 ...간접할당을 통해 데이터 보호)
3. 다형성 : 하나의 타입으로 여러개 객체의 주소를 가질 수 있는 것

>> method >> overloading (오버로딩) method
>>하나의 이름으로  여러가지 기능을 하는 함수 
>> System.out.println(); 이름은 1개 .. 기능 여러개(함수 parameter  개수 , 타입)
>> printlnchar() , printlnString() , printlnBool()
1. 오버로딩을 사용하면 성능 향상 (x)
2. 편하게 사용할려고 ... 개발자가 편하게 >> 설계자가 배려 (개발자)
3. 오버로딩을 사용하지 않아도 문제 되지 않는다 

문법)
1. 함수의 이름은 같고 parameter  [개수] 와 [타입]을 달리 ...
1.1 함수의 이름 동일
1.2 parameter  개수 타입을 달리한다
1.3 return type 오버로딩의 판단 기준이 아니다 
1.4 parameter  의 순서가 다름을 인정  (0) 
ex)  m(int i, String s) ,  m(String s , int i)

*/

class Human{
	String name;
	int age;
}

class OverT{
	int add(int i) {
		return 100 + i;
	}
	//void add(int i2) {
		
	//}
	
	void add(String s , int i) {
		
	}
	void add(int i ,String s ) { //순서가 다름을 인정
		
	}
	
	void add(Human human) {
		
	}
}
public class Ex08_Method_Overloading {

	public static void main(String[] args) {
		System.out.println();

	}

}
