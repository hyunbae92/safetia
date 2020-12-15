<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<h1>wellcome!</h1><br>
<p>입사 지원자 김현배 입니다.</p><br>
<p>버튼을 누르시면 리스트 페이지로 이동합니다.</p><br>

<a href="/views/store/list"><button type="button">리스트로</button></a>
<button type="button" onclick="test()">테스트</button>
<script>
function test(){
	var data ={
			storeName:'sus_01',
			stuffNo:'1'
	}
	$.ajax({
		url:'/store',
		method:'GET',
		data:data,
		success:function(res){
			console.log(res)
		}
	})
}
</script>
</body>
</html>