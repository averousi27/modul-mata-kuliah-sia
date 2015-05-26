package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.Silabus;

public interface SilabusRepository {

	public void update(Silabus silabus);

	public UUID insert(Silabus silabus);

	public Silabus findMK(UUID idMK);

	public Silabus findById(UUID idSilabus);

}
