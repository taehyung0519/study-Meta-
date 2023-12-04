/*
단어 맞추기
구구단 게임

문제가 나오고 .... 시간이 주어지고
일정 시간이 지나며 종료
*/

import javax.swing.JOptionPane;

public class Ex03_Single_Word_Game {

	public static void main(String[] args) {
		String inputdata = JOptionPane.showInputDialog("값을 입력하세요");
		System.out.println("입력값 : " + inputdata);
		
		timer();

	}
	
	static void timer() {
		for(int i = 10 ; i > 0 ; i--) {
			try {
				  System.out.println("남은 시간 : " + i);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
