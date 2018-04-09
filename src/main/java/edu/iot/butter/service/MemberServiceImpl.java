package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;

	@Override
	public Member checkLogin(Login login) throws Exception {
		Member member = dao.selectOne(login.getUserId());
		if (member != null && 
				member.getPassword().equals(login.getPassword())) {
			return member;
		}
		throw new LoginFailException("사용자 ID 또는 비밀번호가 일치하지 않습니다.");
	}

	@Override
	public boolean checkId(String userId) throws Exception {
		return dao.selectOne(userId) != null;
	}

	@Transactional
	@Override
	public boolean add(Member member) throws Exception {
		return dao.insert(member)==1;
	}

	@Transactional
	@Override
	public boolean update(Member member) throws Exception {
		return dao.update(member)==1;
	}

	@Override
	public Member getMember(String userId) throws Exception {
		return dao.selectOne(userId);
	}

	@Transactional
	@Override
	public boolean changePassword(Password password) throws Exception {
		return dao.changePassword(password)==1;
	}

	@Override
	public Pagination getPagination(int page) throws Exception {
		int total=123;
		return new Pagination(page,total);
	}

	@Override
	public List<Member> getList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}
	

	@Transactional
	@Override
	public boolean updateByAdmin(Member member) throws Exception {
		return dao.updateByAdmin(member)==1;
	}
	
	@Transactional
	@Override
	public boolean changePasswordByAdmin(Password password)
			throws Exception {
		return dao.changePasswordByAdmin(password)==1;
	}
}
