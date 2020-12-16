# 20.12.16 1. 자바스크립트 기본

## 🔮 이건 꼭 기억해야해!

- 세미콜론(;) 쓰기를 습관화하기

  => 대부분은 자동으로 삽입이 되지만 그렇지 않는 상황도 존재

  ```
  //ex
  alert("error occured!")
  [1, 2].forEach(alert)
  
  //위와 같은 경우 대괄호 앞의 경우 세미콜론이 있다고 가정하지 않음
  ```



- 지시자 "use strict"를 사용해야만 ES5모드 전까지의 변경사항이 활성화 됨

  (스크립트 또는 함수 최상단에 문자 그대로를 작성)



## 🧐면접관처럼 질문할 목록

> 자바스크립트 엔진

##### 코드네임

- V8 - Chrome과 Opera에서 쓰임
- SpiderMonkey - Firefox에서 쓰임
- IE는 버전에 따라 'Trident'나 'Chakra' 엔진 사용
  - 'ChakraCore'는 Microsoft Edge에서 사용
  - 'SquirrelFish'는 Safari에서 사용

##### 엔진 동작 방식

1. 엔진이 스크립트를 읽는다 (Parsing)
2. 읽어 들인 스크립트를 기계어로 전환 (Compile)
3. 기계어로 저노한된 코드 실행



## 👻 공부하면서 어렵거나 중요한 개념 정리

- 없음