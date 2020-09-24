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

=> JSP가 실행되면 Java Servlet으로 변환되며 웹 어플리케이션 서버에서 동작되면서 필요한 기능을 수행하고 그렇게 생성된 데이터를 웹페이지와 함께 클라이언트로 응답.



##### < Servlet과 JSP 동작 원리 >

1. 클라이언트가 어떤 동작을 함으로써 .jsp를 요청
2. JSP 컨테이너가 JSP파일을 읽음.
3. JSP 컨테이너가 Generate를 통해 Servlet (.java) 파일 생성.
4. .java 파일은 다시 .class 파일로 컴파일 됨.
5. Execute(실행)을 통해 HTML파일을 생성하여 JSP 컨테이너에게 전달.
6. JSP는 HTTP프로토콜을 통해 HTML 페이지를 클라이언트에게 전달.

