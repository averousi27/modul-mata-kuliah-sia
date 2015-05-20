package com.AIS.Modul.MataKuliah.Service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.DetailPemetaanRepository;

@Service
public class DetailPemetaanServiceImpl implements DetailPemetaanService {

	@Autowired
	public DetailPemetaanRepository detailPemetaanRepo;
	
	public boolean findRP(UUID idMK){
		boolean idRP = detailPemetaanRepo.findRP(idMK);
		return idRP;
	}
	
}
