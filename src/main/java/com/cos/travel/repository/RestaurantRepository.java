package com.cos.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.cos.travel.model.Restaurant;

public interface RestaurantRepository extends JpaRepository<Restaurant, Integer> {
	
}
