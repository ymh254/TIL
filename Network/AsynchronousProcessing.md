# Asynchronous processing

: 비동기적 처리란 Client측에서 Server쪽에 Data를 요청할 때  모든 Resource를 한번에 Loading 하지 않고 일부의 정보를 각각 따로 요청하는 데이터 처리 방식.

- 노드 사이의 작업 처리 단위를 동시에 맞추지 않아도 됨.

  (로직을 순차적으로 처리 할 필요가 없음)

- 결과가 주어지는데 시간이 걸리더라도 일부이기 때문에 다른 작업을 할 수 있음.



### Callback Function

: 어떤 특정함수의 인자로 들어가는 함수로서 해당 함수가 실행을 마친 후에 실행되는 함수.

(JavaScript에서 함수는 객채이므로 함수의 인자와 리턴값으로 함수가 올 수 있음)

=> 비동기 처리의 순서를 보장하기 위해 콜백함수를 사용.

​	 (비동기 처리가 끝나는 시점에서 콜백함수가 실행 됨. 즉, 다른 함수의 실행이 끝난 후 실행 됨)

Ex)

```
function first(callback) {
	setTimeout(function(){
		console.log(1);
		callback();
	}, 500);
}

function second() {
	console.log(2);
}

first(function() {
	second();
});

//결과값
//1
//2
```

=> setTimeout() 함수는 대표적인 내장 비동기 함수로서 두개의 매개 변수를 받는데 첫 번째는 콜백함수 두번째는 수행되기까지의 시간을 받음.

