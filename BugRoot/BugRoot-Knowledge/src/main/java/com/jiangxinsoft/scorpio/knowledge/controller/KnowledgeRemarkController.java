package com.jiangxinsoft.scorpio.knowledge.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import com.jiangxinsoft.scorpio.common.Constants;
import com.jiangxinsoft.scorpio.json.RestResponse;
import com.jiangxinsoft.scorpio.knowledge.model.KnowMode;
import com.jiangxinsoft.scorpio.knowledge.model.KnowRemark;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowModeService;
import com.jiangxinsoft.scorpio.knowledge.service.IKnowRemarkService;
import com.jiangxinsoft.scorpio.pagehelper.PageInfo;
import com.jiangxinsoft.scorpio.sys.model.SysUser;
import com.jiangxinsoft.scorpio.sys.service.ISysUserService;

@RequestMapping("/knowledge/mode/remark")
@Controller
public class KnowledgeRemarkController {
	
	@Autowired
	private ISysUserService sysUserService;

	@Autowired
	private IKnowRemarkService knowRemarkService;

	@Autowired
	private IKnowModeService iKnowModeService;

	@RequestMapping("/index")
	public ModelAndView pageIndex(String modeId) {

		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/remark/index");
		return modelAndView;
	}

	@RequestMapping("/message")
	public ModelAndView pageMeaasge(String modeId) {
		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/remark/message");
		return modelAndView;
	}

	@RequestMapping("/details")
	public ModelAndView pageDetails(String modeId,String content) {

		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);

			KnowRemark knowRemark = new KnowRemark();

			knowRemark.setModeId(modeId);
			knowRemark.setContent(content);
			
			List<KnowRemark> knowRemarks = knowRemarkService
					.findAllByIds(knowRemark);

			modelAndView.addObject("knowRemarks", knowRemarks);

			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/remark/details");
		return modelAndView;
	}

	@RequestMapping("/comment")
	public ModelAndView pageComment(String modeId) {

		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isNotEmpty(modeId)) {

			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);
			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/remark/comment");
		return modelAndView;
	}

	@RequestMapping("/default")
	public ModelAndView page(String modeId) {
		ModelAndView modelAndView = new ModelAndView();

		if (StringUtils.isNotEmpty(modeId)) {
			KnowMode knowMode = iKnowModeService.findByPrimaryKey(modeId);

			modelAndView.addObject("knowMode", knowMode);
		}
		modelAndView.setViewName("knowledge/mode/remark/default");
		return modelAndView;
	}

	@RequestMapping("/new")
	public ModelAndView pageNew() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("knowledge/mode/remark/new");
		return modelAndView;
	}

	@RequestMapping("/edit")
	public ModelAndView pageEdit(String modeId) {
		ModelAndView modelAndView = new ModelAndView();

		if (StringUtils.isNotBlank(modeId)) {
			KnowRemark knowRemark = knowRemarkService.findByPrimaryKey(modeId);
			if (knowRemark != null) {

				modelAndView.addObject("knowRemark", knowRemark);
				modelAndView.setViewName("knowledge/mode/remark/edit");

				return modelAndView;
			}
		}

		modelAndView.addObject("message", "没有指定需要编辑评论信息,或知识评论信息已不存在!");
		modelAndView.setViewName(Constants.ERROR_FOR_DIV_PAGE);

		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/save")
	public RestResponse save(KnowRemark pojo) {
        
		knowRemarkService.save(pojo);

		return RestResponse.success("保存知识评论信息成功!");
	}

	@ResponseBody
	@RequestMapping("/update")
	public RestResponse update(KnowRemark pojo) {
		knowRemarkService.update(pojo);
		return null;
	}

	@ResponseBody
	@RequestMapping("/listPage")
	public PageInfo<KnowRemark> listPage(KnowRemark pojoVo, int page, int rows,
			String sort, String order) {
		PageInfo<KnowRemark> retPage = null;

		String modeContentId = pojoVo.getModeId();
		if (StringUtils.isNotBlank(modeContentId)) {
			retPage = knowRemarkService.findByPage(pojoVo, page, rows, sort,
					order);
		}

		return retPage;
	}

	@ResponseBody
	@RequestMapping("/listAll")
	public PageInfo<KnowRemark> listAll(KnowRemark pojoVo, int page, int rows,
			String sort, String order) {
		PageInfo<KnowRemark> retPage = knowRemarkService.findByPage(pojoVo,
				page, rows, sort, order);

		return retPage;
	}

	@ResponseBody
	@RequestMapping("/delete")
	public RestResponse delete(String[] remarkIds,String userId) {
        
		Object name1 =  SecurityUtils.getSubject().getPrincipal();
		SysUser sysUser = sysUserService.getUserByUsername(name1+"");
		
		if(sysUser.getUserId().equals(userId)){
		knowRemarkService.deleteByPrimaryKeys(remarkIds);
		return RestResponse.success("删除评论信息成功!");
		} else {
			return	RestResponse.failure("你不能删除这条评论!");
		}
	}
}
