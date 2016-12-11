package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.MsgVO;

@Repository
public class MsgDAOImpl implements MsgDAO {

	@Inject
	private SqlSession session;
	private static String namespace ="info.easysafe.mappers.MsgMapper";
	
	@Override
	public List<MsgVO> listSendMsg(String sendUser) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listAllSendMsg", sendUser);
	}
	
	@Override
	public List<MsgVO> listReceiveMsg(String receiveUser) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listAllReceiveMsg", receiveUser);
	}

	@Override
	public MsgVO detailMsg(int msgNo) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".detailMsg", msgNo);
	}

	@Override
	public void sendMsg(MsgVO mvo) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".sendMsg", mvo);
	}

	@Override
	public void deleteMsg(int msgNo) {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deleteMsg", msgNo);
	}

	@Override
	public void updateMsg(MsgVO mvo) {
		// TODO Auto-generated method stub
		session.update(namespace + ".readMsg", mvo);
	}

	@Override
	public boolean findUser(String findId) {
		// TODO Auto-generated method stub
		if(session.selectOne(namespace + ".searchUser", findId) != null)
		{
			return true;
		}
		return false;
	}

	@Override
	public void sendAskLvUp(MsgVO mvo) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".sendLvUp", mvo);
	}

	@Override
	public MsgVO selectUpMsg(String userId) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectUpMsg", userId);
	}

	@Override
	public void completeMsg(int msgNo) {
		// TODO Auto-generated method stub
		session.update(namespace + ".completeUpMsg", msgNo);
	}

}
