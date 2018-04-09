package edu.iot.butter.dao;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;

public interface MemberDao extends BaseDao<Member,String>{
	int changePassword(Password password) throws Exception;

	// 관리자 호출 메서드
	int updateByAdmin(Member member) throws Exception;
	int changePasswordByAdmin(Password password) throws Exception;

}
