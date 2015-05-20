package com.AIS.Modul.MataKuliah.Repository;

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
	
	@Override
	public RP findRP(String idMK) {
		// TODO Auto-generated method stub
		RP queryResult = (RP)sessionFactory.getCurrentSession().createQuery("from RP rp "
				+ "join rp.mk mk "
				+ "where mk.idMK = '"+idMK.toString()+"'");
		if(queryResult!=null) return queryResult;
		else return null;
	}

	@Override
	public void save(RP rp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(rp);
		tx.commit();
		session.flush();
		session.close();
	}

}
