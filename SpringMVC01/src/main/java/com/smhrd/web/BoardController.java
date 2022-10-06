package com.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.entity.Board;

// @Controller를 이용해서 POJO임을 명시
@Controller
public class BoardController {

	@RequestMapping("/boardList.do") // 해당 요청이 들어오면 아래의 메서드를 실행해라
	public String boardList(HttpServletRequest request) {
		
		// 게시글(글 번호, 제목, 작성자, 내용, 작성일, 조회수) --> DTO(VO)
		Board board1 = new Board(1, "스프링", "이혜빈", "스프링게시판","2022-10-06", 0);
		Board board2 = new Board(2, "스프링", "삼혜빈", "스프링게시판","2022-10-06", 0);
		Board board3 = new Board(3, "스프링", "사혜빈", "스프링게시판","2022-10-06", 0);
		
		
		// ArrayList의 부모 클래스인게 List라 여러가지 List를 담을 수 있어 범용성이 높아서 
		// 자료형을 ArrayList가 아닌 List에 담아준다.
		// 근데 여기서 보여주는게 아니라 boardList.jsp에서 보여주는거라
		// request 주머니에 list를 저장
		List<Board> list = new ArrayList<Board>();
		list.add(board1);
		list.add(board2);
		list.add(board3);
		
		// ("어떤 이름으로 저장할것이냐", 어떤 걸 저장할것이냐)
		// 객체 바인딩
		request.setAttribute("list", list);
		
		
		// RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/boardList.jsp");
		// rd.forward(request, response);
		// 확장자를 제외한 jsp파일의 이름 리턴 == forward 이동
		// 스프링은 forward방식을 아래와 같이만 적어주면 된다.
		// webapp-> spring -> appServlet -> servelt-context.xml에서
		// 저절로 붙게 만들어주는 'WEB-INF/views/'와 '.jsp'를 붙게 만들어주는 기능이 있음
		return "boardList";
		
	}
}
