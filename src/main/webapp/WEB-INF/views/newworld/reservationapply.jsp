 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/reservationapply.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈 </a>></li>
                <li><a href="/views/newworld/packagecountry">해외패키지</a>></li>
                <li><a href="/views/newworld/reservationapply">예약하기</a></li>
            </ul>
        </div>
    

    <!-- 패키지상세 메인 -->
<div class="resurpage">
<!-- 큰 글씨 -->
    <h1 class="bigtitle">예약하기</h1><br>
           
           
           
            <div class="resurchoice">  <!-- 페이지 전체 -->
			<div class="rightmenu">
			<div class="resurtext"> <!-- 오른쪽 부분 -->
            <p style="font-size:20px"><b>결제 상세내역</b></p><br>
            <small><center><p>최종결제금액</center>
            <ul><li>성인 <span id="riAdultCount">${param.riAdultCount}</span></li><li> 아동 <span id="riKidsCount">${param.riKidsCount} </span></li><li> 유아 <span id="riBabyCount">${param.riBabyCount} </span></li></ul></p></small>
            </div>
            <div class="summoney">
            <p class="summoneytext" style="text-align: right; font-size:26px; color:#3162C7" ><span id="riTgiPrice" style="font-weight: bold;">${param.riTgiPrice}</span>원</p><br>
            <center><button class="resurbtn" style="width:240px; height: 50px;" onclick="reservation()">예약하기</button></center>
            </div>
            </div>  
            </div>
            
            
            <!-- 왼쪽 부분  -->
	<div class="resurtable">
	
	
	
   		<!-- 첫번째 테이블 -->
   		<p style="font-size:24px">여행정보</p>
   		<input type="hidden" id="giCode">
        <table class="table table-border w-75">
              <tbody id="tBody">
				<!-- 스크립트 확인 -->
              </tbody>
            </table>




            <!-- 두번째 테이블 -->
   		<p class="tabletext" style="font-size:24px">예약자정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">이름</th>
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
            <input type="hidden" id="giEtc" value="${param.giEtc}"><br>
            
		
		
		<!-- 인원 입력버튼 -->
   		<p class="tabletext" style="font-size:24px">인원정보</p>
   		<div class="peoplecheck">
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">성인</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 12세 이상</small></p>
   		
   		<div class="btngroup">
 			<button onclick="showInput('riAdultCount', -1)"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text name="riAdultCount" maxlength='2' style="text-indent:3px" value="${param.riAdultCount}">
 			<button onclick="showInput('riAdultCount', 1)"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
            </div>
            
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceAdult"></span></b>원</p>
   		</div>
   		
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">아동</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 12세 미만</small></p>
   		
   		<div class="btngroup">
 			<button onclick="showInput('riKidsCount', -1)"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text name="riKidsCount" maxlength='2' style="text-indent:3px" value="${param.riKidsCount}" >
 			<button onclick="showInput('riKidsCount', 1)"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
       </div>
            
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceKid"></span></b>원</p>
   		</div>
   		
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">유아</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 2세 미만</small></p>
   		
   		<div class="btngroup">
 			<button onclick="showInput('riBabyCount', -1)"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text name="riBabyCount" maxlength='2' style="text-indent:3px" value="${param.riBabyCount}">
 			<button onclick="showInput('riBabyCount', 1)"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
        </div>
        
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceBaby"></span></b>원</p>
   		</div>
   		</div>
		
		
		<!-- 이게 없으면 디자인이 깨집니다.  -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
   		<!-- 테이블 -->
   		<p class="tabletext" style="font-size:24px">여행자 정보</p>
   		
   		<!-- 체크박스 -->
   		<div class="form-check">
  			<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onclick="isChecked(this)">
  			<label class="form-check-label" for="flexCheckDefault">
  			예약자와 동일
  			</label>
		</div>
		
		<div id="companion">
		<!-- 세번째 테이블 -->
 
            </div>
</div> 
</div>      
<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function getgoods() { //상품 정보 가져오기
	fetch('/reservation/${param.giCode}/${param.giEtc}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		
		let html = '';
		html += '<tr>'
		html += '<th class="table-primary">' + '패키지명' + '</th>'
		html += '<td>' + data.giName + '</td>'
		html += '</tr>'
		html += '<th class="table-primary">' + '여행기간' + '</th>'
		html += '<td>' + data.giPeriodAbout + '<br>'
		html += data.giPeriod + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '항공편' + '</th>'
		html += '<td>'+ data.viDeparture + ' ↔ ' + data.viDestination + '<br>'
		html += '출발: ' + data.viStart + '<br>'
		html += '도착: ' + data.viArr + '</td>'
		html += '</tr>'
		document.querySelector('#tBody').innerHTML = html;
		
		document.querySelector('#giCode').value = data.giCode;
		
		document.querySelector('#giEtc').value = data.giEtc;
		
		const infos = document.querySelectorAll('span[class]');
		for(const info of infos) {
			console.log(info);
			info.innerHTML = data[info.getAttribute('class')];
			
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			var num1 = document.querySelector('span.giPriceAdult').innerHTML;
			num1 = num1.toString().replace(regexp, ',');
			document.querySelector('span.giPriceAdult').innerHTML = num1;
			
			var num2 = document.querySelector('span.giPriceKid').innerHTML;
			num2 = num2.toString().replace(regexp, ',');
			document.querySelector('span.giPriceKid').innerHTML = num2;
			
			var num3 = document.querySelector('span.giPriceBaby').innerHTML;
			num3 = num3.toString().replace(regexp, ',');
			document.querySelector('span.giPriceBaby').innerHTML = num3;
		}
	})
}
function getUserInfo() {	//예약자 정보 가져오기
	fetch('/userinfo/${userInfo.uiNum}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		document.querySelector('td[data-id=uiName]').innerHTML = data.uiName;
		document.querySelector('td[data-id=uiPhone]').innerHTML = data.uiPhone;
		document.querySelector('td[data-id=uiEmail]').innerHTML = data.uiEmail;
		document.querySelector('td[data-id=uiBirth]').innerHTML = data.uiBirth;
		document.querySelector('#uiId').value = data.uiId;
	})
}
function showInput(id, cnt){  //인원수에 따라 여행자 정보 입력란 추가
	let count = cnt?cnt:${param.riAdultCount} + ${param.riKidsCount} + ${param.riBabyCount};
	//cnt 값이 있으면 cnt값 할당, 없으면 더하기 한 값 할당
	let priceAdult = document.querySelector('span.giPriceAdult').innerText.replace(/,/g, "");
	let priceKid = document.querySelector('span.giPriceKid').innerText.replace(/,/g, "");
	let priceBaby = document.querySelector('span.giPriceBaby').innerText.replace(/,/g, "");
	let html = '';
	if(cnt){
		let personCnt = parseInt(document.querySelector('input[name='+id + ']').value);
		let personCntResult = parseInt(document.querySelector('span#'+id).innerText)
		if(count<0){
			if(document.querySelector('input[name='+id + ']').value == 0) {
				document.querySelector('input[name='+id + ']').value = 0;
				document.querySelector('span#'+id).innerText = 0;
				return;
			}else {
				document.querySelector('input[name='+id + ']').value = --personCnt;
				document.querySelector('span#'+id).innerText = --personCntResult;
				document.querySelector('#companion>table:last-child').remove();
				priceAdult = priceAdult*document.querySelector('span#riAdultCount').innerText;
				priceKid = priceKid*document.querySelector('span#riKidsCount').innerText;
				priceBaby = priceBaby*document.querySelector('span#riBabyCount').innerText;
				console.log(priceAdult);
					
			 	document.querySelector('span#riTgiPrice').innerText = (priceAdult + priceKid + priceBaby);
				
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				document.querySelector('span#riTgiPrice').innerText = (document.querySelector('span#riTgiPrice').innerText).toString().replace(regexp, ',');
				return;
			}
			
		}
		
		document.querySelector('input[name='+id + ']').value = ++personCnt;
		document.querySelector('span#'+id).innerText = ++personCntResult;
		
		priceAdult = priceAdult*document.querySelector('span#riAdultCount').innerText;
		priceKid = priceKid*document.querySelector('span#riKidsCount').innerText;
		priceBaby = priceBaby*document.querySelector('span#riBabyCount').innerText;
		console.log(priceAdult);
			
	 	document.querySelector('span#riTgiPrice').innerText = (priceAdult + priceKid + priceBaby);
		
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		/* document.querySelector('span#riTgiPrice').innerText = priceAdult + priceKid = priceBaby; */
		document.querySelector('span#riTgiPrice').innerText = (document.querySelector('span#riTgiPrice').innerText).toString().replace(regexp, ',');
	}
	
	
	for(let i = 0; i < count; i++) {
		html += '<table class="table table-border w-75">';
		html += '<tbody id="tBody_companion">';
		html += '<tr>';
		html += '<th class="table-primary">성명(한글)</th>';
		html += '<td><input type="text" name="coName"><p style="display:none; color:red; font-size:13px;" name="coNameErr">이름을 입력해주세요</p></td>';
		html += '<th></th>';
		html += '<td></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th class="table-primary">생년월일</th>';
		html += '<td><input type="text" name="coBirth"><p style="display:none; color:red; font-size:13px;" name="coBirthErr">법정생년월일을 입력해주세요</p></td>';
		html += '<th class="table-primary">성별</th>';
		html += '<td>';
		html += '<div class="form-check">';
		html += '<select name="coGender">';
		html += '<option value="선택">성별</option>';
		html += '<option value="남자">남자</option>';
		html += '<option value="여자">여자</option>';
		html += '</select>';
		html += '</div>'
		html += '<p style="color:red; font-size:13px;" name="coGenderErr">성별을 확인해주세요</p>';
		html += '</td></tr>';
		html += '<tr>';
		html += '<th class="table-primary">영문 성</th>';
		html += '<td><input type="text" name="coEngFirst"><p style="display:none; color:red; font-size:13px;" name="coEngFirstErr">여권상의 영문 성을 입력해주세요</p></td>';
		html += '<th class="table-primary" >영문 이름</th>';
		html += '<td><input type="text" name="coEngName"><p style="display:none; color:red; font-size:13px;" name="coEngNameErr">여권상의 영문 이름을 입력해주세요</p></td>';
		html += '</tr><tr>';
		html += '<th class="table-primary" >휴대폰 번호</th>';
		html += '<td><input type="text" name="coPhone"><p style="display:none; color:red; font-size:13px;" name="coPhoneErr">휴대폰번호를 입력해주세요</p></td>';
		html += '<th class="table-primary" >이메일</th>';
		html += '<td><input type="text" name="coEmail"><p style="display:none; color:red; font-size:13px;" name="coEmailErr">이메일을 입력해주세요</p></td>';
		html += '</tr></tbody></table>';
	}
	document.querySelector('#companion').insertAdjacentHTML('beforeend', html);
}
function isChecked(obj){  //예약자와 동일 체크버튼 누르면 여행자1 정보입력란에 예약자정보가 자동 입력되고 disabled됨
	const dataIdObj = document.querySelectorAll('td[data-id]');
	const inputObj = document.querySelectorAll('input');
	const pObj = document.querySelectorAll('p[id=error1]');
	console.log(dataIdObj);
	console.log(inputObj);
	console.log(pObj);
   	if(obj.checked){
   		/* for(const dataIdObj of dataIdObjs){
			const dataId = dataIdObj.getAttribute('data-id');
			const inputId = dataId.substring(2);
			const reservInfo = '#'+dataId;
			document.querySelector('input[name=co'+inputId+']\'').value = document.querySelector(reservInfo).value;
		} */
 		inputObj[8].value = dataIdObj[0].innerHTML;
 		inputObj[8].disabled = true
 		inputObj[9].value = dataIdObj[1].innerHTML;
 		inputObj[9].disabled = true
 		inputObj[12].value = dataIdObj[3].innerHTML;
 		inputObj[12].disabled = true
 		inputObj[13].value = dataIdObj[2].innerHTML;
 		inputObj[13].disabled = true
 		pObj[3].style.display = '';
 		pObj[4].style.display = '';
 		pObj[5].style.display = '';
	}else{
		inputObj[8].value =''
		inputObj[8].disabled = false
		inputObj[9].value = ''
		inputObj[9].disabled = false
		inputObj[12].value = ''
		inputObj[12].disabled = false
		inputObj[13].value = ''
		inputObj[13].disabled = false
		pObj[3].style.display = 'none';
		pObj[4].style.display = 'none';
		pObj[5].style.display = 'none';
	}
}
function reservation() {
	let companionList = [];
	const param = {
			uiBirth: document.querySelector('td[data-id=uiBirth]').innerText,
			uiName: document.querySelector('td[data-id=uiName]').innerText,
			uiEmail: document.querySelector('td[data-id=uiEmail]').innerText,
			uiPhone: document.querySelector('td[data-id=uiPhone]').innerText,
			uiId: document.querySelector('#uiId').value,
			giCode: document.querySelector('#giCode').value,
			riAdultCount: document.querySelector('span#riAdultCount').innerText,
			riKidsCount: document.querySelector('span#riKidsCount').innerText,
			riBabyCount: document.querySelector('span#riBabyCount').innerText,
			riTgiPrice: parseInt((document.querySelector('span#riTgiPrice').innerText).replace(/,/g, "")),
			giEtc : document.querySelector('#giEtc').value
		};
	 const cnt = document.querySelector('#companion').children.length;
	 let coNames = document.querySelectorAll('input[name=coName]');
	 let coBirths = document.querySelectorAll('input[name=coBirth]');
	 let coGenders = document.querySelectorAll('select[name=coGender]');
	 let coEngFirsts = document.querySelectorAll('input[name=coEngFirst]');
	 let coEngNames = document.querySelectorAll('input[name=coEngName]');
	 let coPhones = document.querySelectorAll('input[name=coPhone]');
	 let coEmails = document.querySelectorAll('input[name=coEmail]');
	 for(let i = 0; i < cnt; i++) {
		 if(coNames[i].value.trim() == '' || coBirths[i].value.trim() == '' || coGenders[i].value == '선택' || coEngFirsts[i].value.trim() == '' || coEngNames[i].value.trim() == '' || coPhones[i].value.trim() == '' || coEmails[i].value.trim() == '') {
			 alert('정보를 다시 한 번 확인해주시고 \n 입력해주세요.');
			 return;
		 }
	 }
	 if(document.querySelector('#giEtc').value == 'home') {
	      fetch('/reservation/home', {
	         method: 'POST',
	         headers: {
	            'Content-Type': 'application/json'
	         },
	         body: JSON.stringify(param)
	      })
	      .then(function(res) {
	         return res.json();
	      })
	      .then(function(data) {
	         if(data) {
	        	 console.log(data);
	        		for(let i=0; i<cnt; i++){
	        			const companion = {
	        				coName : coNames[i].value,
	        				coBirth : coBirths[i].value,
	        				coGender : coGenders[i].value,
	        				coEngFirst : coEngFirsts[i].value,
	        				coEngName : coEngNames[i].value,
	        				coPhone : coPhones[i].value,
	        				coEmail : coEmails[i].value,
	        				uiId: document.querySelector('#uiId').value,
	        				giCode: document.querySelector('#giCode').value,
	        				riCode: data.riCode
	        			};
	        			 companionList.push(companion);
	        		}
	            fetch('/reservation/companion/' + data.riCode,{
	            	 method: 'POST',
	    	         headers: {
	    	            'Content-Type': 'application/json'
	    	         },
	    	         body: JSON.stringify(companionList)
	            })
	            alert('예약 등록')
	            location.href="/views/newworld/reservationlist";
	         }
	      })
	   }else if(document.querySelector('#giEtc').value == 'foreign') {
	      fetch('/reservation', {
	         method: 'POST',
	         headers: {
	            'Content-Type': 'application/json'
	         },
	         body: JSON.stringify(param)
	      })
	      .then(function(res) {
	         return res.json();
	      })
	      .then(function(data) {
	    	  console.log(data);
	         if(data) {
	        		for(let i=0; i<cnt; i++){
	        			const companion = {
	        				coName : coNames[i].value,
	        				coBirth : coBirths[i].value,
	        				coGender : coGenders[i].value,
	        				coEngFirst : coEngFirsts[i].value,
	        				coEngName : coEngNames[i].value,
	        				coPhone : coPhones[i].value,
	        				coEmail : coEmails[i].value,
	        				uiId: document.querySelector('#uiId').value,
	        				giCode: document.querySelector('#giCode').value,
	        				riCode: data.riCode
	        			};
	        			 companionList.push(companion);
	        		}
	        		console.log(companionList);
	        	 fetch('/reservation/companion/' +data.riCode,{
	        		 method: 'POST',
	    	         headers: {
	    	            'Content-Type': 'application/json'
	    	         },
	    	         body: JSON.stringify(companionList)
	        	 })
	        	 .then(function(res) {
			         return res.json();
			      })
			      .then(function(data) {
			    	  alert('예약 되었습니다.')
			    	  location.href="/views/newworld/reservationlist";
			      })
	         }
	      })
	   }
}

window.onload = function() { 
		getUserInfo(), getgoods(), showInput();
}
</script>
</body>
</html>