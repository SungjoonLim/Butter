package edu.iot.butter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;

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
//		System.out.println(userId);
		Member m = dao.selectOne(userId);
//		System.out.println(m);
		return m != null;
	}

	@Transactional
	@Override
	public boolean add(Member member) throws Exception {
		int result = dao.insert(member);
		return (result == 1);
	}

}
