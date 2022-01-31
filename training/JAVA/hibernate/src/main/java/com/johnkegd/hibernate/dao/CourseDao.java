package com.johnkegd.hibernate.dao;

import java.util.List;

import com.johnkegd.hibernate.model.Course;

public interface CourseDao {
	
	void addCourse(Course course);
	
	void addCourses(List<Course> courses);
	
	public List<Course> getAllCourses();
	
	public Course findById(Long idCourse);
	
	void update(Course course);

	void deleteByID(Long idCourse);
	
	void deleteCoursesById(List<Long> courses);
	
	
	
	
	
	
	
}
