package info.easysafe.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;

@Repository
public class ChemDAOImpl implements ChemDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace ="info.easysafe.mapper.MainMapper";

	@Override
	public List<ChemVO> selectListChemKorName(String korKey) throws Exception {
		return session.selectList(namespace+".selectListChemKorName", korKey);
	}

	@Override
	public ChemVO selectOneChemKorName(String korName) throws Exception {
		return session.selectOne(namespace+".selectOneChemKorName", korName);
	}

	@Override
	public List<ProductVO> selectListProductKorName(String korKey) throws Exception {
		return session.selectList(namespace+".selectListProductKorName", korKey);
	}

	@Override
	public ProductVO selectOneProductKorName(String korName) throws Exception {
		return session.selectOne(namespace+".selectOneProductKorName", korName);
	}

}
