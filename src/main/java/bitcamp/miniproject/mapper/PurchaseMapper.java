package bitcamp.miniproject.mapper;

import bitcamp.miniproject.domain.Purchase;
import bitcamp.miniproject.domain.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface PurchaseMapper {
    public Purchase addPurchase(Purchase purchase) throws Exception ;


    public Purchase getPurchase(int PurchaseVO) throws Exception ;


    public List<Purchase> getPurchaseList(Search search) throws Exception ;


    public Purchase updatePurchase(Purchase purchase) throws Exception ;


    public void updateTranCode(Purchase purchase) throws Exception ;


    public int getTotalCount(Search search);
}
