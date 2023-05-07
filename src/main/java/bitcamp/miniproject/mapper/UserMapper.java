package bitcamp.miniproject.mapper;

import bitcamp.miniproject.domain.Search;
import bitcamp.miniproject.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    public void addUser(User user) throws Exception ;

    // SELECT ONE
    public User getUser(String userId) throws Exception ;

    // SELECT LIST
    public List<User> getUserList(Search search) throws Exception ;

    // UPDATE
    public void updateUser(User user) throws Exception ;

    // 게시판 Page 처리를 위한 전체Row(totalCount)  return
    public int getTotalCount(Search search) throws Exception ;

    public List<Map<String, Object>>getautoList(Map<String, Object> paramMap) throws Exception;


}
