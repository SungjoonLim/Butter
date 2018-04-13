<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:url value="/" var="root" />
<script>

function showLineChart(data){
	var labels = data.map(item=>item.id + '시');
	var values = data.map(item=>item.value);
	
	lineChart(labels,values);
}

//line
function lineChart(labels,values){
	var ctxL = document.getElementById("lineChart").getContext('2d');
	var myLineChart = new Chart(ctxL, {
	    type: 'line',
	    data: {
	        labels: labels,
	        datasets: [
	            {
	                label: "온도 변화",
	                fillColor: "rgba(54,162,235,0.2)",
	                strokeColor: "rgba(54,162,235,0.2)",
	                pointColor: "rgba(54,162,235,0.2)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(54,162,235,0.2)",
	                data: values
	            }
	        ]
	    },
	    options: {
	        responsive: true
	    }    
	});
}

$(function(){
 	var api="${root}api/sensor/";
 	var cmt="${root}view/comment/"
 	var sensor_values;
	$.get(api,function(data){
		//console.log(data);
		//data.forEach(function(item,ix){
			//console.log(item)
			/* var str = `<p>\${item.id} : \${item.type},
						\${item.value} \${item.time}</p>`;
			$('#sensor_panel').append($(str)); */
			sensor_values=data;
			showLineChart(data);
		//});
	});
	
	$('#add').click(function(e){
		var data = {
			id:8,
			type:'온도',
			value:35
		};
		
		$.ajax({
			url:api,
			//data:data,				// url인코딩
			data:JSON.stringify(data),  //json인코딩
			contentType:'application/json',  
			type:'post',
			success:function(result){
				//console.log(result);
				if(result){
					sensor_values.push(data);
					showLineChart(sensor_values);
				}else{
					alert("데이터 삽입 실패")
				}
			}
		});
	});
	
	$('#edit').click(function(e){
		var data=sensor_values[4];
		data.value=50;	
		
		$.ajax({
			url:api,
			//url : api+4, // ~/api/sensor/4
			data:JSON.stringify(data),
			contentType:'application/json',
			type:'put',
			success:function(result){
				console.log(result);
				showLineChart(sensor_values);
			}
		});
	});
	
 	$('#delete').click(function(e){
		var target = $(this).data('target');
		$.ajax({
			url:api+target,
			//url : ~/api/
			type:'delete',
			success:function(result){
				var index=Number(target);
				//배열의 index 번째 요소부터 한개 삭제
				sensor_values.splice(index,1);
				showLineChart(sensor_values);
			}
		});
	});
 	
 	$('#comment').click(function(e){
 		var data = {
 				content:'온도',
 				writer:'hong',
 				fileName:'',
 				commentRef:1,
 				commentLevel:0
 			};
 			
 			$.ajax({
 				url:cmt,
 				//data:data,				// url인코딩
 				data:JSON.stringify(data),  //json인코딩
 				contentType:'application/json',
 				type:'post',
 				success:function(result){
 					console.log(result);
 					alert("데이터 삽입");
 					
 				}
 			});
 	});
})


</script>

<h2 class="mt-5 mb-4">게시글 보기</h2>
<div class="row">
	<div class="col-md-2">제목</div>
	<div class="col-md-10">${board.title}</div>
</div>
<div class="row">
	<div class="col-md-2">작성자</div>
	<div class="col-md-10">${board.writer}</div>
</div>
<div class="row">
	<div class="col-md-2">조회수</div>
	<div class="col-md-10">${board.readCnt}</div>
</div>
<div class="row">
	<div class="col-md-2">첨부파일</div>
	<div class="col-md-10">
		<c:forEach var="file" items="${board.attachments}">
			<div>
				<a href="../download/${file.attachmentId}"> <i
					class="fa fa-download"></i> ${file.fileName}
				</a>
			</div>
		</c:forEach>
	</div>
</div>

<div class="row">
	<div class="col-md-2">작성일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
	</div>
</div>
<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" />
	</div>
</div>
<hr />
<div>${board.content}</div>

<button id="add" class="btn btn-primary btn-sm">추가</button>
<button id="edit" class="btn btn-important btn-sm">수정</button>
<button id="delete" data-target="5" class="btn btn-danger btn-sm">삭제</button>

<div id="sensor_panel">
	<canvas id="lineChart"></canvas>
</div>



<div id="comments"></div>
<textarea class="form-control z-depth-1"
	id="exampleFormControlTextarea3" rows="3"
	placeholder="Write your comment...">
</textarea>
<button id="comment" class="btn btn-primary btn-sm">입력</button>




<div class="text-center mt-4">
	<a href="../edit/${board.boardId}" class="mr-4"> <i
		class="fa fa-edit mr-2"></i> 수정
	</a> <a href="../delete/${board.boardId}" class="mr-4"> <i
		class="fa fa-trash mr-2"></i> 삭제
	</a> <a href="javascript:history.back()"> <i class="fa fa-undo mr-2"></i>
		돌아가기
	</a>
</div>


