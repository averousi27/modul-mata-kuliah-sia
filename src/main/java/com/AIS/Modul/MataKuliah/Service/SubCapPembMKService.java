package com.AIS.Modul.MataKuliah.Service;

import java.util.List;
import java.util.UUID;

import com.sia.main.domain.CapPemb;
import com.sia.main.domain.CapPembMK;
import com.sia.main.domain.SubCapPembMK;


public interface SubCapPembMKService {

	public CapPemb findByCapPembMK(CapPembMK capPembMK);

	public Datatable getdatatable(String sEcho, int iDisplayLength,
			int iDisplayStart, int iSortCol_0, String sSortDir_0,
			String sSearch, String filter);

	public String save(SubCapPembMK subCapPembMKNew);

	public List<SubCapPembMK> findCapPemb(String idCapPembMK);

	public void delete(UUID idSubCapPembMK);
  
	public List<SubCapPembMK> findByCapPembMKList(UUID idCapPembMK);

}
