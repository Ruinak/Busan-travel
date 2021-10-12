package com.cos.travel.web;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.cos.travel.service.RestaurantService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class RestaurantController {

	private final RestaurantService restaurantService;
	
	// by 민수. 인기 맛집으로 이동하기
	@GetMapping("/busan/restaurant")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("restaurants", restaurantService.list(pageable));
		return "busan/restaurant";
	}
}
