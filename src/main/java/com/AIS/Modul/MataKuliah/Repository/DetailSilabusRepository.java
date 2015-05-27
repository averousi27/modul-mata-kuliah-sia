package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.DetailSilabus;

public interface DetailSilabusRepository {

	public UUID insert(DetailSilabus detailSilabus);

	public DetailSilabus findById(UUID idDetailSilabus);

}
