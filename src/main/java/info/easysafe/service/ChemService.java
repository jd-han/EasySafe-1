package info.easysafe.service;

import java.util.List;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.NoticeVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.domain.SearchCriteria;

public interface ChemService {
	
	public List<ChemVO> listChemKorName(String korKey) throws Exception;
	
//	public List<ChemVO> listChemEngName(String engKey) throws Exception;
	
	public ChemVO readChemKorName(String korName) throws Exception;
	
//	public ChemVO readChemEngName(String engName) throws Exception;
	
	public List<ProductVO> listProductKorName(String korKey) throws Exception;
//	
//	public List<ProductVO> listProductEngName(String engKey) throws Exception;
//	
	public ProductVO readProductKorName(ProductVO tempPro) throws Exception;
	
//	public ProductVO readProductEngName(String engName) throws Exception;
	
	public ProductVO readUpc(String upc) throws Exception;
	
	public List<ProductVO> listProductWCompo(String compo) throws Exception;

	public List<ProductVO> productListSelectByUpc(String upc) throws Exception;

	public List<NoticeVO> listNotice(int no) throws Exception;

	

}
