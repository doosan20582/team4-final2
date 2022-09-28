package com.goott.service;

import java.util.List;
import java.util.Map;

import com.goott.domain.ProductVO;
import com.goott.domain.DrawVO;

public interface DrawServiceAdmin {
	
	public List<DrawVO> draw_admin();
	public List<Map<String,Object>> admin_add_plus(int product_category_id);
	public List<Map<String, Object>> admin_add_plus_product(Map<String,Object> map);
	public List<Map<String, Object>> admin_add_plus_product_name(Map<String,Object> map);
	public List<Map<String, Object>> admin_add_plus_product_price(Map<String,Object> map);
	public void draw_admin_add(DrawVO vo);
	
}
