<%@page import="kr.or.ddit.vo.CartListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%MemberVO memVo = (MemberVO) session.getAttribute("loginMember"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
int i = 0;
%>

		<div class="row mb-5">
			<form class="col-md-12" method="post">
				<div class="site-blocks-table">

					<table class="table">
						<thead class="thead-dark">
							<tr>
						        <th scope="col">번호</th>
						        <th scope="col">아이디</th>
						        <th scope="col">이름</th>
						        <th scope="col">전화번호</th>
						        <th scope="col">메일</th>
						        <th scope="col">블랙리스트</th>
						    </tr>
						</thead>
						<tbody>
					
							<%
								if (memberList == null || memberList.size() == 0) {
								%>
								<tr>
								<td colspan="5">등록된 멤버가 없습니다.</td>
								</tr>
								<%
								} else {
									for (MemberVO memberVo : memberList) {
										i++;
								%>
								<tr>
								<td><%=i%></td>
								<td class="tdId"><%=memberVo.getMem_id()%></td>
								<td><%=memberVo.getMem_name()%></td>
								<td><%=memberVo.getMem_tel()%></td>
								<td><%=memberVo.getMem_mail()%></td>
								<%if(memberVo.getMem_status() == 0){
								%>
								<td><input type="button" value="black" id="black" class="btn btn-dark btn-lg py-3 btn-block blackListAdd"></td>
								<%	
								}else{
								%>
								<td><input type="button" value="Clear" id="blackClear" class="btn btn-light btn-lg py-3 btn-block blackListClear"></td>
								<%
								
								}
								%>
								
							</tr>
							<%
									}
								}
							%>

						</tbody>
					</table>
				</div>
			</form>
		</div>
		
<script>
//ajax를 이용 블랙처리
$('.blackListAdd').on('click', function () {
	let mem_id = $(this).parents('tr').find('.tdId').text();
	
	swal({
		  title: "블랙리스트에 추가하시겠습니까?",
		  text: "",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		        $.ajax({
		            type:'post',
		            url:'<%=request.getContextPath() %>/blackListAdd.do',
		            dataType:'json',
		            data:
		            	{
		            	"member_id" : mem_id
		            	},
		            success: function(res) {
		        		
		        		if(res.status == "success"){
		        			swal("블랙리스트 등록", "","success")//알럿창
		        			.then((value) => {
		        			location.replace('<%=request.getContextPath() %>/includes/admin/adminstart.jsp') 
								});
		        		}
		        
		            },
		            error:function (xhr) {
		                alert("상태:" + xhr.status);
		            }
		        })    //ajax
		        
		  } else {
		    swal("취소 되었습니다.");
		  }
		});



})

//ajax를 이용 블랙해제
$('.blackListClear').on('click', function () {
	let mem_id = $(this).parents('tr').find('.tdId').text();
	console.log("바보"+mem_id);
	swal({
		  title: "블랙리스트를 해제하겠습니까?",
		  text: "",
		  icon: "success",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		        $.ajax({
		            type:'post',
		            url:'<%=request.getContextPath() %>/blackListClear.do',
		            dataType:'json',
		            data:
		            	{
		            	"member_id" : mem_id
		            	},
		            success: function(res) {
		        		
		        		if(res.status == "success"){
		        			swal("블랙리스트 해제", "","success")//알럿창
		        			.then((value) => {
		        			location.replace('<%=request.getContextPath() %>/includes/admin/adminstart.jsp') 
								});
		        		}
		        
		            },
		            error:function (xhr) {
		                alert("상태:" + xhr.status);
		            }
		        })    //ajax
		        
		  } else {
		    swal("취소 되었습니다.");
		  }
		});



})

</script>
		


				







	