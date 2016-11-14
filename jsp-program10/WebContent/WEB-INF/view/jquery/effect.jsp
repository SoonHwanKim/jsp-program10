<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../global/header.jsp"%>
<div class="outbox">
<div class="box"></div>
</div>
<script src="${context}/js/effect.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	effect.base();
	$( "#go" ).click(function() {effect.animate()});
});
</script>