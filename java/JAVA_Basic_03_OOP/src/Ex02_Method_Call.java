import kr.or.kosa.Tv;

/*
기능 (행위) 만드는 방법
method 만드는 방법(문법)

method : 행위 또는 기능의 최소단위 구현 : [하나의 함수]는 [하나의 기능]만 구현
ex)  먹는 기능 , 자는 기능 

ex) 롯데월드 : 게임방 : 동전 (농구) , 동전 뽑기 (포켓몬)

** 모든 함수는 호출에 의해서만 동작한다 **
누군가 이름을 부르지 않으면 동작하지 않는다 

JAVA)
1. void , parameter(0) : public void print(String str) { 실행구문 }
2. void , parameter(x) : public void print() { 실행구문 }  공짜
3. return type , parameter(0) : public int print(int data) { return 100; }
3. return type , parameter(x) : public int print() { return 100; }

void  > 돌려주는 것이 없어요 > return type 없어요
return type >> 8가지 기본 + 1(String) , Array , class , interface , Collection
이 중에서 8가지 + String + class 학습

void print(int i , int j , int k)
print(10);(x)
print(10,20);(x)
print(10,20,"30");(x)
print(10,20,30);(0)

class Car {}

void print(Car c){}  //Car 타입을 가지는 객체의 주소 

print(new Car());

Car c  = new Car();
print(c)

함수 이름 길게 .....

사원테이블에서 사원의 모든 정보를 가지고 오는 함수
void getEmpAllList()

void getEmpListByEmpno()
*/

class Fclass{
	
	private int subSum(int i) { //의도 :  클래스 내에서만 ... 공통, 다른 도와주는 함수
		return i + 100;
	}
	
	/*
	 함수를 생성하는데
	 정수타입의 parameter  2개를 받아서 둘중에 큰 값을 리턴하는 함수를 만드세요
	 ex) max(10,5) return 10이 반환되면 됩니다 
	 //100 , 90 , 60
	  
	 */
	//30점 구현상에 문제는 없어요
		 //함수 구현시 유지보수 측면에서  return 을 최소화
		 /*
		 public int max(int a , int b) { 
		  		 if(a > b) {
		  		 	return a; 
		  		 }else { 
		  		 	return b; 
		  		 } 
		  }
		  */
		  //60점
		 /*
		  public int max(int a , int b) { 
		  		 int result=0;
			     if(a > b) {
		  		 	result = a;
		  		 }else { 
		  		 	result = b;
		  		 } 
		  		 return result; //return 1개 ...
		  }
		  */
		  //90점
		  /*
		  public int max (int a , int b) {
			  int max = (a > b) ? a : b;
			  return max;
		  }
		  */
		  //100점
		  public int max (int a , int b) {
			  return (a > b) ? a : b;
		  }
}

public class Ex02_Method_Call {

	public static void main(String[] args) {
		Tv tv = new Tv();
		tv.brandname ="삼성";
		tv.ch_Up();
		tv.ch_Up();
		tv.ch_Up();
		tv.tvInfo();
		tv.ch_Down();
		tv.tvInfo();
		
		
	}

}
