package com.baizhi.controller;

import com.baizhi.entity.Empl;
import com.baizhi.mapper.EmplMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("all")
public class AjaxController {
	private List<Empl> list;
	@Autowired
	EmplMapper emplMapper;


	@RequestMapping("queryAll")
	@ResponseBody
	public List<Empl> queryAll() {
		list=emplMapper.selectAll();
		return list;
	}
	@RequestMapping("al")
	public String al() {
		throw new RuntimeException("出错了啊");

		}
	}
	/*@RequestMapping("deleteOne")
	@ResponseBody
	public void deleteOne(Integer id) {
		nineService.deleteOne(id);
	}

	@RequestMapping("insertOne")
	@ResponseBody
	public void insertOne(Nine nine) {
		System.out.println(nine);
		nineService.insertOne(nine);
	}

	@RequestMapping("queryOne")
	@ResponseBody
	public Nine queryOne(Integer id) {
		Nine nine = nineService.queryOne(id);
		return nine;
	}

	@RequestMapping("updateOne")
	@ResponseBody
	public void updateOne(Nine nine) {
		nineService.updateOne(nine);
	}*/

