package mybean;

public class Comment_Info {
	private int idx;
	private int postIdx;
	private String id;
	private String date;
	private String comment;
	
	public Comment_Info() {}
	
	public void setIdx(int idx) {
		this.idx=idx;
	}
	
	public void setPostIdx(int postIdx) {
		this.postIdx=postIdx;
	}
	
	public void setId(String id) {
		this.id=id;
	}
	
	public void setDate(String date) {
		this.date=date;
	}
	
	public void setComment(String comment) {
		this.comment=comment;
	}
	
	public int getIdx() {
		return idx;
	}
	
	public int getPostIdx() {
		return postIdx;
	}
	
	public String getId() {
		return id;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getComment() {
		return comment;
	}
}
