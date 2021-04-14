package com.cereal.books.board.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cereal.books.board.model.dao.FundDao;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FundServiceImpl implements FundService {
	
	@Autowired
	private FundDao fundDao;

	@Override
	public int getBoardCount() {
		
		return fundDao.selectCount();
	}

	@Override
	public List<FundBoard> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.selectBoardList(rowBounds);
	}

	@Override
	public int saveRemainDate() {
		int result = 0;
		result = fundDao.saveRemainDate();
		
		return result;
	}

	@Override
	public int changeStatus() {
		int result = 0;
		result = fundDao.changeStatus();
		
		return result;
	}

	@Override
	@Transactional
	public int saveBoard(FundBoard fundboard) {
		int result = 0;

//		if(fundboard.getBfNo() != 0) {
//			result = fundDao.updateBoard(fundboard);
//		} else {
			result = fundDao.insertBoard(fundboard);
//		}
		
		return result;
	}

	// 관리자 펀드 조회
	@Override
	public List<FundBoard> getFundList(PageInfo fundPageInfo, String status) {
		int offset = (fundPageInfo.getCurrentPage() - 1) * fundPageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, fundPageInfo.getListLimit());
		
		return fundDao.adminFundList(rowBounds, status);
	}

	@Override
	public int getFundCount(String status) {
		return fundDao.selectFundStatusCount(status);
	}

	// 마이페이지
	// 참여중인 펀드
	@Override
	public List<FundBoard> getMyFundList(PageInfo pageInfo, int userNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return fundDao.myFundList(rowBounds, userNo);
	}

	@Override
	public int getMyFundCount(int userNo) {
		return fundDao.selectMyFundCount(userNo);
	}
	
	// 내가 제안한 펀드
	@Override
	public List<FundBoard> getMyAplctFundList(PageInfo pageInfo, int userNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return fundDao.myAplctFundList(rowBounds, userNo);
	}
	
	@Override
	public int getMyAplctFundCount(int userNo) {
		return fundDao.selectMyAplcFundCount(userNo);
	}
	
	// viewDetail 해당 번호 찾는 메소드
	@Override
	public FundBoard findBoardByNo(int bfNo) {
		
		return fundDao.selectBoardDetail(bfNo);
	}

	// 조회수, 일정시간 이후 조회수 +1 구현해야
	@Override
	public int increaseViewcnt(int bfNo) {
		int result = 0;
//		long update_time = 0; //null을 방지하기 위해 초기값을 null로 설정함
//		
//		if(session.getAttribute("update_time_" + bfNo) !=null) {
//			
//			//최근에 조회수를 올린 시간이 null이 아니면
//			update_time = (long)session.getAttribute("update_time_" + bfNo);
//		}
//		
//		long current_time = System.currentTimeMillis();
//		
//		//일정 시간이 경과한 후에 조회수를 증가시킨다.
//		if(current_time - update_time > 5 * 1000) {
//			
//		//조회수가 1증가했을때로부터 5000초 후에 다시 클릭을 해야 조회수가 다시 1 증가한다는 말이다.
//		//조회수 증가 처리
			result = fundDao.increateViewcnt(bfNo);
			
//			//조회수를 올린 시간을 저장함
//			session.setAttribute("update_time_" + bfNo, current_time);
//			
//		}
		
		return result;
	}
	
}
