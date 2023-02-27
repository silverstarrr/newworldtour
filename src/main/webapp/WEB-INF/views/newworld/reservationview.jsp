<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/reservationview.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈 </a>></li>
                <li><a href="/views/newworld/packagecountry">해외패키지</a>></li>
                <li><a href="/views/newworld/reservationview">예약조회</a></li>
            </ul>
        </div>
    

    <!-- 패키지상세 메인 -->
<div class="resurpage">
<!-- 큰 글씨 -->
    <h1 class="bigtitle">예약조회</h1><br>
           
           
           
            <div class="resurchoice">  <!-- 페이지 전체 -->
			<div class="rightmenu">
			<div class="resurtext"> <!-- 오른쪽 부분 -->
            <p style="font-size:20px"><b>결제 상세내역</b></p><br>
            <small><center><p>최종결제금액</center>
            <ul><li>성인 <span id="riAdultCount"></span></li><li> 아동 <span id="riKidsCount"></span></li><li> 유아 <span id="riBabyCount"></span></li></ul></p></small>
            </div>
            <div class="summoney">
            <p class="summoneytext" style="text-align: right; font-size:26px; color:#3162C7" ><span id="riTgiPrice" style="font-weight: bold;">${param.riTgiPrice}</span>원</p><br>
            <center><button id="orderCancel" class="resurbtn" style="width:240px; height: 50px; display: none">예약취소</button></center>
            <center><button id="reservPay" class="resurbtn" style="width:240px; height: 50px; display: none">결제하기</button></center>
            </div>
            </div> 
            </div>
            
            
            
<!-- 왼쪽 부분  -->
<div class="resurtable">

		
  		<!-- 첫번째 테이블 -->
  		<div class="resurtable">
		<p style="font-size:24px">여행정보</p>
		<table class="table table-border w-75">
              <tbody id="tBody_reserv">
              </tbody>
            </table>

            <!-- 두번째 테이블: 예약한 당사자 정보-->
   		<p class="tabletext" style="font-size:24px">예약자정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">이름</th>
				<td data-id="uiName"></td>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">성별</th>
				<td data-id="uiName"></td>
				<th class="table-primary">생년월일</th>
				<td data-id="uiBirth"></td>
				</tr>
				<tr>
				<th class="table-primary">이메일</th>
				<td data-id="uiEmail"></td>
				<th class="table-primary">휴대폰번호</th>
				<td data-id="uiPhone"></td>
				</tr>
              </tbody>
            </table>
            <input type="hidden" id="uiId"><br>

		<!-- 세번째 테이블: 예약자가 입력한 동행인 정보-->
   		<p class="tabletext" style="font-size:24px">여행자 정보</p>
   		<div id="companion"></div>
        <!-- <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail"></td>
				</tr>
              </tbody>
            </table> -->

		<div class="paytable" style="display: none">
		<!-- 네번째 테이블 결제정보 -->
   		<p class="tabletext" style="font-size:24px">결제정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody_pay">
				<!-- 스크립트 확인 -->
              </tbody>
            </table>
		</div>

</div>
</div>      

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

function getgoods() {  //상품정보, 회원정보, 항공편정보, 인원수에 따른 여행자 정보
	fetch('/reserv-view/${param.riCode}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		 
		let html = '';
		html += '<tr>'
		html += '<th class="table-primary">' + '예약번호' + '</th>'
		html += '<td data-col="riCode">' + data.riCode + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '패키지명' + '</th>'
		html += '<td data-col="giName">' + data.giName + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '여행기간' + '</th>'
		html += '<td>' + data.giPeriodAbout + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '예약 인원' + '</th>'
		html += '<td>' + '성인: ' + data.riAdultCount + ' &nbsp;&nbsp;&nbsp;아동: ' + data.riKidsCount + '&nbsp;&nbsp;&nbsp; 유아: ' + data.riBabyCount + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '항공편' + '</th>'
		html += '<td>' + data.viDeparture + ' ↔ ' + data.viDestination + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data.viName + '<br>'
		html += '출발일: ' + data.viStart + '<br>'
		html += '도착일: ' + data.viArr + '</td>'
		html += '</tr>'
		html += '<th class="table-primary">' + '결제상태' + '</th>'
		if(data.riCheck == "0" && data.riActive == "0") {
			html += '<td>' + '예약 취소' + '</td>'
		}else if(data.riCheck == "0" && data.riActive == "1") {
			html += '<td>' + '결제 대기' + '</td>'
		}else if(data.riCheck == "1" && data.riActive == "1") {
			html += '<td>' + '결제 완료' + '</td>'
		}
		html += '</tr>'
		document.querySelector('#tBody_reserv').innerHTML = html;
		
		const infos = document.querySelectorAll('td[data-id]');	//예약자 정보 불러옴
		for(const info of infos) {
			info.innerHTML = data[info.getAttribute('data-id')];
		}
		
		const reservs = document.querySelectorAll('span[id]');	//예약 인원, 총 합 불러옴
		for(const reserv of reservs) {
			reserv.innerHTML = data[reserv.getAttribute('id')];
			
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			let price = document.querySelector('span#riTgiPrice').innerHTML;
			price = price.toString().replace(regexp, ',');
			document.querySelector('span#riTgiPrice').innerHTML = price;
		}
	})
}


 function getCompanion(){ 
	  fetch('/reserv-Companion/${param.riCode}')
	    .then(function(res){
	      return res.json()
	    })
	    .then(function(data){
	      console.log(data);
	      console.log(data.length);
			let html = '';
	      for (let i = 0; i < data.length; i++) {
	        const companionList = data[i];
	        html += '<table class="table table-border w-75">';
	        html += '<tbody id="tBody">';
	        html += '<tr>';
	        html += '<th class="table-primary">성명(한글)</th>';
	        html += '<td>'+ companionList.coName + '</td>';
	        html += '<th></th>';
	        html += '<td></td>';
	        html += '</tr>';
	        html += '<tr>';
	        html += '<th class="table-primary">생년월일</th>';
	        html += '<td>' + companionList.coBirth + '</td>';
	        html += '<th class="table-primary">성별</th>';
	        html += '<td>' + companionList.coGender + '</td>';
	        html += '</tr>';
	        html += '<tr>';
	        html += '<th class="table-primary">영문 성</th>';
	        html += '<td>' + companionList.coEngFirst + '</td>';
	        html += '<th class="table-primary">영문 이름</th>'
	        html += '<td>' + companionList.coEngName + '</td>'
	        html += '</tr>';
	        html += '<tr>';
	        html += '<th class="table-primary">휴대폰 번호</th>';
	        html += '<td>' + companionList.coPhone + '</td>';
	        html += '<th class="table-primary">이메일</th>';
	        html += '<td>' + companionList.coEmail + '</td>';
	        html += '</tr>';
	        html += '</tbody>';
	        html += '</table>';
	      }
	      document.querySelector('#companion').insertAdjacentHTML('beforeend', html);
	    });
	}


 
 
//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
function reservCheck() {
	fetch('/pay-info/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		console.log(data);
		
		if(data) {
			data = JSON.parse(data);
			document.querySelector('div.paytable').style.display = '';
			document.querySelector('#orderCancel').style.display = '';
			let html = '';
			html += '<tr>'
			html += '<th class="table-primary">' + '승인번호' + '</th>'
			html += '<td>' + data.applyNum + '</td>'
			html += '<th class="table-primary">' + '금액' + '</th>'
			html += '<td>' + data.amount + '원' + '</td>'
			html += '</tr>'
			html += '<tr>'
			html += '<th class="table-primary">' + '카드명' + '</th>'
			html += '<td>' + data.cardName + '</td>'
			html += '<th class="table-primary">' + '할부' + '</th>'
			if(data.cardQuota == 0) {
				html += '<td>' + '일시불' + '</td>'
			}else {
				html += '<td>' + data.cardQuota + '개월' + '</td>'
			}
			html += '</tr>'
			document.querySelector('#tBody_pay').innerHTML = html;
		}
	})
}

//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
function reservOrder() {
	fetch('/reserv-order/${userInfo.uiId}/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		console.log(data);
		if(data) {
			document.querySelector('#reservPay').style.display = '';
			document.querySelector('#orderCancel').style.display = '';
			document.querySelector('div.paytable').style.display = 'none';
		}
	})
}

function reservCancel() { //결제로 넘어가기 전, 예약 취소한 상황
	fetch('/reserv-cancel/${userInfo.uiId}/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		if(data) {
			document.querySelector('#reservPay').style.display = 'none';
			document.querySelector('#orderCancel').style.display = 'none';
			document.querySelector('div.paytable').style.display = 'none';
		}
	})
}


//결제
$('#reservPay').click(function () {
    var IMP = window.IMP; //생략가능
    IMP.init('imp68257437'); //가맹점 식별코드
    //var money = $('input[name="cp_item"]:checked').val();
    //console.log(돈);

    IMP.request_pay({ //IMP.request_pay(parpam,callback)
        pg: 'html5_inicis', //PG사 선택
        merchant_uid: document.querySelector('td[data-col=riCode]').innerHTML, //가맹점에서 구별할 수 있는 고유한id(예약번호)
        name: document.querySelector('td[data-col=giName]').innerHTML, //상품명
        amount: parseInt((document.querySelector('span#riTgiPrice').innerHTML).replace(/,/g, "")), //가격
        buyer_email: document.querySelector('td[data-id=uiEmail]').innerHTML,
        buyer_name: document.querySelector('td[data-id=uiName]').innerHTML,
        buyer_tel: document.querySelector('td[data-id=uiPhone]').innerHTML,
    }, function (rsp) { //callback 결제 완료 후 실행되는 함수
        console.log(rsp);
        $.ajax({
				type : 'POST',
				url : '/verifyIamport/' + rsp.imp_uid
	})
    .done(function(data) {
    	console.log(data);
    	if(rsp.paid_amount == data.response.amount){
    		alert('결제 되었습니다.');
	        $.ajax('/pay', { //서버의 결제 정보를 받는 endpoint
            	method: 'POST',
            	dataType: 'json',
            	contentType:'application/json',
            	data: JSON.stringify({
            		impUid: rsp.imp_uid,
            		merchantUid: rsp.merchant_uid,
            		payMethod: rsp.pay_method,
            		pgProvider: rsp.pg_provider,
            		pgTid: rsp.pg_tid,
            		applyNum: rsp.apply_num,
            		cardName: rsp.card_name,
            		cardQuota: rsp.card_quota,
            		name: rsp.name,
            		amount: rsp.paid_amount,
            		buyerName: rsp.buyer_name,
            		status: rsp.status,
            		failReason: rsp.fail_reason,
            		refund: 'pay'
            	})
            }) 
            location.href="/views/newworld/reservationview?riCode=${param.riCode}";
    	}else {
    		alert('결제 실패');
    	}
    });
	});
})


$('#orderCancel').click(function () {
	var check = confirm("정말 예약 취소하시겠습니까?")
	if(check == true) {
		fetch('/pay-info/${param.riCode}')
		.then(function(res) {
			return res.text();
		})
		.then(function(data) {
			console.log(data);
			
			if(data) {
				data = JSON.parse(data);
				if(check) {
					$.ajax({
						"url": "/verifyIamport/" + data.impUid,
						"type": "POST",
						"contentType": "application/json",
						"data": JSON.stringify({
							merchantUid: data.merchantUid,
							cancelAmount: data.amount,
							cancelReason: "테스트 환불"
						}),
						"dataType": "json"
					})
					.done(function(final_data) {
						console.log("환불 성공");
						fetch('/pay-cancel/${param.riCode}', {
		 					method: 'PATCH'
		 				})
		 				.then(function(data) {
		 					alert('예약취소 되었습니다.');
		 	 				location.href="/views/newworld/reservationlist";
		 				})
					})
					
					//우리쪽에서 먼저 지우고 아임포트에서 환불 진행하게 한다
					//결제한 금액과 환불 금액이 일치할 경우 ajax처리 되도록
					.done(function(result) {
						let price = document.querySelector('span#riTgiPrice').innerHTML;
						document.querySelector('span#riTgiPrice').innerHTML = price;
						if(result.amount==price){
							$.ajax({
							url: "/verifyIamport/cancel",
							type: "POST",
							headers: {
								contentType: "application/x-www-form-urlencoded"
							},
							data: {
								impUid: data.impUid,
								merchantUid: data.merchantUid,
								cancelAmount: data.amount,
								cancelReason: "테스트 환불"
							}
						})
						}
				
					})
					
					
					}else {
						alert('결제 취소가 취소되었습니다.');
					}
			}else if(!data) {
		 		fetch('/reserve-cancel/${param.riCode}',{
		 			method:'PATCH'
		 		})
		 		.then(function(res){
		 			return res.json();
		 		})
		 		.then(function(data){
		 			if(data){
		 				fetch('/cancel-companion/${param.riCode}', {
		 					method: 'PATCH'
		 				})
		 				.then(function(data) {
		 					alert('예약취소 되었습니다.');
		 	 				location.href="/views/newworld/reservationlist";
		 				})
		 			}
		 		})
			}
		})
	}else if(check == false) {
		alert('예약 취소를 취소하였습니다.');
	}

})

window.onload = function() { 
		getgoods(), getCompanion(), reservOrder(), reservCheck(), reservCancel();
}
</script>
</body>
</html>