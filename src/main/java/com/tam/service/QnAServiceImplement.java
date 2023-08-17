package com.tam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.QnAMapper;
import com.tam.model.QnaVO;
import com.tam.model.Criteria;
@Service
public class QnAServiceImplement implements QnAService{

	@Autowired
	private QnAMapper qnaMapper;
	
	@Override
	public List<QnaVO> selectAll(int prodNum) throws Exception {
		return qnaMapper.selectAll(prodNum);
	}

	@Override
	public int selectCount(Criteria cri) throws Exception {
		return qnaMapper.selectCount(cri);
	}

	@Override
	public QnaVO selectOne(int qnaNum) throws Exception {
		return qnaMapper.selectOne(qnaNum);
	}

	@Override
	public void postQnA(QnaVO qVo) throws Exception {
		qnaMapper.postQnA(qVo);
	}

	@Override
	public int deleteQ(int qnaNum) throws Exception {
		return qnaMapper.deleteQ(qnaNum);
	}

	@Override
	public int updateQ(QnaVO qVo) throws Exception {
		return qnaMapper.updateQ(qVo);
	}
	
	@Override
	public int updateA(QnaVO qVo) throws Exception {
		return qnaMapper.updateA(qVo);
	}

	@Override
	public int deleteA(QnaVO qVo) throws Exception {
		return qnaMapper.deleteA(qVo);
	}
}
