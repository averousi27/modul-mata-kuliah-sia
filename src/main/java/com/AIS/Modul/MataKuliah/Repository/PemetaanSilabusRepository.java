package com.AIS.Modul.MataKuliah.Repository;

import java.util.UUID;

import com.sia.main.domain.PemetaanSilabus;

public interface PemetaanSilabusRepository {

	public void update(PemetaanSilabus ps);

	public UUID insert(PemetaanSilabus ps);

}
