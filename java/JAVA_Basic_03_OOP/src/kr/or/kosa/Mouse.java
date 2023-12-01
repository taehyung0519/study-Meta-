package kr.or.kosa;

public class Mouse{
	private int x;
	private int y;
	
	public void setX(int x) {
		this.x = x;
	}
	public void setY(int y) {
		this.y = y;
	}
	
	public void getReadMouseData() {
		System.out.println("x : " + x + " y : " + y);
	}
	
}