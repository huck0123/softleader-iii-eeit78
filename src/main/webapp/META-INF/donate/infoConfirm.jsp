<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class="panel alert tab-pane fade" id="infoConfirm">
	<div>
		<h3>您的捐款資訊</h3>
		<table class="table">
			<colgroup>
				<col span="1" style="background-color: #ADADAD">
				<col style="background-color: #F0F0F0;">
			</colgroup>
			<tr>
				<td><label for="">捐款活動名稱:</label></td>
				<td>${param.name }</td>
			</tr>
			<tr style="display: none">
				<td>捐款人ID</td>
				<td><input type="text" name="form.giverId"
					value="${sessionScope.giver.id }"></td>
			</tr>
			<tr>
				<td><label for="">捐款金額:</label></td>
				<td id="infoAmount"></td>
			</tr>
			<tr>
				<td><label for="">持卡人姓名:</label></td>
				<td id="infoCardHolder"></td>
			</tr>
			<tr>
				<td><label for="">卡別:</label></td>
				<td id="infoCardType"></td>
			</tr>
			<tr>
				<td><label for="">卡號:</label></td>
				<td id="infoCardNo"></td>
			</tr>
		</table>
	</div>
	
	<div>
		<a class="btn btn-primary" id="infoConfirmBack" >上一步</a>
		<input type="submit" class="btn btn-success" value="確認送出">
	</div>
</div>

<script>

	//donate.jsp
	$('#infoConfirmBack').on('click', function(){
		//上一步
		$('.nav-tabs a[href="#billInfo"]').tab('show');
	});
	
</script>
