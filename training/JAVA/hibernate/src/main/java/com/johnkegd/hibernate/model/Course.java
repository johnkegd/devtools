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
@Table(name = "course")
public class Course implements Serializable {
	
	@Id
	@Column(name = "id_course")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idCourse;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "project")
	private String project;
	
	@Column(name = "themes")
	private String theme;
	
	@ManyToOne(optional = true, fetch = FetchType.EAGER)
	@JoinColumn(name = "id_teacher")
	private Teacher teacher;

	
	public Course() {}
	
	public Course(String name, String project, String theme) {
		this.name = name;
		this.project = project;
		this.theme = theme;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getProject() {
		return this.project;
	}
	public void setProject(String project) {
		this.project = project;
	}

	public String getTheme() {
		return this.theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	
	
}
