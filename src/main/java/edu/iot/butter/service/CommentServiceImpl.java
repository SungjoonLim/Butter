package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.butter.dao.CommentDao;
import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;

@Service
public class CommentServiceImpl implements CommentService{
	 @Autowired
	   CommentDao dao;
	   
	   @Override
	   public Pagination getPagination(int page) throws Exception {
	      int total = dao.getCount();
	      Pagination pagination = new Pagination(page, total, 20, 5);  //perpage, preblock
	      return pagination;
	   }

	   @Override
	   public List<Comment> getList(Pagination pagination) throws Exception {
	      return dao.selectList(pagination);
	   }

	   @Override
	   public Comment getComment(int commentId) throws Exception {
	      return dao.selectOne(commentId);
	   }

	   @Override
	   public boolean create(Comment comment) throws Exception {
	      return dao.insert(comment)==1;
	   }

	   @Override
	   public boolean update(Comment comment) throws Exception {
	      return dao.update(comment)==1;
	   }

	   @Override
	   public boolean delete(int commentId) throws Exception {
	      return dao.delete(commentId)==1;
	   }

}
