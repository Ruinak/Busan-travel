//package com.cos.travel.model;
//
//import java.util.Date;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Temporal;
//import javax.persistence.TemporalType;
//import org.hibernate.annotations.CreationTimestamp;
//import com.fasterxml.jackson.annotation.JsonFormat;
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@Builder
//@AllArgsConstructor
//@NoArgsConstructor
//@Data
//@Entity
//public class Comment {
//
//	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
//	private int cnum;
//	private String content;
//	
//	@CreationTimestamp
//	@Temporal(TemporalType.TIMESTAMP)
//	@JsonFormat(pattern = "yyyy-MM-dd")
//	private Date regdate;
//	
//	@ManyToOne
//	@JoinColumn(name="spot_id")
//	private Spot spot;
//	
//	@ManyToOne
//	@JoinColumn(name = "user_id")
//	private User user;
//}