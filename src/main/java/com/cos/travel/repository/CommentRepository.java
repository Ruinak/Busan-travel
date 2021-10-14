package com.cos.travel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.travel.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	@Query(value="SELECT * FROM comment WHERE s_id=?1", nativeQuery = true) 
	public List<Comment> findByS_id(int num);
}
