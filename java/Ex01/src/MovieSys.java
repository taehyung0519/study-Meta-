import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class theater{
	private List<User> userList;
	private int num;
	
	theater(User u, int num){
		userList = new ArrayList<User>();
		this.num = num;
	}
	
	public void bookSeat(User u) {
		userList.add(u);
	}
	
}

class ticket {
	
	Scanner sc = new Scanner(System.in);

    String[] txt_data=null;
    File f;
    File fd= new File("C://MovieData/"); //파일이 생성될곳
    boolean fileExist;
    
    
    theater th = new theater(null, 0)

    public void showTicket() {
    	String name = sc.next();
    	for(User user:userList) {
    		if(user.name.equals(name)) {
    	        File f= new File("C://MovieData/"+name+".txt"); //기록할 파일객체 생성
    		}
    	}

    }
}



public class MovieSys {

	public static void main(String[] args) {
		
	}

}
