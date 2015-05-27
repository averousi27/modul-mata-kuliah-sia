package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.PemetaanSilabus;

@Repository
public class PemetaanSilabusRepositoryImpl implements PemetaanSilabusRepository{
 
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void update(PemetaanSilabus ps) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(ps);
		tx.commit(); 
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(PemetaanSilabus ps) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(ps);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

}
