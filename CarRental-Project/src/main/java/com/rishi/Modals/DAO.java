package com.rishi.Modals;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

public class DAO {
	
	private Connection c;
	public DAO() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated constructor stub
		Class.forName("com.mysql.cj.jdbc.Driver");
		c=DriverManager.getConnection("jdbc:mysql://localhost:3306/carrental","root","rishi");
	}
	public void closeConnection() throws SQLException {
		c.close();
	}
	
	public String adminLogin(String id,String password) throws SQLException {
		PreparedStatement pst=c.prepareStatement("select * from admin where id=? and password=?");
		pst.setString(1, id);
		pst.setString(2, password);
		ResultSet rs=pst.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
			
		}else {
			return null;
		}
	}
	public void addEnquiry(String name,String phone) throws SQLException {
		PreparedStatement pst=c.prepareStatement("insert into enquiries (name,phone,status) values(?,?,'Pending')");
		pst.setString(1, name);
		pst.setString(2, phone);
		pst.executeUpdate();
	}
	public void changeStatus(int id) throws SQLException {
		PreparedStatement pst=c.prepareStatement("update enquiries set status='Done' where id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
	}
	
	public ArrayList<HashMap> getAllEntries() throws SQLException{
		PreparedStatement pst=c.prepareStatement("select * from enquiries order by id DESC");
		ResultSet rs=pst.executeQuery();
		ArrayList<HashMap> enquiries =new ArrayList<HashMap>();
		while(rs.next()) {
			HashMap<String, String> enquiry=new HashMap<>();
			enquiry.put("id", rs.getString("id"));
			enquiry.put("name", rs.getString("name"));
			enquiry.put("phone", rs.getString("phone"));
			enquiry.put("status", rs.getString("status"));
			
			enquiries.add(enquiry);
		}
			return enquiries;
		}
	public boolean registerCarOwner(HashMap<String, String> carOwner , InputStream idproof)throws SQLException {
		PreparedStatement pst=c.prepareStatement("insert into car_owners (email,password,name,phone,address,idproof,status) values(?,?,?,?,?,?,'Pending')");
		pst.setString(1, carOwner.get("email"));
		pst.setString(2, carOwner.get("password"));
		pst.setString(3, carOwner.get("name"));
		pst.setString(4, carOwner.get("phone"));
		pst.setString(5, carOwner.get("address"));
		pst.setBinaryStream(6, idproof);
		
		try {
			pst.executeUpdate();
			return true;
			
		} catch (SQLIntegrityConstraintViolationException e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public ArrayList<HashMap> getAllOwners() throws SQLException{
		PreparedStatement pst=c.prepareStatement("select * from car_owners order by status DESC");
		ResultSet rs= pst.executeQuery();
		ArrayList<HashMap> carOwners=new ArrayList<>();
		while(rs.next()) {
			HashMap<String, String> carOwner=new HashMap<>();
			carOwner.put("email", rs.getString("email"));
			carOwner.put("name", rs.getString("name"));
			carOwner.put("phone", rs.getString("phone"));
			carOwner.put("status", rs.getString("status"));
			carOwner.put("address", rs.getString("address"));
			
			carOwners.add(carOwner);
			
		}
		return carOwners;
		
	}
	
	public byte [] getIDProof(String email) throws SQLException {
		PreparedStatement pst= c.prepareStatement("select idproof from car_owners where email=?");
		pst.setString(1, email);
		ResultSet rs= pst.executeQuery();
		rs.next();
		return rs.getBytes("idproof");
		
	}
	public void changeCarOwnerStatus(String email , String status)throws SQLException {
		PreparedStatement pst;
if(status.equalsIgnoreCase("Pending")) {
	
			pst = c.prepareStatement("update car_owners set status = 'Accepted' where email = ?");
		}else {
			pst= c.prepareStatement("delete from car_owners where email = ?");
			
		}
		
			pst.setString(1, email);
			pst.executeUpdate();
		
	}
	
	public String carOwnerLogin(String email, String password) throws SQLException {
		PreparedStatement pst= c.prepareStatement("select * from car_owners where email= ? and password =?" );
		pst.setString(1, email);
		pst.setString(2, password);
		ResultSet rs= pst.executeQuery();
		if(rs.next()) {
			String status=rs.getString("status");
			if(status.equalsIgnoreCase("Pending")) {
				return "Pending";
			}
			return rs.getString("name");
		}else {
			return null;
		}
	}
}

