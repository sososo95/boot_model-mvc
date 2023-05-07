package bitcamp.miniproject.service;

import bitcamp.miniproject.domain.Product;
import bitcamp.miniproject.domain.Search;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	public void insertProduct(Product product) throws Exception;
	
	public Product findProduct(int productVO) throws Exception;
	
	public Map<String, Object> getProductList(Search searchVO) throws Exception;
	
	public Product updateProduct(Product product) throws Exception;
	
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) throws Exception;

}
