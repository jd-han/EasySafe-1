package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.MsgVO;
import info.easysafe.persistence.MsgDAO;

@Service
public class MsgServiceImpl implements MsgService {

	@Inject
	private MsgDAO dao;
	
	@Override
	public List<MsgVO> listSendMsg(String sendUser) {
		// TODO Auto-generated method stub
		return dao.listSendMsg(sendUser);
	}
	
	@Override
	public List<MsgVO> listReceiveMsg(String receiveUser) {
		// TODO Auto-generated method stub
		return dao.listReceiveMsg(receiveUser);
	}

	@Override
	public MsgVO msgDetail(int msgNo) {
		// TODO Auto-generated method stub
		return dao.detailMsg(msgNo);
	}

	@Override
	public void sendMsg(MsgVO mvo) {
		// TODO Auto-generated method stub
		dao.sendMsg(mvo);
	}

	@Override
	public void deleteMsg(int msgNo) {
		// TODO Auto-generated method stub
		dao.deleteMsg(msgNo);
	}

	@Override
	public void onReadable(MsgVO mvo) {
		// TODO Auto-generated method stub
		dao.updateMsg(mvo);
	}

}
