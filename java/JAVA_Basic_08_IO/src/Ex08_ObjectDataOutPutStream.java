//파일을 대상으로 객체를 write

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

import kr.or.kosa.UserInfo;

public class Ex08_ObjectDataOutPutStream {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String filename = "UserData.txt";
		
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ObjectOutputStream out = null; //직렬화 제공 객체
		
		try {
			fos = new FileOutputStream(filename);
			bos = new BufferedOutputStream(fos);
			//직렬화
			out = new ObjectOutputStream(bos);
			
			//객체 생성
			UserInfo u1 = new UserInfo("홍길동", "super", 100); //완제품
			UserInfo u2 = new UserInfo("scott", "tiger", 50); //완제품
			
			out.writeObject(u1); //u1 객체를 줄을 세워서 write >> UserData.txt 
			out.writeObject(u2);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				  out.close();
				  bos.close();
				  fos.close();
				  System.out.println("파일 생성 > buffer -> 직렬화 -> 파일 write");
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

}
