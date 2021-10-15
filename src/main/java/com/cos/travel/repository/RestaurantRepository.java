package com.cos.travel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Restaurant;

public interface RestaurantRepository extends JpaRepository<Restaurant, Integer> {
	
	// 가게이름으로 검색하기
	Page<Restaurant> findByRestaurantContaining(String restaurant, Pageable pageable);
		
	// 제목 + 내용으로 검색하기
	@Query(value = "SELECT * FROM restaurant WHERE " + "title LIKE %?1% or " + "detail LIKE %?1% ",
			countQuery = "SELECT count(*) FROM restaurant WHERE title LIKE %?1% or detail LIKE %?1%",
		    nativeQuery = true)
	Page<Restaurant> findByText(String searchText, Pageable pageable);
}
