package com.kimi.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kimi.mapper.AttachMapper;
import com.kimi.model.AttachImageVO;
import com.kimi.model.Criteria;
import com.kimi.model.PageDTO;
import com.kimi.model.ProductVO;
import com.kimi.service.ShopService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ShopController {
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void mainPageGET(Model model, Criteria cri){
		log.info("메인 페이지 진입");
		model.addAttribute("list", shopService.getGoodsList(cri));
		model.addAttribute("cate1", shopService.getCate1());
		model.addAttribute("cate2", shopService.getCate2());
		model.addAttribute("cate3", shopService.getCate3());
		model.addAttribute("cate4", shopService.getCate4());
	}
	
	/* 상품 검색 */
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		log.info("cri : " + cri);
		
		List<ProductVO> list = shopService.getGoodsList(cri);
		log.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			log.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, shopService.goodsGetTotal(cri)));
		
		return "search";
		
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		log.info("getImage()......."+fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces=org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int id){
		log.info("getAttachList.........." + id);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(id), HttpStatus.OK);
	}
	
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{id}")
	public String goodsDetailGET(@PathVariable("id")int id, Model model) {
		
		log.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", shopService.getGoodsInfo(id));
		
		return "/goodsDetail";
	}

}
