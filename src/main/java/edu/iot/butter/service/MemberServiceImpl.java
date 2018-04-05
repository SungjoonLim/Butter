package edu.iot.butter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;

	@Override
	public Member checkLogin(Login login) {
		try {
			Member member = dao.selectOne(login.getUserId());
			if (member == null) {
				return null;
			}
			if (!login.getPassword().equals(member.getPassword())) {
				return null;
			}
			return member;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean checkId(String userId) throws Exception{
		Member member = dao.selectOne("userId");
		return member != null;
	}
	
	@Transactional
	@Override
	public boolean add(Member member) throws Exception {
		int result = dao.insert(member);
		return (result == 1);
	}

}
