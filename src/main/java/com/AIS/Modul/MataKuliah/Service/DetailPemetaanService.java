package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

public interface DetailPemetaanService {

	public Datatable getdatatable(String sEcho, int iDisplayLength, int iDisplayStart,
			int iSortCol_0, String sSortDir_0, String sSearch, String filter,
			UUID idMK);

	public boolean findRP(UUID idMK);

}
