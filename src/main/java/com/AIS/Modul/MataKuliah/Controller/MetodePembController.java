package com.AIS.Modul.MataKuliah.Controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.AIS.Modul.MataKuliah.Service.Datatable;
import com.AIS.Modul.MataKuliah.Service.MetodePembService;
import com.AIS.Modul.MataKuliah.Service.RumpunMKService;
import com.sia.main.domain.MetodePemb;
import com.sia.main.domain.RumpunMK;

@Controller
@RequestMapping(value = "rencanapembelajaran/metode")
public class MetodePembController extends SessionController {

	@Autowired
	private MetodePembService metodePembServ;
	  
	private static final Logger logger = LoggerFactory.getLogger(MetodePembController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView datatable(Locale locale, Model model, HttpSession session) {
		MetodePemb metodePemb = new MetodePemb(); 
		ModelAndView mav = new ModelAndView();
		if(!isLogin(session)){ mav.setViewName("redirect:/login/");	return mav;}
		if(!hasMenu(session, "Kelola Metode Pembelajaran"))	{ mav.setViewName("redirect:/");return mav;}else{mav = addNavbar(session,mav);}
		mav.addObject("metodePemb", metodePemb);
		mav.setViewName("ViewMetodePembelajaran"); 
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
			@RequestParam("statusMetodePemb") String statusMetodePemb
            ) { 
		String filter = "CAST( statusMetodePemb as string) LIKE '%"+statusMetodePemb+"%'";
		Datatable metodePembDatatable = metodePembServ.getdatatable(sEcho, iDisplayLength, iDisplayStart, iSortCol_0, sSortDir_0, sSearch, filter);
		return metodePembDatatable;
	}
	@RequestMapping(value = "/simpan", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse simpan(@Valid @ModelAttribute("metodePemb") MetodePemb metodePemb, 
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
        response.setData(metodePembServ.save(metodePemb));
        if(response.getData()!=null) response.setMessage("Data berhasil disimpan");
        else 
        {
        	response.setStatus("error");
        	response.setMessage("Metode pembelajaran sudah ada");
        }
        return response;
    }
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse edit(@RequestParam("idMetodePemb") UUID idMetodePemb) {
		AjaxResponse response;
		MetodePemb metodePemb = metodePembServ.findById(idMetodePemb); 
		if(metodePemb == null) response = new AjaxResponse("error","Data tidak ditemukan",null);
		else response = new AjaxResponse("ok","Data ditemukan",metodePemb);
        return response;
    } 
	
	@RequestMapping(value = "/deletemany", method = RequestMethod.POST)
    public @ResponseBody AjaxResponse deleteMany(@RequestParam("idMetodePemb[]") UUID[] idMetodePemb) {
		AjaxResponse response;
		for (UUID uuid : idMetodePemb) {
			metodePembServ.delete(uuid);
		}
		response = new AjaxResponse("ok","Data dihapus",null);
        return response;
    }
}
