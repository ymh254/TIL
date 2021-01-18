alert(alert(1) || 2 || alert(3));
//Result => 1, 2가 alert창에 출력 됨
//alert(1) 평가와 동시에 alert창에 1이 출력되고
//alert는 undefinded를 반환하기 때문에,
//다음 truthy 값인 2를 반환함.

alert(alert(1) && alert(2));
//Result => 1, undefinded가 alert창에 출력
//평가와 동시에 1이 출력되고,
//첫 번째 falsy값인 undefinded를 출력함.