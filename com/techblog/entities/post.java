package com.techblog.entities;

import java.sql.Timestamp;

public class post {

	
	private int pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private String ppic;
	private Timestamp pdate;
	private static int catid;
	private int userid;
	
	public post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid,int userid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userid=userid;
	}

	public post() {
	}

	public post(String ptitle, String pcontent, String pcode, String ppic, Timestamp pdate, int catid,int userid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.ppic = ppic;
		this.pdate = pdate;
		this.catid = catid;
		this.userid=userid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPpic() {
		return ppic;
	}

	public void setPpic(String ppic) {
		this.ppic = ppic;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public static int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}
	
	
	
	
}
