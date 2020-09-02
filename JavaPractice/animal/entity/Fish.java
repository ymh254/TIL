package workshop.animal.entity;

public class Fish extends Animal implements Pet {
	private String name;
	public Fish() {
		super(0);
	}
	@Override
	public void setName(String name) {
		
	}
	@Override
	public String getName() {
		return null;
	}
	@Override
	public void play() {
		System.out.println("물고기는 논다.");
	}
	@Override
	public void eat() {
		System.out.println("물고기는 먹는다.");
	}
	public void walk() {
		System.out.println("물고기는 발이 없다.");
	}
}
