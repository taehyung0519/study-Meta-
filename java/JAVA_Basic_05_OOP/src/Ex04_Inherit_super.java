/*
객체 한개만 가지고 놀때는
this : 객체 자신을 가르키는 this (this.emno , this.ename)
this : 생성자를 호출하는 this ( this(100,"red"))

상속관계
부모 , 자식 

super(상속관계에서 자식이 부모의 자원 접근 하는 주소제공) : 상속관계에서 부모에 접근 (super)

1. super : 상속관계에서 부모자원에 접근
2. super : 상속관계에서 부모의 생성자를 호출

Tip)
C# : base()
JAVA : super()

*/

class Base{
	String basename;
	Base(){
		System.out.println("부모 클래스 기본 생성자");
	}
	Base(String basename){
		this.basename = basename;
		System.out.println("basename : " + this.basename);
	}
	
	void method() {
		System.out.println("부모 method");
	}
}

class Derived extends Base {
	String dname;
	Derived() { //생성자
		System.out.println("자식 클래스 기본 생성자");
	}
	Derived(String dname){
		
		//부모 생성자 호출 (super)
		super(dname); //부모도 생성자 호출
		this.dname = dname;
		System.out.println("dname : " + this.dname);
	}
	
	@Override
	void method() {
		// TODO Auto-generated method stub
		//super.method();
		System.out.println("부모함수 재정의");
	}
	
	void pMethod() {
		//부모자원을 사용하고 싶다면
		//자식객체의 함수 안에서 super 사용
		super.method();
	}
	
}
public class Ex04_Inherit_super {

	public static void main(String[] args) {
		Derived d = new Derived("홍길동");
		d.method();

		//부모가 그리워서
		d.pMethod();
	}

}
