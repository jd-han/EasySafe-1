package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.Criteria;
import info.easysafe.domain.MsgVO;
import info.easysafe.domain.SearchCriteria;
import info.easysafe.domain.UserVO;
import info.easysafe.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "info.easysafe.mappers.UserMapper";

	@Override
	public List<UserVO> listAll() throws Exception {
		return session.selectList(namespace+".listAccount");
	}

	@Override
	public void create(UserVO vo) throws Exception {
		System.out.println("VO daoimpl:" + vo);
		session.insert(namespace+".createAccount", vo);
	}

	@Override
	public UserVO view(String uid) throws Exception {
		UserVO uvo = session.selectOne(namespace+".readAccount", uid);
		if(uvo != null){
			uvo.setUpw(null);
		}
		return uvo;
	}

	@Override
	public void deleteAccount(int no) throws Exception {
		session.delete(namespace+".deleteAccount", no);
	}

	@Override
	public void updateAccount(UserVO vo) throws Exception {
		System.out.println("daoimpl updateAccount :" +vo);
		session.update(namespace+".updateAccount", vo);
	}
	@Override
	public void updateAccountNoPic(UserVO vo) throws Exception {
		System.out.println("update account no pic. : " + vo);
		session.update(namespace+".updateAccountNoPic", vo);
		
	}
//	@Override
//	public void addPic(UserVO vo) throws Exception {
//		System.out.println("daoiple addPic");
//		session.insert(namespace+".addPic", vo);
//	}

	@Override
	public void updatePW(UserVO vo) throws Exception {
		session.update(namespace+".updateAccountpw", vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		UserVO uvo = session.selectOne(namespace+".login", vo);
		uvo.setUpw("");
		return uvo;
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		UserVO uvo = session.selectOne(namespace+".login", dto);
		System.out.println("UserDAOImpl uvo : "+ uvo);
		if (uvo != null) {
			uvo.setUpw(""); }
		return uvo;
	}

	@Override
	public void updateLevel(UserVO vo) throws Exception {
		session.update(namespace+".updateLevel", vo);
	}
	@Override
	public UserVO viewEmail(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".readEmail", vo);
	}


	@Override
	public void applogin(UserVO vo) throws Exception {
		session.selectOne(namespace+".login", vo);
	}

	@Override
	public List<UserVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if (page <=0){
			page =1;
		}
		page = (page-1)*10;
		return session.selectList(namespace+".listPage", page);
	}

	@Override
	public List<UserVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<String> viewAllRequest() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".selectRequestList");
	}

	@Override
	public List<UserVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public void updateAsk(UserVO uvo) {
		// request 컬럼을 R 또는 N 또는 D 로 바꿈
		session.selectOne(namespace + ".updateRequest", uvo);
	}

	@Override
	public void goPro(UserVO uvo) {
		// TODO Auto-generated method stub
		session.update(namespace + ".goPro", uvo);
	}

	@Override
	public UserVO chkAccount(UserVO uvo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".chkAccount", uvo);
	}

	@Override
	public void resetPass(UserVO uvo) {
		// TODO Auto-generated method stub
		session.update(namespace + ".resetPass", uvo);
	}
}
