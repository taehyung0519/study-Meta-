/*
여러개의 Thread 가 있을때
우선순위 : default 5가 (생성되면 ...)
Min(1) ~ Max(10)

상대적으로 수치값을 올리면 CPU 점유할 수 있는 확율 높인다 
*/

class Pth extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("-------------------------");
		}
	}
}

class Pth2 extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("|||||||||||||||||||||||||||");
		}
	}
}

class Pth3 extends Thread {
	@Override
	public void run() {
		for(int i = 0 ; i < 1000 ; i++) {
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		}
	}
}
public class Ex09_priority {

	public static void main(String[] args) {
		Pth  pth = new Pth();
		Pth2 pth2 = new Pth2();
		Pth3 pth3 = new Pth3();
	    
		pth.setPriority(10); //먼저 end
		pth2.setPriority(1);
		pth3.setPriority(1);
		
		System.out.println(pth.getPriority());
		System.out.println(pth2.getPriority());
		System.out.println(pth3.getPriority());
		
		pth.start();
		pth2.start();
		pth3.start();
	}

}
