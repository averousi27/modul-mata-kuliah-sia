package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.DetailSilabus;

public interface DetailSilabusService {

	public String save(DetailSilabus detailSilabus);

	public DetailSilabus findById(UUID idDetailSilabus);

}
