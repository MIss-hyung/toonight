package webtoon;

public class WebtoonDTO {
	private int number;
	//    ����
	private String title;
	// �����
	private String poster;
	// �ּ�
	private String url;
	 
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	   @Override
	    public String toString() {
	        return "WebtoonDTO [number=" + number + ", title=" + title + ", poster=" + poster + " ,url="+ url +"]";
	    }
}
