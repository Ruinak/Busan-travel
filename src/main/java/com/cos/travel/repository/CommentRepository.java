//package com.cos.travel.repository;
//
//import java.util.List;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//import com.cos.travel.model.Comment;
//
//public interface CommentRepository extends JpaRepository<Comment, Integer>{
//
//	@Modifying
//	@Query(value = "INSERT INTO comment(content, regdate, spot_id, user_id) values(?1, now(), ?2, ?3)",
//					nativeQuery = true)
//	public void commentInsert(String content, int spot_id, int user_id);
//	
//	//@Query("SELECT sc FROM tbl_comment3 sc WHERE bnum=?1")	// JPQL로 FROM 뒤에 클래스명을 써주는게 맞음
//	@Query("SELECT sc FROM comment sc JOIN fetch sc.spot WHERE spot_id=?1") // fetch 조인도 있음, tbl_comment3는 Entity명
//	public List<Comment> findBySid(int spot_id);
//}
