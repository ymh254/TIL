# Event

: 사건이 일어남을 의미. 즉, 사용자가 클릭/스크롤/필드내용을 바꿨을 때 발생하는 것을 의미.

> Event target

이벤트가 일어날 객체를 의미.

> Event type

이벤트의 종류를 의미. (ex) onclick, onchange 등)

> Event handler

이벤트가 발생했을 때 동작하는 코드를 의미.

Ex)

```
<input type="button" onclick="alert(window.location)" value="alert(window.href)"/>
```

( => Inline 방식의 코드 )

-위에서 Event target은 button, type은 onclick, hanler는 alert(window.location)이다.



### Inline

: 이벤트를 등록하는 방식으로, 이벤트를 이벤트 대상의 태그 속성으로 지정하는 것.

- 같은 태그 속성안에서 그 객체를 this로 지정 할 수 있다.



### Property Listener

: 이벤트 대상에 해당하는 객체의 프로퍼티로 이벤트를 등록하는 방식.

=> Inline 방식과 다르게 < script >라는 태그 안에 특정 객체의 property를  써서 이벤트를 등록함.

Ex)

```
<body>
	<input type="button" id="target" value='button'/>
<script>
	var t = documnet.getElementById('target');
	t.onclick = function(event) {
		alert('Hello world,' + event.target.value)
	}
</script>
</body>
```

=> 객체 t의 property인 onclick 호출.



### addEventListener()

: 가장 권장되는 방식. 

- 여러개의 이벤트 핸들러를 등록할 수 있다 (property listener랑 다른점).

- ie8이하에서는 호환되지 않음.

  => attactEvent 메소드를 사용.

  ​	=> event type에 click 대신 onclick을 써줌.

Ex)

```
<body>
	<input type="button" id="target" value='button'/>
<script>
	var t = documnet.getElementById('target');
	t.addEventListner('click', function(event){
		alert('Hello world,' + event.target.value)
	});
</script>
</body>
```

=> 첫 번째 인자로 event type을 받고 해당 객체의 event가 발생했을 때, 	두 번째 인자로 전달되는 event listener가 호출됨.



### Event 전파

> Bubbling

한 element에 event가 발생하면 해당 element에 할당된 handler가 동작하고, 이어서 부모 element의 handler가 동작함 (최상위 element를 만날때 까지 각각에 할당된 handler가 동작함).

Ex)

```
<style>
  body * {
    margin: 10px;
    border: 1px solid blue;
  }
</style>

<form onclick="alert('form')">FORM
  <div onclick="alert('div')">DIV
    <p onclick="alert('p')">P</p>
  </div>
</form>
```

=> < p > element를 클릭하면 p, div, form 순서로 실행됨.

- 최초 event가 발생한 element를 target element라 함.

  (event.target을 사용해 접근가능.)

  - event.target은 실제 event가 시작된 target element이므로 변하지 않음.
  - this (=event.currentTarget)는 현재 실행하는 handler가 할당된 element를 참조.

- event객체의 메서드인 event.stopPropgation()을 사용해 버블링 중단가능 (상위 element에서 event가 어떤 경우든 사용될 수 있으므로 권장되지 않음).

  

> Capturing

: Bubbling과 반대로 event가 상위 element에서 하위 element로 전파되는 단계.

```
<style>
  body * {
    margin: 10px;
    border: 1px solid blue;
  }
</style>

<form>FORM
  <div>DIV
    <p>P</p>
  </div>
</form>

<script>
  for(let elem of document.querySelectorAll('*')) {
    elem.addEventListener("click", e => alert(`캡쳐링: ${elem.tagName}`), true);
    //addEventListener에서 마지막에 true로 capture option 설정해줘야 Capturing 단계가 적용됨.
    //Default값은 false로서 이는 bubbling 단계를 적용함.
    elem.addEventListener("click", e => alert(`버블링: ${elem.tagName}`));
  }
</script>
```

=> HTML, BODY, FORM, DIV,							//Capturing 단계, 첫 번째 Listener

​	 P, P,																 //target 단계, Listener가 Capturing, Bubbling순으로 설정되 두 번 호출

 	DIV, FORM, BODY, HTML 순으로 호출됨.	 //Bubbling 단계, 두 번째 Listener



> Event 기본 동작 취소

: Event를 호출하는 속성을 실행 시켰을 때 Event동작을 취소하는 방법.

```
<body>
	<p>
		<label> prevent event on</lable><input id="prevent" type="checkbox" name="eventprevent" value="on"/>
	</p>
	<p>
		<a href="http://www.github.com" onclick="if(document.getElementById('prevent').checked return false;")>Github</a>
	</p>
</body>
```

또는

```
<script>
	document.querySelector('a').onclick = function(event){
		if(document.getElementById('prevent').checked)
			return false;
	};
</script>
```

또는

```
<script>
	document.querySelector('a').addEventListener(click, function(event){
		if(document.getElementById('prevent').checked)
			event.preventDefault();
	};
</script>
```

(Ie9 이하 버전에서는 event.preventDefault 대신 event.returnValue를 false로 지정해야함.)



### 문서 로딩

: HTML 문서로딩은 위에서 부터 아래로 순차적으로 진행이 된다. 따라서, 우선 순위에 맞춰 코드를 작성을 해야한다.

1. Script를 Body의 맨 아래에 작성한다.

2. Widow 객체의 onload event를 사용.

   (browser에서 모든 resource들이 완전히 로딩이 됐을 onload객체 호출)

   Ex)

   ```
   <head>
     <script>
     window.onload = function(){
       var t = document.getElementById('target');
       console.log(t);
     }
     </script>
   </head>
   <body>
   	<p id="target">Hello</p>
   </body>
   ```

3. addEventListener 사용

   ```
   <head>
     <script>
     window.addEventListener('load', function(){
       var t = document.getElementById('target');
       console.log(t);
     }
     </script>
   </head>
   <body>
   	<p id="target">Hello</p>
   </body>
   ```

   인자로 'load' 대신 'DOMContentLoaded'를 주면 resource들의 로딩이 끝나지않아도 HTML의 태그들만 randering이 끝난 후 event 발생

   (ie9 이상에서만 지원).



### jQuery 이벤트

<JavaScript 코드>

```
<body>
	<input type="button" id="target" value='pure'/>
<script>
	var t = documnet.getElementById('target');
	t.addEventListner('click', function(event){
		alert('pure');
	});
</script>
</body>
```

<jQuery 코드>

```
<body>
	<input type="button" id="target" value='jquery'/>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$('#target').on('click', function(event){
		alert('jquery')
	})
</script>
</body>
```



> on API

: jQuery가 제공하는 event를 다루는 API

- 형태 : .on( events [, selector] [, data], handler(eventObject) )
  - event : 등록하고자 하는 event type을 지정 (Ex) "click")
  - selector : event가 설치된 element의 하위 element를 event target으로 필터링함 (생략 가능).
  - data : event가 실행될 때 handler로 전달될 data를 설정 (생략 가능).
  - handler : event handler 함수.

Ex)

```
<input type="text" id="target"></textarea>
<input id="remove"  type="button" value="remove" />
<p id="status"></p>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
  var handler = function(e){
    $('#status').text(e.type+Math.random());
  };
  $('#target').on('focus blur', handler)
  
  $('#remove').on('click' , function(e){
    $('#target').off('focus', handler);
  })
</script>
```

( .on 대신 .off를 사용하면 이벤트를 제거할 수 있음 )



