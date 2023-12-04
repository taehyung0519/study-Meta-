
public class Ex02_DataType {
	public static void main(String[] args) {
		//int (-21 ~ 21)
		int num = 100000000;
		System.out.println("num : " + num);
		
		//int num2 = 10000000000;
		//The literal 10000000000 of type int is out of range 
		// literal 개발자 직접 입력한 값 (있는 그대로의 값)
		
		//long num2 = 10000000000; // 개발자가 입력한 literal 범위 int 
		long num2 = 10000000000L; //
		
		long num3 = 100;
		//속지 않으려면 값을 보지 말고 타입을 보세요 (리터럴값)
		//long num3 = (long)100; 암시적 형변환  (컴파일러가 ...)
		//작은 타입 값을 큰 타입에 넣는 것은 당근 ^^
		
		//int num4 = (int)10000000000L;
		//Type mismatch: cannot convert from long to int
		//System.out.println(num4); //1410065408  손실 발생 또는 쓰레기값 
		long num4 = 10000000000L; //담는 그릇을 ...  리터럴 크기에 맞게 
		
		int num5 = (int)1000L; // 우연이도 ... 작은 값...
		//강제적 형변환
		//1. 데이터 손실 .... 쓰레기 가만 .... 
		//받는 타입(그릇) 크게 하자 ....
		
		//char 2byte >> 16bit > 유니코드 > 아스크 코드표 > 
		//유니코드(영어: Unicode)는 전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 산업 표준이다  
		//유니코드(Unicode)는 전 세계의 모든 문자를 다루도록 설계된 표준 문자 전산 처리 방식이다. 
	
		char ch = '가';
		//char ch2 = '가나';
		
		ch = 'a';
		ch = 'A';
		
		//char  정수 타입 호환
		int charint = ch;
		System.out.println("십진수 : " +  charint);
		
		char charint2 = 'a';
		System.out.println(charint2);
		int intchar = (int)charint2;  //개발자 직접 형변환 상관없다 .... 안써요 ....
		System.out.println(intchar);//97
		
		/*
		 1. 할당에 있어서 값을 보지말고 값이 가지는 타입을 보자
		 1.1 리터럴 값에 대해서
		 1.1.1 정수 리터럴의 기본 타입은 int >   100000 , 1000000 , 10000000000L
		 1.1.2 실수 리터럴의 기본 타입은 double
		 
		 2. 암시적 형변환 , 명시적 형변환
		 2.1 큰타입에 작은 타입의 값을 넣는 것은 암시적 형변환를 하기에 개발자 ...그냥 ...사용
		 2.2 작은 타입에 큰타입을 넣고자 한다면 자동 형변환을 지원하지 않기 때문제 강제적(명시적) 형변환
		 2.2.1  접미사 L , l ,   (int)정수 , (long)정수
		 KEY POINT 강제적 형변환  데이터 손실을 감수 .....  책임은 개발자가 져야 한다 .....
		 ex) char c = (char) int 범위값 .... 손실 발생... 
		 */ 
		
		//8가지 + String  (기본타입)
		//String 값타입 처럼 써도 문제 없어요 ...
		String name="홍길동";
		name = "홍길동바보";
		
		String color = "red";
		color = color + " 방가방가"; // + 산술 ,결합
		//오라클 :   + 산술 , 결합연산자 ||
		System.out.println(color);
		
		/*
		 var i; (x)
		  
		 let i;
		 i = 100 // 값이 들어오면 타입이 결정
		 const c;
		 */
		
		//java 특수문자 처리하기
		char sing = ' ';
		//이스케이프시퀀스 문자 : 특정 문자앞에 \  다음값은 데이터 인정 
		char sing2 = '\'';
		//quiz 홍"길"동 이라는 문자열을 출력하고 싶어요
		String username = "홍\"길\"동";
		System.out.println(username);
		System.out.println("100"+100); //100100
		System.out.println(100+"100");  //100100
		System.out.println(100+100+"100");//200100
		System.out.println(100+(100+"100"));//100100100
		System.out.println(100+"100"+100);//100100100
		
		//quiz "C:\Temp" 문자열을 출력 (String) 변수에 담아서
		String path = "C:\\Temp";//Invalid escape sequence (valid ones are  \b  \t  \n  \f  \r  \"  \'  \\ )
		System.out.println(path);
	
		//byte  네트워크 데이터 교환 , 파일처리 , 이미지 업로드  >> Array 처리
		//long  화폐
		
		//실수형
		//float  4
		//double 8 (정밀도 높다)
		//**실수 리터럴의 기본 타입 double
		
		//float f = 3.14;//3.14 리터럴 값은  double 그릇에 담겨져 있다
		//1.
		//float f = 3.14f; //데이터 손실
		//float f = (float)3.14;
		
		//여러분
		//받는 그릇 크게
		//float f = 3.14;
		double d = 3.14;
		float data = 1.123456789f;
		System.out.println(data); //1.1234568  반올림 
		
		double data2 = 1.123456789123456789;
		System.out.println(data2); //1.1234567891234568
		
		//** BigDecimal  검색 double 문제점..... 정밀한 수 표현
		
		double data3 = 100;
		System.out.println(data3); //100.0
		
		double data4 = 100;
		int number = 100;
		//data4 + number
		//int result2 = (int) (data4 + number); // 큰것을 작은것  데이터 손실
	
		double result2 = data4 + number;  //손실은 발생하지 않아요 ...
		
		/*
		 1.큰타입 + 작은 타입 연산 >> 큰타입
		 2. 타입간 변환 >> 변수가 가지고 있는 타입을 보자 (암시적, 명시적)
		 3. 명시적 (강제적) 데이터 손실을 가만하자
		 */
		int data5 = 100;
		byte b3 = (byte)data5; //명시적 강제적 형변환
		
		byte b4 = 20;
		int data6 = b4; //컴파일러가 내부적으로 형변환
		//int data6 = (int)b4;  //암시적 형변환
	}

}
