package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.BentukPenilaianService;
import com.AIS.Modul.MataKuliah.Service.CapPembMKService;
import com.AIS.Modul.MataKuliah.Service.DetailPemetaanService;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.DetailSilabusService;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.MateriSilabusService;
import com.AIS.Modul.MataKuliah.Service.MetodePembService;
import com.AIS.Modul.MataKuliah.Service.RPPerTemuService;
import com.AIS.Modul.MataKuliah.Service.RPService;
import com.AIS.Modul.MataKuliah.Service.SilabusService;
import com.sia.main.domain.*;

@Controller
@RequestMapping(value = "/rencanapembelajaran/kelola")
public class RPController {

	@Autowired
	private MKService mkServ;
	
	@Autowired
	private CapPembMKService capPembMKServ;
	
	@Autowired
	private RPService rpServ;
	
	@Autowired
	private DetailPemetaanService detailPemetaanServ;
	
	@Autowired
	private RPPerTemuService rpPerTemuServ;
	
	@Autowired
	private SilabusService silabusServ;
	
	@Autowired
	private MetodePembService metodePembServ;
	
	@Autowired
	private BentukPenilaianService bentukServ;
	
	@Autowired
	private DetailSilabusService detailSilabusServ;
	 
	@Autowired
	private MateriSilabusService materiSilabusServ;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) { 
		ModelAndView mav = new ModelAndView(); 
		List<MK> mkList = mkServ.findAll(); 
		List<MetodePemb> metodePembList = metodePembServ.findAll();
		List<BentukPenilaian> bentukList = bentukServ.findAll();
		List<DetailSilabus> dsList = detailSilabusServ.findAll();
		mav.addObject("mkList", mkList);   
		mav.addObject("metodePembList", metodePembList); 
		mav.addObject("bentukList", bentukList); 
		mav.addObject("dsList", dsList); 
		mav.setViewName("ViewRencana"); 
		return mav;
	}   
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idRPPerTemu[]") UUID[] idRPPerTemu) {
		AjaxResponse response;
		
		for (UUID uuid : idRPPerTemu) {
			rpPerTemuServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data non-aktif",null);
        return response;
    } 
	
	@RequestMapping(value="/getsilabus", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getSilabus(@RequestParam("idMK") UUID idMK){
		AjaxResponse response = new AjaxResponse(); 
		Silabus silabus = silabusServ.findByMK(idMK);
		if(silabus!=null){
			response.setData(silabus);
		}
		else{
			response.setMessage("Silabus tidak ditemukan");
			response.setData(null);
		}
		return response;
	}
	
	@RequestMapping(value="/getrp", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getRP(@RequestParam("idSilabus") UUID idSilabus){
		AjaxResponse response = new AjaxResponse();  
		RP rp = rpServ.findBySilabus(idSilabus);
		if(rp!=null){
			response.setData(rp);
		}
		else{
			response.setData(null);
		} 
		return response;
	}
	
	@RequestMapping(value="/editrp", method = RequestMethod.POST)
	public @ResponseBody AjaxResponse editRP(@RequestParam("idRP") UUID idRP,
			@RequestParam("idSilabus") UUID idSilabus,
			@RequestParam("bahanKajian") String bahanKajian) {
		AjaxResponse response = null; 
		RP rp = rpServ.findById(idRP); 
		Silabus silabus = silabusServ.findById(idSilabus);
		rp.setBahanKajian(bahanKajian);  
		rp.setSilabus(silabus);
		if(rpServ.save(rp)==null){
			response = new AjaxResponse("error", "RP tidak ditemukan", null);
		}
		else{
			response = new AjaxResponse("ok", "RP diperbaharui", rp); 
		}
		return response;
	}
	
	@RequestMapping(value = "/simpanrp", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@RequestParam("idSilabus") UUID idSilabus, 
    		@RequestParam("bahanKajian") String bahanKajian) {
		AjaxResponse response = new AjaxResponse();   
		Silabus silabus = silabusServ.findById(idSilabus);
		RP rpNew = new RP();
		rpNew.setBahanKajian(bahanKajian);
		rpNew.setSilabus(silabus);
		rpServ.save(rpNew); 
		response.setData(rpNew);
        return response; 
    } 
	
	@RequestMapping(value="/getrppertemu", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getRPPerTemu(@RequestParam("idRP") UUID idRP){
		AjaxResponse response = new AjaxResponse(); 
		List<RPPerTemu> rpptList = rpPerTemuServ.findByRP(idRP);  
		if(rpptList!=null){
			response.setMessage("rpPerTemu");
			response.setData(rpptList);
		} 
		return response;
	}
	
	@RequestMapping(value="/editrppertemu", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse editRPPerTemu(@RequestParam("idRPPerTemu") UUID idRPPerTemu){
		AjaxResponse response = new AjaxResponse(); 
		RPPerTemu rppt = rpPerTemuServ.findById(idRPPerTemu);  
		if(rppt!=null){
			response.setMessage("rpPerTemu");
			response.setData(rppt);
		} 
		return response;
	}
	
	@RequestMapping(value="/simpanrppertemu", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanRPPerTemu(@RequestParam("idRPPerTemu") UUID idRPPerTemu, @RequestParam("idRP") UUID idRP,
			@RequestParam("mingguPemb") int mingguPemb, @RequestParam("waktuPemb") int waktuPemb,
			@RequestParam("idMetodePemb") UUID idMetodePemb, @RequestParam("indikatorPenilaian") String indikatorPenilaian,
			@RequestParam("idBentuk") UUID idBentuk, @RequestParam("bobotPenilaian") double bobotPenilaian){
		AjaxResponse response = new AjaxResponse(); 
		RP rp = rpServ.findById(idRP);
		MetodePemb metodePemb = metodePembServ.findById(idMetodePemb);
		BentukPenilaian bp = bentukServ.findById(idBentuk);
		RPPerTemu rppt=null;
		if(idRPPerTemu==null){
			rppt = new RPPerTemu();
		}
		else{
			rppt = rpPerTemuServ.findById(idRPPerTemu);
		}
		rppt.setBentukPenilaian(bp);
		rppt.setBobotPenilaian(bobotPenilaian);
		rppt.setMetodePemb(metodePemb);
		rppt.setMingguPembKe(mingguPemb);
		rppt.setWaktuPemb(waktuPemb);
		rppt.setRp(rp); 
		
		rpPerTemuServ.save(rppt);
		
		response.setData(rppt);
		return response;
		
	} 
	
	@RequestMapping(value="/simpanmateri", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanMateri(@RequestParam("idRPPerTemu") UUID idRPPerTemu,
			@RequestParam("idDetailSilabus") UUID idDetailSilabus){
		AjaxResponse response = new AjaxResponse(); 
		DetailSilabus detailSilabus = detailSilabusServ.findById(idDetailSilabus);
		RPPerTemu rppt = rpPerTemuServ.findById(idRPPerTemu);
		MateriSilabus mp = new MateriSilabus();
		mp.setRpPerTemu(rppt);
		mp.setDetailSilabus(detailSilabus);
		materiSilabusServ.save(mp);
		response.setData(mp);
		return response;
	}
	
	@RequestMapping(value="/deletemateri", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse hapusMateri(@RequestParam("idMateriSilabus") UUID idMateriSilabus){
		AjaxResponse response = new AjaxResponse();  
		materiSilabusServ.delete(idMateriSilabus);
		return response;
	}
	
	@RequestMapping(value="/getmateri", method=RequestMethod.GET)
	public @ResponseBody AjaxResponse getMateri(@RequestParam("idRPPerTemu") UUID idRPPerTemu){
		AjaxResponse response = new AjaxResponse(); 
		List<MateriSilabus> msList = materiSilabusServ.findByRPPerTemu(idRPPerTemu);  
		response.setData(msList);
		return response;
	}
}
