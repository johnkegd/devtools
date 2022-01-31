package com.johnkegd.hibernate.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "teacher_social_media")
public class TeacherSocialMedia implements Serializable {
	@Id
	@Column(name = "id_teacher_social_media")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idTeacherSocialMedia;
	
	@Column(name = "nickname")
	private String nickName;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_teacher")
	private Teacher teacher;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_social_media")
	private SocialMedia socialMedia;
	
	public TeacherSocialMedia() {}
	
	public TeacherSocialMedia(String nickName) {
		this.nickName = nickName;
	}

	public Long getIdTeacherSocialMedia() {
		return idTeacherSocialMedia;
	}

	public void setIdTeacherSocialMedia(Long idTeacherSocialMedia) {
		this.idTeacherSocialMedia = idTeacherSocialMedia;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
