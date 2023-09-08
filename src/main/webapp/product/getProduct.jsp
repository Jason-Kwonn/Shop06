<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
	<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<title>상품상세조회</title>
	
	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
		 $(function() {			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "td.ct_btn01:contains('이전')" ).on("click" , function() {
				//Debug..
				alert(  $( "td.ct_btn01:contains('이전')" ).html() );
				history.go(-1);
			});
			
			 $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
					//Debug..
					alert(  $( "td.ct_btn01:contains('구매')" ).html() );
					self.location = "/purchase/addPurchase?prodNo=${product.prodNo}"
				});
		});
		
		$(function(){
			////////////추가 부분 ////////////
			// no-cache class 에 src 뒤에 랜덤한 수를 두어 캐싱을 방지한다.
			$('.no-cache').attr('src',function () { return $(this).attr('src') + "?a=" + Math.random() });
		});
	
	</script>
	
	</head>
	
	<body bgcolor="#ffffff" text="#000000">
	
	<form name="detailForm" method="post" >
	
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">상품상세조회</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<%--<td width="105"><%=product.getProdNo() %></td> --%>
						<td width="105">${product.prodNo}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<%--<td class="ct_write01"><%=product.getProdName() %></td> --%>
			<td class="ct_write01">${product.prodName}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				상품이미지 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<c:forEach var="image" items="${product.fileNames}">
                	<img class="no-cache" src="../images/uploadFiles/${image}"/>
            	</c:forEach>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<%-- <td class="ct_write01"><%=product.getProdDetail() %></td> --%>
			<td class="ct_write01">${product.prodDetail}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">제조일자</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<%-- <td class="ct_write01"><%=product.getManuDate() %></td> --%>
			<td class="ct_write01">${product.manuDate}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">가격</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<%-- <td class="ct_write01"><%=product.getPrice() %></td> --%>
			<td class="ct_write01">${product.price}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">등록일자</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<%-- <td class="ct_write01"><%=product.getRegDate() %></td> --%>
			<td class="ct_write01">${product.regDate}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
	
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
			
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<%-- <a href="/addPurchaseView.do?prod_no=<%=product.getProdNo() %>">구매</a> --%>
						<!-- 
						<a href="/purchase/addPurchase?prodNo=${product.prodNo}">구매</a>
						 -->
						 구매						 
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
					<td width="30"></td>
			
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- 
						<a href="javascript:history.go(-1)">이전</a>
						 -->
						 이전
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
	
			</td>
		</tr>
	</table>
	</form>
	
	</body>
</html>