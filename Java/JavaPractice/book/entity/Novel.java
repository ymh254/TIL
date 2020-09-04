package workshop.book.entity;

public class Novel extends Publication {
	private String author;
	private String genre;
	
	public Novel () {
		super();
	}

	public Novel (String title, String publishigDate, int page, int price, String author, String genre) {
		super(title, publishigDate, page, price);
		this.author=author;
		this.genre=genre;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
}
