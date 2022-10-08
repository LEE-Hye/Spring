package com.smhrd.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Board;

// 추상 클래스가 아닌 interface를 쓰는이유가
// 추상 클래스는 위에서부터 차례대로 상속받으며 내려와서  필요 없는 것들도 쓰여질 수 있는데
// 인터페이스는 밑에서 필요한 부분만 따로 가져오니까 더 효율적이다 
@Mapper
public interface BoardMapper {

	// 무조건 하나만 나오면 리턴 타입을 Board라 적으면 되는데
	// 여러개 결과 값이 나올테니 List<Board>라고 적어야 한다.
	// 추상 메서드만 정의
	// 메서드 명 == id
	public List<Board> boardList(); 
	// 추상메소드 -> 코드가 없다
	// DAO가 데이터 엑세스 오브젝트(구현이 다 된 오브젝트)인데 의미가 사라졌어
	// -> 그래서 이름을 Mapper로 바꿔

	public int boardInsert(Board board);
	
	public Board boardContent(int idx);
	
	// @Delete("Delete from borad where idx = #{idx}") 이렇게 적어줘도 xml에 sql문 적은것과 같은 역할을 함
	// 대신 주의할 점이 xml에도 boardDelete가 있으면 안된다
	@Delete("Delete from board where idx = #{idx}")
	public int boardDelete(int idx);
	
	public Board boardUpdateForm(int idx);

	// 파라미터 타입과 같은 Board가 들어가야 한다.
	public int boardUpdate(Board board);

}
