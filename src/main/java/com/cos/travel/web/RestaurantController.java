package com.cos.travel.web;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.travel.model.Restaurant;
import com.cos.travel.service.RestaurantService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class RestaurantController {

	private final RestaurantService restaurantService;
	
	// 인기 맛집으로 이동하기
	@GetMapping("/restaurant/restaurant")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("restaurants", restaurantService.list(pageable));
		return "restaurant/restaurant";
	}
	
	// 맛집 상세보기
	@GetMapping("/restaurant/{id}")
	public String findById(@PathVariable int id, Model model) {
		Restaurant restaurant = restaurantService.detail(id);
		model.addAttribute("restaurant", restaurant);
		return "restaurant/restaurantDetail";
	}
}
