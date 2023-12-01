package kr.or.kosa;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

/*
객체 통신
객체(Car , Tv , Tank) >> 프로세스 , 네트워크 , 파일 간에 통신 >> 통신을 위해서 직렬화 , 역직렬화

직렬화 : 객체를 분해해서 줄을 세워 보내는 과정
역직렬화 : 객체를 다시 조립하는 과정

모든 자원(class) 직렬화 가능 >> 아니요 
직렬화 가능한 제품 설계 (레고블럭) 

UserInfo implements Serializable

파일에 객체를 직렬화 write ...

파일을 read 역직렬화 

*/
@Data
@AllArgsConstructor
public class UserInfo implements Serializable {
	private String name;
	private String pwd;
	private int age;
}
