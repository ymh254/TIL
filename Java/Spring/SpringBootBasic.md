# Spring Boot

: JAVA Framework의 프로젝트로 Spring의 여러 기술들을 사용자에게 보다 사용하기 쉽게 제공해줌.

> Spring Boot 프로젝트 구조

| src/main/java                                 | Java Source files                                |
| --------------------------------------------- | ------------------------------------------------ |
| **src/main/resources/application.properties** | **Spring Boot properties 값들을 모아 놓은 파일** |
| **src/main/resources/static**                 | **html, css 같은 정적 파일들**                   |
| **src/main/resources/templates**              | **jsp, thymeleaf 같은 동적 파일들**              |
| **src/test/java**                             | **Java Test Files**                              |

- @SpringBootApplication 클래스의 적정 위치는 디폴트 패키지에 위치해야 함

  ==> @SpringBootApplication 어노테이션의 내부에서 선언된 @ComponentScan 어노테이션은 해당 클래스 기준으로 현 위치와 그 아래 위치까 지 스프링 Bean을 나타내는 어노테이션이 선언된 클래스를 찾기 때문.

- SpringBoot parent가 기본적으로 들어오는데 이것은 스프링부트에서 제공하는 다양한 의존성을 묶어놓은 것을 상속받고 있기 때문에 모든 의존성이 한번에 버전과 함께 들어옴.

> 자동 설정

- @SpringBootApplication 

  = @SpringBootConfiguration + @ComponentScan + @EnableAutoConfigurtaion

- @SpringBootApplication 설정은 Bean을 두단계로 나눠 등록

  1. @ComponentScan :  project 생성시 정해준 default package부터 scanning함.
  2. @EnableAutoConfiguration
     - @ComponentScan 이후에 spring-boot-autoconfigure-2.X.X.RELEASE.jar 파일에 포함되어 있는 bean들을 등록/설정 함.
     - spring.factories내에 선언된 @Configuration 설정 클래스들을 모두 Load함.

> Spring Application

- Event Listener

  : Spring Boot를 실행할 시 구동되는 단계마다 발생하는 여러 이벤트들을 나타내는 객체를 인자로 받아 각 단계마다 원하는 처리가 가능.

  => ApplicationListener<Type>을 implements해서 Event Listener 생성.

  - ApplicationStartingEvent는 스프링 컨테이너(Application)가 생성되기 전에 생성되는 이벤트이기 때문에 해당 SpringApplication 객체에 리스너 추가 필요.

    ```
    public class Application {
    	public static void main(String[] args) {
    		SpringApplication application = new SpringApplication(Application.class);
    		application.addListeners(new SampleListener());
    		//웹어플리케이션 타입 지정 (NONE대신 웹어플리케이션 타입 SEVLET, REACTIVE이 들어갈 수 있다).
    		application.setWebApplicationType(WebApplicationType.NONE);
    		application.run(args);
    	} 
    }
    ```

  - ApplicationStartedEvent는 스프링 컨테이너가 만들어진 이후이기 때문에 Bean으로만 등록해주면 리스너 동작가능.

    ```
    public class Application {
    	public static void main(String[] args) {
    		SpringApplication application = new SpringApplication(Application.class);
    		application.run(args);
    	} 
    }
    ```

- ApplicationRunner 

  - 커맨드 아규먼트 처리
  - SpringApplication 실행된 후에 arguments 값을 받거나, 무엇인가를 실행하고 싶을 때 ApplicationRunner 인터페이스를 구현.
  - @Order()로 순서지정 가능.

- 외부설정

  - 외부 설정을 통해 스프링 부트 어플리케이션의 환경설정 혹은 설정값을 지정 (properties, YAML, 환경변수, 커맨드라인 등).
  - properties의 값은 @Value() 어노테이션(외부설정)을 통해 읽어옴.

  - @ConfigurationProperties 통해 외부 설정값 주입 (의존성 필요!).

    : 해당 프로퍼티 파일의 값을 받은 클래스를 생성하여 @Autowired 등을 토해 자동 주입

    => 여러 프로퍼티 읽기가능 / Bean을 통해 다른 Bean에 주입가능 /application.properties에 같은 key값을 가진 property가 많은 경우 프로퍼티 클라스 작성 가능

- 스프링 부트 프로파일

  - 프로파일(Profile)을 통해 스프링 부트 애플리케이션의 런타임 환경을 관리.

    => Application 작동 시 Test 환경에서 실행할지, Production 환경에서 실행할 지를 프로파일을 통해 관리.

  - Test와 Production 환경을 각각 외부 설정 파일을 통해 관리

    (Spring.profiles.active 키값을 통해 활성화할 파일 지정)

  => @Profile() 통해 기능 구현

  ​	: 인자(Test or Prod)로 들어가는 값이 프로퍼티의 인자값과 일치 시 명시한 스프링 Bean을 등록.

- Logging

  - SLF4j (simple logging façade, Commons Logging)	<= Logback 의존성 제거
    - Logger API를 추상해 놓은 로깅 퍼사드 인터페이스들
    - 로깅 퍼사드를 통해서 Logger를 사용했을 때 로깅 구현체들을 교체하기 쉽도록 해주는 장점을 가짐.
  - JUL (java.util.logging, Log4j2, Logback)
    - 로깅 퍼사드 구현체들
  - 스프링 부트 로깅
    - 로그 레벨
      - ERROR
      - WARN
      - INFO : 상위 로그 레벨의 메세지가 모두 출력됨.
      - debug : 일부 핵심 라이브러리만 디버깅 모드로 로깅
      - Trace : 전부 다 디버깅 모드로 로깅
    - 파일 출력: logging.file (파일설정) 또는 logging.path(디렉토리설정) 
    - 로그 레벨 조정: logging.level.패키지명 = 로그 레벨
  - 스프링부트 기본 로거 설정
    - properties에 설정
    - 파일 출력: logging.path를 지정하면 logs/spring.log 파일이 생성
    -  로그 레벨 조정: logging.level.패키지명 = 로그 레벨

```
#src/main/resources/application-test.properties

 logging.path=logs 
 logging.level.com.spring.boot=debug
```

```
#src/main/java/com/vega2k/boot/runner/MyRunner.java

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class MyRunner implements ApplicationRunner {
	@Autowired
	SpringProperties springProperties;
	private Logger logger = LoggerFactory.getLogger(MyRunner.class)
	
	public void run(ApplicationArguments args) throws Exception { 
		logger.debug("------------------------");
		logger.debug(springProperties.getName());
	} 
}
```



