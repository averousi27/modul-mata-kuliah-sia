package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.RP;

public interface RPService {

	public RP findRP(String string);

	public String save(RP rp);

	public RP findBySilabus(UUID idSilabus); 
}
