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