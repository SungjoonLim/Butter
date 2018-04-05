package edu.iot.butter.model;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@Getter @Setter
public class Member implements Serializable{
	@NotEmpty(message="사용자 ID 입력 필수!")
	@Length(min=4, message="4글자 이상 입력하세요!")
	private String userId;
	
	@NotEmpty(message="이름 입력 필수!")
	private String name;
	
	@NotEmpty(message="비밀번호 입력 필수!")
	@Length(min=4, message="4글자 이상 입력하세요!")
	private String password;
	
	@Email(message="이메일 형식에 맞추세요!")
	private String email;
	
	@NotEmpty(message="전화번호 입력 필수!")
	@Length(min=10, message="10글자 이상 입력하세요!")
	private String cellPhone;
	
	private String address;
	private Date regDate;
	private Date updateDate;
}
