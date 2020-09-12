# Java

- 객체 지향 언어(OOP)

  : 프로그램을 어떻게 설계해야 하는지에 대한 일종의 개념이자 방법론으로, 프로그램을 수많은 객체라는 기본단위로 나누고 이 객체들의 상호작용으로 서술.

- java는 platform(os) 독립적

  => 한 os에서 만들어진 bytecode를 다른 os에서 그대로 실행가능

- `.Java -compile` ==> `.class (byte code)` (assembly code가 아님. assembly code는 다른 os에서 실행불가)

> Class

- 객체를 만드는 틀, 객체를 만들기위한 설계도
- 형태: class 클라스명 {}

> 객체

- 객체는 속성과 기능의 집합 (속성과 기능을 객체 멤버라 함).
  - 속성(Property) : 멤버변수(member variable), 특성(attribute) + 필드(field), 상태(state)
  - 기능(function) : 메서드(method), 행위(behavior), 함수(function)
- 인스턴스를 포함함.

> 인스턴스

- 생성된 객체, 어떤 클라스에 속하는 각각의 객체
- 객체를 생성하여 JVM이 관리하는 메모리에 적재됨
- 어떤 클래스로부터 만들어진 객체를 해당 클라스의 인스턴스라 하고 만들어지는 과정을 인스턴스화라고 함.
- 클래스가 가지고 있는  method를 모두 상속받는다.

> 인스턴스 생성 및 사용

```
클래스명 변수명;					//클래스의 객체를 참조하기 위한 참조변수 선언
변수명 = new 클라스명();	//객체 생성후 객체의 주소를 참조변수에 저장
Ap c;
c=new Ap();					 //Ap c=new Ap();로 한번에 생성 가능
```

- 인스턴스를 생성할려면 특정 클래스를 인스턴스화 시킨후, 그 인스턴스의 주소를 변수에 저장

  - 변수는 만들려는 특정 클래스를 타입으로 해야 해당 클래스를 참조할 수 있음.
  - 인스턴스의 주소를 참조변수에 저장하면 참조변수를 통해서 그 인스턴스를 사용할 수 있음. 

  (클래스를 직접적으로 사용하는것이 아니라 클래스를 통해서 만들어진 인스턴스를 사용할 수 있는것임)

##### JAVA 플랫폼의 3대 요소

- JDK (java development kit)=for development

  -JAVA언어로 작성된 소스를 컴파일하고 관리하는데 사용.

  -JRE를 포함하고 있음 (JRE+Development Tools).

- JRE (java runtime environment)=for user

  -JAVA언어로 작성된 프로그램을 실행

  -JVM을 포함하고 있음 (JVM+Library Classes.

- JVM (java virtual machine)

  -어떤 운영체제에서도 동일한 형태로 실행시켜줌

##### JAVA 플랫폼

- J2se - 일반 자바 프로그램 개발을 위한 개발구조 (stand alone java API).

  ​		- java core, i.o, collection, jdbc

- J2ee - enterprise 환경을 위한 도구. 

  ​	 	- web application server (WAS)

  ​		 - servlet, jsp, ejb, jpa



### 객체지향 언어의 3대 주요 특징

> Encapsulation

Data보호 뿐 아니라, Class의 세부 구현도 숨긴다는 점에서 Information hiding의 확장이라 볼 수 있다.

(Information hind: 멤버변수는 private로 선언하여, 외부에서 직접 참조하지 못하도록 함

​								  멤버 변수는 getter/setter를 이용하여 참조.)

> Inheritance

상속 받을 시 접근제한자 설정시

하위 메소드의 접근 범위가 상위 메소드의 접근 범위보다 넓거나 같아야한다.

(ex) protected 부모 < public 자식)

> Polymorphism

자바에서는 한 Reference Type 변수가 다른 형태의 객체를 참조 할 수 있음.

(부모 Reference 변수 => 자식 객체)

(Reference Data Type = Primitive Data Type을 제외한 자료형)

(Primitive Data Type: boolean  /  char  /  byte/short/int/long  /  float/double)