package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 모든 필드를 초기화 하는 생성자
@Data // Getter, Setter 직접 안 적고 이거 임포트 하면 저절로 만들어짐
public class Board {

	// 글번호
	private int idx;
	// 제목
	private String title;
	// 작성자
	private String writer;
	// 내용
	private String content;
	// 작성일
	private String indate;
	// 조회수
	private int count;
	
}
