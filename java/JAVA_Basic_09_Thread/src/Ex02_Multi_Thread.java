/*
Thread : 프로세스에서 하나의 최소 실행단위(흐름) >>  method >> 실행되는 공간 stack

결과 : stack 여러개 생성해서 >> 동시에 함수를 실행 (실행가능하게 한다) >> cpu 점유 할 수 있는 상태로 만든다 

Thread 생성방법
1. Thread 클래스 상속 >> class Task extends Thread >> run 함수 구현
2. Runnable 인터페이스 구현 >> class Task implements Runnable >> run 추상함수 구현 
   Runnable 인터페이스 Thread 아니예요 >> 사용  >>  Thread thread = new Thread(new Task()) 

   ex) class Task extends Car ..implements Runnable
*/

class Tesk_1 extends Thread {
	@Override
	public void run() { // 함수는 Thread main 함수 역할 >> 새로운 stack 처름 올가가서 실행되는 함수
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("Task_1 " + i + this.getName());
		}
		System.out.println("Task_1 run() END");
	}
}

class Task_2 implements Runnable{  //Thread 아니예요 (run() 가지고 있는 클래스일 뿐)

	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("Task_2 " + i);
		}
		System.out.println("Task_2 run() END");

	}
	
}

public class Ex02_Multi_Thread {

	public static void main(String[] args) {
		//main Thread
		
		Tesk_1 th = new Tesk_1(); //Thread객체 생성
		th.start(); //POINT   새로운 stack 을 생성하고 run() 올리고 역할 끝
		
		Thread th2 = new Thread(new Task_2());
		th2.start();
		
		
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("main " + i);
		}
		System.out.println("main END");
		
		//익명 객체 (일회성)
		Thread th3 = new Thread(new Runnable() {
			
			@Override
			public void run() {
				for(int i = 0 ; i < 1000 ; i++) {
					System.out.println("Task_3 " + i);
				}
				System.out.println("Task_3 run() END");
				
			}
		});
		th3.start();
	}

}
