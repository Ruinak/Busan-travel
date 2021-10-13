package com.cos.travel.web;

import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.cos.travel.model.Board;
import com.cos.travel.service.BoardService;
import com.cos.travel.web.dto.search.SearchDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	
	// 공지사항 이동 및 리스팅
	@GetMapping("/board/boardMain")
	public String notice(Model model,
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("boards", boardService.list(pageable));
		return "board/boardMain";
	}
	
	// 공지사항 쓰기 이동
	@GetMapping("/board/noticeForm")
	public String noticeForm() {
		return "board/noticeForm";
	}
	
	// 공지사항 상세보기
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		Board board = boardService.detail(id);
		board.setCount(board.getCount()+1);
		boardService.update(id, board);
		model.addAttribute("board", board);
		return "board/noticedetail";
	}
	
	// 모든 검색 컨트롤러
	@GetMapping("/board/findbytext")
	public String findByText(Model model, @ModelAttribute SearchDto dto, 
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		Page<Board> lists = boardService.searchByText(dto, pageable);
		System.out.println(lists.getSize());
		model.addAttribute("boards", lists);
		return "board/boardMain";
	}
}