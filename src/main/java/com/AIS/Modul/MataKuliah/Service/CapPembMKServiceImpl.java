package com.AIS.Modul.MataKuliah.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.AIS.Modul.MataKuliah.Repository.CapPembMKRepository;
import com.sia.main.domain.CapPemb;
import com.sia.main.domain.CapPembMK;

@Service
public class CapPembMKServiceImpl implements CapPembMKService {
	
	@Autowired
	private CapPembMKRepository capPembMKRepo;
	
	@Autowired
	private SubCapPembMKService subCapPembMKServ;
	
	@Autowired
	private CapPembService capPembServ;
	 
	
	@Override
	public Datatable getdatatable(String sEcho, int iDisplayLength,
			int iDisplayStart, int iSortCol_0, String sSortDir_0,
			String sSearch, String filter) {
		 

		return null;
	}

	private List<CapPembMK> get(String where, String order,
			int limit, int iDisplayStart) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String save(CapPembMK capPembMK) {
		if(capPembMK.getIdCapPembMK() != null)
		{
			//update
			capPembMKRepo.update(capPembMK);
			return capPembMK.getIdCapPembMK().toString();
		}
		else
		{
			//insert
			return capPembMKRepo.insert(capPembMK).toString();
		}
	}

	@Override
	public CapPembMK findById(UUID idCapPembMK) {
		// TODO Auto-generated method stub
		return capPembMKRepo.findById(idCapPembMK);
	}

	@Override
	public List<CapPemb> findParent(CapPembMK capPembMK) {
		// TODO Auto-generated method stub 
		return capPembMKRepo.findParent(capPembMK);
	}

	@Override
	public String delete(UUID idCapPembMK) {
		// TODO Auto-generated method stub
		CapPembMK capPembMK = capPembMKRepo.findById(idCapPembMK);
		if(capPembMK==null) return null;
		else{
			capPembMK.setStatusCapPembMK(true); 
			capPembMKRepo.update(capPembMK);
			return "Ok";
		}
	}
}
