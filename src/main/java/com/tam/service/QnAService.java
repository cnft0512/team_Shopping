package com.tam.service;

import java.util.List;

import com.tam.model.QnaVO;
import com.tam.model.Criteria;

public interface QnAService {
	
	// 게시글 전체 조회 - 페이징
	public List<QnaVO> selectAll(int prodNum) throws Exception;

	// 전체 게시글 수 - 페이징
	public int selectCount(Criteria cri) throws Exception;

	// 게시글 하나 조회
	public QnaVO selectOne(int qnaNum) throws Exception;

	// 게시글 등록
	public void postQnA(QnaVO qVo) throws Exception;

	// 게시글 삭제
	public int deleteQ(int qnaNum) throws Exception;

	// 게시글 수정
	public int updateQ(QnaVO qVo) throws Exception;

	// 게시글 수정
	public int updateA(QnaVO qVo) throws Exception;

	// 게시글 삭제
	public int deleteA(QnaVO qVo) throws Exception;

}
