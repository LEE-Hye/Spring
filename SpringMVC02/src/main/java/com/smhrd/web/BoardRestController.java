package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.entity.Board;
import com.smhrd.mapper.BoardMapper;

// RestController : Ajax요청을 처리할 컨트롤러 지정
// 이 컨트롤러의 메서드에는 @ResponseBody를 붙이지 않아도, 데이터를 응답

@RestController
public class BoardRestController { // 비동기 관련된 처리를 할 POJO

	@Autowired
	private BoardMapper mapper;
	
	
	@RequestMapping("/ajax01.do")
	public @ResponseBody String ajax01(String data, String data2) {
		// ajax요청을 받는 pojo의 경우 리턴타입 앞에 @ResponseBody 어노테이션을 붙어야 한다.
		// (페이지 이동하는 애가 아니라 이러한 값을 돌려주는 애다)
		// return하는 값을 그대로 응답
		System.out.println("ajax 요청들어옴");
		System.out.println(data);
		System.out.println(data2);
		return "base";
	}

	@RequestMapping("/plus.do")
	public String plus(int num1, int num2) {

		String hap = num1 + "+" + num2 + "=" + (num1+num2);
		
		// 기본적으로 리턴해주는 값이 문자열이 되어야 한다.
		return hap;
		
		// return num1 + num2 + ""; => 빈 문자열을 더해주면 문자열이 출력된다.
	}
	
	@RequestMapping("/json.do")
	public Board json() {
		
		// 이름, 나이, 전화번호
		
		// CSV : 콤마(,)와 엔터로만 데이터를 구분하는 파일 포맷
		// 장점 : 데이터 작음
		// 단점 : 가독성 안 좋음, python 전용
		// 이름, 나이, 전화번호
		// 안현진,20,010-1122-1324
		// 배준오,20,010-2465-4534
		
		
		
		// XML : 태그, 속성을 이용해서 데이터를 저장하는 포맷
		// 장점 : 가독성이 좋음, 사용하기 편한편
		// 단점 : 데이터 크기 큼, 만들기 힘듦
		
		// <person>
		//		<이름>안현진</이름>
		//		<나이>20</나이>
		//		<전화번호>010-1234-4568</전화번호>
		// </person>
		// ...
		
		
		
		// JSON : javascript 객체 형식으로 데이터를 저장하는 포맷, 전달할 때 문자열로 전달
		// 데이터들이 key : value 형태로 짝지어져있다.
		// 장점 : 가독성 좋음, 만들기 쉬움, 호환성 좋다.
		
		//"[
		//		{
		//			"이름" : "안현진",
		//			"나이" : "20",
		//			"전화번호" : "010-1234-5687"
		//		},
		//		{
		//			"이름" : "배준오",
		//			"나이" : "20",
		//			"전화번호" : "010-2564-5477"
		//		},
		//]"
		
		
//		String json ="" ;
//		json += "{";
//		json += "\"name\" : \"안현진\", ";
//		json += "\"age\" : \"20\", ";
//		json += "\"phone\" : \"010-1234-1245\" ";
//		json += "}";
		
		
		Board board = new Board();
		board.setTitle("Ajax 게시판");
		board.setWriter("안현진");
		board.setContent("json데이터 응답하기");
		
		// jackson-databind를 통해(라이브러리에 추가한 거)
		// JAVA Object를 리턴하면 json데이터 포맷으로 변환된다.
		return board;
	}
	
	@RequestMapping("boardList.do")
	public List<Board> boardList() {
		
		
		List<Board> list = mapper.boardList();
		
		return list;
		
	}
	
	@RequestMapping("boardDelete.do")
	public void boardDelete(int idx) {
		
		mapper.boardDelete(idx);

	}

}