# SpringFramwork

>  SingleTon - 객체를 한번만 생성하는 것.

> 프레임워크를 사용하는 이유

기능적인 요구사항 => 업무로직개발, 비지니스 프로세스

비기능적인 문제 해결

(성능, 보안, 확장성)

Infrastructural support, plumbing, Byte code injection -> transaction 관리 기반구조제공



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

    ​										  	(기본 생성자가 없고 argument만 있을 시에는 필수)

    ​											   - Method Injection

    ( 각 메소드의 아규먼트로 의존하는 객체의 레퍼런스를 주입 받는다 )

  ==> 각 클래스간의 의존관계를 Bean 설정을 바탕으로 컨테이너가 자동으로 연결.

  ==> 개발자는 Bean 설정파일에서 의존관계가 필요하다는 정보를 추가해 주면 됨.

  -Beans : Spring Container가 관리해 주는 객체.

  -Spring Container에 XML설정 (Bean 설정파일 => 의존관계 포함) 	     	

  `Metadata`를 통해 Beans를 관리하고 어플리케이션의 중요부분을 형성함

- Bean Factory / Application Context 

  : DI Container 역할을 담당하는 객체 - Bean 등록, 생성, 조회

  - Bean Factory를 바로 사용하지 않고 이를 확장한 Application Context를 사용함.

    ( getBean()이라는 메서드로 Bean을 조회 )

> Junit

 - 단위(unit) 테스트를 지원하는 Java기반 테스팅 프레임워크

   (단위테스트: 소스코드의 특정 모듈이 의도된 대로 정확히 작동하는지 검증하는 절차)

    - 단위 테스트 케이스 안에 케이스 메서드 선언
   - @Test annotation 선언, public void로 선언

- Annotation - 소스코드에 추가하는 metadata (metadata: 한 data에 대한 설명을 의미).

  - @Test - 테스트를 수행할 메소드

    ​			- 각각의 테스트가 서로 영향을 주지 않고 독립적으로 실행됨

  - @Ignore: 테스트를 실행하지 않게 함
  - @Before: @Test메서드가 실행되기 전 실행
  - @After: @Test메서드가 실행된 후 실행

- Assert.assertSame() - 객체 주소 비교,  Assert.assertEquals() 객체 값 비교.

- Spring에서 지원하는 Annotation

  - @RunWith (SpringJUnit4ClassRunner.class)
    - JUnit 프레임워크의 테스트 실행방법을 확장할 때 사용함.
    - SpringJUnit4ClassRunner라는 클래스를 지정해주면 JUnit이 테스트를 진행하는 중에 Application Context를 만들고 관리하는 작업을 진행.
    - 각각의 테스트 별로 객체가 생성되더라도 싱글톤의 ApplicationContext를 보장.
    
  - @ContextConfiguration
    
    - Bean 설정 파일의 위치를 지정할 때 사용됨.
    
  - @Autowired
    - 변수, setter메서드, 생성자, 일반메서드 앞 의존관계를 자동 설정할 때 사용.
    - 스프링 컨테이너안에 존재하는 Bean을 자동으로 주입.
    - Type에 따라 의존하는 객체를 주입.
    - <property>, <constructor-arg>태그와 동일한 역할을함.
    - Bean설정 파일을 읽기 위해 굳이 GenericXmlApplicationContext를 사용할 필요없음.
    
  - @Resource

    - 의존하는 객제를 자동으로 주입.
    - @Autowired와는 다르게 생성자에는 적용이 안됨.
    - 의존하는 객체를 주입할 때 주로 Name을 이용.

  - @Value

    - 단순한 값을 주입할 때 사용되는 어노테이션.
    - @Value(“Spring”)은 <property .. value=“Spring” /> 와 동일한 역할을 한다.

  - @Component

    - Component-scan 태그 선언에 의해 특정 패키지 안의 클래스들을 스캔하고 @Component가 있는 클래스에 대하여 Bean으로 등록.

    - < Context:component-scan > 태그

      - @Component를 통해 자동으로 Bean을 등록하고, @Autowired로 의존관계를 주입받는 어노테이션을 클래스에서 선언하여 사용했을 경우에는 해당 클래스가 위치한 특정 패키지를 Scan하기 위한 설정을 XML에 해주어야 한다.

        `<context:component-scan base-package=“myspring.di.annot" />`

  - @Qualifier
    - 같은 타입의 Bean이 두 개 이상이 존재하는 경우에 스프링이 어떤 Bean을 주입해야 할지 알 수 없어 컨테이너를 초기화하는 과정에서 예외를 발생시킴
    - @Autowired와 함께 사용하여 정확히 어떤 Bean을 사용할지 지정하여 특정 의존 객체를 주입 할 수 있게 함.

  - @Bean

    - 새로운 빈 객체를 제공할 때 사용되며 적용된 메서드의 이름을 Bean의 식별값으로 사용함.

  - @Configuration

    - 스프링 IoC 컨테이너가 해당 클래스를 Bean 정의의 설정으로 사용한다는 것을 나타냄.

  (@Configuration이 선언된 클래스들은 스프링 IoC 컨테이너가 관리하는 객체의 인스턴스화, 설정, 초기화 로직을 정의하는 @Bean 어노테이션이 붙은 메서드들로 이루어져 있다.)

