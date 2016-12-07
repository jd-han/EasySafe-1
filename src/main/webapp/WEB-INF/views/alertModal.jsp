<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- 경고창 모달 -->
<div id="alertModal" class="modal fade" tabindex="-1" role="dialog"	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="font-size: 30px;" class="text-center" id="alertTitle">
					경고창 제목
				</div>
			</div>
			<div class="modal-body" id="alertBody">
				
			</div>
			<div class="modal-footer" id="alertBtnPlace">			
				<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">&nbsp;&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;&nbsp;</button>				
			</div>
		</div>
	</div>
</div>

<script>
	function callAlert(title, body, btns){		 
		$("#alertTitle").html(title);
		$("#alertBody").html(body);
		switch(btns){
		case 'Y':
		case 'y':
			$("#alertBtnPlace").html(
				'<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">확인</button>'
				);
			break;
		case 'YN':
		case 'yn':
			$("#alertBtnPlace").html(
					'<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">확인</button>'
					+'<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">취소</button>'
				);
			break;
		case 'YNC':
		case 'ync':
			$("#alertBtnPlace").html(
					'<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">수락</button>'
					+'<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true">거부</button>'
					+'<button class="btn btn-warning" data-dismiss="modal" aria-hidden="true">취소</button>'
				);
			break;
		}
	}
</script>