package kr.or.kosa;

import java.util.List;
import java.util.Map;

//MVC (Model(DTO , DAO : DB 연결 CRUD )(java) , view(html,jsp) , Controller(servlet))
public class EmpDAO {
	//DAO (CRUD)
	//함수 5개
	//전체조회
	//조건조회
	//삽입
	//수정
	//삭제
	//조회(검색)
	public List<Emp> getEmpAllList(){
		
		//select empno , ename , job from emp;
		return null;
	}
	public Emp getEmpListByEmpno(int empno) {
		//select empno ,ename ,job  from emp where empno=7788
		return null;
	}
	
	//Map map = new HashMap();
	//map.put("title","자바과정")
	//getEmpFindBySearchCondition 
	public List<Emp> getEmpFindBySearchCondition(Map<String,String> search ){
		// where title like '%자바과정%'
		return null;
	}
	
}
