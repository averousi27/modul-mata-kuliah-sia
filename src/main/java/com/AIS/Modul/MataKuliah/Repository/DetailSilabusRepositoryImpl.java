package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.DetailSilabus;

@Repository
public class DetailSilabusRepositoryImpl implements DetailSilabusRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public UUID insert(DetailSilabus detailSilabus) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(detailSilabus);
		tx.commit();
		System.out.println("Data detail tersimpan");
		session.flush();
		session.close();
		return insertId;
	}

}
