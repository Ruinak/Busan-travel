package com.cos.travel.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.travel.model.Restaurant;
import com.cos.travel.model.Tagrestaurant;
import com.cos.travel.service.RestaurantService;
import com.cos.travel.service.TagrestaurantService;
import com.cos.travel.web.dto.search.SearchDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class RestaurantController {

	private final RestaurantService restaurantService;
	private final TagrestaurantService tagrestaurantService;
	
	// 인기 맛집으로 이동하기
	@GetMapping("/restaurant/restaurant")
	public String popular(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.ASC) Pageable pageable) {
		model.addAttribute("restaurants", restaurantService.list(pageable));
		return "restaurant/restaurant";
	}
	
	// 맛집 상세보기
	@GetMapping("/restaurant/{id}")
	public String findById(@PathVariable int id, Model model1, Model model2) {
		Restaurant restaurant = restaurantService.detail(id);
		Tagrestaurant tagrestaurant = tagrestaurantService.detail(id);
		model1.addAttribute("restaurant", restaurant);
		model2.addAttribute("tagrestaurant", tagrestaurant);
		return "restaurant/restaurantDetail";
	}
	
	// 맛집 검색하기.
	@GetMapping("/restaurant/search")
	public String searchRestaurant(Model model, @ModelAttribute SearchDto dto, 
			@PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable){
		Page<Restaurant> restaurants = restaurantService.searchByText(dto, pageable);
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("searchDto", dto);
		return "restaurant/searchList";
	}
}
