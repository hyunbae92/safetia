package com.test.safetia.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("store")
public class StoreVO {
	//점포 테이블 컬럼 , 점포이름 
	private Integer stuffNo;
	private String stuffName;
	private Integer stuffPrice;
	private String stuffDesc;
	private String storeName;
}
