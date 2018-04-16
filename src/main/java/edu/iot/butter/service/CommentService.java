package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;

public interface CommentService {
int getCount(int boardId) throws Exception;

	Pagination getPagination(int page, int boardId) throws Exception;

	Comment selectOne(int commentId) throws Exception;

	List<Comment> selectList(Pagination pagination) throws Exception;

	public boolean insert(Comment comment) throws Exception;

	public boolean update(Comment comment) throws Exception;

	public boolean delete(int commentId) throws Exception;

}