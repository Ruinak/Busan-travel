package com.cos.travel.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Spot;
import com.cos.travel.model.Tagspot;
import com.cos.travel.service.CommentService;
import com.cos.travel.service.SpotService;
import com.cos.travel.service.TagspotService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class SpotController {
	
	private final SpotService spotService;
	private final TagspotService tagspotService;
	private final CommentService commentService;
	
	// 인기 관광지로 이동하기
	@GetMapping("/busan/popular")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "score", direction = Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("spots", spotService.list(pageable));
		return "busan/popular";
	}
	
	// 관광지 상세보기
	@GetMapping("/busan/{id}")
	public String findById(@PathVariable int id, Model model) {
		Spot spot = spotService.detail(id);
		Tagspot tagspot = tagspotService.detail(id);
		model.addAttribute("spot", spot);
		model.addAttribute("tagspot", tagspot);
		// 댓글 리스트
		model.addAttribute("clist", commentService.list(id));
		// 댓글 개수
		model.addAttribute("listCount", commentService.countComment(id));
		return "busan/popularDetail";
	}
	
	// 맞춤 여행지
	@GetMapping("/busan/recommand")
	public String recommand(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails,
			@PageableDefault(size = 9, sort = "score", direction = Sort.Direction.DESC) Pageable pageable) {
		// db에서 여행테마 받아서 쿼리문 형태로 전환 "여행,힐링 -> 여행|힐링"
		String userPreference = principalDetails.getUser().getPreference().replaceAll(",", "|");
		// 쿼리결과를 spots에 담아서 jsp파일에 뿌림
		model.addAttribute("spots", spotService.recommand(userPreference, pageable));
		return "busan/recommand";
	}
	
	// 관광지 검색하기.
	@GetMapping("/busan/search")
	public String searchSight(Model model, 
			@RequestParam(required=false) String sight, 
			@RequestParam(required=false) String detail, 
			@RequestParam(required=false) String tag,
			@RequestParam(required=false) int page) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		// 여기서 관광지명, 제목+내용, 해시태그 조건 분기
		if(sight!=null) {
			map.put("sight", sight);
			model.addAttribute("menu", "sight");
			model.addAttribute("searchText", sight);
		}
		if(detail!=null) {
			map.put("detail", detail);
			model.addAttribute("menu", "detail");
			model.addAttribute("searchText", detail);
		}
		if(tag!=null) {
			map.put("tag", tag);
			model.addAttribute("menu", "tag");
			model.addAttribute("searchText", tag);
		}
		
		map.put("pageIndex", page); // 첫 인덱스
		map.put("recordCountPerPage", 5);
		map.put("sortColumn", "score");
		map.put("sortOrder", "desc");
		Page<Spot> spots = spotService.getGridList(map);
		System.out.println("관광지 출력 확인 : "+spots);
		model.addAttribute("spots", spots);
		return "busan/searchList";
	}
	
	// 테마별 관광지 조회하기
	@GetMapping("/busan/popular/{theme}")
	public String theme(Model model, 
			@PageableDefault(size = 9, sort = "score", direction = Sort.Direction.DESC) Pageable pageable,
			@PathVariable(value="theme") String theme) {
		Page<Spot> spots = null;
		// 두 가지 테마를 포함하고 있는 경우 분리해서 테마를 조회하게 함
		if(theme.equals("자연")) {
			spots = spotService.findByTwoTheme("산", "바다", pageable);
		} else if(theme.equals("예술or건축물")) {
			spots = spotService.findByTwoTheme("예술", "건축물", pageable);
		} else if(theme.equals("운동or트레킹")) {
			spots = spotService.findByTwoTheme("운동", "트레킹", pageable);
		} else if(theme.equals("가족or반려동물")) {
			spots = spotService.findByTwoTheme("가족", "반려동물", pageable);
		} else if(theme.equals("역사or종교")) {
			spots = spotService.findByTwoTheme("역사", "종교", pageable);
		} else {
			spots = spotService.findByTheme(theme, pageable);
		}
		model.addAttribute("spots", spots);
		return "busan/popular";
	}
}
