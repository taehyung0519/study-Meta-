package kr.or.kosa;

public class Person2 {
   private String name;
   private int age;
   
      
	public Person2(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	
	@Override
	public String toString() {
		return "Person2 [name=" + name + ", age=" + age + "]";
	}
   
   
}
