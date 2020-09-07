# Spring

>  SingleTon - 객체를 한번만 생성하는 것.

> 프레임워크를 사용하는 이유

기능적인 요구사항 => 업무로직개발, 비지니스 프로세스

비기능적인 문제 해결

(성능, 보안, 확장성)



> 프레임워크 vs 라이브러리

프레임워크는 라이브러리의 덩어리이다.

어플리케이션을 만들 때의 주도권을 프레임워크는 프레임워크가 가지고 있고, 라이브러리는 개발자가 갖고 있다.

==> IoC (Inverstion of Controll)

​	: 인스턴스 생명주기 관리를 개발자가 아닌 컨테이너가 대신 해준다.

​	(IoC Container ---> 객체 생성 및 의존성을 관리)

- IoC

  - DL : Dependcy Lookup

  - DI : Dependancy Injection - Setter Injection

    ​										       - Constructor Injection

    ​										  	 - Method Injection

  ​	==> 각 클래스간의 의존관계를 Bean 설정을 바탕으로 컨테이너가 자동으로 연결.

  ​	==> 개발자는 Bean 설정파일에서 의존관계가 필요하다는 정보를 추가해 주면 됨.

  ​	- Beans : Spring Container가 관리해 주는 객체.

  ​    - Spring Container에 XML설정 (Bean 설정파일 => 의존관계 포함) 	     	

  ​	`Metadata`를 통해 Beans를 관리하고 어플리케이션의 중요부분을 형성함

  ​	< getBean()으로 객체 호출 >

- Bean Factory / Application Context 

  : DI Container 역할을 담당하는 객체 - Bean 등록, 생성, 조회

  - Bean Factory를 바로 사용하지 않고 이를 확장한 Application Context를 사용함.

    ( getBean()이라는 메서드로 Bean을 조회 )

