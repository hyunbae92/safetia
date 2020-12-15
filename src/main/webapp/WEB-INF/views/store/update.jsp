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
<table border="1">
	<tr>
		<th>상품번호</th>
		<td><input id="stuffNo" readonly></td>
	</tr>
	<tr>
		<th>상품이름</th>
		<td><input id="stuffName"></td>
	</tr>
	<tr>
		<th>상품가격</th>
		<td><input id="stuffPrice"></td>
	</tr>
	<tr>
		<th>상품설명</th>
		<td><input id="stuffDesc"></td>
	</tr>	
</table>
<button type="button" onclick="doUpdate()">수정</button><button type="button" onclick="location.href='/views/store/list'">목록</button>
<script>
var stuffNo = ${param.stuffNo};
var storeName = '${param.storeName}';

window.addEventListener('load',loadStuff);

function loadStuff(){
	var params = {
			stuffNo : stuffNo,
			storeName : storeName
	}
	$.ajax({
		url : '/store',
		method : 'GET',
		data : params,
		success : function(res){
			if(res){
				$('input[id]').each(function(idx,obj){
					var col = obj.id;
					$('#'+col).val(res[col]);					
				})
			}
		}
	})
}
function doUpdate(){
	var params = {
			storeName : storeName,
			stuffNo : stuffNo,
			stuffName : $('#stuffName').val(),
			stuffPrice : $('#stuffPrice').val()
	}
	if($('#stuffDesc').val().trim()){
		params.stuffDesc =$('#stuffDesc').val().trim();
	}
	$.ajax({
		url : '/store',
		method : 'PATCH',
		data : params,
		success : function(res){
			if(res){
				alert('수정되었습니다!');
				location.reload();
			}else{
				alert('실패하였습니다.')
			}
		}
	})	
}

</script>
</body>
</html>