package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import com.sia.main.domain.MateriSilabus;

public interface MateriSilabusService {

	public String save(MateriSilabus mp);

	public MateriSilabus findById(UUID idMateriSilabus);

	public String delete(UUID idMateriSilabus);

}
