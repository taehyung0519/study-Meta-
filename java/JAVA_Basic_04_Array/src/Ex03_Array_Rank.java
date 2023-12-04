
public class Ex03_Array_Rank {

	public static void main(String[] args) {
		// 다차원 배열 (2차원)
		//[행][열]
		//엑셀 시트 , 영화관 좌석  , 지도 좌표값 (경도 , 위도) , 바둑판 .....
		int[][] score = new int[3][2];
		score[0][0] = 100;
		
		//다차원 배열 >> 중첩 for
		for(int i = 0;  i < 3 ; i++) {
			for(int j = 0 ; j < 2 ; j++) {
				System.out.printf("score [%d][%d]=[%d]\n",i,j,score[i][j]);
			}
		}

		for(int i = 0;  i < score.length ; i++) {
			for(int j = 0 ; j < score[i].length ; j++) {
				System.out.printf("score [%d][%d]=[%d]\n",i,j,score[i][j]);
			}
		}
		
		int[][] score2= new int[][] {{11,12},{13,14},{15,16}};
		
		//개선된 for문
		for(int[] arr  : score2 ) {
			for(int value : arr) {
				System.out.println(value);
			}
		}
		
	}

}
