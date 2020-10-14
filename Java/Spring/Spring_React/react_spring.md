# Spring_react 연동

### React

> React-Spring 연동

##### 구상

```
Back-end : SpringBoot (MyBatis)
Front-end : React.js
Database : MySQL
```



##### Basic definition

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

  

##### CRUD 구현

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



##### Router

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

     - prams : path경로 뒤에 `/:foo`형식으로 설정

     - query (라이브러리 필요 => yarn add query-string)

       Ex)

       ```
       import React from 'react';
       import queryString from 'query-string';
       
       const About = ({location, match}) => {
           const query = queryString.parse(location.search);
           console.log(query);
       
           return (
               <div>
                   <h2>About {match.params.name}</h2>
               </div>
           );
       };
       
       export default About;
       ```

       경로 형태 :  /about/foo?detail=true

- 라우트로 설정한 컴포넌트는 3가지의 props를 전달 받음

  - history : push, replace를 통해 다른 경로로 이동하거나 앞 뒤 페이지로 전환 할 수 있음

    (이동을 할 때 double check를 해줘 무의식적인 이탈 방지)

  - location : 현재 경로에 대한 정보를 지니고 있고 URL 쿼리 정보도 갖음

    - Location.pathname : 현재 브라우저상의 위치를 알려줌

      (어떤 라우트에서 렌더링 하던 동일)

  - match :  어떤 라우트에 매칭이 되었는지에 대한 정보가 있고 params 정보를 갖음

    ​				(설정한 Route와 직접적으로 관계된 값만 보여줌)

    - match.path : 라우트에서 설정한 path 값을 보여줌
    - match.url : 할당된 id값을 보여줌

  - withRouter 함수는 라우트로 사용된 컴포넌트가 아니어도 match, location, history 객체를 접근 가능케해줌

- Switch 컴포넌트

  : 여러 Route를 감싸서 그중 일치하는 단 하나의 라우트만을 렌더링 시킴 (비교할 라우터를 위에 작성)

  => exact값을 주지 않더라도 하나의 라우트만을 렌더링 시킬 수 있음

- NavLink

  : Link에서 사용하는 경로가 일치하는 경우 특정 스타일 혹은 CSS클라스를 적용 가능

  (NavLink에서 스타일 적용할 때는 activeStyle 값을, CSS 클라스를 적용할 때는 activeClassName값을 props로 넣어 줌)

- 중첩 라우트

<src/pages/Post.js>

```
import React from 'react';

const Post = ({match}) => {
    return (
        <div>
            포스트 {match.params.id}
        </div>
    );
};

export default Post;

```

<src/pages/Posts>

```
import React from 'react';
import { Link, Route } from 'react-router-dom';
import { Post } from 'pages'; 

const Posts = ({match}) => {
    return (
        <div>
           <h2>Post List</h2> 
           <ul>
                <li><Link to={`${match.url}/1`}>Post #1</Link></li>
                <li><Link to={`${match.url}/2`}>Post #2</Link></li>
                <li><Link to={`${match.url}/3`}>Post #3</Link></li>
                <li><Link to={`${match.url}/4`}>Post #4</Link></li>
           </ul>
           <Route exact path={match.url} render={()=>(<h3>Please select any post</h3>)}/>
           <Route path={`${match.url}/:id`} component={Post}/>
        </div>
    );
};

export default Posts;

```

1. Post 컴포넌트에서 params.id를 받아와 렌더링

2. Post import => Posts 컴포넌트의 Link에서 현재 주소 뒤에 id를 붙혀서 이동하도록 설정

   (하단의 Route를 통해 조건에 따라 원하는 결과 출력)

   - 첫번째 라우트에 match.url 설정 => Post id가 주어지지 않았기 때문
   - 두번째 라우트에선 현재 라우트의 주소에 :id가 붙었을 시에 Post컴포넌트를 보여주도록 설정

3. index.js 수정

4. App.js에서 /posts 경로를 위한 라우트 설정



### SpringBoot

1. SpringToolSuite에서 Work space 지정

2. Dependency 적용

   - Spring Web : 스프링으로 웹프로젝트를 진행
   - MySQL Driver : DB로 MySQL 사용
   - MyBatis : Java에서 SQL문을 실행
   - Lombok : 자바 클라스(특히 VO, DTO, Entity)를 만들 때 생성하는 getter, setter 및 기타함수들을 어노테이션 하나로 자동으로 생성해주는 역할
   - Spring Boot DevTools : STS에서 작업 시 저장 할 때마다 자동으로 서버를 재부팅해주는 역할

3. application.properties 작성 (들여쓰기 x)

   Ex)

   ```
   #MySQL설정
   spring.datasource.url=jdbc:mysql://localhost:3306test_crud?useUnicode=true&characterEncoding=utf8&verifyServerCertificate=false&useSSL=false&serverTimezone=UTC
   spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
   spring.dataasource.username=root
   spring.datasource.password=
   
   #MyBatis설정
   mybatis.mapper-location=classpath*:mapper/*.xml
   ```

4. MySQL에서 Database와 Table 생성

5. Vo, Controller, Configuration, Mapper 작성

   - VO (Value Object) : front-end에서 스프링부트(back-end)로 URL을 통해 작업을 요청 할 시 자바 언어로 해당 객체를 받아주는 역할

   - Controller : URL과 method(get, post, delete 등)로 들어온 요청을 처리

   - Mapper : MyBatis를 이용해 Controller에서 DB작업을 할 때, mapper라는 이름으로 java파일과 xml파일안에서 작업함

     =>xml파일에서 작성한 쿼리문을 java파일에서 작성한 메소드와 연결시켜 DB에서 작업