package info.easysafe.app;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import info.easysafe.domain.UserVO;
import info.easysafe.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserDaoTest {
	@Inject
	private UserDAO dao;
	
	@Test
	public void testUserInsert() throws Exception{
		UserVO vo = new UserVO();
		vo.setUid("dori");
		vo.setUmail("na@er.com");
		vo.setUname("doridori");
		vo.setUpw("234");
		
		dao.create(vo);
		
	}

}
