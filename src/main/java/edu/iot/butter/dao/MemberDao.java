package edu.iot.butter.dao;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;

public interface MemberDao extends BaseDao<Member,String>{
	int changePassword(Password password) throws Exception;
}
