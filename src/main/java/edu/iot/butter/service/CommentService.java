package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;

public interface CommentService {
   Pagination getPagination(int page) throws Exception;
   
   List<Comment> getList(Pagination pagination) throws Exception;
   
   public Comment getComment(int commentId) throws Exception;
   
   public boolean create(Comment comment) throws Exception;
   
   public boolean update(Comment comment) throws Exception;
   
   public boolean delete(int commentId) throws Exception;


}