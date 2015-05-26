package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.Silabus;

public interface SilabusService {
	
	public String save(Silabus silabus);

	public Silabus findMK(UUID idMK);

	public Silabus findById(UUID idSilabus);
}
