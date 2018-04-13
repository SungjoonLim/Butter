package edu.iot.butter.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Board;
import edu.iot.butter.model.Comment;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.BoardService;
import edu.iot.butter.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping("/list")
	public void list(@RequestParam(value="page", defaultValue="1")int page,
						Model model) throws Exception {
		Pagination pagination = service.getPagination(page);
		List<Board> list = service.getList(pagination);
		model.addAttribute("pagination",pagination);
		model.addAttribute("list",list);
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void createForm(Board board) {}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createSubmit(@Valid Board board, BindingResult result,
							MultipartHttpServletRequest request) throws Exception {
		if(result.hasErrors()) {
			System.out.println(result);
			return "board/create";
		}
		
		List<MultipartFile> attachments = request.getFiles("files");
		if(!service.create(board, attachments)) return "board/create";
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/view/{boardId}", method=RequestMethod.GET)
	public String view(@PathVariable int boardId, Model model) throws Exception{
		Board board = service.getBoard(boardId);
		model.addAttribute("board",board);
		return "board/view";
	}
	
	@RequestMapping(value="/download/{attachmentId}",method=RequestMethod.GET)
	public String download(@PathVariable int attachmentId, Model model) throws Exception{
		Attachment file = service.getAttachment(attachmentId);
		
		String path="c:/temp/upload/"+file.getLocation();
		model.addAttribute("type","application/octet-stream");
		model.addAttribute("path",path);
		model.addAttribute("fileName", file.getFileName());
		
		return "download";
	}
	
	@RequestMapping(value="/edit/{boardId}", method=RequestMethod.GET)
	public String editForm(@PathVariable int boardId, Model model) throws Exception{
		Board board = service.getBoard(boardId);
		model.addAttribute("board",board);
		return "board/edit";
	}
	
	@RequestMapping(value="/edit/{boardId}", method=RequestMethod.POST)
	public String editSubmit(@Valid Board board, BindingResult result,
							MultipartHttpServletRequest request) throws Exception{
		if(result.hasErrors()) return "board/edit";
		List<MultipartFile> attachments = request.getFiles("files");
		if(!service.update(board, attachments)) {
			result.reject("updateFail","비밀번호가 일치하지 않습니다.");
			 return "board/edit";
		}
		return "redirect:/board/list";
	}
	
	@ResponseBody
	@RequestMapping(value="/delete_attachment/{attachmentId}",
						method=RequestMethod.DELETE)
	public boolean delete(@PathVariable int attachmentId) throws Exception{
//		System.out.println(attachmentId);
		//첨부파일 삭제
		return service.deleteAttachment(attachmentId);
	}
	
	

//	@Autowired
//	CommentService commentService;
//	
//	@RequestMapping(value = "/view/{boardId}", method = RequestMethod.GET)
//	public String view(@RequestParam(value = "page", defaultValue = "1") int page, 
//	   				@PathVariable int boardId, Model model) throws Exception {
//		Board board = service.getBoard(boardId);
//		Pagination pagination = commentService.getPagination(page);
//		List<Comment> list = commentService.getList(pagination);
//		log.debug(list.toString()+"---------------------------------------------------------------");
//		model.addAttribute("board", board);
//		model.addAttribute("pagination", pagination);
//		model.addAttribute("list", list);
//		return "board/view";
//	}
}












