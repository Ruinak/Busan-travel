package com.cos.travel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.cos.travel.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username);

	public void deleteById(int id);

	User findByEmail(String email);
	
	Page<User> findByUsernameContaining(String username, Pageable pageable);
	Page<User> findByEmailContaining(String email, Pageable pageable);

	/* JPQL 형식
	 * @Query("SELECT u FROM User u WHERE " +
	 * "u.username LIKE %?#{escape([0])}% or " + "u.email LIKE %?#{escape([0])}% " +
	 * "escape ?#{escapeCharacter()}") List<User> findByText(String searchText);
	 */

	@Query(value = "SELECT * FROM User WHERE " + "username LIKE %?1% or " + "email LIKE %?1% ",
			countQuery = "SELECT count(*) FROM User WHERE username LIKE %?1% or email LIKE %?1%",
		    nativeQuery = true)
	Page<User> findByText(String searchText, Pageable pageable);
	//searchText = 검색어이며 ?1에 들어감
	//pageable시에는 countryQuery를 해서 개수를 알아야함
}