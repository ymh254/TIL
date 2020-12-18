//덧셈 고치기
let a = prompt("덧셈할 첫 번째 숫자:", 1);
let b = prompt("덧셈할 두 번째 숫자:", 2);
alert(a + b);
//Result => 12

//원하는 답인 3 받기
//1.
let a = +prompt("덧셈할 첫 번째 숫자:", 1);
let b = +prompt("덧셈할 두 번째 숫자:", 2);
alert(a + b);
//2.
let a = prompt("덧셈할 첫 번째 숫자:", 1);
let b = prompt("덧셈할 두 번째 숫자:", 2);
alert(+a + +b);