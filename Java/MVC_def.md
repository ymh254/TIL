# Spring MVC

(Model-View-Controller)

: 소프트웨어 공학에서 사용되는 아키텍쳐 패턴으로 주 목적은 Business logic과 Presentation logic을 분리하기 위함.

- MVC 패턴을 사용하면, 사용자 인터페이스로 부터 비지니스 로직을 분리하여 애플리케이션의 시각적 요소나 그 이면에서 실행되는 비지니스 로직을 쉽게 고칠 수 있는 애플리케이션을 만들 수 있음.

  - Model
    -  애플리케이션의 정보 (data, Business Logic포함)
      - 사용자가 입력한 데이터나 사용자에게 출력할 데이터를 다룸
      - 여러 개의 데이터 변경 작업을 하나의 작업으로 묶음
      - DAO 클라스, Service 클라스에 해당
  - View
    - 사용자에게 제공할 화면 (Presentation Logic)
      - 모델이 처리한 데이터나 그 작업 결과를 가지고 사용자에게 출력할 화면을 만듬
      - HTML, CSS, Java Script를 사용하여 웹 브라우저가 출력할 UI 생성 => 생성된 화면은 웹브라우저가 출력
  - Controller
    - Model과 View 사이의 상호 작용을 관리
      - 클라이언트의 요청을 받았을 때 그 요청에 대해 실제 업무를 수행하는 모델 컴포넌트를 호출
      - 호출한  컴포넌트를 화면에 생성하도록 뷰에게 전달
      - Servlet과 JSP사용하여 작성 가능.

  