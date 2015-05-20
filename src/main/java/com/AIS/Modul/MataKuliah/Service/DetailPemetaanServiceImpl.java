package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.DetailPemetaanRepository;

@Service
public class DetailPemetaanServiceImpl implements DetailPemetaanService {

	@Autowired
	public DetailPemetaanRepository detailPemetaanRepo;
	
	@Override
	public boolean findRP(UUID idMK){
		boolean idRP = detailPemetaanRepo.findRP(idMK);
		return idRP;
	}

	private String [] column = {"mk.idMK", "mk.kodeMK", "mk.namaMK", "kur.thnMulai", "rumpunMK.namaRumpunMK", "mk.tingkatPemb", 
			"mk.jumlahSKS", "mk.sifatMK", "kn.huruf", "mk.deskripsiMK", "mk.statusMK"};
	private Boolean[] searchable = {false,true,true,true,true,true,true,true,true,true,false};
	
	@Override
	public Datatable getdatatable(String sEcho, int iDisplayLength,
			int iDisplayStart, int iSortCol_0, String sSortDir_0,
			String sSearch, String filter, UUID idMK) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
