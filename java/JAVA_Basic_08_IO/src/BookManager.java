
import java.io.File;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

class Book {
    final String isbn;
    String title;
    int price;

    public Book(String isbn, String title, int price) {
        this.isbn = isbn;
        this.title = title;
        this.price = price;
    }

    public String ISBN() {
        return isbn;
    }

    public String toString() {
        return String.format("ISBN:%s 이름:%s 가격:%d", isbn, title, price);
    }
}

class BookManager {
    static private HashMap<String, Book> books;
    private File file;
    
    public BookManager() {
    	this.books =  new HashMap<String, Book>();
    	file = new File("book.txt");
    }

    public void run() {
        Scanner sc = new Scanner(System.in);
        do {
            System.out.println("1:추가 2:삭제 3:검색 4:도서 목록 5:ISBN 목록 0:종료");
            int n = sc.nextInt();
            sc.nextLine(); // 엔터키 처리

            if (n == 0) {
            	System.out.println("종료합니다.");
                break;
            }

            if (n == 1) {
                System.out.print("추가할 도서 ISBN:");
                String isbn = sc.nextLine();
                System.out.print("도서제목:");
                String title = sc.nextLine();
                System.out.print("가격:");
                int price = sc.nextInt();
                insert(isbn, title, price);
            }
            if (n == 2) {
                System.out.print("삭제할 도서 ISBN:");
                String isbn = sc.nextLine();
                delete(isbn);
            }
            if (n == 3) {
                System.out.print("검색할 도서 ISBN:");
                String isbn = sc.nextLine();
                Book book = search(isbn);
                if (book != null) {
                    System.out.print("검색결과>>>");
                    System.out.println(" 이름:" + book.title+" 가격:"+book.price);
                }
            }
            if (n == 4) {
                showList();
            }
            if (n == 5) {
                showISBNList();
            }

        } while (true);
        sc.close();
    }

    public void insert(String isbn, String title, int price) {
        Book book = new Book(isbn, title, price);
        books.put(isbn, book);
    }

    public Book search(String isbn) {
        return books.get(isbn);
    }

    public void delete(String isbn) {
        if (search(isbn) != null) {
            books.remove(isbn);
            System.out.println("삭제완료");
        } else {
            System.out.println("해당 책이 존재하지 않습니다.");
        }
    }

    public void showList() {
        Set<String> keySet = books.keySet();
        for (String key : keySet) {
            System.out.println(books.get(key).toString());
        }
    }

    public void showISBNList() {
        for (String isbn : books.keySet()) {
            System.out.println(isbn);
        }
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        BookManager bm = new BookManager();
        bm.run();
    }
}

