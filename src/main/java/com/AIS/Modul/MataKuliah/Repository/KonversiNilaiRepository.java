package com.AIS.Modul.MataKuliah.Repository;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.KonversiNilai;

public interface KonversiNilaiRepository {

	public List<KonversiNilai> findAll();

	public KonversiNilai findById(UUID idKonversi);

}
