package edu.iot.butter.service;

import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;

public interface MemberService {
	Member checkLogin(Login login) throws Exception;
	boolean checkId(String userId) throws Exception;
	boolean add(Member member) throws Exception;
	boolean update(Member member) throws Exception;
	Member getMember(String userId) throws Exception;
}
