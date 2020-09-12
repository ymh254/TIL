# Node 객체

: DOM객체의 최상위 객체.

- DOM은 website html을 보여주는 DOM tree구조를 가지고 있고 그 안에서 각각의 Element들을 Node라 함.

- Element는 서로 부모, 자식 혹은 형제자매 관계로 연결되어있음.

  - 관계를 나타내는 API

  `Node.childNodes`, `Node.firstChild`, `Node.lastChild`, `Node.nextSibling`, `Node.previousSibling`, `Node.Contains`, `Node.hasChildNodes`

  - 노드의 종류

  `Node.nodeType`, `Node,nodeName`

  - 노드의 값

  `Node.nodeValue`, `Node.textContent`

  - 자식관리

  `Node.appendChild`, `Node.removeChild`

