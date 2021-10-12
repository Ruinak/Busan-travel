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
	
	// 전체 관광지 목록 보기
	@Transactional(readOnly = true)
	public Page<Restaurant> list(Pageable pageable){
		return restaurantRepository.findAll(pageable);
	}
}
