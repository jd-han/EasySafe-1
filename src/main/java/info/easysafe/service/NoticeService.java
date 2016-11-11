package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> listNotice() throws Exception;
	public NoticeVO readNotice(int nno) throws Exception;
}
