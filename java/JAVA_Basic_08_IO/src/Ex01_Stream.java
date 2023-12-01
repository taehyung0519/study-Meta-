/*
IO(input / output)

Stream(통로)
데이터 종류 : 이미지 , 파일  <> 문자

JAVA API >> 클래스 제공 받아요
I/O 기본 단위는 Byte

추상 클래스 
InputStream , OutPutStream (추상함수 .... 재정의)

당신이 Byte 데이터 작업 
입력 InputStream 상속 구현하는 클래스 사용해라 

대상이
1. Memory : ByteArrayInputStream
2. File   : FileInputStream   (**)

당신이 Byte 데이터 작업 
출력 OutputStream 상속 구현하는 클래스 사용해라 

대상이
1. Memory : ByteArrayOutPutStream
2. File   : FileOutPutStream  (**)

사실 지금까지 memory  Array , Collection 통해서 메모리기반 작업 ....
*/
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Arrays;
public class Ex01_Stream {
	public static void main(String[] args) {
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9}; //-128 ~ 127
		byte[] outSrc = null; //현재 메모리를 가지고 있지 않아요
		
		//중간매개체(stream) > memory > read , write
		//입력
		ByteArrayInputStream input = null;    //빨대 (통로) 입력 전용
		//출력
		ByteArrayOutputStream output = null;  //빨대 (통로) 출력 전용

		input = new ByteArrayInputStream(inSrc); // 대상 : inSrc >> read
		output = new ByteArrayOutputStream();
		
		System.out.println("outSrc before : " + Arrays.toString(outSrc));

		//공식같은 로직(암기)
		
		int data=0;
		while((data = input.read()) != -1 ) {
			//System.out.println(data);
			//read 한 데이터를 출력 (다른 stream)
			output.write(data);
			//write 대상이 data 가 아니고 ByteArrayOutputStream 자신의 통로에 ...write
			
		}
		
		outSrc = output.toByteArray(); //heap 생성된 배열 객체의 주소값을 return
		
		System.out.println("outSrc after : " + Arrays.toString(outSrc));
		/*
		while(input.read()!= -1 ) {
			System.out.println(input.read());
			
			//input.read() >> next
		}
		*/

	}

}
