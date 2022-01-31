package com.johnkegd.hibernate.dao;

import java.util.List;
import com.johnkegd.hibernate.model.Teacher;

public interface TeacherDao {

	void saveTeacher(Teacher teacher);
	
	List<Teacher> getAllTeachers();
	
	void deleteTeacherById(Long idTeacher);
	
	void updateTeacher(Teacher teacher);
	
	Teacher findById(Long idTeacher);
	
	Teacher findByName(String name);
}
