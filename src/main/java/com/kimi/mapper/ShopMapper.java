package com.kimi.mapper;

import java.util.List;

import com.kimi.model.Criteria;
import com.kimi.model.ProductVO;

public interface ShopMapper {
	
	/* 상품 검색 */
	public List<ProductVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	public List<ProductVO> getCate1();
	
	public List<ProductVO> getCate2();
	
	public List<ProductVO> getCate3();
	
	public List<ProductVO> getCate4();
	
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int id);
}
