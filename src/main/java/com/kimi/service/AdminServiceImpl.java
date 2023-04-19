package com.kimi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimi.mapper.AdminMapper;
import com.kimi.model.AttachImageVO;
import com.kimi.model.Criteria;
import com.kimi.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Transactional
	@Override
	public void goodsEnroll(ProductVO product) {
		log.info("(Service)goodsEnroll..........");
		
		adminMapper.goodsEnroll(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		product.getImageList().forEach(attach -> {
			attach.setId(product.getId());
			adminMapper.imageEnroll(attach);
		});
	}
	
	@Override
	public List<ProductVO> goodsGetList(Criteria cri){
		log.info("goodsGetList()..............");
		return adminMapper.goodsGetList(cri);
	}
	
	@Override
	public int goodsGetTotal(Criteria cri){
		log.info("goodsGetTotal()..............");
		return adminMapper.goodsGetTotal(cri);
	}
	
	@Override
	public ProductVO goodsGetDetail(int id) {
		log.info("goodsGetDetail......."+id);
		return adminMapper.goodsGetDetail(id);
	}
	
	@Transactional
	@Override
	public int goodsModify(ProductVO product) {
		int result = adminMapper.goodsModify(product);
		
		if(result == 1 && product.getImageList() != null && product.getImageList().size() > 0) {
			adminMapper.deleteImageAll(product.getId());
			
			product.getImageList().forEach(attach -> {
			
			attach.setId(product.getId());
			adminMapper.imageEnroll(attach);
				
			});
		}
		
		return result;
	}
	
	@Transactional
	@Override
	public int goodsDelete(int id) {
		log.info("goodsDelete..............");
		
		adminMapper.deleteImageAll(id);
		
		return adminMapper.goodsDelete(id);
	}
	
	/* 지정 상품 이미지 정보 얻기 */
	@Override
	public List<AttachImageVO> getAttachInfo(int id) {
		
		log.info("getAttachInfo........");
		
		return adminMapper.getAttachInfo(id);
	}

}
