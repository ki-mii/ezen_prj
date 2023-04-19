package com.kimi.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private int id;
	private String name;
	private String category;
	private int price;
	private String origin;
	private String volume;
	private int alcohol;
	private int stock;
	private String info;
	private Date regDate;
	private Date updateDate;
	
	private List<AttachImageVO> imageList;
	
}
