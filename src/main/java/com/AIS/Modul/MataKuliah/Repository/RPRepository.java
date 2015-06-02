package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.RP;

public interface RPRepository {
 
	public RP findRP(String string); 

	public RP findBySilabus(UUID idSilabus);

	public UUID insert(RP rp);

}
