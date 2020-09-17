## Servlet

: 웹프로그래밍에서 클라이언트의 요청을 처리하고 그 결과를 다시 클라이어느에게 전송하는 Servlet클래스의 구현규칙을 지킨 자바 프로그래밍 기술.

> 특징

- 클라이언트의 요청에 대해 동적으로 작동하는 웹 어플리케이션 컴포넌트
- html을 사용하여 요청에 응답
- Java Thread를 이용하여 동작
- MVC 패턴에서 Controller로 이용됨.
- HTTP 프로토콜 서비스를 지원하는 javax.servlet.http.HttpServlet 클래스를 상속받음 ( => UDP보다 속도가 느리다. )
- 단점 : HTML 변경 시 Servlet을 재컴파일해야 함.



## JSP (Java Server Page)

: html 소스 코드 속에Java 코드가 들어가는 구조를 갖는 웹어플리케이션 프로그래밍 기술 (Servlet과 반대).