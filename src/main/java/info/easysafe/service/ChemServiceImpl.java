package info.easysafe.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.NoticeVO;
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
	public ProductVO readProductKorName(ProductVO pvo) throws Exception {
		return dao.selectOneProductKorName(pvo);
	}

	@Override
	public ProductVO readUpc(String upc) throws Exception {
		// TODO Auto-generated method stub
		return dao.findProductWBarcode(upc);
	}

	@Override
	public List<ProductVO> listProductWCompo(String compo) throws Exception {
		// TODO Auto-generated method stub
		return dao.findProductWComponent(compo);
	}

	@Override
	public List<ProductVO> productListSelectByUpc(String upc) throws Exception {
		// TODO Auto-generated method stub
		return dao.productListSelectByUpc(upc);
	}

	@Override
	public List<NoticeVO> listNotice(int no) throws Exception{
		// TODO Auto-generated method stub
		return dao.listNotice(no);
	}

}
