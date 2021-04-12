package com.cereal.books.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.ClubDao;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

/*
 * 에러내역 : 
 *  org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): -> mapper.xml 의 id와 일치하지 않는 경우
 */

@Slf4j
@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDao clubDao;
	
	@Override
	public int getBoardCount() {
		return clubDao.selectCount();
	}
	
	@Override
	public int saveRemainDate() {
		return clubDao.saveRemainDate();
	}


	// 게시판 페이징 처리
	@Override
	public List<ClubBoard> getBoardList(PageInfo pageInfo) {
		/*
		 * RowBounds (import org.apache.ibatis.session.RowBounds;)
		 *  1) offset : 데이터를 가져오는 시작점에서 얼마나 떨어진 데이터값인지 의미
		 *  2) limit : 몇 개의 값을 가져올지를 의미한다.
		 */
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return clubDao.selectClubList(rowBounds);
	}

	@Override
	public ClubBoard findClubByNo(int bcNo) {
		return clubDao.selectClubDetail(bcNo);
	}

	@Override
	public int saveBoard(ClubBoard clubBoard) {
		
		int result = 0;
		
		System.out.println("saveBoard result : " + result);
		
		result = clubDao.insertClub(clubBoard);
		
		if(clubBoard.getBcNo() != 0) {
//			result = clubDao.updateClub(clubBoard);
			System.out.println("updateClub");
		} else {
			result = clubDao.insertClub(clubBoard);
		}
		
		return result;
	}
	
}
