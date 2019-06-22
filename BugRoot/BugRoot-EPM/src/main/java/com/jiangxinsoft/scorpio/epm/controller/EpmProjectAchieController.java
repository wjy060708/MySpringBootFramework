package com.jiangxinsoft.scorpio.epm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.epm.model.EpmBOMEntry;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectAchie;
import com.jiangxinsoft.scorpio.epm.model.EpmProjectInfo;
import com.jiangxinsoft.scorpio.epm.service.IEpmBOMEntryService;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectAchieService;
import com.jiangxinsoft.scorpio.epm.service.IEpmProjectInfoService;

import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.sys.constants.SysConstants;

@RequestMapping("/epm/project/achie")
@Controller
public class EpmProjectAchieController {
	
	@Autowired
	private IEpmBOMEntryService epmBOMEntryService;
	
	@Autowired
	private IEpmProjectAchieService epmProjectAchieService;
	
	@Autowired
	private IEpmProjectInfoService epmProjectInfoService;
	
	@RequestMapping("/new")
	public ModelAndView pageNew(String entryId,String projectId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotEmpty(entryId)) {
			EpmBOMEntry epmBOMEntry = epmBOMEntryService.findByPrimaryKey(entryId);
			EpmProjectInfo epmProjectInfo = epmProjectInfoService.findByPrimaryKey(projectId);
			
			modelAndView.addObject("epmBOMEntry", epmBOMEntry);
			modelAndView.addObject("epmProjectInfo", epmProjectInfo);
		}		
		
		modelAndView.setViewName("epm/project/achie/new");
		
		return modelAndView;
	}
	
	/**
	 * 保存新创建的成果
	 * @param document
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/save")
	public RestResponse saveDocument(EpmProjectAchie epmProjectAchie) {	
		epmProjectAchieService.save(epmProjectAchie);
		
		return RestResponse.success("保存成果成功!");
	}
	
	@ResponseBody
	@RequestMapping("/listEntryAchie")
	public List<EpmProjectAchie> listPage(EpmProjectAchie pojo) {
		List<EpmProjectAchie> list = null;

		String entryId = pojo.getEntryId();
		if (StringUtils.isNotBlank(entryId)) {
			list = epmProjectAchieService.find(pojo);
		}

		return list;
	}
	
	@RequestMapping("/view")
	public ModelAndView pageView(String achieId) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieService.findByPrimaryKey(achieId);
			
			if(epmProjectAchie != null) {
				modelAndView.addObject("epmProjectAchie", epmProjectAchie);
				modelAndView.setViewName("epm/project/achie/view");
				
				return modelAndView;
			}
		}
		
		modelAndView.addObject("message", "没有指定需要浏览的文档,或文档已不存在!");
		modelAndView.setViewName(SysConstants.ERROR_FOR_DIV_PAGE);
		
		return modelAndView;
	}
	
	@RequestMapping("/getViewer/{achieId}")
	public ModelAndView getViewer(@PathVariable(name="achieId") String achieId) {
		ModelAndView modelAndView = new ModelAndView();
		if(StringUtils.isNotBlank(achieId)) {
			EpmProjectAchie epmProjectAchie = epmProjectAchieService.findByPrimaryKey(achieId);
			
			modelAndView.addObject("epmProjectAchie", epmProjectAchie);
			modelAndView.setViewName("epm/project/achie/viewer");
		}
		
		return modelAndView;
	}
	
	@RequestMapping("/fileDownload/{achieId}")
	public void fileDownload(@PathVariable(name="achieId") String achieId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/x-msdownload;");
		
		epmProjectAchieService.downloadDocument(achieId, request, response);
	}
	
	@RequestMapping("/getPdfDocument/{achieId}")
	public void getPdfDocument(@PathVariable(name="achieId") String achieId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		epmProjectAchieService.getPdfDocument(achieId, request, response);
	}
	
	@ResponseBody
	@RequestMapping("/documentReady")
	public RestResponse pdfDocumentReady(String achieId) {
		boolean bReady = epmProjectAchieService.isDocumentReady(achieId);
		if(bReady) {
			return RestResponse.success("Pdf文档已准备好!");
		} else {
			return RestResponse.failure("Pdf文档没有准备好!");
		}
	}

	@RequestMapping("/pdfDownload/{achieId}")
	public void pdfDownload(@PathVariable(name="achieId") String achieId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/x-msdownload;");
		
		epmProjectAchieService.downloadPdfDocument(achieId, request, response);
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] ids) {
		epmProjectAchieService.deleteByPrimaryKeys(ids);
		
		return RestResponse.success("删除项目成果成功!");
	}
	
	
}
