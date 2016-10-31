package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sun.xml.internal.ws.developer.Serialization;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.persistence.ChemDAO;

@Service
public class ChemServiceImpl implements ChemService {
	
	@Inject
	private ChemDAO dao;

	@Override
	public List<ChemVO> listChemKorName(String korKey) throws Exception {
		return dao.selectListChemKorName(korKey);
	}

	@Override
	public ChemVO readChemKorName(String korName) throws Exception {
		return dao.selectOneChemKorName(korName);
	}

	@Override
	public List<ProductVO> listProductKorName(String korKey) throws Exception {
		return dao.selectListProductKorName(korKey);
	}

	@Override
	public ProductVO readProductKorName(String korName) throws Exception {
		return dao.selectOneProductKorName(korName);
	}

}
