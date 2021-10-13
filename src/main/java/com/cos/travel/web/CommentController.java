package com.cos.travel.web;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cos.travel.config.auth.PrincipalDetails;
import com.cos.travel.model.Comment;
import com.cos.travel.model.Spot;
import com.cos.travel.service.CommentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CommentController {
	
	private final CommentService commentService;
	
	// 댓글 작성
	@PostMapping("/comment/insert/{num}")
	public ResponseEntity<String> cInsert(@PathVariable int num,
			@RequestBody Comment comment,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		// jsp에서 spot 정보 못가져옴. 컨트롤러에서 처리
		Spot spot = new Spot();
		spot.setId(num);
		comment.setSpot(spot);
		comment.setUser(principalDetails.getUser());
		System.out.println(comment);
		commentService.insert(comment);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	// 댓글 리스트
	@GetMapping("/comment/list/{num}")
	public ResponseEntity<List<Comment>> list(@PathVariable int num){
		System.out.println("num = " + num);
		List<Comment> clist = commentService.list(num);
		return new ResponseEntity<List<Comment>>(clist, HttpStatus.OK);
	}
}