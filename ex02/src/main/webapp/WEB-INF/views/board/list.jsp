<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List Page
					<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno}" /></td>
								<td>
									<a href='/board/get?bno=<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}"/></a>
								</td>
								<td><c:out value="${board.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.updateDate}" /></td>
							</tr>
						</c:forEach>
					</table>
					
					<div class='pull-right'>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="pagenate_button previous">
									<a href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li class="pagenate_button next">
									<a href="${pageMaker.endPage+1}">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
					
				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class=modal-footer>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
						<!-- //modal-content -->
					</div>
					<!-- //modal-dialog -->
				</div>
				<!-- //modal -->
	<!-- /.container-fluid -->
</div>
<form id='actionForm' action="/board/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
<!-- End of Main Content -->
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
			
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if(result === '' || history.state) {
				return;	
			}
			
			if(parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			self.location="/board/register";
		});
		
		var actionForm=$("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>