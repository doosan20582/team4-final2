package com.goott.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.DrawEnterVO;
import com.goott.domain.DrawResultVO;
import com.goott.domain.DrawVO; 
import com.goott.mapper.DrawAdminMapper;

@Service
public class DrawServiceAdminImpl implements DrawServiceAdmin {

	@Inject
	DrawAdminMapper drawAdminMapper;
	
	@Override
	public List<DrawVO> draw_admin() {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin();
	}
	@Override
	public List<DrawVO> draw_admin_change(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin_change(map);
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
	public void update(DrawVO vo) {
		// TODO Auto-generated method stub
		 drawAdminMapper.update(vo);
	}
	@Override
	public void delete(DrawVO vo) {
		// TODO Auto-generated method stub
		drawAdminMapper.delete(vo);
	}
	@Override
	public List<DrawEnterVO> admin_count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("이건 서비스야"+map);
		return drawAdminMapper.admin_count(map);
		
	} 
	/*
	 * @Override public void admin_count_vo(DrawResultVO vo) { // TODO
	 * Auto-generated method stub drawAdminMapper.admin_count_vo(vo); }
	 */
	@Override
	public List<Map<String, Object>> draw_customer_memberID(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_customer_memberID(map);
	}

	@Override
	public void draw_admin_count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		drawAdminMapper.draw_admin_count(map);
		
	}
	@Override
	public String adminConfirmation(String member_id) {
		// TODO Auto-generated method stub
		return drawAdminMapper.adminConfirmation(member_id);
	}
	@Override
	public List<DrawVO> draw_customer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_customer(map);
	}

	@Override
	public int draw_customer_button_check(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_customer_button_check(map);
	}
	@Override 
	public void draw_customer_button(Map<String, Object> map) {
		// TODO Auto-generated method stub
		drawAdminMapper.draw_customer_button(map);
	}
	
	@Override
	public List<DrawResultVO> getResultList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("서비스 아이디 체크" +map);
		return drawAdminMapper.getRusultID(map);
	}

	   
	   

	  
	    
 
	
 
 
	   


}
