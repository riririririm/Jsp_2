package com.rim.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rim.util.DBConnector;

public class MemberDAO {

	public MemberDTO memberLogin(MemberDTO dto) throws Exception{
		MemberDTO m = null;
		
		Connection conn  = DBConnector.getConnection();
		String sql="select * from member where id=? and pw=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, dto.getId());
		pst.setString(2, dto.getPw());
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		
		DBConnector.disConnect(pst, conn);
		
		return dto;
	}
	
	public int memberJoin(MemberDTO dto) throws Exception{
		int result=0;
		Connection conn  = DBConnector.getConnection();
		String sql="insert into member values(?,?,?,?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, dto.getId());
		pst.setString(2, dto.getPw());
		pst.setString(3, dto.getName());
		pst.setString(4, dto.getPhone());
		pst.setString(5, dto.getEmail());
		pst.setInt(6, dto.getAge());
		
		result = pst.executeUpdate();
		
		DBConnector.disConnect(pst, conn);
		
		return result;
	}
}
