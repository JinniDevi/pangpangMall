package kr.or.ddit.pay.dao;

import java.util.List;

import kr.or.ddit.vo.PayListVO;
import kr.or.ddit.vo.PayVO;

public interface IPayDAO {
	
	public List<PayListVO> selectAllPay(String memId);
	
	public int insertPay(PayVO payVo);
	
	public int updatePay(PayVO payVo);
	
	public PayVO selectPayNO(String memId);
	
	public int updateProductQty(PayListVO payListVo);
	
}
