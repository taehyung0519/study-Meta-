import kr.or.kosa.Person;

class Test{
	int i;
	int j;
	void print() {
		System.out.println(i);
	}
}

public class Ex01_Ref_Type {
	public static void main(String[] args) {
		//값타입 - 참조타입(주소) : class 타입 , Array , String ....
		
		Test test = new Test();
		test.print();
		
		Person person;
		person = new Person(); //생성자 함수 호출 ...
		person.name= "김유신";  //직접할당 ....
		person.age = 100;
		person.power = true;
		person.personPrint();
		
		System.out.println(person); //kr.or.kosa.Person@7a79be86
		System.out.println(person.toString());//kr.or.kosa.Person@7a79be86
		
		Person person2 = new  Person();
		System.out.println(person == person2); //같은 주소가 아니야
		
		Person person3 = person; //주소값 할당
		//동거 ....
		System.out.println(person == person3); 
	
		// 클래스 == 설계도 == 데이터 타입(사용자)
	}

}
