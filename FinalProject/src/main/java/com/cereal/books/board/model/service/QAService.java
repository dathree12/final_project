package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;

public interface QAService {

	int qaCount();

	List<QA> findQAByNo(PageInfo pageInfo);

}
