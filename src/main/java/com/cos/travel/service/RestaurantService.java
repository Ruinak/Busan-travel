package com.cos.travel.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.cos.travel.model.Restaurant;
import com.cos.travel.repository.RestaurantRepository;
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
}
