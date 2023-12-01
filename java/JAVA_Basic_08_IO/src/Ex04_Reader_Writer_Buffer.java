import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Ex04_Reader_Writer_Buffer {

	public static void main(String[] args) {
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader("C:\\Temp\\Ex01_Stream.java");
			br = new BufferedReader(fr);
			
			//buffer  line 단위 장점
			String line ="";
			for(int i = 0 ; (line = br.readLine()) != null ; i++) {
				//System.out.println(line);
				if(line.indexOf(";") != -1) {
					System.out.println(line);
				}
			}
			
		} catch (Exception e) {
			
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
