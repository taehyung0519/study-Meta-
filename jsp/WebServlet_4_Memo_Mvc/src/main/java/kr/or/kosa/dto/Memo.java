package kr.or.kosa.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
create table memo(
    id varchar2(20) not null,
    email varchar2(20) not null,
    content varchar2(100)
);
*/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Memo {
	private String id;
	private String email;
	private String content;
	
}
