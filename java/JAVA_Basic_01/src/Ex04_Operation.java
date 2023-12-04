import java.util.Scanner;

public class Ex04_Operation {
	public static void main(String[] args) {
		
		/*
		 for
		 while
		 do ~ while 일단 한번은 강제적으로 수행 ... 그 다음 조건을 보고 판단
		 메뉴 구성
		 do{실행블럭} while(조건판단)
		 메뉴 구성 
		 점심 메뉴를 선택하세요
		 1. 짜장
		 2. 짬뽕
		 3.....
		 입력 .....
		  
		 */
		Scanner sc = new Scanner(System.in);
		int inputdata = 0;
		do {
			System.out.println("숫자 입력 (0-9)");
			inputdata = Integer.parseInt(sc.nextLine());
			
		}while(inputdata >= 10);  //조건 결과가 true do 문 실행
		                          // 9 >= 10 false do 탈출  
		System.out.println("당신이 입력한 숫자는 : " +  inputdata);
		
		/*
		//메뉴를 보여주고 사용자에 선택 ....
		//원하시는 메뉴를 선택하지 않으면 강제로 다시 메뉴를 보여 주세요
		
		//1.예금
		//2.출금
		//3.잔고
		//4.종료
		
		
		//잔액 변수를 생성 (balance)
		//예금 처리  + 누적
		//출금 처리  - 누적
		//잔고      balance  출력
		//종료      프로그램 끝 (함수의 종료  , 프로그램의 강제 종료) 
		//return 함수 ....System.exit(0) ..... 논리 종료 
		// while(true) { 특정조건  break ...}   

		*/
		
		Outter: for(char upper='A'; upper<='Z'; upper++) {
  					for(char lower='a'; lower<='z'; lower++) {
  							System.out.println(upper + "-" + lower);
  								if(lower=='g') {
  												break Outter;
  								}
  						}
				}
		System.out.println("프로그램 실행 종료");
	}

}



