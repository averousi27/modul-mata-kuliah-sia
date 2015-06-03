package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.RPPerTemu;
import com.sia.main.domain.RumpunMK;

@Repository
public class RPPerTemuRepositoryImpl implements RPPerTemuRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void update(RPPerTemu rpPerTemu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(rpPerTemu);
		tx.commit();
		session.flush();
		session.close();
	}

	@Override
	public UUID insert(RPPerTemu rpPerTemu) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		UUID insertId= (UUID)session.save(rpPerTemu);
		tx.commit();
		session.flush();
		session.close();
		return insertId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public RPPerTemu findById(UUID idRPPerTemu) {
		// TODO Auto-generated method stub
		List<RPPerTemu> queryResult = sessionFactory.getCurrentSession().createQuery("from RPPerTemu WHERE idRPPerTemu='"+idRPPerTemu.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public RPPerTemu findByRP(UUID idRP) {
		// TODO Auto-generated method stub
		List<RPPerTemu> queryResult = sessionFactory.getCurrentSession().createQuery("from RPPerTemu rppt "
				+ "join rppt.rp rp "
				+ "WHERE rp.idRP='"+idRP.toString()+"'").list();
		if(queryResult.size()==0) return null;
		return queryResult.get(0);
	}

}
