package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.DetailPustaka;

public interface DetailPustakaRepository {

	public void update(DetailPustaka dp);

	public UUID insert(DetailPustaka dp);

	public DetailPustaka findById(UUID idDetailPustaka);

}
