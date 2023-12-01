/*
프로그램 >> 실행  >> 프로세스 >> 최소 하나의 Thread (최소 하나의 stack 메모리)
>> JVM  >> Thread 하나 생성 (stack) >> main 할당 

지금까지 >> 싱글 프로세스 >> 싱글 쓰레드 >> main 함수만 실행 >> 하나의 stack
*/
public class Ex01_Single_Thread {
	public static void main(String[] args) {
		System.out.println("일꾼_1");
		
		worker();
		worker2();
	}
	static void worker() {
		System.out.println("일꾼_2");
	}
	static void worker2(){
		System.out.println("일꾼_3");
	}
}
