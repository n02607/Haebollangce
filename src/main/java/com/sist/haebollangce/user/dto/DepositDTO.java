package com.sist.haebollangce.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DepositDTO {
	
	private String purchaseCode;
	private String fkUserid;
	private String purchaseDate;
	private String purchasePrice;
	private String purchaseStatus;
	
	private String entryFee;
	
	private String reward;
	
	private String convertReward;
	
	private String allDeposit;
	private String allReward;
	
	//////////////////////////////////////
	
	
	
}
