/*
생성자 함수(constructor)
1. 특수한 목적 함수
2. 목적( member field  초기화) >>  static {} ,  { 초기자 블럭 }

3. 일반 함수와 다른점
3.1 함수 이름이 고정(class 이름 동일)
3.2 return type 없어요 (객체 생성과 동실 호출) (return 을 받을 대상이 없다)
3.3 실행시점 > new 객체 생성 > heap 객체 생성 > member field 자리 > 자동으로 생성자 함수 호출
3.4 return type(x) >> void >> public void(생략) 클래스 이름 >> public 클래스이름(){}

4. 왜 만들까 : [생성되는 객체]마다 [강제적]으로 member field 초기화 하고 싶다

class Car { String color; }
>> 설계도를 만든이는 자동차 색상은 니가 알아서 해  (안해도 어쩔 수 없어)

class Car {String color="blue"}
>> 객체를 생성하면 무조건 자동차의 blue

문제) 자동차의 색상을 정하지 않고 출고
설계도를 사용하는 사람이 자동차를 만들때 색상을 넣지 않으면 출고 안되게 하고 싶어요
>> 생성자 설계 강제하지 않으면 객체 안 만들어 져요

5. 생성자 함수 1개 만들까 .... 
6. 생성자 함수는 overloading 가능 (강제 구현) ** Today Point
****  생성자 함수를 쓰는 가장 중요한 목적은  member field [강제적]  초기화

*/
class Car{
	String carname="포니";
	//구현하지 않으면  컴파일러가 자동 >> 생성자를 만든다
	//Car(){}  default ...
	Car(){
		System.out.println("기본 생성자");
	}
}
class Car2{
	String carname;
	Car2(){
		
	}
	Car2(String name){
		carname = name;
	}
}

class Car3{
	String carname;
	
	//overloading 생성자 >> 강제성
	Car3(String name){ // overloading 생성자 함수가 하나라도 있다면 ... default 자동 생성 안되요
		carname = name;
	}
}

//옵션 다양한 .... 자동차 판매점 , 노트북 판매점 .... 여러 옵션 (강제)
/*
자동차 영업소 입니다.
영업사원은 고객에게 자동차를 팔려고 합니다.
고객은 자동차의 기본 사양을 살 수 도 있고 ....  여러가지 선택 옵션을 선택 할 수 있습니다.
자동차의 기본은
문의 개수 4개 , 자동차의 색상 기본은 red  4개가 기본 입니다
그런데 고객은
문의 개수만 변경 가능하고  자동차의 색상 기본은 red  으로 할 수 있고
문의 개수는 기본으로 하고 자동차의 색상 변경 가능하고
문의 개수와 자동차의 색상 모든 변경 하여 차를 구매할 수 있습니다

자동차 구매
1. 기본 사양  
2. 옵션 : 문 변경 , 자동차의 색상 기본
3. 옵션 : 자동차의 색상 변경 , 문 기본
4. 옵션 : 자동차의 색상 변경 , 문 변경
*/

class Car7 {
	String carcolor;
	int door;
	
	public Car7() {
		carcolor="blue";
		door=4;
	}
	public Car7(int num) {
		carcolor = "blue";
		door = num;
	}
	public Car7(String color) {
		carcolor = color;
		door = 4;
	}
	public Car7(int num , String color) {
		carcolor=color;
		door = num;
	}
}
public class Ex09_Constructor {

	public static void main(String[] args) {
		Car car = new Car();
		
		//Car3 car3 = new Car3();
		Car3 car3 = new Car3("강제이름");
		
		Car7 car7 = new Car7(1, "pink");
	}

}
