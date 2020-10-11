# React

> React-Spring 연동

### 구상

```
Back-end : SpringBoot (MyBatis)
Front-end : React.js
Database : MySQL
```



### Basic definition

- Public (folder) - index.html 파일을 포함

  => react는 html 파일 하나로 웹을 만듬 (single page application)

  - 이를 html template라고 함

  - 모든 component가 이 html 파일안에 root란 id를 가진 div 태그에서 rendering됨.

- index.js (file) - react app에 존재하는 render 중 최상위에 있는 render가 존재하는 파일.

  => React.DOM.render()는 app.js파일에서 render한 app component를 index.html파일에 있는 id가 "root"인 div 태그 안에 실행시킴.

- src (folder) - 이 폴더는 react app 전역에 적용되는 js파일과 css파일을 포함

- App.js (file) - root component

    			 - 브라우저에서 실제로 렌더되는 컴포넌트를 포함

     - JSX라는 확장자 파일을 리턴 (자바스크립트 확장 문법)

- state

  : Component 내부에서 선언하면 내부에서 값 변경 가능

- props

  - 부모 컴포넌트가 자식 컴포넌트에게 주는 값
  - 자식 컴포넌트에서 props를 받아 읽기만 가능하고 수정은 불가

- Component Type

  - function type
    - 클래스형에 비해 단순하게 구성
    - state, lifeCycle 관련 기능 사용 불가 (Hook을 통해 해결)
    - 컴포넌트 선언이 편함
    - 메모리 자원을 클라스형에 비해 적게 사용

  구조)

  ```
  import React form 'react';
  
  const UserComponent = (props) => {
  	return(
  	<div className="container">			//JSX는 class 대신 className을 사용
  	컴포넌트 내용
  	<div>
  	)
  }
  ```

  

  - class type
    - state, lifeCycle 관련기능 사용 가능
    - 임의 메서드 정의 가능
    - 자주 사용되진 않지만 유지보수를 위해 알아둬야 함

  ```
  import React, {Component} from 'react';
  
  class UserComponent extends Component{
  	render(){
  		return(
  			<div className="container">
  			컴포넌트 내용
  			</div>
  		)
  	}
  }
  ```

  



### CRUD 구현

<UserListComponent.js>

Delete User button - 버튼을 클릭하면 API통신을 통해 DB에서 해당 유저를 삭제하고 filter라는 기능을 통해 state에 있는 users 배열에서 삭제된 해당 유저id를 제외하고 다시 배열로 나타냄.

Edit User button - browser local storage를 통해 해당 유저 id를 일시적으로 저장하고 route를 통해 EditUserComponent.js로 이동

Add User button - route를 통해 AddUserComponent.js로 이동

<AddUserComponent.js>

1. 입력받을 유저 정보를 state에 작성
2. input 태그의 onChange()를 통해 setState로 state값을 저장
3. 유저 추가를 하면 API 통신을 통해 DB에 저장

<EditUserComponent.js>

1. UserListComponent.js에서 .map()을 통해 유저리스트를 하나씩 출력 후 타겟 id값을 editUser()의 파라미터로 넘김.
2. 받은 파라미터를 userID라는 key값으로 저장 후 EditUserComponent.js에서 API통신을 통해 해당 유저정보를 DB에서 가져옴.
3. setState로 수정 후 다시 API통신을 통해 DB에 저장



### Router

React는 기본적으로 SPA (Single Page Application)에서 뷰 렌더링을 유저의 브러우저가 담당하도록 하고, 어플리케이션을 브라우저에 로드 한 다음에 정말 필요한 데이터만 전달받음

=> Router를 통해서 다른 주소에 따라 다른 뷰를 보여줌.

(yarn add react-router-dom 으로 설치)

(yarn add cross-env --dev => 프로젝트에서 NODE_PATH를 사용하여 절대경로로 파일을 불러오기 위하여 환경 변수를 설정 할 때 운영체제마다 방식이 다르므로 공통정인 방법으로 설정 할 수 있게 해주는 라이브러리)

1. src/index.js 파일에서 BrowserRouter라는 컴포넌트를 /App에 적용

   - BrowserRouter : History API를 사용하여 페이지를 새로고침하지 않고도 주소를 변경하고 현재 주소에 관련된 정보를 props로 쉽게 조회하거나 사용가능케 함

2. App.js에 Route 컴포넌트 사용

   - Route : 어떤 규칙을 가진 경로에 어떤 컴포넌트를 보여 줄지 정의함

   Ex) `<Route path="/" component={home}/>`

   - 다른 컴포넌트를 추가할 시 path가 /인 컴포넌트에 exact라는 props를 true로 설정해줘야 정확하게 일치하는 경로의 컴포넌트를 나타냄

3. a 태그 대신 Link 컴포넌트 사용

   => 페이지를 새로 불러오지 않고 애플리케이션은 그대로 유지한 상태에서 History API를 사용하여 페이지 주소만 변경 (페이지 전환 방지)

   Ex) `<Link to="주소>내용</Link>"`

4. 라우트 파라미터 읽기

   - 라우트의 경로에 특정 값을 넣는 방법
     - prams
     - query



