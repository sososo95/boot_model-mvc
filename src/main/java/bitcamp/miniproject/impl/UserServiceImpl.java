package bitcamp.miniproject.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bitcamp.miniproject.domain.Search;
import bitcamp.miniproject.domain.User;
import bitcamp.miniproject.mapper.UserMapper;
import bitcamp.miniproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	///Field
	@Autowired
	@Qualifier("userMapper")
	private UserMapper userMapper;
	public void setUserDao(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user) throws Exception {
		userMapper.addUser(user);
	}

	public User getUser(String userId) throws Exception {
		return userMapper.getUser(userId);
	}

	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userMapper.getUserList(search);
		int totalCount = userMapper.getTotalCount(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateUser(User user) throws Exception {
		userMapper.updateUser(user);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userMapper.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}


	public List<Map<String, Object>> autocomplete(Map<String, Object> paramMap) throws Exception {
		return userMapper.getautoList(paramMap);
	}
}