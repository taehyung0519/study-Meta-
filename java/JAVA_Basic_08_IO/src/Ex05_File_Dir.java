/*
파일 , 폴더 를 다루는 클래스 학습
C# : 파일(File) ,  폴더(Directory)

JAVA : File (파일생성,삭제 ..... 폴더 생성 , 삭제 ) 하나의 클래스로
>> a.txt 생성, 수정 , 삭제 , 정보 read
>> Temp  생성, 수정 , 삭제 , 정보 read

경로
절대경로 : C:\\ , D:\\  >> D:\\Temp\\a.txt 
상대경로 : 현재 파일을 중심으로 >> ../  >> /

*/

import java.io.File;

public class Ex05_File_Dir {

	public static void main(String[] args) {
		File f = new File("C:\\Temp");
		//다양한 정보 얻기 위해서
		if(!f.exists() || !f.isDirectory()) {
			//존재하지 않거나 디렉토리 아니면
			System.out.println("유효하지 않은 경로");
			System.exit(0);// 프로세스의 강제 종료
		}

		//실제 존재하는 경로이고 폴더라면
		//POINT
		
		//[1.jpg][2.txt][file.txt][끼러기][aaaa]  >> 배열타입 File  >> File[] list = new 
		File[] files = f.listFiles();
		for(int i = 0 ; i < files.length ; i++) {
			String name = files[i].getName(); //파일명 ,,,, 폴더명 
			System.out.println(files[i].isDirectory() ? "[DIR]" + name : name);
		}
	}

}
