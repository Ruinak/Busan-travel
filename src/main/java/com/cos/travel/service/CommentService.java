//package com.cos.travel.service;
//
//import java.util.List;
//import java.util.Optional;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import com.cos.travel.model.Spot;
//import com.cos.travel.model.Comment;
//import com.cos.travel.repository.SpotRepository;
//import com.cos.travel.repository.CommentRepository;
//import lombok.RequiredArgsConstructor;
//
//@Service
//@RequiredArgsConstructor	// 요구되어지는 생성자를 만들고 final을 사용하면 Autowired를 대체할 수 있음
//public class CommentService {
//
//	private final CommentRepository commentRepository;
//	private final SpotRepository spotRepository;
//	
//	// 댓글 추가
//	@Transactional
//	public void insert(Comment comment) {
//		// board의 replyCnt를 1 증가
//		Optional<Spot> s = spotRepository.findById(comment.getSpot().getId());
//		
//		System.out.println("reply insert");
//		// 댓글 추가
//		// commentRepository.save(comment);
//		
//		// JPQL
//		commentRepository.commentInsert(
//				comment.getContent(), 
//				comment.getSpot().getId(),
//				comment.getUser().getId()
//				);
//	}
//	// 댓글 리스트
//	@Transactional
//	public List<Comment> list(int id){
//		return commentRepository.findBySid(id);
//	}
//}