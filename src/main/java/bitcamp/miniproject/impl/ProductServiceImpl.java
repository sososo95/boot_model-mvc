package bitcamp.miniproject.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bitcamp.miniproject.domain.Product;
import bitcamp.miniproject.domain.Search;
import bitcamp.miniproject.mapper.ProductMapper;
import bitcamp.miniproject.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	
	@Autowired
	@Qualifier("productMapper")
	private ProductMapper productMapper;
	
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public void insertProduct(Product product) throws Exception {
		productMapper.insertProduct(product);
	}

	public Product findProduct(int productVO) throws Exception {
		return productMapper.findProduct(productVO);
	}

	public Map<String, Object> getProductList(Search search) throws Exception {
		
		List<Product> list= productMapper.getProductList(search);
		int totalCount = productMapper.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public Product updateProduct(Product product) throws Exception {
		productMapper.updateProduct(product);
		return product;
	}
	
	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) throws Exception {
		return productMapper.getautoList(paramMap);
	}

}
