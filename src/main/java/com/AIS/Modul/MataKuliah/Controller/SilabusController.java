package com.AIS.Modul.MataKuliah.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.CapPembMKService;
import com.AIS.Modul.MataKuliah.Service.DetailSilabusService;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.PustakaService;
import com.AIS.Modul.MataKuliah.Service.SilabusService;
import com.sia.main.domain.CapPembMK;
import com.sia.main.domain.DetailPemetaan;
import com.sia.main.domain.DetailPustaka;
import com.sia.main.domain.DetailSilabus;
import com.sia.main.domain.MK;
import com.sia.main.domain.Pustaka;
import com.sia.main.domain.RumpunMK;
import com.sia.main.domain.Silabus;
import com.sia.main.domain.SubCapPemb;

@Controller
@RequestMapping(value = "/silabus/kelola")
public class SilabusController {


	@Autowired
	private MKService mkServ;
	
	@Autowired
	private SilabusService silabusServ;
	
	@Autowired
	private CapPembMKService capPembMKServ;
	
	@Autowired
	private DetailSilabusService detailSilabusServ;
	
	private static final Logger logger = LoggerFactory.getLogger(SilabusController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) { 
		List<MK> mkList = mkServ.findAll();
		List<CapPembMK> cpmkList = capPembMKServ.findAll();
		
		ModelAndView mav = new ModelAndView();  
		mav.addObject("mkList", mkList);
		mav.addObject("cpmkList", cpmkList);
		mav.setViewName("ViewSilabus");
		return mav;
	}
	
	@RequestMapping(value="/simpan", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanSilabus(@RequestParam("idMK") UUID idMK) {  
		AjaxResponse response = new AjaxResponse(); 
		Silabus cekSilabus = silabusServ.findMK(idMK);
		if(cekSilabus==null){
			MK mk = mkServ.findById(idMK); 
			Silabus silabusNew = new Silabus();
			silabusNew.setMk(mk); 
			response.setData(silabusServ.save(silabusNew));
			response.setMessage("Data berhasil disimpan"); 
		}   
		else{
			response.setData(cekSilabus); 
			response.setMessage("Silabus ditampilkan yang sudah ada"); 
		} 
        return response; 
	}
	
	@RequestMapping(value="/simpandetail", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanDetailSilabus(@RequestParam("idSilabus") UUID idSilabus,
			@RequestParam("pokokBahasan") String pokokBahasan) {
		AjaxResponse response = new AjaxResponse(); 
		Silabus silabus = silabusServ.findById(idSilabus); 
		DetailSilabus detailSilabus = new DetailSilabus();
		detailSilabus.setSilabus(silabus);
		detailSilabus.setPokokBahasan(pokokBahasan);
		
		response.setData(detailSilabusServ.save(detailSilabus));
		response.setStatus("ok");
		response.setMessage("Data detail silabus tersimpan");
		return response;
	}
	
	@RequestMapping(value="/simpanpemetaan", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanPemetaan(@RequestParam("idDetailSilabus") UUID idDetailSilabus,
			@RequestParam("idCapPembMK") UUID idCapPembMK) {
		AjaxResponse response = new AjaxResponse(); 
		Silabus silabus = silabusServ.findById(idDetailSilabus); 
		DetailSilabus detailSilabus = new DetailSilabus();
		detailSilabus.setSilabus(silabus);
		detailSilabus.setPokokBahasan(pokokBahasan);
		
		response.setData(detailSilabusServ.save(detailSilabus));
		response.setStatus("ok");
		response.setMessage("Data detail silabus tersimpan");
		return response;
	}
}
