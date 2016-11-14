<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<h1>셀렉터</h1>
<div class="outbox" id="selectorOutbox">
	<div class="box" id="selectorBox">
		<h3>셀렉터란</h3>
		<h4>셀렉터는 문서 내에서 원하는 엘리먼트를 쉽게 식별하고 <br />
			이를 추출하기 위해 jQuery 에서 제공하는 기술
		</h4>
		<h3>셀렉터 다루기</h3>
		<ol> 
			<li><button id="selectNo1">엘리먼트에 접근해서 스타일 지정하기</button></li>
			<li><button id="selectNo2">한번에 다양한 엘리먼트에 접근하여 갯수와 텍스트 얻기</button></li>
			<li><button id="selectNo3">조건에 만족하는 짝수와 홀수에 위치한 엘리먼트 구별하기</button></li>
			<li><button id="selectNo3_1">n번째로 일치하는 엘리먼트 스타일 적용</button></li>
			<li><button id="selectNo4">로그인 폼 정의</button></li>
			<li><button id="selectNo5">다중 체크박스</button></li>
		</ol>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#selectNo1').click(function(){selector.no1()});
		$('#selectNo2').click(function(){selector.no2()});
		$('#selectNo3').click(function(){selector.no3()});
		$('#selectNo3_1').click(function(){selector.no3_1()});
		$('#selectNo4').click(function(){selector.no4()});
		$('#selectNo5').click(function(){selector.no5()});
		$('#back').click(function(){selector.back()});
	});	
	var selector = {
		configDiv1 : function() {
			$('div#selectorBox').remove();
			$('div#selectorOutbox')
			.append('<span id="selectorSimple">스팬1</span><br/>')
			.append('<span class="span_class">스팬2_1</span><br/>')
			.append('<span class="span_class">스팬2_2</span><br/>')
			.append('<span class="span_class">스팬2_3</span><br/>')
			.append('<span class="span_class">스팬2_4</span><br/>')
			.append('<span>스팬3</span><br/>')
			.append('<div class="span_class">스팬4</div>');
		},
		back : function() {
			history.go(-1);
		},
		/*엘리먼트에 접근해서 스타일 저장하기*/
		no1 : function(){
			this.configDiv1();
			$('span').addClass('font_color_red');
			$('div.span_class').addClass('bg_color_yellow');
			$('span#selectorSimple').addClass('font_size_30')
				.addClass('font_style_italic');
		},
		/*한번에 다양한 엘리먼트에 접근하여 갯수와 텍스트 얻기*/
		no2 : function(){
			this.configDiv1();
			var $searchElems = $('span,div.span_class');
			$searchElems.css( "border", "3px solid red" );
			var result = '';
			result += '검색된 엘리먼트 수 : ' + $searchElems.length + '\n';
			/*length 대신에 size() 를 사용해도 가능하다*/
			/*each() 는 for-loop 기능*/
			$searchElems.each(function() {
				result += $(this).text()+'\n';
			});
			alert(result);
		},
		configDiv3 : function(){
			$('div#selectorBox').remove();
			$('div#selectorOutbox')
				.append('<table id="selectorTab">')
				.append('</table>');
			/*
			* table 과 tr td 는 자스 내부적으로 볼때
			* 다른 객체이다
			*/
			$('#selectorTab')
				.append('<tr><td>하나</td><td>ONE</td></tr>')
				.append('<tr><td>둘</td><td>TWO</td></tr>')
				.append('<tr><td>셋</td><td>THREE</td></tr>')
				.append('<tr><td>넷</td><td>FOUR</td></tr>')
				.append('<tr><td>다섯</td><td>FIVE</td></tr>')
		},
		/*조건에 만족하는 짝수와 홀수에 위치한 엘리먼트 구별하기*/
		no3 : function() {
			this.configDiv3();
			// backgroundColor 는 제이쿼리에서 미리 선언된 키값
			$('tr:even').css('backgroundColor','pink');
			$('tr:odd').css('backgroundColor','yellow');
		},
		/*n번째로 일치하는 엘리먼트 스타일 적용*/
		no3_1 : function() {
			this.configDiv3();
			/*
			* eq(n) n번째로 일치하는 엘리먼트에 스타일을 적용시킨다.
			* 인덱스는 0부터 시작하여 가로방향으로 진행하여 라인 끝에 다다르면
			* 다음 라인 왼쪽부터 오른쪽으로 진행한다. 지그재그 방향이다.
			*/
			$('tr:eq(4)').css('backgroundColor','yellow');
			$('#selectorTab').addClass('tab');
		},
		no4 : function() {
			$('div#selectorBox').remove();
			$('div#selectorOutbox')
				.append('<div><span class="item">아이디 *</span><input id="userid" type="text"/></div>')
				.append('<div><span class="item">이름 *</span><input id="userName" type="text"/></div>')
				.append('<div><span class="item">암호 *</span><input id="password" type="password"/></div>')
				.append('<div><span class="item">암호확인 *</span><input id="pwdConfirm" type="password"/></div>')
				.append('<input type="button" id="btn_reg" value="회원가입">');
			$('#btn_reg').click(function() {
				/*
				* #userid:text 에서 : 마크는 pseudo[su:do] - class 수도-클래스(의사클래스) 라고 부른다.
				원 단어의 뜻은 '거짓의' 라는 뜻이지만 자스에서는 
				가상의 클래스를 뜻한다.
				보통 엘리먼트 속성중에서 항상 있는 상태가 아닌 변화하는 상태를 나타낸다.
				사용자가 클래스로 선언하지 않더라도 특정 이벤트를 
				가지는 속성에서라면 수도 클래스를 통해 상태값을 반환한다.
				:text 외에도 다음과 같은 사례가 있다.
				
				a:hover{color : #ABCDEF}
				a:link{text-decoration : none}
				a:visited{color : blue}
				*/
				if($('#userid').val()==""){
					alert('아이디를 입력하세요');
					return;
				}
				var userName = $('#userName:text').val();
				if (userName == "") {
					alert('이름을 입력하세요');
					return;
				}
				if ($('#password:password').val() == "" || $('#pwdComfirm:password').val()=="") {
					alert('암호를 입력하세요');
					return;
				}
				if ($('#password:password').val() !=  $('#pwdComfirm:password').val()) {
					alert('암호가 일치하지 않습니다.');
					return;
				}
				/*회원가입을 마치면 입력값을 제거하는 기능*/
				$('#userid:text').val('');
				$('#userName:text').val('');
				$('#password:password').val('');
				$('#pwdConfirm:password').val('');
				
			});	
		},
		no5 : function() {
			$('div#selectorBox').remove();
			$('div#selectorOutbox')
				.append('<div><span class="item">음악감상</span><input type="checkbox"name="hobby"value="music"/></div>')
				.append('<div><span class="item">요가</span><input type="checkbox"name="hobby"value="yoga"/></div>')
				.append('<div><span class="item">독서</span><input type="checkbox"name="hobby"value="reading"/></div>')
				.append('<div><input type="button"id="btn_select"value="취미선택"/></div><div id="contents">결과</div>');
			$('#btn_select:button').click(function() {
				var checkedList = "";
				var checkedConsole = "";
				$('input[name="hobby"]:checkbox:checked').each(function() {
					checkedList += $(this).prev().text() + "\t";
					checkedConsole += $(this).text() + "\t";
				});
				$('#contents').html(checkedList);
				console.log(checkedConsole);
			});
		}
	};
	
</script>
