package test.nboard.dto;

import java.math.BigDecimal;

public class NewBoardDTO {
	private BigDecimal b_no; 
	private BigDecimal ref;
	private BigDecimal step; 
	private BigDecimal b_level;	
	private String name;	
	private String subj;	
	private BigDecimal hit;
	private int tcount = 0;
	private int pageline = 10;
	private int page = 1;
	private BigDecimal num;
	private String regdate;
	private String newcontents;
	private String comment;
	private BigDecimal commentseq;
	
	public BigDecimal getCommentseq() {
		return commentseq;
	}
	public void setCommentseq(BigDecimal commentseq) {
		this.commentseq = commentseq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getNewcontents() {
		return newcontents;
	}
	public void setNewcontents(String newcontents) {
		this.newcontents = newcontents;
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public BigDecimal getB_no() {
		return b_no;
	}
	public void setB_no(BigDecimal b_no) {
		this.b_no = b_no;
	}
	public BigDecimal getRef() {
		return ref;
	}
	public void setRef(BigDecimal ref) {
		this.ref = ref;
	}
	public BigDecimal getStep() {
		return step;
	}
	public void setStep(BigDecimal step) {
		this.step = step;
	}
	public BigDecimal getB_level() {
		return b_level;
	}
	public void setB_level(BigDecimal b_level) {
		this.b_level = b_level;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubj() {
		return subj;
	}
	public void setSubj(String subj) {
		this.subj = subj;
	}
	public BigDecimal getHit() {
		return hit;
	}
	public void setHit(BigDecimal hit) {
		this.hit = hit;
	}
	public int getTcount() {
		return tcount;
	}
	public void setTcount(int tcount) {
		this.tcount = tcount;
	}
	public int getPageline() {
		return pageline;
	}
	public void setPageline(int pageline) {
		this.pageline = pageline;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public BigDecimal getNum() {
		return num;
	}
	public void setNum(BigDecimal num) {
		this.num = num;
	}
}