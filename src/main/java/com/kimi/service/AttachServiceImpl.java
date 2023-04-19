package com.kimi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.mapper.AttachMapper;
import com.kimi.model.AttachImageVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService {
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public List<AttachImageVO> getAttachList(int id) {
		log.info("getAttachList............");
		
		return attachMapper.getAttachList(id);
	}

}
