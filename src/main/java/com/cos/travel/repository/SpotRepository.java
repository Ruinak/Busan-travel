package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Spot;

public interface SpotRepository extends JpaRepository<Spot, Integer> {
	
	@Query(value="select * from spot where spot.theme REGEXP ?1",
			nativeQuery = true)
	public List<Spot> recommand(String userPreference);
	
}
