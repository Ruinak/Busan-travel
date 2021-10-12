package com.cos.travel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.cos.travel.model.Spot;

public interface SpotRepository extends JpaRepository<Spot, Integer> {
	
}
