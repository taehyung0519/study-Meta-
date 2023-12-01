/*
게임 : 유닛(unit)

unit : 공통기능(이동좌표 , 이동 , 멈춘다) : 추상화 ,일반화
unit : 이동방법은 다르다 (이동방법은 unit 마다 별도의 구현 필요(반드시))

class Unit{ void move(){}; }  //각각 유닛을 만드는데 반드시 move() 다른 형태로 구현
//강제성이 없다 ....
*/
abstract class Unit{
	int x,y;
	void stop() {
		System.out.println("Unit stop");
	}
	
	//이동 (서로 다르게) 강제 구현 ..다름을 구현
	abstract void move(int x, int y); //실행블럭(x) >> 추상함수 >> 미완성 함수
	
}
class Tank extends Unit {

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Tank 소리내며 이동 : " + this.x + "," + this.y);
		
	}
	//필요에 따라서 구체화 , 특수화 구현 (고유한 기능)
	void changeMode() {
		System.out.println("탱크모드 변환");
	}
}

class Marine extends Unit{

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Marine 이동 :" + this.x + "," + this.y);
	}
	//특수화 , 구체화
	void stimpack() {
		System.out.println("스팀팩기능");
	}
	
}

class DropShip extends Unit {

	@Override
	void move(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("DropShip 하늘로 이동 : " + this.x + ","+ this.y);
	}
	
	//특수화 , 구체화
	void load() {
		System.out.println("Unit load");
	}
	void unload() {
		System.out.println("Unit Unload");
	}
}
public class Ex13_abstract_class {

	public static void main(String[] args) {
		//JAVA : 객체의 타입을 비교하는 연산자 (instanceof :true , false)
		//JavaScript : typeof , instanceof
		
		Tank tank = new Tank();
		tank.move(500, 200);
		tank.stop();
		tank.changeMode();
		
		Marine marine = new Marine();
		marine.move(200, 300);
		marine.stop();
		marine.stimpack();
		
		if(tank instanceof Unit) { //tank 객체는 Unit타입 입니까
			System.out.println(true);
		}else {
			System.out.println(false);
		}
		
		if(tank instanceof Tank) { //tank 객체는 Unit타입 입니까
			System.out.println(true);
		}else {
			System.out.println(false);
		}
		
		//다형성 문제
		//1. 탱크 3대를 만들고 같은 좌표(600,800) 로 이동 시키세요
			Tank[] tanklist = {new Tank(),new Tank(),new Tank()};
			for(Tank t : tanklist) {
				t.move(600, 800);
			}
		//2. 여러개의  Tank 1대 , Marine 1사람 , DropShip 1대) 생성하고 같은 좌표
		//(666,888) 
		//다형성  
		Unit[] unitlist = {new Tank(), new Marine(), new DropShip()};
		for(Unit unit : unitlist) {
			unit.move(666, 888);
		}
	}

}
