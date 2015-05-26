package com.AIS.Modul.MataKuliah.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.DetailSilabusRepository;
import com.sia.main.domain.DetailSilabus;

@Service
public class DetailSilabusServiceImpl implements DetailSilabusService {

	@Autowired
	private DetailSilabusRepository detailSilabusRepo;
	
	@Override
	public String save(DetailSilabus detailSilabus) {
		// TODO Auto-generated method stub
		return detailSilabusRepo.insert(detailSilabus).toString(); 
	}

}
