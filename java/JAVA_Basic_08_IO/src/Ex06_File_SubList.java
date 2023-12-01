import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Ex06_File_SubList {

	static int totalfiles=0;
	static int totaldir=0;
	
	static void printFileList(File dir) {
		System.out.println("Full Path : " + dir.getAbsolutePath());
		List<Integer> subdir = new ArrayList<Integer>();
		
		File[] files = dir.listFiles(); //하위 폴더와 파일 포함
		for(int i = 0 ; i < files.length ; i++) {
			String filename = files[i].getName(); //폴더명 , 파일명
			if(files[i].isDirectory()) {
				filename = " [ DIR ]" + filename;
				subdir.add(i); //??
			}else {
				filename = filename + " / " + files[i].length() + "byte";
			}
		}
		
		//폴더 개수
		//파일 개수
		int dirnum = subdir.size(); //현재 주어진    하위에 있는 폴더 개수
		int filenum = files.length - dirnum; //  하위에 있는 파일 개수
		
		//누적개수
		totaldir += dirnum;
		totalfiles += filenum;
		
		System.out.println("[Current Dirnum] :" + dirnum);
		System.out.println("[Current Filenum] :" + filenum);
		
		/*
		  POINT (제시한 폴더가 다시 하위 폴더를 가지고 정보 ....)
		  [0] >  a.txt
		  [1] >  aaa폴더 > a-1폴더 > a-2폴더
		  [2] >  bbb폴더 > b-1폴더 , b.txt
		*/
		System.out.println("******************************");
		//List<Integer> subdir = new ArrayList<Integer>();
		//[0] > 1
		//[1] > 2
		 for(int i = 0 ; i < subdir.size() ; i++) {
			 int index = subdir.get(i);
			 printFileList(files[index]); //재귀 처럼
		 }
	}
	
	public static void main(String[] args) {
		File f = new File("C:\\Temp");
		if(!f.exists() || !f.isDirectory()) {
			System.out.println("유효한 디렉토리가 아닙니다");
			System.exit(0);
		}
		
		//정상적인 경로이고 폴더구나
		printFileList(f);
		System.out.println("누적 총 파일수 : " + totalfiles);
		System.out.println("누적 총 폴더수 : " + totaldir);
	}

}
