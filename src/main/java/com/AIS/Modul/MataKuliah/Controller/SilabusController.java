package com.AIS.Modul.MataKuliah.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.validation.constraints.Max;

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
import com.AIS.Modul.MataKuliah.Service.DetailPustakaService;
import com.AIS.Modul.MataKuliah.Service.DetailSilabusService;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.PemetaanSilabusService;
import com.AIS.Modul.MataKuliah.Service.PrasyaratMKService;
import com.AIS.Modul.MataKuliah.Service.PustakaService;
import com.AIS.Modul.MataKuliah.Service.SilabusService;
import com.AIS.Modul.MataKuliah.Service.SubCapPembMKService;
import com.sia.main.domain.CapPembMK;
import com.sia.main.domain.DetailPemetaan;
import com.sia.main.domain.DetailPustaka;
import com.sia.main.domain.DetailSilabus;
import com.sia.main.domain.MK;
import com.sia.main.domain.PemetaanSilabus;
import com.sia.main.domain.PrasyaratMK;
import com.sia.main.domain.Pustaka;
import com.sia.main.domain.RumpunMK;
import com.sia.main.domain.Silabus;
import com.sia.main.domain.SubCapPemb;
import com.sia.main.domain.SubCapPembMK;

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

	@Autowired
	private PemetaanSilabusService pemetaanSilabusServ;
	
	@Autowired
	private PustakaService pustakaServ;
	
	@Autowired
	private DetailPustakaService detailPustakaServ;
	
	@Autowired
	private SubCapPembMKService subCapPembMKServ;
	
	@Autowired
	private PrasyaratMKService prasyaratMKServ;
	
	private static final Logger logger = LoggerFactory.getLogger(SilabusController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) { 
		List<MK> mkList = mkServ.findAll();
		List<CapPembMK> cpmkList = capPembMKServ.findAll();
		List<Pustaka> pustakaList = pustakaServ.findAll();
		ModelAndView mav = new ModelAndView();  
		mav.addObject("mkList", mkList);
		mav.addObject("cpmkList", cpmkList);
		mav.addObject("pustakaList", pustakaList);
		mav.setViewName("ViewSilabus");
		return mav;
	}
	
	@RequestMapping(value="/simpan", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanSilabus(@RequestParam("idMK") UUID idMK) {  
		AjaxResponse response = new AjaxResponse(); 
		Silabus cekSilabus = silabusServ.findByMK(idMK);
		if(cekSilabus==null){
			MK mk = mkServ.findById(idMK); 
			Silabus silabusNew = new Silabus();
			silabusNew.setMk(mk); 
			silabusServ.save(silabusNew);
			response.setData(silabusNew);
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
		detailSilabusServ.save(detailSilabus);
		
		response.setData(detailSilabus);
		response.setStatus("ok");
		response.setMessage("Data detail silabus tersimpan");
		return response;
	}
	@RequestMapping(value="/editdetail", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse editDetailSilabus(@RequestParam("idDetailSilabus") UUID idDetailSilabus,
			@RequestParam("pokokBahasan") String pokokBahasan) {
		AjaxResponse response = null; 
		DetailSilabus detailSilabus = detailSilabusServ.findById(idDetailSilabus);    
		detailSilabus.setPokokBahasan(pokokBahasan);  
		if(detailSilabusServ.save(detailSilabus)==null){
			response = new AjaxResponse("error", "data pokok bahasan tidak ditemukan", null);
		}
		else{
			response = new AjaxResponse("ok", "data pokok bahasan diperbaharui", detailSilabus); 
		}
		return response;
	}
	
	@RequestMapping(value="/hapusdetail", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse hapusDetailSilabus(@RequestParam("idDetailSilabus") UUID idDetailSilabus) {    
		detailSilabusServ.delete(idDetailSilabus); 
		
		return new AjaxResponse();
	}
	
	@RequestMapping(value="/simpanpemetaan", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanPemetaan(@RequestParam("idDetailSilabus") UUID idDetailSilabus,
			@RequestParam("idCapPembMK") UUID idCapPembMK) {
		AjaxResponse response = new AjaxResponse(); 
		DetailSilabus ds = detailSilabusServ.findById(idDetailSilabus); 
		CapPembMK cpmk = capPembMKServ.findById(idCapPembMK); 
		PemetaanSilabus ps = new PemetaanSilabus(); 
		
		ps.setCapPembMK(cpmk);
		ps.setDetailSilabus(ds);
		pemetaanSilabusServ.save(ps);
		
		response.setData(ps);
		response.setStatus("ok");
		response.setMessage("Data pemetaan tersimpan");
		return response;
	}
	
	@RequestMapping(value="/simpanpustaka", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanDetailPustaka(@RequestParam("idPustaka") UUID idPustaka,
			@RequestParam("idSilabus") UUID idSilabus) {
		AjaxResponse response = new AjaxResponse(); 
		Silabus silabus = silabusServ.findById(idSilabus); 
		Pustaka pustaka = pustakaServ.findById(idPustaka); 
		DetailPustaka dp = new DetailPustaka();  
		
		dp.setPustaka(pustaka);
		dp.setSilabus(silabus);
		detailPustakaServ.save(dp);
		
		response.setData(dp);
		response.setStatus("ok");
		response.setMessage("Data detail pustaka tersimpan");
		return response;
	}
	
	@RequestMapping(value="/getpokokbahasanlist", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getPokokBahasanList(@RequestParam("idSilabus") UUID idSilabus){
		AjaxResponse response = null;
		List<DetailSilabus> pokokBahasanList = detailSilabusServ.findBySilabus(idSilabus);
		if(pokokBahasanList!=null){
			response = new AjaxResponse("ok", "list pokok bahasan ada", pokokBahasanList);
		}
		else response = new AjaxResponse("", "", null);
		return response; 
	}
	
	@RequestMapping(value="/getpemetaanlist", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getPemetaanList(@RequestParam("idDetailSilabus") UUID idDetailSilabus){
		AjaxResponse response = null;
		List<PemetaanSilabus> pemetaanSilabusList = pemetaanSilabusServ.findByDetailSilabus(idDetailSilabus);
		if(pemetaanSilabusList!=null){
			response = new AjaxResponse("ok", "list pemetaan silabus ada", pemetaanSilabusList);
		}
		else response = new AjaxResponse("", "", null);
		return response; 
	}
	
	@RequestMapping(value="/hapuspemetaan", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse deletePemetaan(@RequestParam("idPemetaanSilabus") UUID idPemetaanSilabus) {    
		pemetaanSilabusServ.delete(idPemetaanSilabus);  
		return new AjaxResponse("","Data pemetaan pokok bahasan sudah dihapus",null);
	}
	
	@RequestMapping(value="/hapuspustaka", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse deletePustaka (@RequestParam("idDetailPustaka") UUID idDetailPustaka) {    
		detailPustakaServ.delete(idDetailPustaka);  
		return new AjaxResponse("","Data pemetaan pokok bahasan sudah dihapus",null);
	}
	 
	@RequestMapping(value="/laporan", method = RequestMethod.GET)
	public ModelAndView showSilabus(Locale locale, Model model) {  
		ModelAndView mav = new ModelAndView();
		List<MK> mkList = mkServ.findAll(); 
		mav.addObject("mkList", mkList);
		mav.setViewName("DaftarReportSilabus");
		return mav;
	}
	
	@RequestMapping(value="/laporan", method = RequestMethod.POST)
	public ModelAndView getSilabusElement(Locale locale, Model model, @RequestParam("idMK") UUID idMK) {  
		ModelAndView mav = new ModelAndView();   
		MK mk2 = mkServ.findById(idMK); 
		Silabus silabus = silabusServ.findByMK(idMK);//dapat silabusnya
		List<DetailSilabus> dsList = detailSilabusServ.findBySilabus(silabus.getIdSilabus());//dapat pokok bahasannya
		List<DetailPustaka> dpList = detailPustakaServ.findBySilabus(silabus.getIdSilabus()); //dapat pustakanya    
		List< List<PemetaanSilabus> > psAllList = new ArrayList< List<PemetaanSilabus> >();
		List< List<SubCapPembMK> > scpmkAllList = new ArrayList< List<SubCapPembMK> >();
		for(DetailSilabus ds : dsList){
			List<PemetaanSilabus> psList = pemetaanSilabusServ.findByDetailSilabus(ds.getIdDetailSilabus());//dapat capaian pembelajaran mata kuliah
			psAllList.add(psList);
		}
		for(List<PemetaanSilabus> psList : psAllList){
			for(PemetaanSilabus ps : psList){ 
				//System.out.println(ps.getCapPembMK().getIdCapPembMK());
				List<SubCapPembMK> scpmkList = subCapPembMKServ.findByCapPembMKList(ps.getCapPembMK().getIdCapPembMK()); //dapat capaian pembelajaran satuan manajemen
				scpmkAllList.add(scpmkList);
			} 
		} 
		List<PrasyaratMK> prasyaratList = prasyaratMKServ.findParentMK(idMK); 
		
		mav.addObject("mk2", mk2);
		mav.addObject("silabus", silabus);
		mav.addObject("dsList", dsList);
		mav.addObject("dpList", dpList);
		mav.addObject("psAllList", psAllList);
		mav.addObject("scpmkAllList", scpmkAllList);
		mav.addObject("prasyaratList", prasyaratList); 
		mav.setViewName("ReportSilabus");
		return mav;
	}
	
	
	
}
