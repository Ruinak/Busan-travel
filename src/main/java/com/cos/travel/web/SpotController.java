package com.cos.travel.web;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.travel.model.Spot;
import com.cos.travel.model.Tagspot;
import com.cos.travel.service.SpotService;
import com.cos.travel.service.TagspotService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class SpotController {

	private final SpotService spotService;
	private final TagspotService tagspotService;
	
	// 인기 관광지로 이동하기
	@GetMapping("/busan/popular")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("spots", spotService.list(pageable));
		return "busan/popular";
	}
	
	// 관광지 상세보기
	@GetMapping("/busan/{id}")
	public String findById(@PathVariable int id, Model model1, Model model2) {
		Spot spot = spotService.detail(id);
		Tagspot tagspot = tagspotService.detail(id);
		model1.addAttribute("spot", spot);
		model2.addAttribute("tagspot", tagspot);
		return "busan/popularDetail";
	}
}
