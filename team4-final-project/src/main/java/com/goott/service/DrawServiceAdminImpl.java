package com.goott.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.DrawVO; 
import com.goott.mapper.DrawAdminMapper;

@Service
public class DrawServiceAdminImpl implements DrawServiceAdmin {

	@Inject
	DrawAdminMapper drawAdminMapper;
	
	@Override
	public List<DrawVO> draw_admin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin(map);
	}
	@Override
	public List<DrawVO> draw_customer() {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_customer();
	}

	@Override
	public List<Map<String,Object>> admin_add_plus_product(Map<String,Object> map) {
		
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin_add_plus_product(map);
	}

	@Override
	public List<Map<String,Object>> admin_add_plus(int product_category_id) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin_add_plus(product_category_id);
	}

	@Override
	public List<Map<String, Object>> admin_add_plus_product_name(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.admin_add_plus_product_name(map);
	}



	@Override
	public List<Map<String, Object>> admin_add_plus_product_price(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.admin_add_plus_product_price(map);
	}
 


	@Override
	public List<Map<String, Object>> admin_title_product_id(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.admin_title_product_id(map);
	}

	@Override
	public void draw_admin_add(DrawVO vo) {
		// TODO Auto-generated method stub
	 drawAdminMapper.draw_admin_add(vo);
	}

	@Override
	public Integer set_draw_id(Integer id) {
		// TODO Auto-generated method stub
		//System.out.println("service"+vo.toString());
		
		return drawAdminMapper.set_draw_id(id);  
	}

	@Override
	public int update(DrawVO vo) {
		// TODO Auto-generated method stub
		return drawAdminMapper.update(vo);
	}

	 
	   

	
 
 
	   


}
