## Spring

> Overall cycle

1. query문만 XML파일안에 다 작성 후 SQL로 불러옴

2. MyBatis로 XML에 작성한것들을 최적화시킴.



- Spring Restful Web Service ---> Json



### Web Server   vs   Web Container

`Web Server ` 

- HTTP프로토콜을 기반으로 하여 클라이언트의 요청을 받아 정적인 컨텐츠를 제공 (WAS를 거치지 않음).

  - static web (apache, nginx) => html, css, javascript

- 동적인 컨텐츠 제공을 위한 요청 전달

  => web container로 보냄.

`Web Container`

- dynamic web(servlet, jsp) / web application

- DB와 연동

  => web server에게 요청 받은 동적인 컨텐츠를 처리해서 정적인 페이지로 생성해주는 모듈 (JSP, Servlet을 실행 시킬 수 있는 소프트웨어).



### WAS

(Web Application Server) 

=Wev server + Web Container (+ EJB Container (j2ee api))

​	=> JSP, Servlet 구동 환경 제공

- 사용자의요청에 따라 서버에서 프로그램을 실행 및 처리한 뒤 그것을 다시 정적인 페이지로 변환해 반환하는 등의 동적인 처리를 한다.

  :tomcat, jeus, jboss, webSphereIBM, webLogicBEA(oracle), TMAX

- Web Server 기능들을 구조적으로 분리하여 처리하고자하는 목적으로 제시됨
  - 분산 transaction, security, messaging, thread 등의 처리 기능을 처리하는 분산 환경에서 사용됨.
  - 주로 DB서버와 같이 수행됨.