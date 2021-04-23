package com.cereal.books.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int cartNo;
	
	private int userNo;
	
	private String cartTitle;
	
	private int cartAmount;
	
	private int cartPrice;
	
	private String cartStatus;
	
	private String cartItem;
	
	private int bcNo;
	
	private int bfNo;
	
}
