package edu.iot.butter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.CommentService;

@RestController
@RequestMapping(value="view/comment")
public class CommentController {
   
   @Autowired
   CommentService service;
/*   
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
*/
   
   
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public Map<String, Object> list(@RequestParam(value = "page", defaultValue = "1") int page,
                                   @RequestParam(value = "board") int boardId) throws Exception {
       Map<String, Object> map = new HashMap<>();
       Pagination pagination = service.getPagination(page, boardId);
       System.out.println(pagination);
       List<Comment> list = service.selectList(pagination);
       map.put("pagination", pagination);
       map.put("list", list);
       return map;
   }


   @RequestMapping(value = "/list", method = RequestMethod.POST)
   public boolean insert(@RequestBody Comment comment, HttpSession session) throws Exception{
       //requestbody : json 사용시
       Member member = (Member) session.getAttribute("USER");
       if (member != null) {
           boolean result = service.insert(comment);
           return true;
       }
       return false;
   }

   @RequestMapping(value = "/list", method = RequestMethod.PUT)
   public boolean update(@RequestBody Comment comment) throws Exception {
       //System.out.println(comment);
       return service.update(comment);
   }

   @RequestMapping(value = "/list/{commentId}", method = RequestMethod.DELETE)
   public boolean delete(@PathVariable int commentId) throws Exception {
       return service.delete(commentId);
   }
   
}