import java.util.ArrayList;
import java.util.Stack;
//설계도
class Mygeneric<T> { //Type paramter

	T obj;
	
	void add(T obj) {
		this.obj = obj;
	}
	
	T get() {
		return this.obj;
	}
}

class Person{
	int age = 100;
}


public class Ex02_Generic {

	public static void main(String[] args) {
	
		Mygeneric<String> mygen = new Mygeneric<String>();
		/*
		String obj;
	
		void add(String obj) {
			this.obj = obj;
		}
	
		String get() {
			return this.obj;
		} 
		  
        */
		Mygeneric<Person> mygen2 = new Mygeneric<Person>();
		/*
		Person obj;
	
		void add(Person obj) {
			this.obj = obj;
		}
	
		Person get() {
			return this.obj;
		} 
		  
        */
		
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person());
		Person p = list.get(0);
		
		Stack<Integer> mystack = new Stack<Integer>();
	    mystack.push(10);
	    mystack.push(10);
	    mystack.push(10);
	    mystack.push(10);
	    System.out.println(mystack.pop());
	    System.out.println(mystack.pop());
	    System.out.println(mystack.pop());
	    System.out.println(mystack.pop());
	    System.out.println(mystack.pop());
	}

}
