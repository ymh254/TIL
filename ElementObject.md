# Element 객체

- HTMLElement의 부모객체

- MarkUp 언어의 일반적인 규격에 대한 속성을 정의하고 있고 그 언어들에 대한 객체들을 사용.

- DOM은 MarkUp 언어를 제어하기 위한 규격.

- MarkUp 언어는 <></>과 같은 형식을 갖는다

  (HTML, XML, SVG, XUL...)

> 식별자 API
>
> : 문서내에서 특정한 엘리먼트를 식별하기 위한 용도로 사용.
>
> (식별자: ID, Class)

- Element.classList

  : DOMTokenList를 갖고 있는 객체.

   - DOMTokenList는 유사배열을 나타내고 몇 몇 속성을 갖는다. (Length, item, contains, add, remove...)

     Ex) class이름.classList.length와 같이 사용됨.

- Element.className

- Element.id

- Element.tagName

> 조회 API
>
> : 엘리먼트의 하위 엘리먼트를 조회.

- Element.getElementsByClassName
- Element.getElementsByTagName
- Element.querySelector
- Element.querySelectorAll

> 속성 API
>
> : 엘리먼트의 속성을 알아내고 변경.

- Element.getAttribute(name);
- Element.setAttribute(name, value);
- Element.hasAttribute(name);
- Element.removeAttribute(name);