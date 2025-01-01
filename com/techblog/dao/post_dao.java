package com.techblog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.category;
import com.techblog.entities.post;

public class post_dao {

	Connection con;

	public post_dao(Connection con) {
		super();
		this.con = con;
	}
	//get List of categories
	public ArrayList<category> getAllCategories(){
		
		ArrayList <category> list=new ArrayList<>();
		
		try {
			
			String qry="Select * from categories";
			Statement st=this.con.createStatement();
			ResultSet set=st.executeQuery(qry);
			
			while(set.next()) {
				int cid=set.getInt("cid");
				String name=set.getString("name");
				String description=set.getString("description");
				category c=new category(cid,name,description);
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//get all posts function
	
	public List<post> getAllPosts(){
		
		List<post> list=new ArrayList<>();
		try {
			PreparedStatement p=con.prepareStatement("select * from posts");
			ResultSet set=p.executeQuery();
					while (set.next()) {

			            int pid = set.getInt("pid");
			            String ptitle = set.getString("ptitle");
			            String pcontent = set.getString("pcontent");
			            String pcode = set.getString("pcode");
			            String ppic = set.getString("ppic");
			            Timestamp date = set.getTimestamp("pdate");
			            int catid = set.getInt("catid");
			            int user_id = set.getInt("userid");
			            post post = new post(pid, ptitle, pcontent, pcode, ppic, date, catid, user_id);

			            list.add(post);
						}
		}catch (Exception e) {
            e.printStackTrace();
        }
		
        
		return list;
	}
	
	//get post by category
	
	public List<post> getPostByCatID(int catid) {
	    List<post> list = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM posts WHERE catid=?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setInt(1, catid);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	int pid = rs.getInt("pid");
	            String ptitle = rs.getString("ptitle");
	            String pcontent = rs.getString("pcontent");
	            String pcode = rs.getString("pcode");
	            String ppic = rs.getString("ppic");
	            Timestamp date = rs.getTimestamp("pdate");
	            int user_id = rs.getInt("userid");
	            post post = new post(pid, ptitle, pcontent, pcode, ppic, date, catid, user_id);
	            list.add(post);
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	
	public boolean savePost(post p) {
		boolean f=false;
		
		try {
			 String q = "insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
	            PreparedStatement pstmt = con.prepareStatement(q);
	            pstmt.setString(1, p.getPtitle());
	            pstmt.setString(2, p.getPcontent());
	            pstmt.setString(3, p.getPcode());
	            pstmt.setString(4, p.getPpic());
	            pstmt.setInt(5, p.getCatid());
	            pstmt.setInt(6, p.getUserid());
	            pstmt.executeUpdate();
	            f = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
