/*
컴퓨터에서 가장 느린작업 : Disk read /write
File 처리 > DISK > 입출력단위가 한 byte

버스 (Buffer) 한번에 여러명을 태워서 가자 ....
1. I/O 성능 개선(접근 횟수)
2. Line 단위 (엔터)

BufferedOutPutStream (보조 스트림) >> 독자적인 작업 불가 >> helper > File Stream 도와서 
*/

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

public class Ex03_Stream_Buffer {
	public static void main(String[] args) {
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			  fos = new FileOutputStream("data.txt"); //default 경로 ... src
			  bos = new BufferedOutputStream(fos); //버퍼 생성
			  
			  for(int i = 0 ; i < 10 ; i++) {
				  bos.write('A');  //data.txt create 파일에 10번
			  }
			     bos.flush();
				 /*
				  JAVA Buffer (8k , 8192byte)  >> WEB
				  1. Buffer 안에 내용이 채위지면 스스로 출발 (버퍼를 비우는 작업) 
				  2. 강제로 출발 (buffer) 강제 비우기 : flush() or close()하면 자동 flush()
				  3. 개발  close() 자원해제  >> 내부적으로 flush()  
				  */
		} catch (Exception e) {
			  System.out.println(e.getMessage());
		}finally {
			try {
				  bos.close();
				  fos.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}

}
