/*
DB >  Emp(... deptno(fk))  .... Dept (deptno(pk),dname,loc) : master detail

user (사용자)    provider (제공자)

class A {}
class B {}

관계 : A는 B를 사용합니다
1. 상속 : A extends B
2. 포함 : A 라는 클래스가 B를(member field(부품)) 사용   class A {B b;}
2.1 부분 (생명주기: 동일하지 않아요))
2.2 전체 (생명주기: 동일)) 

class B {}
class A {
  int i;
  //A는 B를 사용합니다 (포함)
  B b;
  A(){
      b = new B();
  }
}
>> main(){
   A a = new A();
   a = null;
   //A , B 같은 운명 공동체
}
 
포함관계 (위 예제)
B는 독자생성 가능 >> A라는 객체가 생성되면 B생성
운명공동체 (전체집합)
>> 자동차와 엔진 , 노트북과 CPU

class B{
}
class A{
   int i;
   B b;
   A(){   }
   //method
   void method(B b){
   	  this.b = b;
   }
}
>> main(){
  A a = new B();
  B b = new B();
  //필요에 따라서
  a.method(b);
  //같은 운명이 아니다
  //부분집합
  //노트북과 마우스 , 학교  학생
}

A는 B를 사용합니다(참조) >> 포함 >> A가 B를 member field >> 생성(전체) , 따로(부분)


그리고 의존 (함수안에서) create , local , parameter


*/
public class Ex15_User_Provider {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
