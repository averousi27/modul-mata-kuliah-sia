package com.AIS.Modul.MataKuliah.Repository;

import com.sia.main.domain.RP;

public interface RPRepository {
 
	public RP findRP(String string);

	public void save(RP rp);

}
