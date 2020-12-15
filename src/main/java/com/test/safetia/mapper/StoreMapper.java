package com.test.safetia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.safetia.vo.StoreVO;

@Mapper
public interface StoreMapper {

	//해당 점포의 상품정보 관련 맵퍼
	
	List<StoreVO> selectStoreStuffList(StoreVO store);
	StoreVO selectStoreStuff(StoreVO store);
	int insertStoreStuff(StoreVO store);
	int updateStoreStuff(StoreVO store);
	int deleteStoreStuff(StoreVO store);
}
