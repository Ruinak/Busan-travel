//package com.cos.travel.web;
//
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//import com.cos.travel.config.auth.PrincipalDetails;
//import com.cos.travel.model.Spot;
//import com.cos.travel.model.Comment;
//import com.cos.travel.service.CommentService;
//
//@RequestMapping("/reply/*")
//@RestController
//public class CommentController {
//
//	@Autowired
//	private CommentService commentService;
//	
//	// 댓글 추가
//	@PostMapping("insert/{num}")
//	public ResponseEntity<String> insert(@PathVariable int id, @RequestBody Comment comment,
//			@AuthenticationPrincipal PrincipalDetails principal) {
//		Spot s = new Spot();
//		s.setId(id);
//		comment.setSpot(s);					// Spot의 값
//		System.out.println("principal.getUser() : "+ principal.getUser());
//		comment.setUser(principal.getUser());	// User의 값
//		commentService.insert(comment);
//		return new ResponseEntity<String>("success", HttpStatus.OK);
//	}
//	// 댓글 리스트
//	@GetMapping("list/{id}")
//	public List<Comment> list(@PathVariable int id){
//		List<Comment> clist = commentService.list(id);
//		return clist;
//	}
//}
