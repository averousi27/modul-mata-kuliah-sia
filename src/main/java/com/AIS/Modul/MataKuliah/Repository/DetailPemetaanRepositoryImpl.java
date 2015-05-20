package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sia.main.domain.DetailPemetaan;

@Repository
public class DetailPemetaanRepositoryImpl implements DetailPemetaanRepository{

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unused")
	@Override
	public boolean findRP(UUID idMK) {
		// TODO Auto-generated method stub
	DetailPemetaan queryResult = (DetailPemetaan) sessionFactory.getCurrentSession().createQuery(
				"select dp from detailPemetaan dp "
				+ "join dp.capPembMK cpmk"
				+ "join dp.rpPerTemu rppt"
				+ "join cpmk.mk mk"
				+ "where mk.idMK = '"+idMK.toString()+"'"); 
		return false;
	}

	@Override
	public long count(String where) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		if(where != "") dbWhere = " WHERE "+where;
		Query query = sessionFactory.getCurrentSession().createQuery(
		        "select count(*) from detailPemetaan dp "
				+ "join dp.capPembMK cpmk"
				+ "join dp.rpPerTemu rppt"
				+ "join cpmk.mk mk"+dbWhere);
		Long count = (Long)query.uniqueResult();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetailPemetaan> get(String where, String order, int limit,
			int offset) {
		// TODO Auto-generated method stub
		String dbWhere ="";
		String dbOrder ="";
		if(where != "") dbWhere = " WHERE "+where;
		if(order != "") dbOrder = " ORDER BY "+order;
		 
		Query query = sessionFactory.getCurrentSession().createQuery("select dp from detailPemetaan dp "
				+ "join dp.capPembMK cpmk"
				+ "join dp.rpPerTemu rppt"
				+ "join cpmk.mk mk" +dbWhere+dbOrder);
		
		if(limit != -1 && limit>0) {
			query.setFirstResult(offset);
			if(offset < 0) offset = 0;
			query.setMaxResults(limit);
		}
		
		return query.list();
	}

}
