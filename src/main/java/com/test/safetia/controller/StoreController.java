package com.test.safetia.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.safetia.service.StoreService;
import com.test.safetia.vo.StoreVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class StoreController {

	@Resource
	private StoreService storeService;
	
	//점포의 상품 단일 동기화
	@PostMapping("/store/synchro")
	public  Map<String, Object> autoStoreSynchro(@ModelAttribute StoreVO store){
		log.info("store=>{}",store);
		return storeService.autoStoreUpdate(store);
	}
	
	//점포의 모든 상품  동기화
	@PostMapping("/store/synchro/all")
	public  List<Map<String, Object>> autoStoreSynchroAll(){
		return storeService.autoStoreUpdateAll();
	}
	
	//해당 점포의 상품리스트
	@GetMapping("/stores")
	public List<StoreVO> selectStoreStuffList(@ModelAttribute StoreVO store){
		return 	storeService.selectStoreStuffList(store);
	}
	
	//해당 점포의 상품 상세정보
	@GetMapping("/store")
	public StoreVO selectStoreStuff(@ModelAttribute StoreVO store) {
		return storeService.selectStoreStuff(store);
	}
	
	//해당 점포의 상품 추가
	@PostMapping("/store")
	public int insertStoreStuff(@ModelAttribute StoreVO store) {
		return storeService.insertStoreStuff(store);
	}
	
	//해당 점포의 상품 갱신
	@PatchMapping("/store")
	public int updateStoreStuff(@ModelAttribute StoreVO store) {
		return storeService.updateStoreStuff(store);
	}
	
	//해당 점포의 상품 삭제
	@DeleteMapping("/store")
	public int deleteStoreStuff(@ModelAttribute StoreVO store) {
		return storeService.deleteStoreStuff(store);
	}
}
