package com.johnkegd.hibernate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class JohnkegdSession {
	
	private Session session;
	
	public JohnkegdSession() {
			Configuration config = new Configuration();
			config.configure();
			SessionFactory sf = config.buildSessionFactory();
			this.session = sf.openSession();
			this.session.beginTransaction();
	}
	

	public Session getSession() {
		return this.session;
	}
	

}
