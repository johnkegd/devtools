package com.johnkegd.hibernate.dao;

import java.util.List;

import com.johnkegd.hibernate.model.Teacher;

public class TeacherDaoImpl extends JohnkegdSession implements TeacherDao {
	
	private JohnkegdSession johnkegdSession;
	
	public TeacherDaoImpl() {
		this.johnkegdSession = new JohnkegdSession();
	}

	@Override
	public void saveTeacher(Teacher teacher) {

		johnkegdSession.getSession().persist(teacher);
		johnkegdSession.getSession().getTransaction().commit();
	}

	@Override
	public List<Teacher> getAllTeachers() {
		return johnkegdSession.getSession().createQuery("from Teacher").list();
	}

	@Override
	public void deleteTeacherById(Long idTeacher) {
		Teacher teacher = findById(idTeacher);
		johnkegdSession.getSession().delete(teacher);
		johnkegdSession.getSession().getTransaction().commit();
		System.out.println("Teacher deleted");
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		johnkegdSession.getSession().update(teacher);
		johnkegdSession.getSession().getTransaction().commit();
	}

	@Override
	public Teacher findById(Long idTeacher) {
		try {
			Teacher teacher = johnkegdSession.getSession().find(Teacher.class, idTeacher);
			if (teacher == null) {
				throw new NullPointerException();
			}
			return teacher;
		} catch(NullPointerException e) {
			System.out.println("Teacher not Found:" + e);
		}
		
		return null;
	}

	@Override
	public Teacher findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

}
