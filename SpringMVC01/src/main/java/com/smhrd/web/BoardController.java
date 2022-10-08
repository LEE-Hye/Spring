package com.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.Board;
import com.smhrd.mapper.BoardMapper;

// @Controller를 이용해서 POJO임을 명시
// POJO임을 servlet-context.xml에서 scan해주러 올 때 확인된다.
@Controller
public class BoardController {
	
	// 인터페이스는 구현이 되기 전까지 쓸 수 없다. 그래서 오류가 난다.
	// private BoardMapper mapper = new BoardMapper();
	
	// 우리가 직접적으로 여기다 객체 생성을 해줄 수 없어 결합도가 이미 떨어져 있는 상태
	// boardcontroller라는 애한테 메모리에 만들어줬던 완벽한 dao메퍼를 mapper을 주입시켜줌(의존성 주입)
	@Autowired // 메모리에 이 변수에 담을게 있다면, 알아서 담아줘
	private BoardMapper mapper; 

	@RequestMapping("/boardList.do") // 해당 요청이 들어오면 아래의 메서드를 실행해라
	public String boardList(Model model) {
		
		// ArrayList의 부모 클래스인게 List라 여러가지 List를 담을 수 있어 범용성이 높아서 
		// 자료형을 ArrayList가 아닌 List에 담아준다.
		// 근데 여기서 보여주는게 아니라 boardList.jsp에서 보여주는거라
		// request 주머니에 list를 저장
		List<Board> list =  mapper.boardList();
		
		// ("어떤 이름으로 저장할것이냐", 어떤 걸 저장할것이냐)
		// 객체 바인딩
		// Model : 다이어트한 request : 객체 바인딩 기능만 남김
		// request.setAttribute("list", list);로 적을 수 있었는데
		// 여기서만 request를 쓰기에는 메모리를 너무 낭비하게 돼서 Model이라는 애를 사용함
		// 그래서 HttpServletRequest request 이것도 안 적고 Model model이라 적어주면 됨
		model.addAttribute("list", list);
		
		
		// RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/boardList.jsp");
		// rd.forward(request, response);
		// 확장자를 제외한 jsp파일의 이름 리턴 == forward 이동
		// 스프링은 forward방식을 아래와 같이만 적어주면 된다.
		// webapp-> spring -> appServlet -> servelt-context.xml에서
		// ViewResolver가 'WEB-INF/views/'와 '.jsp'를 붙게 만들어 준다.
		return "boardList";
		
	}
	
	@RequestMapping("/boardForm.do")
	public String boardForm(Model model) {

		return "boardForm";
	}
	
	@RequestMapping("boardInsert.do")
	public String boardInsert(Board board) {
		// 1. 기본 생성자가 존재한다.
		// 2. 필드의 변수명과 input태그의 name값이 같다.
		// -> 자동으로 파라미터 수집이 가능하다.
		// -> 매개변수에 결과로 묶일 데이터 타입이나 변수를 넣어주면 된다.
		
		// data(파라미터) 수집
		// 제목, 작성자, 내용
		/*
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		*/
		

		
		// Mapper들에 SQL문 정의
		
		
		// insert기능 사용
		mapper.boardInsert(board);
		
		// 다음 페이지로
		// 다시 pojo인 컨트롤러로 돌아와야 하는 경우에 redirect 사용
		// redirect:/ 를 urlmapping 앞에 붙이면 된다
		return "redirect:/boardList.do";
		// return "boardList.do"; 
		// -> WEB-INF/vies/boardList.do.jsp
	}
	
	@RequestMapping("boardContent.do")
	public String boardContent(@RequestParam int idx, Model model) {
		// Board board에도 가져올 idx가 있지만 딱 한개만 불러오기에는 크기 때문에
		// DTO를 사용하지 않고 그냥 변수로도 파라미터 수집이 가능하다.
		// 변수명 == name => int idx
		// 변수명 != name => @RequestParam("idx") int idx : requestparameter에 있는 값 중 idx를 꺼내서 변수 idx에 저장해라
		
		Board board = mapper.boardContent(idx);
		// mapper안에 있는 boardContent를 쓰겠다. 
		// => 이 결과값이 필요하기 때문에 Board board에 담아준다.
		
		model.addAttribute("board", board);
		// 위에서 가져온 값을 사용하기 위해서 model에 추가 시켜줌
		
		return "boardContent";
	}
	
	@RequestMapping("boardDelete.do")
	public String boardDelete(@RequestParam int idx) {
		
		mapper.boardDelete(idx);
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("boardModify.do")
	public String boardModify() {
		
		return "boardModify";
	}
}
