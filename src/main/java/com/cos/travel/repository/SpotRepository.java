package com.cos.travel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Spot;

public interface SpotRepository extends JpaRepository<Spot, Integer> {
	
	// 맞춤 관광지 추천 쿼리
	@Query(value="select * from spot where spot.theme REGEXP ?1", nativeQuery = true)
	Page<Spot> recommandUser(String userPreference, Pageable pagealbe);
	
	// 관광지명으로 검색하기
	Page<Spot> findBySightContaining(String sight, Pageable pageable);
		
	// 제목 + 내용으로 검색하기
	@Query(value = "SELECT * FROM spot WHERE " + "title LIKE %?1% or " + "detail LIKE %?1% ",
			countQuery = "SELECT count(*) FROM spot WHERE title LIKE %?1% or detail LIKE %?1%",
		    nativeQuery = true)
	Page<Spot> findByText(String searchText, Pageable pageable);
	
	// 해시태그로 검색하기.
	Page<Spot> findByTagContaining(String tag, Pageable pageable);
	
	// 테마별 관광지 조회하기 - 한가지 테마일때
	Page<Spot> findByThemeContaining(String theme, Pageable pageable);
	
	// 테마별 관광지 조회하기 - 두가지 테마일때
	@Query(value = "SELECT * FROM spot WHERE " + "theme LIKE %?1% or " + "theme LIKE %?2% ",
		    nativeQuery = true)
	Page<Spot> findByTwoTheme(String theme1, String theme2, Pageable pageable);
}
