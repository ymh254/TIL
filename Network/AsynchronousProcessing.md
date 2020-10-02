# Asynchronous processing

: 비동기적 처리란 Client측에서 Server쪽에 Data를 요청할 때  모든 Resource를 한번에 Loading 하지 않고 일부의 정보를 각각 따로 요청하는 데이터 처리 방식.

- 노드 사이의 작업 처리 단위를 동시에 맞추지 않아도 됨.

  (로직을 순차적으로 처리 할 필요가 없음)

- 결과가 주어지는데 시간이 걸리더라도 일부이기 때문에 다른 작업을 할 수 있음.



### Callback Function

: 어떤 특정함수의 인자로 들어가는 함수로서 해당 함수가 실행을 마친 후에 실행되는 함수.

(JavaScript에서 함수는 객채이므로 함수의 인자와 리턴값으로 함수가 올 수 있음)

=> 비동기 처리의 순서를 보장하기 위해 콜백함수를 사용.

​	 (비동기 처리가 끝나는 시점에서 콜백함수가 실행 됨. 즉, 다른 함수의 실행이 끝난 후 콜백함수가 실행 됨)

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

=> setTimeout() 함수는 대표적인 내장 비동기 함수로서 두개의 매개 변수를 받는데 첫 번째는 콜백함수, 두번째는 해당 함수가 수행되기까지의 시간을 받음.



### Promise

: Callback 함수를 중첩해서 연쇄적으로 호출하면 코드가 복잡해지고 가독성이 떨어지는 콜백 지옥이라 불리는 이 문제를 해결하기 위한 방법.

=> 현재에는 당장 얻을 수 없지만 가까운 미래에는 얻을 수 있는 어떠한 데이터에 접근할 수 있음.

- new 키워드와 생성자를 통해 Promise객체를 생성하여 함수를 인자로 받고 그 함수의 인자로 `resolve`와 `reject`라는 함수형 매개변수를 갖음.

  ```
  const promise1 = new Promise(function(resolve, reject) { ... } );
  promise1.then()		//이행 => 프라미스 값이 반환되어
  				.then()		//			.then(handler)을 이용해 chaining이 가능.
  				.then()		//이 후 .then()을 이용한 작업이 끝나면 chaining도 끝남.
  ```

- 리턴값으로 바로 사용 가능

  ```
  function returnPromise() {
    return new Promise((resolve, reject) => { ... 	} );
  }
  ```

- async/await를 이용

- REST API의 함수인 `fetch()`함수를 호출해서 리턴받은 Promise객체를 사용하는 경우가 많음.

  (NodeJS 런타임에서는 `node-fetch` 모듈을 설치해야 사용 가능)

  - `fetch()`함수는 API의 URL을 인자로 받고, 미래 시점에 얻게될 API호출결과를 Promise 객체로 리턴함

    (Network latency 때문에 결과값을 바로 얻지 못하는 상황이므로 Promise를 사용하는 목적과 부합함)

  - Promise 객체의 `then()`메소드는 결과값을 갖고 수행할 로직을 담은 콜백 함수를 인자로 받음.

  - `catch()`메서드는 예외처리 로직을 담은 콜백함수를 인자로 받음.

  ```
  fetch("https://jsonplaceholder.typicode.com/posts/1")
    .then((response) => console.log("response:", response))
    .catch((error) => console.log("error:", error))
  ```

  