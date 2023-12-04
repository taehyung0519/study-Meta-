package kr.or.kosa;
/*
 노트북은 색상을 가지고 있다
 노트북은 생산년도를 가지고 있다
 노트북은 마우스를 가지고 있다 
 >> 마우스를 필요에 따라서 사용할 수도 있다 
 마우스는  좌표값을 가지고 있다   나중에 추가 >> 휠 1개 , 버튼 2개 ,

 마우스는 부품 (별도의 클래스)
*/
/*
class Mouse{
	int x;
	int y;
	
	void setX(int x) {
		this.x = x;
	}
	void setY(int y) {
		this.y = y;
	}
	
	void getReadMouseData() {
		System.out.println("x : " + x + " y : " + y);
	}
	
}
*/
public class NoteBook {
    private String color;
    private int year;
    //private Mouse mouse; //부품
    //private Mouse mouse = new Mouse(); //부품 NoteBook 과 Mouse lifecycle 같다
	public void setColor(String color) {
		this.color = color;
	}
	public void setYear(int year) {
		this.year = year;
	}
	//public void setMouse(Mouse mouse) {
	//	this.mouse = mouse;
	//}
    
    public void handleMouse(Mouse mouse) { //의존관계
    	mouse.setX(100);
    	mouse.setY(200);
    	mouse.getReadMouseData();
    }
	
    
}

/*
 NoteBook note = new NoteBook(); 
 Mouse m = new Mouse();
 note.handleMouse(m);
  
 */



