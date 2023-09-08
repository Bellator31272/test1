package com.spring.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.reply.dao.ReplyDAO;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	public ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		List<ReplyVO> replyList = replyDAO.replyList(rvo);
		return replyList;
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = replyDAO.replyInsert(rvo);
		return result;
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = replyDAO.replyUpdate(rvo);
		return result;
	}

	@Override
	public int replyDelete(int r_num) {
		int result = replyDAO.replyDelete(r_num);
		return result;
	}


}
