package com.goott.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.goott.domain.DrawVO;


@Mapper
public interface DrawAdminMapper {

	public List<DrawVO> draw_admin(Map<String, Object> map);

	public List<Map<String, Object>> draw_admin_add_plus_product(Map<String,Object> map);

	public List<Map<String,Object>> draw_admin_add_plus(int product_category_id);
	
	/**
	 * 
	 * @param category_id,brand_id
	 * @return 상품 이름 (admin_add에 상품이름 추가)
	 */


	public List<Map<String, Object>> admin_add_plus_product_name(Map<String,Object> map);
	/**
	 * 
	 * @param category_id,brand_id
	 * @return 상품 이름 (admin_add에 상품가격 추가)
	 */

	public List<Map<String, Object>> admin_add_plus_product_price(Map<String,Object> map);

	public void draw_admin_add(DrawVO vo);
 
	public List<DrawVO> draw_customer();

	public List<Map<String, Object>> admin_title_product_id(Map<String, Object> map);

	public Integer set_draw_id(Integer product_id);

	

	public int update(DrawVO vo);
   

 
 
}
