package workshop.animal.entity;

public class Cat extends Animal implements Pet{
	private String name;

	public Cat () {
		super(4);
	}
	public Cat (String name) {
		super(4);
		setName(name);
	}
	@Override
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public void play() {
		System.out.println("고양이는 논다.");
	}
	@Override
	public void eat() {
		System.out.println("고양이는 우유를 먹는다");
	}

}
