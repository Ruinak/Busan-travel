package com.cos.travel.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.travel.model.Spot;
import com.cos.travel.repository.SpotRepository;
import com.cos.travel.web.dto.search.SearchDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class SpotService {

	private final SpotRepository spotRepository;
	
	// 전체 관광지 목록 보기
	@Transactional(readOnly = true)
	public Page<Spot> list(Pageable pageable){
		return spotRepository.findAll(pageable);
	}
	
	// 관광지 상세보기
	@Transactional(readOnly = true)
	public Spot detail(int id) {
		return spotRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("상세보기 실패");
				});
	}
	
	// 맞춤 관광지 추천
	@Transactional(readOnly = true)
	public Page<Spot> recommand(String userPreference, Pageable pageable){
		return spotRepository.recommandUser(userPreference, pageable);
	}
	
	// 관광지 검색하기.
	@Transactional(readOnly = true)
	public Page<Spot> searchByText(SearchDto dto, Pageable pageable) {
		Page<Spot> spotList = null;
		switch (dto.getGubun()) {
		case "관광지명":
			spotList = spotRepository.findBySightContaining(dto.getText(), pageable);
			break;
		case "제목 내용":
			spotList = spotRepository.findByText(dto.getText(), pageable);
			break;
		case "해시태그":
			spotList = spotRepository.findByTagContaining(dto.getText(), pageable);
		}
		return spotList;
	}

	// 테마별 관광지 조회하기 - 한가지 테마일때
	@Transactional(readOnly = true)
	public Page<Spot> findByTheme(String theme, Pageable pageable) {
		return spotRepository.findByThemeContaining(theme, pageable);
	}
	
	// 테마별 관광지 조회하기 - 두가지 테마일때
	@Transactional(readOnly = true)
	public Page<Spot> findByTwoTheme(String theme1, String theme2, Pageable pageable) {
		return spotRepository.findByTwoTheme(theme1, theme2, pageable);
	}
}
