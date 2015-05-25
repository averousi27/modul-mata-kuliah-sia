package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.PustakaService;
import com.sia.main.domain.DetailPemetaan;
import com.sia.main.domain.DetailPustaka;
import com.sia.main.domain.DetailSilabus;
import com.sia.main.domain.MK;
import com.sia.main.domain.Pustaka;
import com.sia.main.domain.RumpunMK;
import com.sia.main.domain.Silabus;

@Controller
@RequestMapping(value = "/silabus/kelola")
public class SilabusController {


	@Autowired
	private MKService mkServ;
	
	private static final Logger logger = LoggerFactory.getLogger(SilabusController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		Silabus silabus = new Silabus(); 
		DetailSilabus detailSilabus = new DetailSilabus();
		DetailPustaka detailPustaka = new DetailPustaka();
		DetailPemetaan detailPemetaan = new DetailPemetaan();
		List<MK> mkList = mkServ.findAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("silabus", silabus);
		mav.addObject("detailSilabus", detailSilabus);
		mav.addObject("detailPustaka", detailPustaka);
		mav.addObject("detailPemetaan", detailPemetaan);
		mav.addObject("mkList", mkList);
		mav.setViewName("ViewSilabus");
		return mav;
	}
}
