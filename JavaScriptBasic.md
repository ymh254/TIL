# JavaScript

### Object Model

- Window : 전역객체 (모든 객체의 유일한 최상위 객체)

  - DOM ( Document Object Model)
  - BOM (Browser Object Moder)
  - JavaScript

  

> BOM

- Location 객체 : 윈도우 문서(브라우저)의 URL변경 및 문서의 위치 관련 정보를 얻을 수 있다.

- Navigator 객체

  - 각 다른 브라우징이 다르게 동작하는 이슈(cross browsing)를 해결해줌.

    (웹표준이 생기면서 어느정도는 해결됨)

- 창 제어

  - window.open() 이란 메소드로 새로운 창을 load함.

  (이때, javascript안에 작성된 window.open()으로 인해 별다른 액션없이 타의적으로 새창이 열리는 경우 팝업뜨게 됨)

> DOM
>
> : 제어의 대상에 해당되는 객체를 찾는 것이 우선.
>
> => 메소드를 이용

- Methods

  - document.getElementsByTagName()

    - Tag name으로 객체를 찾음.
    - document는 문서 전체를 뜻하는 전역객체이므로 특정 객체안의 객체를 찾고 싶다면 다른 객체를 쓸 수 있음.
    - TagName 대신 ClassName을 쓸 수 있음.

  - document.getElementById()

    - 객체의 Id로 객체를 찾음 (하나의 객체만 찾음).

  - document.querySelector()

    - css 선택자의 문법을 이용해서 객체를 조회함.

    - document.querySelectorAll()로 같은 객체 모두를 조회 가능함.

      (유사 배열로 조회 됨.)

- jQuery (= Library)

  - DOM을 내부에 감추고 보다 쉽게 웹페이지를 조작할 수 있게 해주는 오픈소스.

  - 일반적인 구조 

    ```
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
    jQuery( document ).ready(function( $ ) {
        
    $( 'css 선택자(객체)' ).css( 'color', 'red');
    
    });
    </script>
    ```

  - var 변수 = $( 'css 선택자' ) 의 형태로 정해 줄 수 있다.

    - 즉, 변수.css('color', 'red') 의 형태로 쓰일 수 있다.

    - 이때, 변수는 Jquery 객체가 아닌 DOM객체이다.

      - 변수.css('color') 같은 경우 color에 할당 된 값을 호출.

      - css 스타일 하나 이상 적용가능

        Ex) 변수.css('color', 'red').css('text-decoration', 'underline')

  - .map() : 배열(유사배열)에서 각각의 element들을 순회하며 실행되는 메소드

- HTML Element

  - 객체.constructor.name : 객체의 이름을 조회.

  - HTML안의 각 태그들은 HTML Element의 자식객체라 볼 수 있다.

    (HTMLElement > HTMLHeadElement, HTMLBodyElement, HTMLInputElement)

  - HTMLCollecion: 다수의 객체가 호출 되어질 때의 그 객체들을 포함하는 객체 (유사 배열).