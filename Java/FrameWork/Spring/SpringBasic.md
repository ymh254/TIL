## Spring

> Overall cycle

1. query문만 XML파일안에 다 작성 후 SQL로 불러옴

2. MyBatis로 XML에 작성한것들을 최적화시킴.



- Spring Restful Web Service ---> Json



### Web server   vs   web container

`web server `  :  static web (apache, nginx) => html, css, javascript

`web container`   -dynamic web(servlet. jsp) / web app

​							   -DB와 연동



### WAS

(Web Application Server) 

= Web Container + EJB Container (j2ee api)

= 사용자의요청에 따라 서버에서 프로그램을 실행 및 처리한 뒤 그것을 다시 정적인 페이지로 변환해 반환하는 등의 동적인 처리를 한다.

:tomcat, jeus, jboss, webSphereIBM, webLogicBEA(oracle), TMAX
