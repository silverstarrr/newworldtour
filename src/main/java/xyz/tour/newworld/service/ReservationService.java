package xyz.tour.newworld.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import xyz.tour.newworld.mapper.ReservationMapper;
import xyz.tour.newworld.vo.CompanionInfoVO;
import xyz.tour.newworld.vo.ForeignHomeGoodsInfoVO;
import xyz.tour.newworld.vo.ReservationInfoVO;

@Service
@Slf4j
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	//공통
	public ForeignHomeGoodsInfoVO getGoodsFlight(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {	//예약 페이지에 항공, 상품 테이블에서 정보 불러오기
		return reservationMapper.getGoodsFlight(foreignGoodsInfoVO);
	}
	
	public ForeignHomeGoodsInfoVO getGoodsForeign(ForeignHomeGoodsInfoVO foreignGoodsInfoVO) {	//예약 상세 페이지에 상품 정보 불러오기
		return reservationMapper.getGoodsForeign(foreignGoodsInfoVO);
	}
	
	public ReservationInfoVO insertReservation(ReservationInfoVO reservationInfoVO) {  //해외패키지 예약등록(정원초과 확인)
		ForeignHomeGoodsInfoVO foreignHomeGoodsInfo = reservationMapper.maxForeignGoodsInfos(reservationInfoVO);
		int max = foreignHomeGoodsInfo.getGiMax();
		int reservationSum = foreignHomeGoodsInfo.getReservationSum();
		
		reservationSum += reservationInfoVO.getRiAdultCount();
		reservationSum += reservationInfoVO.getRiBabyCount();
		reservationSum += reservationInfoVO.getRiKidsCount();
		log.debug("max=>{}", max);
		log.debug("reservationSum=>{}", reservationSum);
		
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int cipher = 5;
		String riRandom = "";
		
		for(int i = 0; i < cipher; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			riRandom += ranNum;
		}
		log.debug("riRandom=>{}", riRandom);
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		log.debug("now=>{}", formatedNow);
		
		log.debug("riCode=>{}", formatedNow + riRandom);
		reservationInfoVO.setRiCode(formatedNow+riRandom);
		
		if(max<reservationSum) {
			throw new RuntimeException("예약정원을 초과 하였습니다.");
		}
		reservationMapper.insertReservation(reservationInfoVO);
		return reservationInfoVO;
	}
	
	
	public ReservationInfoVO getReservations(ReservationInfoVO reservationInfoVO) {	//예약 상세 페이지에 예약자 정보 불러오기
		return reservationMapper.getReservations(reservationInfoVO);
	}

	//동행인
	public int insertCompanion(List<CompanionInfoVO> companionInfoVO) {	//동행인 DB 저장
		return reservationMapper.insertCompanion(companionInfoVO);
	}
	
	public int updateCompanion(CompanionInfoVO companionInfoVO) {	//예약하면서 동행인 테이블에 예약번호 저장
		return reservationMapper.updateCompanion(companionInfoVO);
	}
	
	public List<CompanionInfoVO> getCompanion(CompanionInfoVO companionInfoVO) {	//예약 상세 페이지 동행인 정보 불러오기
		return reservationMapper.getCompanion(companionInfoVO);
	}

	public ReservationInfoVO insertHomeReservation(ReservationInfoVO reservationInfoVO) {	//국내패키지 예약등록(정원초과 확인)
		ForeignHomeGoodsInfoVO foreignHomeGoodsInfo = reservationMapper.maxHomeGoodsInfos(reservationInfoVO);
		int max = foreignHomeGoodsInfo.getGiMax();
		int reservationSum = foreignHomeGoodsInfo.getReservationSum();
		
		reservationSum += reservationInfoVO.getRiAdultCount();
		reservationSum += reservationInfoVO.getRiBabyCount();
		reservationSum += reservationInfoVO.getRiKidsCount();
		
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int cipher = 5;
		String riRandom = "";
		
		for(int i = 0; i < cipher; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			riRandom += ranNum;
		}
		log.debug("riRandom=>{}", riRandom);
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		log.debug("now=>{}", formatedNow);
		
		log.debug("riCode=>{}", formatedNow + riRandom);
		reservationInfoVO.setRiCode(formatedNow+riRandom);
		if(max<=reservationSum) {
			throw new RuntimeException("예약정원을 초과 하였습니다.");
		}
		
		reservationMapper.insertHomeReservation(reservationInfoVO);
		return reservationInfoVO;
	}

	
	
	
	
	//예약조회
	public List<ReservationInfoVO> getReservList(ReservationInfoVO reservationInfoVO){
		return reservationMapper.selectReserv(reservationInfoVO);
	}
	
	public ReservationInfoVO getReservView(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.selectReservView(reservationInfoVO);
	}
	
	public List<CompanionInfoVO> getCompanionByRiCode(CompanionInfoVO companionInfoVO){
		return reservationMapper.selectCompanionByRiCode(companionInfoVO);
	}
		
	//예약 취소
	public int updateReservationActive(String riCode) {
		return reservationMapper.updateReservationActive(riCode);
	}
	
	
	//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
	public ReservationInfoVO reservInfoCheck(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoCheck(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
	public ReservationInfoVO reservInfoOrder(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoOrder(reservationInfoVO);
	}
	
	//예약 상세 페이지에서 예약 취소된 건일 경우 버튼 아무것도 안뜸
	public ReservationInfoVO reservInfoCancel(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.reservInfoCancel(reservationInfoVO);
	}
	
	//마이페이지에서 로그인한 회원 국내&해외 예약내역 불러오기
	public List<ReservationInfoVO> selectReservMy(ReservationInfoVO reservationInfoVO) {
		return reservationMapper.selectReservMy(reservationInfoVO);
	}
	

}
