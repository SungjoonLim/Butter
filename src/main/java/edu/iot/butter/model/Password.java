package edu.iot.butter.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Password {
	@NotEmpty(message="사용자 ID는 필수")
	private String userId;

	
	@NotEmpty(message="이전 비밀번호는 필수")
	private String oldPassword;
	
	@NotEmpty(message="바꿀 비밀번호는 필수")
	@Length(min=4,message="4글자 이상으로 변경 가능!")
	private String newPassword;
	
}
