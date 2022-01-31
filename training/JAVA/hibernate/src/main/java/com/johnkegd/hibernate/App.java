package com.johnkegd.hibernate;

import java.util.List;

import com.johnkegd.hibernate.dao.TeacherDaoImpl;
import com.johnkegd.hibernate.model.Teacher;

public class App {

	public static void main(String[] args) {
	
	TeacherDaoImpl teacherDaoImpl = new TeacherDaoImpl();
	Teacher changer = new Teacher("Change","avatar");
	changer.setIdTeacher(new Long(3));
	/*
	Teacher gwendolin = new Teacher("Gwendolin Rotach","avatar");
	teacherDaoImpl.saveTeacher(gwendolin);
	
	List<Teacher> teachersList = teacherDaoImpl.getAllTeachers();
	
	for(Teacher teacher : teachersList) {
		System.out.println(teacher.getName());
		}
	*/

	
	teacherDaoImpl.deleteTeacherById(new Long(3));
	
	}

}
