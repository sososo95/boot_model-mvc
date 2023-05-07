package bitcamp.miniproject.service;

import bitcamp.miniproject.domain.Purchase;
import bitcamp.miniproject.domain.Search;

import java.util.Map;

public interface PurchaseService {
	
	public Purchase addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int PurchaseVO) throws Exception;
	
	public Map<String, Object> getPurchaseList(Search search) throws Exception;
		
	public Purchase updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
}
