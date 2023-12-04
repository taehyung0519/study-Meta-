import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;
public class Ex04_Array_Cinema {

	public static void main(String[] args) throws IOException {
	        String[][] seats = new String[5][5];
	        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	        StringTokenizer st;
	        for (int i = 0; i < seats.length; i++) {
	            for (int j = 0; j < seats[i].length; j++) {
	                seats[i][j] = "[ " + (i + 1) + "행 " + (j + 1) + "열" + " ]";
	            }
	        }
	        int num = 0;
	        while (true) {
	            System.out.println("영화 예매 시스템");
	            System.out.println("1.예매하기");
	            System.out.println("2.예매조회");
	            System.out.println("3.예매취소");
	            System.out.println("4.좌석조회");
	            System.out.println("5.시스템종료");
	            System.out.println("======================");
	            System.out.println("원하시는 번호를 입력해주세요.");
	            num = Integer.parseInt(br.readLine());
	            if (num == 1) { // 예매하기
	                while (true) {
	                    boolean flag = reserve(seats, br);;
	                    if (flag) {
	                        break;
	                    }
	                }
	            } else if (num == 2) { //예매조회
	                check(seats);
	            } else if (num == 3) { //예매취소
	                cancel(seats, br);
	            } else if (num == 4) { //좌석조회
	                checkSeat(seats, br);
	            } else if (num == 5) {
	                System.out.println("시스템을 종료합니다.");
	                break;
	            } else {
	                System.out.println("잘못 입력하셨습니다.");
	            }
	        }
	    }

	    private static boolean reserve(String[][] seats, BufferedReader br) throws IOException {
	        StringTokenizer st;
	        System.out.println("원하시는 좌석을 선택해주세요. ex)2행 3열 ->2 3");
	        st = new StringTokenizer(br.readLine());
	        int x = Integer.parseInt(st.nextToken()) - 1;
	        int y = Integer.parseInt(st.nextToken()) - 1;
	        if (seats[x][y].equals("x")) {
	            System.out.println("예약된 좌석입니다. 다시 선택해주세요.");
	        } else {
	            seats[x][y] = "x";
	            System.out.println((x + 1) + " 행 " + (y + 1) + " 열 예약이 완료되었습니다.");
	            return true;
	        }
	        return false;
	    }

	    private static void checkSeat(String[][] seats, BufferedReader br) throws IOException {
	        StringTokenizer st;
	        System.out.println("조회하고 싶은 좌석을 선택해주세요. ex)2행 3열 ->2 3");
	        st = new StringTokenizer(br.readLine());
	        int x = Integer.parseInt(st.nextToken()) - 1;
	        int y = Integer.parseInt(st.nextToken()) - 1;
	        if (seats[x][y].equals("x")) {
	            System.out.println("현재 좌석은 예매되었습니다.");
	        } else {
	            System.out.println("현재 좌석은 비어있습니다.");
	        }
	    }

	    private static void cancel(String[][] seats, BufferedReader br) throws IOException {
	        StringTokenizer st;
	        System.out.println("취소하는 좌석을 선택해주세요. ex)2행 3열 ->2 3");
	        st = new StringTokenizer(br.readLine());
	        int x = Integer.parseInt(st.nextToken()) - 1;
	        int y = Integer.parseInt(st.nextToken()) - 1;
	        if (seats[x][y].equals("x")) {
	            seats[x][y] = "[ " + (x + 1) + "행 " + (y + 1) + "열" + " ]";
	        } else {
	            System.out.println("예약되어있지 않은 좌석입니다.");
	        }
	    }

	    private static void check(String[][] seats) {
	        for (String[] seat : seats) {
	            for (String s : seat) {
	                System.out.print(s + " ");
	            }
	            System.out.println();
	        }
	    }
	}
		/*
		Random r = new Random();
		String ran = Integer.toString(r.nextInt(8) + 1);
		for (int i = 0; i < 7; i++) {
			ran += Integer.toString(r.nextInt(9));
			
		}
		System.out.println("예매번호 : " + ran);
		
		
		String[][] seat = new String[3][5];
	
		//좌석 초기화
		for(int i = 0 ; i < seat.length ; i++) {
			for(int j = 0 ; j < seat[i].length ; j++) {
				seat[i][j]="__";
			}
		}
		
		//예매
		seat[2][1] ="홍길동";
		seat[0][0] ="김유신";
		
		//예매현황
		for(int i = 0 ; i < seat.length ; i++) {
			for(int j = 0 ; j < seat[i].length ; j++) {
				System.out.printf("[%s]",seat[i][j].equals("__") ? "좌석": seat[i][j]);
			}
			System.out.println();
		}
		
		//예매하기
		int row,col;
		row=1;
		col=0;
		if(seat[row][col].equals("__")) {
			System.out.println("예매가능");
		}else {
			System.out.println("예매불가능");
		}
		
		
		//예매종료 (영화시작)
		for(int i = 0 ; i < seat.length ; i++) {
			for(int j = 0 ; j < seat[i].length ; j++) {
				seat[i][j]="__";
			}
		}
	}
	*/

