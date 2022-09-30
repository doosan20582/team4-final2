package com.goott.service;

import java.util.List;
import java.util.Map;

import com.goott.domain.DrawResultVO;
import com.goott.domain.DrawVO;

public interface DrawServiceAdmin {
	
	public List<DrawVO> draw_admin();
	public List<DrawVO> draw_admin_change(Map<String, Object> map);
	public List<Map<String,Object>> admin_add_plus(int product_category_id);
	public List<Map<String, Object>> admin_add_plus_product(Map<String,Object> map);
	public List<Map<String, Object>> admin_add_plus_product_name(Map<String,Object> map);
	public List<Map<String, Object>> admin_add_plus_product_price(Map<String,Object> map);
	
	public List<DrawVO> draw_customer();

	public List<Map<String, Object>> admin_title_product_id(Map<String, Object> map);
	public void draw_admin_add(DrawVO vo);
	public Integer set_draw_id(Integer id);
	public void update(DrawVO vo);
	public void delete(DrawVO vo);

	public List<DrawResultVO> admin_count(Map<String, Object> map);


} 
         