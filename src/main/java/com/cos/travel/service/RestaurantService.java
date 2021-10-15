package com.cos.travel.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cos.travel.model.Restaurant;
import com.cos.travel.repository.RestaurantRepository;
import com.cos.travel.web.dto.search.SearchDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RestaurantService {

	private final RestaurantRepository restaurantRepository;
	
	// 전체 맛집 목록 보기
	@Transactional(readOnly = true)
	public Page<Restaurant> list(Pageable pageable){
		return restaurantRepository.findAll(pageable);
	}
	
	// 맛집 상세보기
	@Transactional(readOnly = true)
	public Restaurant detail(int id) {
		return restaurantRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
	
	// 맛집 검색하기
	@Transactional(readOnly = true)
	public Page<Restaurant> searchByText(SearchDto dto, Pageable pageable) {
		Page<Restaurant> restaurantList = null;
		switch (dto.getGubun()) {
			case "가게이름":
				restaurantList = restaurantRepository.findByRestaurantContaining(dto.getText(), pageable);
				break;
			case "제목 내용":
				restaurantList = restaurantRepository.findByText(dto.getText(), pageable);
				break;
		}
		return restaurantList;
	}
}
