/*
멀티 스레드 환경 (공유자원 ....)

synchronized (동기화)

Collection (Vetor , ArrayList)  비교

한강 : 화장실 , 비빕밥 축제

Vetor 동기화보장 > 멀티 스레드 환경 > 자원보호 > 화장실(lock) > 성능저하 ....
ArrayList 동기화 보다는 성능 보장 > 성능

한강 : 화장실 (공유자원)
사용하려는 사용자 (thread) : 10명 ... 10개의 thread >> 동시에 접근 

반대
한강 비빕밥 축제 : 사용하려는 사용자 (thread) : 10명 : lock 없이 ....
*/

class Wroom{
	//void openDoor(String name) { 동기화(x)
  synchronized	void openDoor(String name) {
		System.out.println(name + "님 화장실 입장 ^^");
		for(int i = 0 ; i < 100 ; i++) {
			System.out.println(name + " 사용중 " + i);
			if(i == 10) {
				System.out.println(name + "님 끙 @@");
			}
		}
		System.out.println("시원하시죠 ^^!");
	}
	
}

class User extends Thread {
	Wroom wr;
	String who;
	
	User(String name , Wroom wr){
		this.who = name;
		this.wr = wr;
	}
	
	@Override
	public void run() {
		wr.openDoor(this.who);
	}
}

public class Ex08_Sync_Thread {
	public static void main(String[] args) {
		//한강 둔치
		Wroom w = new Wroom();
		
		//사람들
		User kim = new User("김씨", w);
		User lee = new User("이씨", w);
		User park = new User("박씨", w);
		
		//배가 아파요
		kim.start();
		lee.start();
		park.start();
	}

}
/*
사례)
은행 ....
트랜잭션 : transaction : > 하나의 논리적인 작업 단위
begin tran
	A 계좌 인출
	B 계좌 이체
rollback
commit


동기화
카드 복제 : 5장
ATM 기기 .... 
동시에 1000만원 
한장의 카드 ... lock .........
*/