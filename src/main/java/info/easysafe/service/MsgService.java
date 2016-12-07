package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.MsgVO;

public interface MsgService {

	List<MsgVO> listSendMsg(String sendUser);
	
	List<MsgVO> listReceiveMsg(String receiveUser);

	MsgVO msgDetail(int msgNo);

	void sendMsg(MsgVO mvo);

	void deleteMsg(int msgNo);

	void onReadable(MsgVO mvo);

	boolean searchUser(String findId);
}
