/*
Set 인터페이스
(원안에 들어가세요) : 순서를 보장(x) , 중복을 허락하지 않아요
순서가 없고 중복을 허락하지 않는 데이터 집합
구현하는 클래스
HashSet , TreeSet (자료구조)

*/

import java.util.HashSet;
import java.util.Set;

public class Ex03_Set {

	public static void main(String[] args) {
		HashSet<Integer>  hs = new HashSet<Integer>();
		hs.add(10);
		hs.add(20);
		System.out.println(hs.add(10));
		
		System.out.println(hs.toString());
		//로또 , 차량번호 , 회원id
		
		/*
		 for(int i = 0 ; i < 6 ; i++) {
			lotto[i] = (int)(Math.random()*45 + 1);
			for(int j = 0 ; j < i ; j++) { //j < i (채워진 개수 만큼 비교)
				if(lotto[i] == lotto[j]) {
					i--;
					break;
					
				}
			}
		}  
		 */
		Set set2 = new HashSet();
		while(set2.size() < 6) {
			int num = (int)(Math.random()*45 + 1);
			set2.add(num);  
		}
		System.out.println(set2.toString());
	}

}
