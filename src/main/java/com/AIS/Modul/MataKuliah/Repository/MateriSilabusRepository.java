package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.MateriSilabus;

public interface MateriSilabusRepository {

	public void update(MateriSilabus mp);

	public UUID insert(MateriSilabus mp);

	public MateriSilabus findById(UUID idMateriSilabus);

}
