package com.kimi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.mapper.AdminMapper;
import com.kimi.mapper.AttachMapper;
import com.kimi.mapper.ShopMapper;
import com.kimi.model.AttachImageVO;
import com.kimi.model.Criteria;
import com.kimi.model.ProductVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShopServieceImpl implements ShopService {
	@Autowired
	private ShopMapper shopMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	
	/* 상품 검색 */
	@Override
	public List<ProductVO> getGoodsList(Criteria cri) {
		
		log.info("getGoodsList().......");
		
		List<ProductVO> list = shopMapper.getGoodsList(cri);
		
		list.forEach(product -> {
			
		int id = product.getId();
		
		List<AttachImageVO> imageList = attachMapper.getAttachList(id);
		
		product.setImageList(imageList);
			
		});
		
		return list;
		
	}

	/* 사품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {
		
		log.info("goodsGetTotal().......");
		
		return shopMapper.goodsGetTotal(cri);
		
	}
	
	@Override
	public List<ProductVO> getCate1(){
		log.info("getCategory().........");
		
		return shopMapper.getCate1();
	}
	
	@Override
	public List<ProductVO> getCate2(){
		log.info("getCategory().........");
		
		return shopMapper.getCate2();
	}
	
	@Override
	public List<ProductVO> getCate3(){
		log.info("getCategory().........");
		
		return shopMapper.getCate3();
	}
	
	@Override
	public List<ProductVO> getCate4(){
		log.info("getCategory().........");
		
		return shopMapper.getCate4();
	}
	
	@Override
	public ProductVO getGoodsInfo(int id) {
		
		ProductVO goodsInfo = shopMapper.getGoodsInfo(id);
		goodsInfo.setImageList(adminMapper.getAttachInfo(id));
		
		return goodsInfo;
	}
 

}
