package com.kimi.service;

import java.util.List;

import com.kimi.model.AttachImageVO;
import com.kimi.model.Criteria;
import com.kimi.model.ProductVO;

public interface AdminService {
	
	public void goodsEnroll(ProductVO product);
	
	/* 상품 리스트 */
	public List<ProductVO> goodsGetList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 상품 조회 페이지 */
	public ProductVO goodsGetDetail(int id);
	
	/* 상품 수정 */
	public int goodsModify(ProductVO product);	

	/* 상품 정보 삭제 */
	public int goodsDelete(int id);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int id);
}
