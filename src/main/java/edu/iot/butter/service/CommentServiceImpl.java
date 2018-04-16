package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.butter.dao.CommentDao;
import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDao dao;

	@Override
	public Pagination getPagination(int page, int boardId) throws Exception {
		int total = dao.getCount(boardId);
		Pagination pagination = new Pagination(page, total, 10, 5); // perpage, preblock
		System.out.println("service");
		System.out.println(pagination);
		pagination.setBoardId(boardId);
		return pagination;
	}

	@Override
	public List<Comment> selectList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}

	@Override
	public boolean insert(Comment comment) throws Exception {
		return dao.insert(comment) == 1;
	}

	@Override
	public boolean update(Comment comment) throws Exception {
		return dao.update(comment) == 1;
	}

	@Override
	public boolean delete(int commentId) throws Exception {
		return dao.delete(commentId) == 1;
	}

	@Override
	public Comment selectOne(int commentId) throws Exception {
		return dao.selectOne(commentId);
	}

	@Override
	public int getCount(int boardId) throws Exception {
		return dao.getCount(boardId);
	}

}
