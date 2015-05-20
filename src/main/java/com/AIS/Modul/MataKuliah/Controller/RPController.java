package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.CapPembMKService;
import com.AIS.Modul.MataKuliah.Service.DetailPemetaanService;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.sia.main.domain.*;

@Controller
@RequestMapping(value = "/rencanapembelajaran")
public class RPController {

	@Autowired
	private MKService mkServ;
	
	@Autowired
	private CapPembMKService capPembMKServ;
	
	@Autowired
	private DetailPemetaanService detailPemetaanServ;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		RPPerTemu rpPerTemu = new RPPerTemu();  
		List<MK> mkList = mkServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("mkList", mkList);   
		mav.addObject("rp", rpPerTemu);
		mav.setViewName("ViewRencanaPembelajaran");  
		return mav;
	}
	
	@RequestMapping(value = "/json", method = RequestMethod.GET)
	public @ResponseBody Datatable json(
			@RequestParam("sEcho") String sEcho, 
			@RequestParam("iDisplayLength") int iDisplayLength,
            @RequestParam("iSortCol_0") int iSortCol_0,
            @RequestParam("sSortDir_0") String sSortDir_0,
            @RequestParam("sSearch") String sSearch,
			@RequestParam("iDisplayStart") int iDisplayStart,
			@RequestParam("statusRPPerTemu") String statusRPPerTemu,
			@RequestParam("optionMK") String namaMK
            ) {
		String filter = "CAST(rppt.statusRPPerTemu as string) LIKE '%"+statusRPPerTemu+"%'";
		Datatable rumpunMKDatatable = mkServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch, filter);
		
		return rumpunMKDatatable;
	} 
	
}
