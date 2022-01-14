package kr.co.finalp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthoritiesOracleDAO implements AuthoritiesDAO{

	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	@Override
	public void insertAuthority(String id) {
		ss.insert("kr.co.finalp.insertMemberAuthority", id);
	}

}
