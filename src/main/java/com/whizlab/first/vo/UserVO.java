package com.whizlab.first.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
@Getter
@Setter
public class UserVO {
	private int userSeq;
	private String userID;
	private String userPW;
	private String userName;
	private String userUsage;
	private String userRegi;
	private Timestamp userRegiDate;
	private String userEditor;
	private Timestamp userEditDate;

	private int userBizCode;
}
