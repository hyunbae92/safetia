<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
table{
	text-align: center;
	width: 600px;
	float: left;
}
div[id=bDiv]{
	clear: both;
}
</style>
</head>
<body>
<table id="sus_01" border="1">
	<tr>
		<th id="01" data-store-name="sus_01" colspan="5">sus_01</th>
	</tr>
	<tr>
		<th data-col="stuffNo">상품번호</th>
		<th data-col="stuffName">상품이름</th>
		<th data-col="stuffPrice">상품가격</th>
		<th data-col="stuffDesc">상품설명</th>
		<th data-col="synchro">단일갱신</th>
	</tr>
	<tbody id="tbody_01"></tbody>
</table>

<table id="sus_02" border="1">
	<tr>
		<th id="02" data-store-name="sus_02" colspan="5">sus_02</th>
	</tr>
	<tr>
		<th>상품번호</th>
		<th>상품이름</th>
		<th>상품가격</th>
		<th>상품설명</th>
	</tr>
	<tbody id="tbody_02"></tbody>
</table>
<br>
<div id="bDiv">
<a href="/views/store/insert"><button type="button">상품 추가</button></a>
<button type="button" onclick="doSynchroAll()">전체 갱신</button>
</div>
<div id="rDiv">
</div>
<script>
window.addEventListener('load',loadLists);
window.addEventListener('load',loadResult);
function loadLists(){
	$('[id][data-store-name]').each(function(idx,obj){
		var storeNo = obj.id;
		var data = {
				storeName: 'sus_'+storeNo
		}
		$.ajax({
			url:'/stores',
			method:'GET',
			data:data,
			success:function(res){
				callBack(res,storeNo);
			}
		})
	})
}

function callBack(list,storeNo){
	var html = '';
	for(var stuff of list){
		html += '<tr>';
		$('th[data-col]').each(function(idx,obj){
			var col = obj.getAttribute('data-col');
			if(col!='synchro'){
				if(col=='stuffName'){
					html += '<td><a href="/views/store/update?stuffNo='+stuff.stuffNo+'&storeName=sus_'+storeNo+'">'+stuff[col]+'</a></td>'
				}else{
					html += '<td>'+stuff[col]+'</td>'	
				}
			}else{
				if(storeNo=='01'){
					html += '<td><button type="button" onclick="doSynchro('+stuff.stuffNo+')">갱신</button></td>'	
				}
			}
			
		})
		html += '</tr>';
	}
	$('#tbody_'+storeNo).html(html);
}

function doSynchro(stuffNo){
	var params = {
			storeName : 'sus_01',
			stuffNo : stuffNo
	}
	$.ajax({
		url : '/store/synchro',
		method : 'POST',
		data : params,
		success : function(res){
			if(res){
				alert('('+res.stuffNo+'번 상품) '+res.result);
				location.reload();
			}
		}
	})
}
function doSynchroAll(){
	var params = {
			storeName : 'sus_01'
	}
	$.ajax({
		url : '/store/synchro/all',
		method : 'POST',
		data : params,
		success : function(res){
			console.log(res);
			var html = '';
			for(var obj of res){
				html += '('+obj.stuffNo+'번 상품) '+obj.result+'<br>';
			}
			localStorage.setItem('result', html);
			console.log(html);
			location.reload();
		}
	})
}

function loadResult(){
	var result = localStorage.getItem('result');
	if(result){
		$('#rDiv').html(result);
	}
}
</script>
</body>
</html>