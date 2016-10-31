package info.easysafe.persistence;

import java.util.List;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;

public interface ChemDAO {
	
	//�ѱ۷� ���� �˻��� ���
	public List<ChemVO> selectListChemKorName(String korKey) throws Exception;
	//������ Ŭ��
	public ChemVO selectOneChemKorName(String korName) throws Exception;
	
	//�ѱ۷� ��ǰ �˻��� ���
	public List<ProductVO> selectListProductKorName(String korKey) throws Exception;	
	//������ Ŭ��
	public ProductVO selectOneProductKorName(String korName) throws Exception;

}
