# MyBatis

: 자바 오브젝트와 SQL문 사이의 자동 Mapping 기능을 지원하ORM(Object Relational Mapping)프레임워크

- SQL에 변경이 있을 때마다 자바 코드를 수정하거나 컴파일 하지 않아도 됨.

> Component

- MyBatis 설정파일 (SqlMapConfig.xml)
  - 데이터베이스의 접속 주소 정보나 Mapping 파일의 경로 등의 고정된 환경정보를 설정함.
  - VO 객체의 정보를 설정.

- SqlSessionFactoryBean

  - MyBatis 설정파일을 바탕으로 SqlSessionFactory를 생성.
  - Spring Bean으로 등록해야 함

- SqlSessionFactory

  ​	: SqlSession을 생성.

- SqlSession

  - 핵심적인 역할을 하는 클래스로서 SQL 실행이나 트랜잭션 관리를 실행.
  - SqlSession 오브젝트는 Thread-Safe 하지 않으므로 thread마다 필요에 따라 생성.

- SqlSessionTemplate

  - 핵심적인 역할을 하는 클래스로서 SQL 실행이나 트랜잭션 관리를 실행.
  - SqlSession 인터페이스를 구현하며, Thread-safe함.
  - Spring Bean으로 등록해야 함

- mapping 파일 (user.xml)

  : SQL문과 ORM을 설정한다.

- Spring Bean 설정 파일 (bean.xml)
  - SqlSessionFactoryBean을 Bean 등록할 때 DataSource 정보와 MyBatis Config 파일정보, Mapping 파일의 정보를 함께 설정.
  - SqlSesseionTemplate을 Bean으로 등록.

> Mapper 인터페이스
>
> : Mapping 파일에 기재된 SQL을 호출하기 위한 인터페이스