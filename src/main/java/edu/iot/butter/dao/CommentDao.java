package edu.iot.butter.dao;

import edu.iot.butter.model.Comment;

public interface CommentDao extends BaseDao<Comment, Integer> {
	int getCount(int boardId) throws Exception;
}
