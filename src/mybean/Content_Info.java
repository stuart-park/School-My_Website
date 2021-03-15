package mybean;

public class Content_Info {
	private int idx;
	private int readNum;
	private int likeNum;
	private String id;
	private String title;
	private String date;
	private String type;
	private String content;
	private String fileName;
	
	public Content_Info() {}
	
	public void setIdx(int idx) {
		this.idx=idx;
	}
	
	public void setReadNum(int readNum) {
		this.readNum=readNum;
	}
	
	public void setLikeNum(int likeNum) {
		this.likeNum=likeNum;
	}
	
	public void setId(String id) {
		this.id=id;
	}
	
	public void setTitle(String title) {
		this.title=title;
	}
	
	public void setDate(String date) {
		this.date=date;
	}
	public void setType(String type) {
		this.type=type;
	}

	public void setContent(String content) {
		this.content=content;
	}
	
	public void setFileName(String fileName) {
		this.fileName=fileName;
	}
	
	public int getIdx() {
		return idx;
	}
	
	public int getReadNum() {
		return readNum;
	}
	
	public int getLikeNum() {
		return likeNum;
	}
	
	public String getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getType() {
		return type;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getFileName() {
		return fileName;
	}
}