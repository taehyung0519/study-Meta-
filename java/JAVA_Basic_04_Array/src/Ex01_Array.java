/*
배열은 객체다 (Array)
1. new  를 통해서 생성 (주소값)
2. heap 메모리 생성 (관리자원)
3. 정적배열(고정배열) : 배열은 한번 선언하면 (크기가 정해지면) 변경 불가 < > 동적(Collection : API 클래스)
4. 자료구조(알고리즘) : 제어문(결합) : 기초적인 자료구조

*/

import kr.or.kosa.Emp;

class Car{
	
}
class Person{
	String name;
}

public class Ex01_Array {
	public static void main(String[] args) {
		
		//3가지 
		int[] arr = new int[5];  //heap
		int[] arr2 = new int[]{10,20,30,40,50};
		int[] arr3 = {10,20,30}; //생략 new 컴파일러가 new ....메모리
		
		//Tip)
		//const arr = [1,2,3,4,5];   let arr=[];  arr.push(10)
		//javascript  동적배열 ....
 	
		//객체 배열
		Car[] cararr = new Car[3];
		cararr[0] = new Car();
		
		
		//향상된 for문
		//JAVA : for(Type 변수명 : 배열 or 컬렉션) {}
		//C# : for(Type 변수명 in 배열 or 컬렉션) {}
		//Javascript : for(Type 변수명 in 배열) {}
		
		int[] arr4 = {5,6,7,8,9};
		for(int value : arr4) {
			System.out.println(value);
		}
		
		//Person 3명 만들어라
		Person[] persons = new Person[3];
		Person[] persons2 = {new Person(),new Person()};
		
		//사원 3명을 만드세요 (Array)
		//1000 , 김
		//2000 , 박
		//3000 , 이
		
		//결과를 개선된 for 사원의 사번 ,이름을 모두 출력하세요
		Emp[] elist = {new Emp(1000,"김"),new Emp(2000,"박"),new Emp(3000,"이")};
		for(Emp emp : elist) {
			emp.empInfoPrint();
		}
	}
}
