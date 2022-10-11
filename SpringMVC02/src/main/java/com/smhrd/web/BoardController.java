package com.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.Board;
import com.smhrd.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper; 

	@RequestMapping("/")
	public String base() {
		return "base";
	}
}
