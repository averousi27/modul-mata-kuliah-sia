package com.AIS.Modul.MataKuliah.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.DetailPustakaRepository;
import com.sia.main.domain.DetailPustaka;

@Service
public class DetailPustakaServiceImpl implements DetailPustakaService {

	@Autowired
	private DetailPustakaRepository detailPustakaRepo;
	
	@Override
	public String save(DetailPustaka dp) {
		// TODO Auto-generated method stub
		if(dp.getIdDetailPustaka() != null)
		{
			//update
			detailPustakaRepo.update(dp);
			return dp.getIdDetailPustaka().toString();
		}
		else
		{
			//insert
			return detailPustakaRepo.insert(dp).toString();
		}
	}

}
