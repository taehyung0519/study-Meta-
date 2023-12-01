//연산자 , 제어문
public class Ex03_Operation {
	public static void main(String[] args) {
		//증가감 연산자
		//++ . --
		//Point 증가감 연산자가 다른 연산과 결합되면
		
		int i = 5;
		int j = 10;
		int result = i + ++j;
		System.out.println(result);
		//j > 11
		result = i + j++;
		System.out.println(result);
		System.out.println(j);
		
		/*
		  byte + short >> 내부적으로 컴파일러가 int + int
		  char + char  >> int + int
		  int 보다 작은 정수타입은 >> int 바꾸어서 연산 처리
		  
		  정수 long  예외
		  char + int >> int
		  int + int  >> int
		  int + long >> long
		  
		  정수 + 실수 >> 타입 크기의 상관없어 실수가 승자

		 */
		int sum = 0;
		for(int k = 0 ; k <= 100 ; k++ ) {
			if(k % 2 == 0) {
				sum+=k;
			}
		}
	
		System.out.println(sum);
		
		
		if(10 == 10.0f) {
			System.out.println("true");
		}else {
			System.out.println("false");
		}
	
		//삼항연산자
		int p = 10;
		int p2 = -10;
		int result2 = (p == p2) ?  p : p2;
		
		//javascript  ===  타입 하고 값으면   true
		
		
		int x = 3;
		int y = 5;
		//비트연산  OR
		System.out.println((x | y));
		/*
		 256 128 64 32 16 8 4 2 1  
		                  0 0 1 1  >> 3
		                  0 1 0 1  >> 5
		                  0 1 1 1  >> OR
		                  4+2+1    >> 7  
		  
		 */
		
		/*
		 &&  and  연산   
		 ||  or   연산
		 if(10 > 0 && -1 > 1 && 100 > 2 && 1 > -1){} 
		 if(10 > 0 || -1 > 1 || 100 > 2 || 1 > -1){} 
		 */
		
		int data=90;
		switch(data) {
		  case 100: System.out.println("100");
		  case 90 : System.out.println("90");
		  case 80 : System.out.println("80");
		  default : System.out.println("default");
		}
		
		data=90;
		switch(data) {
		  case 100: System.out.println("100");
		  	break;
		  case 90 : System.out.println("90");
			break;
		  case 80 : System.out.println("80");
			break;
		  default : System.out.println("default");
		}
		
		int month=3;
		String res="";
		switch(month) {
		case 1 :
		case 3 :
		case 5 :
		case 7 :
		case 8 :
		case 10 :
		case 12 : res="31일";
			break;
		case 4 :
		case 6 :
		case 9 :
		case 11 :res="30일";
			break;
		case 2 : res ="29일";
			break;
		default : res = "월이 아니다";
		}
		
		//난수 (랜덤값 , 임의의 추출값) 을 얻기를 원해요
	    //쉬운방법 : 구글 검색 (친절하게)
	    //자바를 만들이는 자습서 (API 문서) 자원에 설명과 사용방법 (영어)
	    //https://docs.oracle.com/javase/8/docs/api/index.html   검색
	    //패키지 기준 (폴더별로 자원을 모아 모아 ...)
	    //java.lang.Math  클래스 활용하면 여러가지 수학적인 기능 사용 ...
	    //import java.lang.*; 생략 .. default open ...
	    
	    //public static double random();
	    //double greater than or equal to 0.0 and less than 1.0
	    //결과 : 0.0 <= random < 1.0
	      System.out.println("Math.random() : " + Math.random()); 
	      System.out.println("Math.random() * 10: " + (Math.random()) * 10);  //0~9
	   	   //(int)(Math.random() * 10) + 1
	      System.out.println((int)(Math.random() * 10) + 1); //1 ~ 10 까지 난수 (중복값 나와요)
		
	      
	  /*
	  	  
	   우리는 백화점 경품 시스템을 만들려고 한다
 	   경품 시스템은 나오는 점수에 따라 경품을 지급하는 시스템이다
       경품 추첨시 1000 점수가 나오면
       경품으로 TV , NoteBook , 냉장고 , 한우세트 , 휴지
       경품 추첨시 900 점수가 나오면
       경품으로  NoteBook , 냉장고 , 한우세트 , 휴지
       경품 추첨시 800 점수가 나오면
       경품으로  냉장고 , 한우세트 , 휴지
       경품 추첨시 700 점수가 나오면
       경품으로  한우세트 , 휴지
       경품 추첨시 600 점수가 나오면
       경품으로  휴지
       그외 점수는 100 ~ 500 까지는 칫솔 
       경품시스템의 점수 범위는 100 ~ 1000 점까지 한정되어 있다
       사용자가 경품 시스템을 사용시 랜덤하게 100 ~ 1000까지의 값이 나오게 되어 있습니다.
       
       프로그램을 한번 실행하면 그 때 랜덤값이 나오고 그 랜덤값에 의해서 경품을 출력하면 되요 
	   */
	      int jumsu = ((int)(Math.random()* 10) + 1)*100;
		  String msg="";//초기화
		  msg+= "고객님의 점수는 :" + jumsu + " 이고 상품은 : ";
		  switch(jumsu) {
		  	case 1000:msg+="Tv"; //연산자 학습
		  	case 900:msg+="NoteBook ";
		  	case 800:msg+="냉장고 ";
		  	case 700:msg+="한우 ";
		  	case 600:msg+="휴지 ";
		  	         break;
		  	default:msg+="칫솔";     
		  }
		  System.out.println(msg);  
	      
	}

	
}
