package workshop.animal.control;
	import workshop.animal.entity.Animal;
	import workshop.animal.entity.Cat;
	import workshop.animal.entity.Fish;
	import workshop.animal.entity.Pet;
	import workshop.animal.entity.Spider;
	
public class TestAnimals {

	   public static void main(String[] args) {
	      Fish d = new Fish();
	      Cat c = new Cat("Fluffy");
	      Animal a = new Fish();
	      Animal e = new Spider();
	      Pet p = new Cat();
	      
	      System.out.println("=".repeat(60));
	      System.out.println("나는 고양이");
	      System.out.println("고양이 c 이름: "+ c.getName());
	      c.play();
	      c.eat();
	      c.walk();
	      System.out.println("-".repeat(60));
	      System.out.println("나는 고양이");
	      System.out.println("고양이 p 이름: "+ p.getName());
	      ((Cat) p).play();
	      ((Cat) p).eat();
	      ((Cat) p).walk();
	      System.out.println("=".repeat(60));
	      System.out.println("나는 물고기");
	      System.out.println("물고기 p 이름: "+ d.getName());
	      d.walk();
	      d.eat();
	      d.play();
	      System.out.println("-".repeat(60));
	      System.out.println("물고기");
	      System.out.println("물고기 a 이름: "+ ((Fish) a).getName());
	      ((Fish) a).walk();
	      ((Fish) a).eat();
	      ((Fish) a).play();
	      System.out.println("=".repeat(60));
	      System.out.println("저는 거미 e에요");
	      ((Spider) e).walk();
	      ((Spider) e).eat();
	   }

	}
