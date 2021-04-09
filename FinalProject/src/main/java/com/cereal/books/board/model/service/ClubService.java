package com.cereal.books.board.model.service;

import com.cereal.books.board.model.vo.ClubBoard;

// Ctrl + Mouse up -> Implementation (Impl : 구현체로 이동)
public interface ClubService {

	// bcNo 로 ClubBoard 정보 가져오기
	ClubBoard findByBoardNo(int bcNo);
}
