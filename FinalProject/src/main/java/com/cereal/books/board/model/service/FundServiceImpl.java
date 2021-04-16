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
	
	@Override
	public int adminFundStatus(String status, int bfNo) {
		return fundDao.adminUpdateFundStatus(status, bfNo);
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

	// 조회수 증가(반복조회 방지)
	@Override
	public int increaseViewcnt(int bfNo) {
		
		return fundDao.increateViewcnt(bfNo);
	}
	
	// 검색을 통한 조회
	@Override
	public int getSearchCount111(String keyword) {
		
		return fundDao.getSearchCount111(keyword);
	}

	@Override
	public List<FundBoard> getSearchList111(PageInfo pageInfo, String keyword) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.selectBoardList111(rowBounds, keyword);
	}
	
//	@Override
//	public int getSearchCount(String fd_search_sort, String keyword) {
//		
//		return fundDao.getSearchCount(fd_search_sort, keyword);
//	}
//
//	@Override
//	public List<FundBoard> getSearchList(PageInfo pageInfo, String fd_search_sort, String keyword) {
//		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
//		
//		return fundDao.getSearchList(rowBounds, fd_search_sort, keyword);
//	}


	
	
	
}
