/*
2개의 함수가 동시에 실행이 안되요 ....

stack 이 여러개 >> multi thread

문제
시간
2개 동시에 (경합) >> cpu

*/

import javax.swing.JOptionPane;

class WordTime extends Thread{
	@Override
	public void run() {
		for(int i = 10 ; i > 0 ; i--) {
			
			if(Ex04_Multi_Word_Game.inputcheck) return; //thread 종료
			try {
				  System.out.println("남은 시간 : " + i);
				  Thread.sleep(1000); //휴게실에서 1초 쉬었다가 경합 (점유) >> runnable
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

class WordInputThread extends Thread{
	@Override
	public void run() {
		String dan = "2";
		String inputdata = JOptionPane.showInputDialog(dan + "단 값을 입력하세요");
		if(inputdata != null && !inputdata.equals("")) {
			Ex04_Multi_Word_Game.inputcheck = true;
		}
		System.out.println("입력값 : " + inputdata);
	}
}

public class Ex04_Multi_Word_Game {
	
	static boolean inputcheck = false;
	
	public static void main(String[] args) {
		
		
		
		WordTime wordtime = new WordTime();
		wordtime.start();
		
		WordInputThread wordinput = new WordInputThread();
		wordinput.start();
		
		
		System.out.println("main end");
		

	}

}
