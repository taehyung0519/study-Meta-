import kr.or.kosa.Mouse;
import kr.or.kosa.NoteBook;

public class Ex03_Method_Ref {

	public static void main(String[] args) {
		NoteBook notebook = new NoteBook();
		notebook.setColor("blue");
		notebook.setYear(2023);
		
		Mouse mouse = new Mouse();
		notebook.handleMouse(mouse);

	}

}
