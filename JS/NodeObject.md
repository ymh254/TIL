# Node 객체

: DOM객체의 최상위 객체.

- DOM은 website html을 보여주는 DOM tree구조를 가지고 있고 그 안에서 각각의 Element들을 Node라 함.

- Element는 서로 부모, 자식 혹은 형제자매 관계로 연결되어있음.

  => 하나의 Element를 기준으로 하위 Element를 자식 Element라하고 상위 객체를 부모 Element, 같은 선상에 있는 Element를 Sibling Element라고 한다.

  - 관계를 나타내는 API

  `Node.childNodes`, `Node.firstChild`, `Node.lastChild`, `Node.nextSibling`, `Node.previousSibling`, `Node.Contains`, `Node.hasChildNodes`

  - 노드의 종류

  `Node.nodeType`, `Node,nodeName`

  - 노드의 값

  `Node.nodeValue`, `Node.textContent`

  - 자식관리

  `Node.appendChild`, `Node.removeChild`, `Node.insertBefore`, `Node.replaceChild`

  (Node.appendChild를 사용해서 Element를 추가할 때 그 안에 들어갈 Text Node는

  `document.createTextNode()`를 통해 추가한다.)

Ex) 

```
function traverse(target, callback) {
	if(taget.nodeType === node.ELEMNET_NODE){
		if(target.nodeName === 'A')							//A = anchor tag를 뜻함.
			callback(target);        
		var c = target.childNodes;
		for(var i=0; i<c.length; i++){
			traverse(c[i], callback)
		}
	}
}
traverse(document.getElementById('start'), function(elem){
	console.log(elem);
})

//target이란 객체안에 있는 a 태그만이 출력됨.

//traverse 함수는 재귀함수(자신을 다시 호출하여 작업을 수행하는 함수)이고 인자값으로 callback이란 함수를 호출했다. 이때 인자로 전달되 다른함수의 값으로 쓰여지는 함수를 callback함수라 한다.
```



> jQuery 노드 변경 API

- 추가

```
<div class="target"> context </div>

$('.target').before('<div>context</div>');	//기존에 있는 <div>전에 생성
$('.target').after('<div>context</div>');		//기존에 있는 <div>후에 생성
$('.target').prepend('<div>context</div>');	//<div>와 context사이에 생성
$('.target').append('<div>context</div>');	//context와 </div>사이에 생성

//이미 있는 Element를 대상으로 실행을 하면 해당 Element가 이동함.

//var target
//target.insertAdjacentHTML('beforebegin', <div>context</div>);
//target.insertAdjacentHTML('afterbegin', <div>context</div>);
//target.insertAdjacentHTML('beforeend', <div>context</div>);
//target.insertAdjacentHTML('afterend', <div>context</div>); 와 일치.
```

- 제거

-`$().remove()` : 선택된 Element를 제거.

-`$().empty()` : 선택된 Element의 text node 제거.

- 변경

-`$(1).replaceWith(2)` : 제어 대상을 먼저 지정해줌.   // 1 -> 2

-$`(2).replaceAll(1)` : 제어 대상을 인자로 전달.   // 2 -> 1

(변경해줄 대상뒤에 `.clone()`을 붙히면 대상 Element는 그대로 있고 복사된 값으로 변경이 됨.)



> 문자열로 Node 제어
>
> ```
> <ul id="target">
> 	<li>HTML</li>
> </ul>
> var target = documnet.getElementById('target');
> target.innerHTML = <li>CSS</li>;
> 
> //실행시키면 <li>HTML</li>가 <li>CSS</li>로 대체됨.
> //innerHTML 대신 outerHTML로 변경을 해주면 호출한 객체를 포함해서 값이 바뀜. 즉, <ul></ul>태그를 포함한 값이 대체됨.
> ```
>
> 