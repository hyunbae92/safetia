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
<table>
	<tr>
		<th>제품이름 :</th>
		<td><input id="stuffName"></td>
	</tr>
	<tr>
		<th>제품가격 :</th>
		<td><input id="stuffPrice"></td>
	</tr>
	<tr>
		<th>제품설명 :</th>
		<td><input id="stuffDesc"></td>
	</tr>
</table>
<button type="button" onclick="doInsert()">저장</button><button type="button" onclick="location.href='/views/store/list'">취소</button>
<script>
function doInsert(){
	var params = {
			storeName : 'sus_01',
			stuffName : $('#stuffName').val(),
			stuffPrice : $('#stuffPrice').val()
	}
	if($('#stuffDesc')){
		params.stuffDesc = $('#stuffDesc').val();
	}
	$.ajax({
		url : '/store',
		method : 'POST',
		data : params,
		success : function(res){
			if(res==1){
				alert('저장되었습니다.');
				location.href = '/views/store/list';
			}else{
				alert('실패하였습니다.');
			}
		}
	})
	
}
</script>
</body>
</html>