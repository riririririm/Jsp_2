package com.rim.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

import com.rim.util.DBConnector;
import com.sun.prism.Presentable;

import oracle.jdbc.proxy.annotation.Pre;

public class noticeDAO {


	//selectList()
	public ArrayList<noticeDTO> selectList(String search, int startRow, int lastRow) throws Exception {
		ArrayList<noticeDTO> arr = new ArrayList<noticeDTO>();
		noticeDTO dto = null;
		Connection conn = DBConnector.getConnection();
		String sql="select * from "
				+ "(select rownum R, n.* from "
				+ "(select * from notice where title like ? order by num desc) n) "
				+ "where R between ? and ?";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, "%"+search+"%");
		pst.setInt(2, startRow);
		pst.setInt(3, lastRow);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			dto = new noticeDTO();
			dto.setContents(rs.getString("contents"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getInt("hit"));
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			arr.add(dto);
		}
		
		DBConnector.disConnect(rs, pst, conn);
		return arr;
	}
	
	//selectOne()
	public noticeDTO selectOne(int num) throws Exception {
		noticeDTO dto = null;
		Connection conn = DBConnector.getConnection();
		String sql="select * from notice where num=?";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			dto = new noticeDTO();
			dto.setContents(rs.getString("contents"));
			dto.setReg_date(rs.getDate("reg_date"));
			dto.setHit(rs.getInt("hit"));
			dto.setNum(rs.getInt("num"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
		}
		DBConnector.disConnect(rs, pst, conn);
		return dto;
	}
	
	//insert()
	public int insert(noticeDTO dto) throws Exception {
		int result=0;
		Connection conn = DBConnector.getConnection();
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,0)";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, dto.getTitle());
		pst.setString(2, dto.getContents());
		pst.setString(3, dto.getWriter());
		
		result=pst.executeUpdate();
		
		DBConnector.disConnect(pst, conn);
		
		return result;
	}
	
	//update()
	public int update(noticeDTO dto) throws Exception {
		int result=0;
		Connection conn = DBConnector.getConnection();
		String sql = "update notice set title=?, contents=?, reg_date=sysdate where num=?";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, dto.getTitle());
		pst.setString(2, dto.getContents());
		pst.setInt(3, dto.getNum());
		
		result=pst.executeUpdate();
		
		DBConnector.disConnect(pst, conn);
		
		return result;
	}
	
	//delete()
	public int delete(int num) throws Exception {
		int result=0;
		Connection conn = DBConnector.getConnection();
		String sql = "delete notice where num=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		result = pst.executeUpdate();
		
		DBConnector.disConnect(pst, conn);
		
		return result;
	}
	
	//countHit()
	public int countHit(int num) throws Exception {
		int result=0;
		Connection conn = DBConnector.getConnection();
		String sql = "update notice set hit=hit+1 where num=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		result=pst.executeUpdate();
		
		DBConnector.disConnect(pst, conn);
		
		return result;
	}
	
	public int countTotal() throws Exception {
		int result=0;
		Connection conn = DBConnector.getConnection();
		String sql = "select count(*) from notice";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		
		rs.next();
		result = rs.getInt("count(*)");
		
		
		return result;
	}
}
