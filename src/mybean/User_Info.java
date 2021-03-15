package mybean;

public class User_Info {
	private String id;
	private String pwd;
	private String name;
	private String birthday;
	private String fileName;
	
	public User_Info() {}
	
	public void setId(String id) {
		this.id=id;
	}
	public void setPwd(String pwd) {
		this.pwd=pwd;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setBirthday(String birthday) {
		this.birthday=birthday;
	}
	public void setFileName(String fileName) {
		this.fileName=fileName;
	}
	
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getName() {
		return name;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getFileName() {
		return fileName;
	}
}
