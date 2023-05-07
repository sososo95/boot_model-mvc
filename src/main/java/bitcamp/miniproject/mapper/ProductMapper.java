package bitcamp.miniproject.mapper;

import bitcamp.miniproject.domain.Product;
import bitcamp.miniproject.domain.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {

    public void insertProduct(Product product) throws Exception ;


    public Product findProduct(int product) throws Exception ;


    public List<Product> getProductList(Search search) throws Exception ;


    public void updateProduct(Product product) throws Exception ;


    public int getTotalCount(Search search) throws Exception ;


    public List<Map<String, Object>>getautoList(Map<String, Object> paramMap) throws Exception;
}
