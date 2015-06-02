package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Transaction;

import com.sia.main.domain.RP;

@Repository
public class RPRepositoryImpl implements RPRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public RP findRP(String idMK) {
		// TODO Auto-generated method stub
		List<RP> queryResult = sessionFactory.getCurrentSession().createQuery("select rp from RP rp "
				+ "join rp.mk mk "
				+ "where mk.idMK = '"+idMK+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}
 

	@SuppressWarnings("unchecked")
	@Override
	public RP findBySilabus(UUID idSilabus) {
		// TODO Auto-generated method stub
		List<RP> queryResult = sessionFactory.getCurrentSession().createQuery("select rp from RP rp "
				+ "join rp.silabus silabus "
				+ "where silabus.idSilabus = '"+idSilabus.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return null;
	}

	@Override
	public UUID insert(RP rp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(rp);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

}
