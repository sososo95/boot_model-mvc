package bitcamp.miniproject.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bitcamp.miniproject.domain.Purchase;
import bitcamp.miniproject.domain.Search;
import bitcamp.miniproject.mapper.PurchaseMapper;
import bitcamp.miniproject.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	@Qualifier("purchaseMapper")
	private PurchaseMapper purchaseMapper;

	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	public Purchase addPurchase(Purchase purchase) throws Exception {
		purchaseMapper.addPurchase(purchase);
		return purchase;
	}

	public Purchase getPurchase(int purchaseVO) throws Exception{
		return purchaseMapper.getPurchase(purchaseVO);
	}

	public Purchase updatePurchase(Purchase purchase) throws Exception {
		purchaseMapper.updatePurchase(purchase);
		return purchase;
	}


	public Map<String, Object> getPurchaseList(Search search) throws Exception {

		List<Purchase> list= purchaseMapper.getPurchaseList(search);
		int totalCount = purchaseMapper.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseMapper.updateTranCode(purchase);
	}

}
