package com.springbook.biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "scott", "TIGER");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close( PreparedStatement stmt, Connection conn) {
		if(stmt != null) { try {stmt.close();} catch(Exception e) {e.printStackTrace();} }
		if(conn != null) { try {conn.close();} catch(Exception e) {e.printStackTrace();} }
	}
	
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if(rs != null) { try {rs.close();} catch(Exception e) {e.printStackTrace();} }
		if(stmt != null) { try {stmt.close();} catch(Exception e) {e.printStackTrace();} }
		if(conn != null) { try {conn.close();} catch(Exception e) {e.printStackTrace();} }
	}
}
