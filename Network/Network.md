# Network 통신

##### Ajax (Asynchronous JavaScript and XML)

: JavaScript를 이용해서 비동기적으로 서버와 브라우저가 데이터(XML, JSON)를 주고받는 방식.

=> 브라우저가 가지고 있는 XMLHttpRequest 객체를 이용해서 전체 페이지를 새로 고치지 않고도 페이지의 일부만을 위한 데이터 로드 기법

>  XMLHttpRequest

Ex)

< time.php (참고용) >

```
<?php
$d1 = new DateTime;
$d1->setTimezone(new DateTimezone("asia/seoul"));
echo $d1->format('H:i:s');
?>
```

< demo.html >

```
<p>time : <span id="time"></span></p>
<input type="button" id="execute" value="execute" />
<script>
document.querySelector('input').addEventListener('click', function(event){
    var xhr = new XMLHttpRequest();
//XMLHttpRequest 객체 생성
    xhr.open('GET', './time.php');
//첫 번째 인자 = form 태그의 method에 대응 (GET/POST)
//두 번째 인자 = 접속하고자 하는 서버쪽 리소스의 주소 (form태그의 action에 해당) 
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4 && xhr.status === 200){
            document.querySelector('#time').innerHTML = xhr.responseText;
        }
    }
    xhr.send();
//open()을 호출한 뒤에 send()호출.
}); 
</script> 
```

- onreadystatechange 이벤트는 서버와의 통신이 끝났을 때 호출됨.

  (Callback 함수를 포함)

- readyState는 통신의 현재 상태를 알려줌.

  - 4 : 통신이 완료되었음을 의미
  - 200 : 통신이 성공했음을 의미

- responseText 프로퍼티는 서버에서 전송한 데이터를 담고 있음.
- 진행과정
  1. XMLHttpRequest Object를 만든다.
     - request를 보낼 준비를 브라우저에게 시키는 과정
     - 이것을 위해서 필요한 method를 갖춘 object가 필요함
  2. callback 함수를 만든다.
     - 서버에서 response가 왔을 때 실행시키는 함수
     - HTML 페이지를 업데이트 함
  3. Open a request
     - 서버에서 response가 왔을 때 실행시키는 함수
     - HTML 페이지를 업데이트 함
  4. send the request
     - 전송할 데이터를 전달

> jQuery - Ajax

: jQuery를 이용해서 Ajax를 이용하게 되면 cross browsing문제를 해결하는 뿐아니라 보다 가편해지는 장점을 갖음

- $.ajax API

  : jQuery가 Ajax와 관련해서 제공하는 API중 하나로 제일 많이 쓰임.

  - 문법 : jQuery.ajax ( [ settings ] )
    - data
      :서버로 데이터를 전송할 때 이 옵션을 사용.
    - dataType
      : 서버측에서 전송한 데이터를 어떤 형식의 데이터로 해석할 것인가를 지정. (값으로 올 수 있는 것은 xml, json, script, html이지만 지정을 하지않는다면 jQuery가 스스로 판단함)
    - success
      : 성공했을 때 호출할 콜백을 지정
      => Function( PlainObject data, String textStatus, jqXHR jqXHR )
    - type
      : 데이터를 전송하는 방법을 지정 (get, post).

Ex)

<time.php(참고용)>

```
<?php
$d1 = new DateTime;
$d1->setTimezone(new DateTimezone($_POST['timezone']));
echo $d1->format($_POST['format']);
?>
```

<demo.html>

```
<p>time : <span id="time"></span></p>
<form>
    <select name="timezone">
        <option value="Asia/Seoul">asia/seoul</option>
        <option value="America/New_York">America/New_York</option>
    </select>
    <select name="format">
        <option value="Y-m-d H:i:s">Y-m-d H:i:s</option>
        <option value="Y-m-d">Y-m-d</option>
    </select>
</form>
<input type="button" id="execute" value="execute" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $('#execute').click(function(){
        $.ajax({
            url:'./time2.php',
            
            type:'post',
            
            data:$('form').serialize(),
            //form 태그의 정보를 "값의이름=값의내용&값"의 형식으로 바꿔줌.
            
            success:function(data){
                $('#time').text(data);
            }
        })
    })
</script>
```



##### JSON (JavaScrip Object Notation)

: JavaScript에서 객체를 만들 때 사용하는 표현으로 데이터 저장 및 전송으로 많이 사용.

- JSON.parse()

  : 인자로 전달된 문자열을 JavaScript Data로 변환.

- JSON.stringify()

  : 인자로 전달된 JavaScript Data를 문자열로 변환.

Ex)

< fruit.php(참고용) >

```
<?php
$fruit = ["apple", "banana"];
echo implode(',', $fruit);

//JSON으로 변환
//echo json_encode($fruit);
//(json_decode란 method를 쓰면 이전 Typed으로 변환함)
?>
```

<demo.html>

```
<p id="fruit"></p>
<input type="button" id="execute" value="execute" />
<script>
document.querySelector('input').addEventListener('click', function(event){
    var xhr = new XMLHttpRequest();
    xhr.open('GET', './fruit.php');
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4 && xhr.status === 200){
            var _fr = xhr.responseText;
            
            var fr = fr.split(',');
            //JSON타입의 Data를 그대로 받음.
            //var fr = JSON.parse(_fr);
            
            var _str = '';
            for(var i = 0; i< fr.length; i++){
                _str += '<li>'+fr[i]+'</li>';
            }
            _str = '<ul>'+_str+'</ul>';
            document.querySelector('#fruit').innerHTML = _str;
        }
    }
    xhr.send(); 
}); 
</script>
```

<$.ajax 사용>

```
<p id="fruit"></p>
<input type="button" id="execute" value="execute" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $('#execute').click(function(){
        $.ajax({
            url:'./fruit.php',
            dataType:'json',
            success:function(data){
                var str = '';
                for(var name in data){
                    str += '<li>'+data[name]+'</li>';
                }
                $('#fruit').html('<ul>'+str+'</ul>');
            }
        })
    })
</script>
```



