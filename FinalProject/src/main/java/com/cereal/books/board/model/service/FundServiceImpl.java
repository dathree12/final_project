package com.cereal.books.board.model.service;

import java.util.List;

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

		if(fundboard.getBfNo() != 0) {
			// 펀딩 프로젝트 일반회원 상세조회 페이지 수정하기
			result = fundDao.updateBoard(fundboard);
		} else {
			result = fundDao.insertBoard(fundboard);
		}
		
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
	public int adminFundStatus(String status, List<Integer> bfNo) {
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
	
	// 검색을 통한 리스트 조회, 페이징 처리o
	@Override
	public int getBoardCount_Title(String keyword) {
		return fundDao.getBoardCount_Title(keyword);
	}
	@Override
	public List<FundBoard> getSearchList_Title(PageInfo pageInfo, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return fundDao.getSearchList_Title(rowBounds, keyword);
	}
	@Override
	public int getBoardCount_Content(String keyword) {
		return fundDao.getBoardCount_Content(keyword);
	}
	@Override
	public List<FundBoard> getSearchList_Content(PageInfo pageInfo, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return fundDao.getSearchList_Content(rowBounds, keyword);
	}

	// 인기프로젝트 조회(조회수순), 성공임박프로젝트 조회(남은시간순)
	@Override
	public List<FundBoard> getBoardList_viewCount(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.getBoardList_viewCount(rowBounds);
	}
	@Override
	public List<FundBoard> getBoardList_remainDate(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.getBoardList_remainDate(rowBounds);
	}
	// 마감된프로젝트 조회(마감항목, 최근마감날짜순)
	@Override
	public int getBoardCount_endDate() {
		
		return fundDao.getBoardCount_endDate();
	}
	@Override
	public List<FundBoard> getBoardList_endDate(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());		
		
		return fundDao.getBoardList_endDate(rowBounds);
	}

	// 펀딩 프로젝트 관리자 상세조회 페이지 코멘트 입력, 승인&거절 보내기
	@Override
	public int updateAdminCheck(FundBoard fundboard) {
		
		return fundDao.updateAdminCheck(fundboard);
	}



	


	
	

}
