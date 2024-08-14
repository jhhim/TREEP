package com.ss.sns.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageMapper {

	int getMemberNo(String member_nickname);

}
