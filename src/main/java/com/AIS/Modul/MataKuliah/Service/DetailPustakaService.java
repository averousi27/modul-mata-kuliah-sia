package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.DetailPustaka;

public interface DetailPustakaService {

	public String save(DetailPustaka dp);

	public String delete(UUID idDetailPustaka);

}
