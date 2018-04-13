package edu.iot.butter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.CommentService;

@RestController
@RequestMapping(value="/view/comment")
public class CommentController {
   
   @Autowired
   CommentService service;
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public List<Comment> getList(Pagination pagination) throws Exception {
      return service.getList(pagination);
   }

   @RequestMapping(value = "/{commentId}", method = RequestMethod.GET)
   public Comment get(@PathVariable int commentId) throws Exception{
      return service.getComment(commentId);
   }

   @RequestMapping(value = "/", method = RequestMethod.POST)
   public boolean insert(@RequestBody Comment comment) throws Exception{  //requestbody : json 사용시
      System.out.println(comment);
//	  return true;
	   return service.create(comment);
   }

   @RequestMapping(value = "/", method = RequestMethod.PUT)
   public boolean update(@RequestBody Comment comment) throws Exception {
      //System.out.println(comment);
      return service.update(comment);
   }

   @RequestMapping(value = "/{commentId}", method = RequestMethod.DELETE)
   public boolean delete(@PathVariable int commentId) throws Exception {
      return service.delete(commentId);
   }
   

   
}