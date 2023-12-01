
class Thread_1 implements Runnable{
	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName() + " ");
	}

}


public class Ex07_Thread_Join {
	public static void main(String[] args) {
		
		Thread th1 = new Thread(new Thread_1());
		Thread th2 = new Thread(new Thread_1());
		Thread th3 = new Thread(new Thread_1());
		Thread th4 = new Thread(new Thread_1());
		Thread th5 = new Thread(new Thread_1());
		
		th1.start(); //거리
		th2.start(); //거리
		th3.start(); //거리
		th4.start(); //거리
		th5.start(); //거리
		
		//목성(거리) , 토성(거리) , 금성(거리) >> 총 거리의 합 
		//총 거리의 합 (목성, 토성, 금성 거리 구한 다음 마지막 실행)
		
		//main thread 는 5개의 .... 마지막
		try {
			 th1.join(); //main thread 에게 내가 끝날때 까지 기다려
			 th2.join(); //main thread 에게 내가 끝날때 까지 기다려
			 th3.join(); //main thread 에게 내가 끝날때 까지 기다려
			 th4.join(); //main thread 에게 내가 끝날때 까지 기다려
			 th5.join(); //main thread 에게 내가 끝날때 까지 기다려
		} catch (Exception e) {
			
		}
		System.out.println("main end");
	}

}
