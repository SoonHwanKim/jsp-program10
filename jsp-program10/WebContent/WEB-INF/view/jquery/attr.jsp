<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<h1>어트리뷰트</h1>
<div class="outbox">
<div class="box">
	<h3>어트리뷰트란 ?</h3>		
	<h4>어트리뷰트는 요소에 부가적인 정보를 첨가하고자 할 때 사용한다.</h4>
	<div class="pad"></div>
	<h3>기본 어트리뷰트를 다루기 위한 메소드</h3>
	<table class="tab">
		<tr>
			<th>메소드</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>attr()
				<button id="attrDemo">샘플</button>
			</td>
			<td>
				엘리먼트 어트리뷰트 값을 가져오고 설정한다
			</td>
		</tr>
		<tr>
			<td>removeAll()</td>
			<td>엘리먼트의 모든 어트리뷰트 값을 제거한다</td>
		</tr>
	</table>
	<div class="pad"></div>
	<h3>클래스 어트리뷰트를 다루기 위한 메소드</h3>
	<table class="tab">
		<tr>
			<th>메소드</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>addClass()</td>
			<td>스타일 입히기</td>
		</tr>
		<tr>
			<td>removeClass()</td>
			<td>스타일 제거하기</td>
		</tr>
		<tr>
			<td>toggleClass()</td>
			<td>엘리먼트에 해당 클래스가 있으면 제거, 없으면 추가</td>
		</tr>
		<tr>
			<td>hasClass()</td>
			<td>엘리먼트에 클래스 존재여부 확인(있으면 true 반환)</td>
		</tr>
	</table>
	<div class="pad"></div>
	<h3>DOM 대체를 위한 메소드</h3>
	<table class="tab">
		<tr>
			<th>메소드</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>html()
				<button id="domDemo">샘플</button>
			</td>
			<td>엘리먼트 태그 내부의 HTML 콘텐츠를 얻어온다(getter)</td>
		</tr>
		<tr>
			<td>html(CONTENT)</td>
			<td>엘리먼트 태그 내부의 HTML 콘텐츠를 변경한다(setter)</td>
		</tr>
		<tr>
			<td>text()<button id="textDemo">샘플</button></td>
			<td>엘리먼트에 텍스트를 뿌린다(setter)</td>
		</tr>
		<tr>
			<td>val()</td>
			<td>form 태그 엘리먼트에서 value 값을 가져온다(getter)</td>
		</tr>
		<tr>
			<td>val(CONTENT)<button id="valDemo">샘플</button></td>
			<td>form 태그 엘리먼트에서 value 값을 설정한다(setter)</td>
		</tr>
	</table>
	
</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#attrDemo').click(function(){attr.attrDemo('${context}/images/hyundai.png');});
		$('#domDemo').click(function(){attr.domDemo();});
		$('#textDemo').click(function(){attr.textDemo();});
		$('#valDemo').click(function(){attr.valDemo();});
	});
	var attr = {
		attrDemo : function(imgPath) {
			$('<img>',{
				src : imgPath,
				width : '100%',
				height : '100%'
			}).appendTo($('.box').empty());	
		},
		/*
		* empty() 와 remove() 차이점
		* - 본인 자체도 사라진다 : remove()
		* - 본인은 남고 내부 요소들만 사라진다 : empty()
		* A append B : A 에 B를 붙인다.
		* B appendTo A : B를 A에 붙인다.
		*/
		domDemo : function() {
			this.common();
			$('#temp').html(
				'<div id="hello"><h3>Hello jQuery, Thank you appendTo() !!</h3></div>'
			);
		},
		common : function() {
			$('<div id="temp"></div>').appendTo($('div.box').empty());
		},
		/*
		* text() 와 html() 의 차이점
		* text() : <E> 을 그대로 리터럴로 출력한다. 자바로 치면 toString()
		* html() : <E> 을 역할에 맞게 번역(인터프리터)해서 출력한다.
		*/
		textDemo : function() {
			this.common();
			$('#temp').text(
				'<div id="hello"><h3>Hello jQuery, Thank you appendTo() !!</h3></div>'
			);
		},
		valDemo : function() {
			this.common();
			$('#temp').html(
				'<div><input type="text" id="txt" placeholder="이름입력" />'+
				'<button id="btn">알러트창띄우기</button><br/><div id="show"></div></div>'
			);
			$('#btn').click(function() {
				var name = $('#txt').val(); 
				alert('이름 :'+name);
				$('#show').text('이름 : '+name);
			});
		}
		
	};
</script>








