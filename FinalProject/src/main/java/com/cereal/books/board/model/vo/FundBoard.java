package com.cereal.books.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FundBoard {
	private int bfNo;
	
	private int userNo;
	
	private String bfTitle;
	
	private int bfPrice;
	
	private Date bfEnrollDate;
	
	private Date bfEndDate;
	
	private Date bfModifyDate;
	
	private Date bfRemainDate;
	
	private int bfTargetPrice;
	
	private int bfReachPrice;
	
	private int bfAttainRate;
	
	private int bfViewCount;
	
	private int bfBuycount;
	
	private String bfStatus;
	
	private String bfAgreement;
	
	private int bfLike;
	
	private String bfContent;
	
	private String bfOriImgName;
	
	private String bfReImgName;
	
}
