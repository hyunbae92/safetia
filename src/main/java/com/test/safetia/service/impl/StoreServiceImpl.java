package com.test.safetia.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.test.safetia.mapper.StoreMapper;
import com.test.safetia.service.StoreService;
import com.test.safetia.vo.StoreVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;
	
	@Override
	public List<StoreVO> selectStoreStuffList(StoreVO store) {
		return storeMapper.selectStoreStuffList(store);
	}

	@Override
	public StoreVO selectStoreStuff(StoreVO store) {
		return storeMapper.selectStoreStuff(store);
	}

	@Override
	public int insertStoreStuff(StoreVO store) {
		return storeMapper.insertStoreStuff(store);
	}

	@Override
	public int updateStoreStuff(StoreVO store) {
		return storeMapper.updateStoreStuff(store);
	}

	@Override
	public int deleteStoreStuff(StoreVO store) {
		return storeMapper.deleteStoreStuff(store);
	}

	@Override
	public Map<String, Object> autoStoreUpdate(StoreVO store) {
		Map<String, Object> result = new HashMap<>();
		result.put("stuffNo", store.getStuffNo());
		result.put("result", "갱신 할 정보가 없습니다.");
		if(store.getStuffName()==null) {
			store = storeMapper.selectStoreStuff(store);
		}
		StoreVO tmpStore = new StoreVO();
		tmpStore.setStoreName("sus_02");
		tmpStore.setStuffNo(store.getStuffNo());
		StoreVO sus02 = storeMapper.selectStoreStuff(tmpStore);
		store.setStoreName("sus_02");
		if(sus02==null) {
			storeMapper.insertStoreStuff(store);
			result.put("result", "정상적으로 추가 되었습니다.");
		}else {
			sus02.setStoreName("sus_02");
			if(!store.equals(sus02)) {
				storeMapper.updateStoreStuff(store);
				result.put("result", "정상적으로 갱신 되었습니다.");
			}
		}
		return result;
	}
	@Override
	public List<Map<String, Object>> autoStoreUpdateAll() {
		List<Map<String, Object>> result = new ArrayList<>();
		StoreVO store = new StoreVO();
		store.setStoreName("sus_01");
		List<StoreVO> storeList = storeMapper.selectStoreStuffList(store);
		for(StoreVO tmpStore : storeList) {
			result.add(autoStoreUpdate(tmpStore));
		}
		return result;
	}
}
