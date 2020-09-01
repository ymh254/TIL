# Java

- 객체 지향 언어(OOP)
- java는 platform(os) 독립적

=> 한 os에서 만들어진 bytecode를 다른 os에서 그대로 실행가능

- `.Java -compile` ==> `.class (byte code)` (assembly code가 아님. assembly code는 다른 os에서 실행불가)



Jdk (java development kit)=for development

-jre를 포함하고 있음

Jre (java runtime environment)=for user



J2se - stand alone. java API

​		- java core, i.o, collection, jdbc

J2ee - server based web application

​		- servlet, jsp, ejb, jpa



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