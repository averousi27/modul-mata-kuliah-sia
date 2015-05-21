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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.AIS.Modul.MataKuliah.Service.AjaxResponse;
import com.AIS.Modul.MataKuliah.Service.CapPembMKService;
import com.AIS.Modul.MataKuliah.Service.DetailPemetaanService;
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.MKService;
import com.AIS.Modul.MataKuliah.Service.RPPerTemuService;
import com.AIS.Modul.MataKuliah.Service.RPService;
import com.sia.main.domain.*;

@Controller
@RequestMapping(value = "/rencanapembelajaran")
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model) {
		RPPerTemu rpPerTemu = new RPPerTemu();  
		List<MK> mkList = mkServ.findAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("mkList", mkList);   
		mav.addObject("rpPerTemu", rpPerTemu);
		mav.setViewName("ViewRencanaPembelajaran");  
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
		String filter = "";
		if(idMK!=""){
			if(rpServ.findRP(idMK)!=null){ 
				RP rp = rpServ.findRP(idMK);
				System.out.println(rp.getMk().getNamaMK());
				MK mk = mkServ.findByIdString(idMK);
				String namaMK = mk.getNamaMK();
				filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%' OR "
						+ "CAST(mk.namaMK as string) LIKE '%"+ namaMK +"%'";
				
			}
			else{
				MK mk = mkServ.findByIdString(idMK);
				RP rp = new RP();
				rp.setMk(mk);
				rpServ.save(rp); 
				filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%'";
			}
		}
		else{
			filter += "CAST(rppt.statusRPPerTemu as string) LIKE '%"+ statusRPPerTemu +"%'";
		}
		Datatable detailPemetaanDatatable = detailPemetaanServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, 
				iSortCol_0, sSortDir_0, sSearch, filter);
		return detailPemetaanDatatable;  
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
		Datatable capPembMKDatatable = capPembMKServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch);
		return capPembMKDatatable;
	}	
	
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("rpPerTemu") RPPerTemu rpPerTemu, 
    		@RequestParam ("idMK") UUID idMK, @RequestParam ("idCapPembMK[]") UUID[] idCapPembMK,
    		BindingResult result, Map<String, Object> model) {
		AjaxResponse response = new AjaxResponse();  
  
        if (result.hasErrors()) {
        	response.setStatus("error");
        	List<FieldError> fieldError = result.getFieldErrors();
        	String message ="";
    		if(fieldError.get(0).isBindingFailure()) message += "Salah satu input tidak valid";
    		else message += fieldError.get(0).getDefaultMessage();
        	for(int i=1;i<fieldError.size();i++)
        	{
        		if(fieldError.get(i).isBindingFailure()) message += "<br/>Salah satu input tidak valid";
        		else message += "<br/>"+fieldError.get(i).getDefaultMessage();
        	}
        	response.setMessage(message);
        	response.setData(fieldError);
            return response;
        } 
        //save 
    	RP rp = rpServ.findRP(idMK.toString());
    	rpPerTemu.setRp(rp);
        response.setData(rpPerTemuServ.save(rpPerTemu));  

        //edit detailpemetaan
        List<DetailPemetaan> detailPemetaanList = detailPemetaanServ.findCapPembMK(rpPerTemu.getIdRPPerTemu().toString()); 
	        if(detailPemetaanList!=null){
	        	for(DetailPemetaan dp : detailPemetaanList){
	        		detailPemetaanServ.delete(dp.getIdDetailPemetaan()); 
	        } 
        }
        
        if(idCapPembMK.length>0){
        	for (UUID uuid : idCapPembMK) {
        		System.out.println(uuid);
	        	if(uuid!=null){ 
	        		CapPembMK capPembMK = capPembMKServ.findById(uuid);
		        	DetailPemetaan detailPemetaanNew = new DetailPemetaan();
		        	detailPemetaanNew.setRpPerTemu(rpPerTemu);
		        	detailPemetaanNew.setCapPembMK(capPembMK);
		            response.setData(detailPemetaanServ.save(detailPemetaanNew)); 
		            System.out.println("detail pemetaan sudah ditambahkan");
	        	}
        	}	  
        }
    	else{ 
    		response.setStatus("error");
    		response.setMessage("Capaian pembelajaran mata kuliah tidak boleh kosong !");
    		return response;
        }
        
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Capaian Pembelajaran sudah ada");
        }
        return response;
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
}
