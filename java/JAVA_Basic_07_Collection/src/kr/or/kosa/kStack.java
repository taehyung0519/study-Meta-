package kr.or.kosa;
//JAVA API 제공하는 stack 직접 구현해보기
//LIFO 구조를 코드 ....
//1. stack 저장공간 (Array : 고정배열 10개방), 저장공간 타입 (Object)
//2. 위치정보 : 저장되는 값이 있는 위치 (index) hint)전자제품 매장 cart 사용해서 처리 
//3. 기능 : push() , pop() , boolean empty() ,boolean full()
public class kStack {
   private Object[] stackarr; //stack 저장소
   private int position; //배열의 index  위치정보값
   //기타 자원 생성
   private int maxsize; 
   
   
   public kStack(int maxsize) {
	   this.stackarr = new Object[maxsize];
	   this.position = -1;
	   this.maxsize = maxsize;
   }
   public boolean isEmpty() {
	   return (position == -1);
   }
   public boolean isFull() {
	   return (position == this.maxsize -1);
   }
   
   public void push(Object i) {
	   if(isFull()) {
		   //throw new IndexOutOfBoundsException("FULL이야");
		   System.out.println("Kstack is full");
	   }else {
		   this.stackarr[++position] = i;
	   }
   }
   
   public Object pop() {
	   Object value = null;
	   if(isEmpty()) {
		   System.out.println("Kstack is empty");
	   }else {
		   value = this.stackarr[position];
		   position--;
	   }
	   return value;
   }
   
}
