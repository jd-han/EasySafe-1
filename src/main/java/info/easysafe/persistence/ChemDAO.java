package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;

public interface ChemDAO {
	
	//한글로 성분 검색한 결과
	public List<ChemVO> selectListChemKorName(String korKey) throws Exception;
	//디테일 클릭
	public ChemVO selectOneChemKorName(String korName) throws Exception;
	
	//한글로 제품 검색한 결과
	public List<ProductVO> selectListProductKorName(String korKey) throws Exception;	
	//디테일 클릭
	public ProductVO selectOneProductKorName(String korName) throws Exception;
	
	//바코드 입력, 상품 찾기
	public ProductVO findProductWBarcode(String upc) throws Exception;
	
	

}
