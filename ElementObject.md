# Element 객체

: HTMLElement의 부모객체

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

##### Property vs Attribute

: Element의 속성을 제어할 때 Property 방식과 Attribute 방식을 사용할 수 있다.

```
<p id="target"> Hello </p>
<script>
	var target = document.getElementById('target');
	//Attribute 방식
	target.setAttribute('class', 'important');
	//Property 방식
	target.className = 'important';
</script>
```

> jQuery 속성 제어 API

- DOM과 마찬가지로 jQuery도 속성과 프로퍼티를 구분한다.

```
메서드 형태 - attr();  //속성

			   - prop();  //프로퍼티
```

- JQuery 조회 범위 제한

```
<ul>
	<li class="marked">html</li>
	<li>css</li>
	<li id="active">JavaScript
		<ul>
			<li>JavaScript Core</li>
			<li class="marked">DOM</li>			<=
			<li class="marked">BOM</li>			<=
		</ul>
	</li>
</ul>
<script src="//code.jquery.com/jquery-1.11.0.min.js"><script>
<script>
//아래의 코드들은 모두 같은 Element를 가르킴 (<=)
	$("#.marked", "#active").css("background-color", "red")
	$("#active .marked").css("background-color", "red")
	$("#active").find('marked').css("background-color", "red")
</script>
```

