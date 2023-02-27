package xyz.tour.newworld.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.PayMapper;
import xyz.tour.newworld.mapper.ReservationMapper;
import xyz.tour.newworld.vo.pay.PayResponseVO;

@Service
@Slf4j
public class PayService {

	@Autowired
	private PayMapper payMapper;
	@Autowired
	private ReservationMapper reservationMapper;

	
	public int payinsert(PayResponseVO payResponseVO) {
		if(payMapper.payinsert(payResponseVO)==1) {
			payMapper.updateCheck(payResponseVO.getMerchantUid());
			log.debug("updateCheck=>{}",payMapper.updateCheck(payResponseVO.getMerchantUid()));
		}
		return 0;
	}
	
	public PayResponseVO getPayInfo(String riCode) {
		log.debug("result=>{}",payMapper.selectPayInfo(riCode));
		return payMapper.selectPayInfo(riCode);
	}
	
	public boolean updateRefund(String riCode) { //환불 하나의 서비스에서 결제,동행인,예약 한번에 처리
		int refundResult = payMapper.updateRefund(riCode);
		int reservationCheckResult = reservationMapper.updateReservationCheck(riCode);
		int companionCancelResult = reservationMapper.companionCancel(riCode);

		if(refundResult+reservationCheckResult+companionCancelResult==3) {
			return true;
		}
		return false;

	}
}
