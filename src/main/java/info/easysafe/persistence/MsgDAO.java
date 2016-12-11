package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.MsgVO;

public interface MsgDAO {
	List<MsgVO> listSendMsg(String sendUser);
	
	List<MsgVO> listReceiveMsg(String receiveUser);

	MsgVO detailMsg(int msgNo);

	void sendMsg(MsgVO mvo);

	void deleteMsg(int msgNo);

	void updateMsg(MsgVO mvo);

	boolean findUser(String findId);

	void sendAskLvUp(MsgVO mvo);

	MsgVO selectUpMsg(String userId);

	void completeMsg(int msgNo);
}
