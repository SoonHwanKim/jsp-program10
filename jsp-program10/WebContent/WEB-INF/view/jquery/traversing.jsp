<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<h1>조회(트래버싱)</h1>
<div class="outbox">
<div class="box">
	<h3>트래버싱(traversing)이란 ? DOM을 탐색하는 기능</h3>
	<table>
		<tr>
			<th>메소드</th>
			<th>설명</th>
		</tr>
		<tr>
			<td>add()
				<button id="btn_add">샘플</button>
			</td>
			<td>엘리먼트를 추가한다</td>
		</tr>
		<tr>
			<td>filter()
				<button id="btn_filter">샘플</button>
			</td>
			<td>조건에 맞는 엘리먼트 찾기</td>
		</tr>
		<tr>
			<td>not()<button id="btn_not">샘플</button></td>
			<td>표현식에 맞지 않는 엘리먼트 찾기</td>
		</tr>
		<tr>
			<td>slice()<button id="btn_slice">샘플</button></td>
			<td>원하는 범위의 엘리먼트만 반환</td>
		</tr>
		<tr>
			<td>children()<button id="btn_children">샘플</button></td>
			<td>자식 엘리먼트</td>
		</tr>
		<tr>
			<td>contents()</td>
			<td>엘리먼트 내용 변경</td>
		</tr>
		<tr>
			<td>next()</td>
			<td>엘리먼트 뒤에 있는 엘리먼트</td>
		</tr>
		<tr>
			<td>nextAll()</td>
			<td>엘리먼트 뒤에 있는 모든 엘리먼트</td>
		</tr>
		<tr>
			<td>prev()</td>
			<td>엘리먼트 앞에 있는 엘리먼트</td>
		</tr>
		<tr>
			<td>prevAll()</td>
			<td>엘리먼트 앞에 있는 모든 엘리먼트</td>
		</tr>
		<tr>
			<td>siblings()<button id="btn_siblings">샘플</button></td>
			<td>엘리먼트와 같은 노드 위치의 모든 엘리먼트</td>
		</tr>
		<tr>
			<td>parent()<button id="btn_parent">샘플</button></td>
			<td>엘리먼트에서 가장 인접한 부모 엘리먼트</td>
		</tr>
		<tr>
			<td>parents()<button id="btn_parents">샘플</button></td>
			<td>모든 부모 엘리먼트</td>
		</tr>
		<tr>
			<td>find()<button id="btn_find">샘플</button></td> 
			<td>엘리먼트의 자손 엘리먼트</td>
		</tr>
		<tr>
			<td>map()<button id="btn_map">샘플</button></td> 
			<td>셀렉트된 엘리먼트들의 내용을 변경</td>
		</tr>
		<tr>
			<td>andSelf()</td>
			<td>탐색한 엘리먼트들의 기준이 되었던 엘리먼트를 추가</td>
		</tr>
		<tr>
			<td>end()<button id="btn_end">샘플</button></td>
			<td>메소드 체이닝(chaning)중에 최초 엘리먼트로 돌아가기</td>
		</tr>
	</table>
</div>	
</div>
<script>
	$(document).ready(function() {
		$('#btn_add').click(function(){traversing.addDemo()});
		$('#btn_filter').click(function(){traversing.filterDemo()});
		$('#btn_not').click(function(){traversing.notDemo()});
		$('#btn_slice').click(function(){traversing.sliceDemo()});
		$('#btn_children').click(function(){traversing.childrenDemo()});
		$('#btn_siblings').click(function(){traversing.siblingsDemo()});
		$('#btn_parent').click(function(){traversing.parentDemo()});
		$('#btn_parents').click(function(){traversing.parentsDemo()});
		$('#btn_find').click(function(){traversing.findDemo()});
		$('#btn_map').click(function(){traversing.mapDemo()});
		$('#btn_end').click(function(){traversing.endDemo()});
	});
	var traversing = {
		makeTemp : function() {
			$('<div id="temp">').appendTo($('.box').empty());
		},	
		addDemo : function() {
			this.makeTemp();
			$('#temp').html(
			'<div class="yellow bg_color_yellow pad">'+
			'<div class="black bg_color_black">바탕-검정</div>'+
			'<div class="red bg_color_red">바탕-적색</div>'+
			'<div class="purple bg_color_purple">바탕-보라</div>'+	
			'<div class="orange bg_color_orange">바탕-오렌지</div>'+
			'</div><button id="btn_foo">클릭</button>'	
			);
			$('#btn_foo').click(function() {
				$('.yellow').add('.black').add('.red')
				.add('.purple').add('.orange')
				.css('background','white');
			});
			/*
			* div 엘리먼트 선택 후 p엘리먼트를 추가한 후,
			* 그 상태로 div 에 오렌지를 
			*/
		},
		makeDiv6 : function() {
			this.makeTemp();
			$('#temp').html(
			'<div id="1" class="foo"> 하나 </div>'+		
			'<div id="2" class="foo middle"> 둘 </div>'+		
			'<div id="3" class="foo middle"> 셋 </div>'+		
			'<div id="4" class="foo middle"> 넷 </div>'+		
			'<div id="5" class="foo middle"> 다섯 </div>'+		
			'<div id="6" class="foo"> 여섯 </div>'+
			'<button id="btn">버튼</button>'
			);
		},
		filterDemo : function() {
			this.makeDiv6();
			$('.foo').css('background','red')
			.addClass('txt_color_white')
			.filter('.middle')
			.css('background','blue');
		},
		notDemo : function() {
			this.makeDiv6();
			$('.foo').css('background','red')
			.addClass('txt_color_white')
			.not('.middle')
			.css('background','blue');
		},
		sliceDemo : function() {
			this.makeDiv6();
			/*
			* slice(begin,end)
			* begin 은 첫 엘리먼트로 0 부터 시작
			* end 는 마지막 엘리먼트로 불포함
			* 파라미터가 하나이면 slice(begin)이면 끝까지를 의미함.
			* slice(2,4)
			* slice(2)
			*/
			$('#btn').click(function(){
				var $foo = $('.foo'); 
				$foo.slice(2,4).css('background','orange');
				$foo.slice(4).css('background','purple');
			});
		},
		childrenDemo : function() {

		},
		siblingsDemo : function() {

		},
		parentDemo : function() {

		},
		parentsDemo : function() {

		},
		childrenDemo : function() {

		},
		findDemo : function() {

		},
		mapDemo : function() {

		},
		endDemo : function() {

		}
	};
</script>