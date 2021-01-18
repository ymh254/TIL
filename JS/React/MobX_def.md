# MobX

: 리액트 상태 관리 라이브러리

#### 주요개념

> Observable State

앱에서 사용하고 있는 상태는 변할 수 있으며, 특정부분이 바뀐다면 MobX에서는 정확히 어떤 부분이 바뀌었는지 알 수 있음

> Computed Value

연산된 값은 기존의 상태값과 다른 연산된 값에 기반하여 만들어질 수 있는 값으로 어떤 값을 연산해야 할 때, 연산에 기반되는 값이 바뀔 때만 새로 연산하게 하고 그렇지 않았다면 기존의 값을 사용

> Reactions

값이 바뀜에 따라 해야 할 일을 정하는 것

> Action

상태에 변화를 일으키는 것

##### 그 외

> autorun

reaction이나 computed의 observe 대신에 사용함으로써 autorun으로 전달해주는 함수에서 사용되는 값이 있으면 자동으로 그 값을 주시하여 그 값이 바뀔 때 마다 함수가 주시되도록 함

> decorate

MobX 함수를 적용함

Ex)

```
decorate(클래스이름, {
  객체: observable,
  함수: computed,
});
```



==> decorator 문법을 사용하 dacorate 함수를 사용하지 않고 MobX사용 가능

Ex) `@observable 객체`

