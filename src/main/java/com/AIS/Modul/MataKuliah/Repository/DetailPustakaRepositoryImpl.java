package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.DetailPustaka;

@Repository
public class DetailPustakaRepositoryImpl implements DetailPustakaRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void update(DetailPustaka dp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(dp);
		tx.commit(); 
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(DetailPustaka dp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(dp);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

}
