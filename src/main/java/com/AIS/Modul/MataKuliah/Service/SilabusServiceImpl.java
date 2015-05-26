package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.SilabusRepository;
import com.sia.main.domain.Silabus;

@Service
public class SilabusServiceImpl implements SilabusService {

	@Autowired
	private SilabusRepository silabusRepo;
	
	@Override
	public String save(Silabus silabus) { 
			return silabusRepo.insert(silabus).toString(); 
	}

	@Override
	public Silabus findMK(UUID idMK) {
		return silabusRepo.findMK(idMK);
		// TODO Auto-generated method stub
		
	}

	@Override
	public Silabus findById(UUID idSilabus) {
		// TODO Auto-generated method stub
		return silabusRepo.findById(idSilabus);
	}
}
