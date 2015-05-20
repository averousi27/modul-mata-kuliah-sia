package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

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
				"from detailPemetaan dp "
				+ "join dp.capPembMK cpmk"
				+ "join dp.rpPerTemu rppt"
				+ "join cpmk.mk mk"
				+ "where mk.idMK = '"+idMK.toString()+"'");
		return false;
	}

}
