package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.DetailSilabus;

public interface DetailSilabusRepository {

	public UUID insert(DetailSilabus detailSilabus);

	public DetailSilabus findById(UUID idDetailSilabus);

	public void update(DetailSilabus detailSilabus);

	public List<DetailSilabus> findBySilabus(UUID idSilabus);

	public List<DetailSilabus> findAll();

}
