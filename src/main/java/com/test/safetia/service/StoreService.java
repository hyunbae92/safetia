package com.test.safetia.service;

import java.util.List;
import java.util.Map;

import com.test.safetia.vo.StoreVO;

public interface StoreService {

	List<StoreVO> selectStoreStuffList(StoreVO store);
	StoreVO selectStoreStuff(StoreVO store);
	int insertStoreStuff(StoreVO store);
	int updateStoreStuff(StoreVO store);
	int deleteStoreStuff(StoreVO store);
	Map<String,Object> autoStoreUpdate(StoreVO store);
	List<Map<String, Object>> autoStoreUpdateAll();
}
