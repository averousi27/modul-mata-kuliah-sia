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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
//		RPPerTemu rpPerTemu = new RPPerTemu();  
		ModelAndView mav = new ModelAndView(); 
		List<MK> mkList = mkServ.findAll(); 
		List<DetailSilabus> dsList = detailSilabusServ.findAll();
		List<BentukPenilaian> bpList = bentukServ.findAll();
		mav.addObject("mkList", mkList);   
		mav.addObject("dsList", dsList);
//		mav.addObject("rpPerTemu", rpPerTemu);
//		mav.setViewName("ViewRencanaPembelajaran");  
		mav.setViewName("ViewRencana"); 
		return mav;
	} 
	
	@RequestMapping(value = "/json", method = RequestMethod.POST)
	public @ResponseBody Datatable json(
			@RequestParam("sEcho") String sEcho, 
			@RequestParam("iDisplayLength") int iDisplayLength,
            @RequestParam("iSortCol_0") int iSortCol_0,
            @RequestParam("sSortDir_0") String sSortDir_0,
            @RequestParam("sSearch") String sSearch,
			@RequestParam("iDisplayStart") int iDisplayStart,
			@RequestParam("statusRPPerTemu") String statusRPPerTemu,
			@RequestParam("idMK") String idMK
            ) {  
//		String filter = "";
//		if(idMK!=""){
//			if(rpServ.findRP(idMK)!=null){ 
//				RP rp = rpServ.findRP(idMK);
//				System.out.println(rp.getMk().getNamaMK());
//				MK mk = mkServ.findByIdString(idMK);
//				String namaMK = mk.getNamaMK();
//				filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%' OR "
//						+ "CAST(mk.namaMK as string) LIKE '%"+ namaMK +"%'";
//				
//			}
//			else{
//				MK mk = mkServ.findByIdString(idMK);
//				RP rp = new RP();
//				rp.setMk(mk);
//				rpServ.save(rp); 
//				filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%'";
//			}
//		}
//		else{
//			filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%'";
//		}
//		Datatable detailPemetaanDatatable = detailPemetaanServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, 
//				iSortCol_0, sSortDir_0, sSearch, filter);
//		return detailPemetaanDatatable;  
		return null;
	} 
	@RequestMapping(value="/pemetaan/json", method=RequestMethod.POST)
	public @ResponseBody Datatable json1(
			@RequestParam("sEcho") String sEcho, 
			@RequestParam("iDisplayLength") int iDisplayLength,
            @RequestParam("iSortCol_0") int iSortCol_0,
            @RequestParam("sSortDir_0") String sSortDir_0,
            @RequestParam("sSearch") String sSearch,
			@RequestParam("iDisplayStart") int iDisplayStart
            ) {
//		Datatable capPembMKDatatable = capPembMKServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch);
//		return capPembMKDatatable;
		return null;
	}	
	
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("rpPerTemu") RPPerTemu rpPerTemu, 
    		@RequestParam ("idMK") UUID idMK, @RequestParam ("idCapPembMK[]") UUID[] idCapPembMK,
    		BindingResult result, Map<String, Object> model) {
		AjaxResponse response = new AjaxResponse();  
//  
//        if (result.hasErrors()) {
//        	response.setStatus("error");
//        	List<FieldError> fieldError = result.getFieldErrors();
//        	String message ="";
//    		if(fieldError.get(0).isBindingFailure()) message += "Salah satu input tidak valid";
//    		else message += fieldError.get(0).getDefaultMessage();
//        	for(int i=1;i<fieldError.size();i++)
//        	{
//        		if(fieldError.get(i).isBindingFailure()) message += "<br/>Salah satu input tidak valid";
//        		else message += "<br/>"+fieldError.get(i).getDefaultMessage();
//        	}
//        	response.setMessage(message);
//        	response.setData(fieldError);
//            return response;
//        } 
//        //save 
//    	RP rp = rpServ.findRP(idMK.toString());
//    	rpPerTemu.setRp(rp);
//        response.setData(rpPerTemuServ.save(rpPerTemu));  
//
//        //edit detailpemetaan
//        List<DetailPemetaan> detailPemetaanList = detailPemetaanServ.findCapPembMK(rpPerTemu.getIdRPPerTemu().toString()); 
//	        if(detailPemetaanList!=null){
//	        	for(DetailPemetaan dp : detailPemetaanList){
//	        		detailPemetaanServ.delete(dp.getIdDetailPemetaan()); 
//	        } 
//        }
//        
//        if(idCapPembMK.length>0){
//        	for (UUID uuid : idCapPembMK) {
//        		System.out.println(uuid);
//	        	if(uuid!=null){ 
//	        		CapPembMK capPembMK = capPembMKServ.findById(uuid);
//		        	DetailPemetaan detailPemetaanNew = new DetailPemetaan();
//		        	detailPemetaanNew.setRpPerTemu(rpPerTemu);
//		        	detailPemetaanNew.setCapPembMK(capPembMK);
//		            response.setData(detailPemetaanServ.save(detailPemetaanNew)); 
//		            System.out.println("detail pemetaan sudah ditambahkan");
//	        	}
//        	}	  
//        }
//    	else{ 
//    		response.setStatus("error");
//    		response.setMessage("Capaian pembelajaran mata kuliah tidak boleh kosong !");
//    		return response;
//        }
//        
//        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
//        else 
//        {
//        	response.setStatus("error");
//        	response.setMessage("Capaian Pembelajaran sudah ada");
//        }
//        return response;
		
		return null;
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
		RPPerTemu rppt = rpPerTemuServ.findByRP(idRP);  
		if(rppt!=null){
			response.setData(rppt);
		} 
		return response;
	}
	
	@RequestMapping(value="/simpanrppertemu", method=RequestMethod.POST)
	public @ResponseBody AjaxResponse simpanRPPerTemu(@RequestParam("idRP") UUID idRP,
			@RequestParam("mingguPemb") int mingguPemb, @RequestParam("waktuPemb") int waktuPemb,
			@RequestParam("idMetodePemb") UUID idMetodePemb, @RequestParam("indikatorPenilaian") String indikatorPenilaian,
			@RequestParam("idBentuk") UUID idBentuk, @RequestParam("bobotPenilaian") double bobotPenilaian){
		AjaxResponse response = new AjaxResponse(); 
		RP rp = rpServ.findById(idRP);
		MetodePemb metodePemb = metodePembServ.findById(idMetodePemb);
		BentukPenilaian bp = bentukServ.findById(idBentuk);
		RPPerTemu rppt = new RPPerTemu();
		
		rppt.setBentukPenilaian(bp);
		rppt.setBobotPenilaian(bobotPenilaian);
		rppt.setMetodePemb(metodePemb);
		rppt.setMingguPembKe(mingguPemb);
		rppt.setWaktuPemb(waktuPemb);
		rppt.setRp(rp);
		rppt.setBentukPenilaian(bp);
		
		rpPerTemuServ.save(rppt);
		
		response.setData(rppt);
		return response;
		
	}
}
