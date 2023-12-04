/*
Collection FrameWork
[다수의 데이터]를 다루는 [표준화된 인터페이스]를 구현하고 있는 [클래스 집합]

Collection 인터페이스  >> 상속 List >> 구현 ArrayList
Collection 인터페이스  >> 상속 Set  >> 구현 HashSet

* ArrayList 의 부모타입은 List 이다 (0) >> 다형성
* Collection 인터페이스는 ArrayList 부모타입니다 (0) 
* instanceof 검증

Map 인터페이스 (key , value) 쌍의 배열 >> 구현 HashMap


1. List (줄을 서시오) 
순서가 있는 데이터 집합(번호표) ... 중복 허용 >> 순서(0),중복(0) 데이터 집합
>> Tip) Array 관리 >> [홍길동][홍길동][홍길동][][] >> [0] 번째 방 ... 단점.... 

1.1  Vector   (구버전) -> 동기화 보장 (0)  >> Lock default
              Vector (화장실) -> 멀티 스레드 환경(Lock) -> 성능(x), 보안(0)
1.2  ArrayList(신버전) -> 동기화 보장 (x)  >> Lock option
              ArrayList (비빕밥) -> 멀티 스레드 환경(Lock) -> 성능(0), 보안(x) 
Vector 유지보수,학습용
ArrayList 활용

----------------------------------------------------------------------
다수의 데이터를 다루는 방법 (Array >> 정적 ,고정
*******방의 개수가 한번 정해지면 (방의 크기는 변경 불가) ***********
1. int[] arr = new int[5];
2. int[] arr2 = new int[]{10,20,30};
3. int[] arr3 = {100,200,300};
arr3 놀고 있는데 데이터가 100건이 추가
int[] arr4 = new int[100];  
******새로운 배열 생성하고 데이터 이동 (코드로 직접 개발자 구현)********

Array 
1. 배열의 크기가 고정 : Car[] cars = {new Car(), new Car()}  2개
2. 접근방법   (index) >>  cars[0] ,,,, n(length-1)

List 인터페이스를 구현하고 있는 ArrayList , Vector는 
1. 배열의 크기가 동적으로 확장 or 축소 가능 >> ** 진실은 컴파일러가 새로운 배열을 만들고 데이터 이동 ...**
2. 순서를 유지 (내부적으로 Array) 사용 , 중복값 허용
3. 중복값 허용 (index 를 통해서 제어)
*/

import java.util.ArrayList;
import java.util.List;

import kr.or.kosa.Emp;

public class Ex01_ArrayList {

	public static void main(String[] args) {
		//사원 2명을 만들어라
		List list = new ArrayList();
		list.add(new Emp(100,"김씨","IT"));
		list.add(new Emp(200,"박씨","IT"));
		
		for(int i = 0 ; i < list.size() ; i++) {
			Object obj = list.get(i);
			Emp emp = (Emp)obj;
			System.out.println(emp.getEmpno() + " / " + emp.getEname());
		}
		
		//Generic (제너릭) : 타입 강제 
		List<Emp> list2 = new ArrayList<Emp>();
		list2.add(new Emp(1,"A","IT"));
		for(Emp e : list2) {
			System.out.println(e.getEmpno() + "/" + e.getEname());
		}
	}

}





