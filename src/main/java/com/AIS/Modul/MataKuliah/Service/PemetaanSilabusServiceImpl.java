package com.AIS.Modul.MataKuliah.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.PemetaanSilabusRepository;
import com.sia.main.domain.PemetaanSilabus;

@Service
public class PemetaanSilabusServiceImpl implements PemetaanSilabusService{

	@Autowired
	private PemetaanSilabusRepository pemetaanSilabusRepo;
	
	@Override
	public String save(PemetaanSilabus ps) {
		// TODO Auto-generated method stub
		if(ps.getIdPemetaanSilabus() != null)
		{
			//update
			pemetaanSilabusRepo.update(ps);
			return ps.getIdPemetaanSilabus().toString();
		}
		else
		{
			//insert
			return pemetaanSilabusRepo.insert(ps).toString();
		}
	}

}
